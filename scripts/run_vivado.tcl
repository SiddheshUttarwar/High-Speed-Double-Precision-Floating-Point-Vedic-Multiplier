set rtl_list_file "rtl_sources.f"
set tb_file "tb/tb_double_precision.v"
set top_module "tb_double_precision"
set snapshot "tb_double_precision_sim"

if {![file exists $rtl_list_file]} {
  puts "ERROR: Missing $rtl_list_file"
  exit 1
}

if {![file exists $tb_file]} {
  puts "ERROR: Missing $tb_file"
  exit 1
}

set fp [open $rtl_list_file r]
set rtl_data [read $fp]
close $fp

foreach raw_line [split $rtl_data "\n"] {
  set src [string trim $raw_line]
  if {$src eq ""} { continue }
  if {[string match "#*" $src]} { continue }
  puts "Compiling RTL: $src"
  xvlog $src
}

puts "Compiling TB: $tb_file"
xvlog $tb_file

puts "Elaborating: $top_module"
xelab $top_module -s $snapshot

puts "Running simulation"
xsim $snapshot -runall

quit
