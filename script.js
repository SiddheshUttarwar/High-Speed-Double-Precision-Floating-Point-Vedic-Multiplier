const vectors = [
  { name: "1.5 x 2.5", a: "0x3FF8000000000000", b: "0x4004000000000000", o: "0x400E000000000000" },
  { name: "10.0 x 0.75", a: "0x4024000000000000", b: "0x3FE8000000000000", o: "0x401E000000000000" },
  { name: "-1.0 x 2.0", a: "0xBFF0000000000000", b: "0x4000000000000000", o: "0xC000000000000000" },
  { name: "123.5 x 2.0", a: "0x405EE00000000000", b: "0x4000000000000000", o: "0x406EE00000000000" }
];

const aHex = document.getElementById("aHex");
const bHex = document.getElementById("bHex");
const oHex = document.getElementById("oHex");
const caseName = document.getElementById("caseName");
const runBtn = document.getElementById("runDemo");
const pipeline = document.getElementById("pipeline");

let idx = 0;
let timer = null;

function showVector(v) {
  aHex.textContent = v.a;
  bHex.textContent = v.b;
  oHex.textContent = v.o;
  caseName.textContent = `Case: ${v.name}`;
}

function tick() {
  showVector(vectors[idx]);
  idx = (idx + 1) % vectors.length;
}

function startDemo() {
  document.body.classList.add("play");
  pipeline.classList.add("play");
  runBtn.textContent = "Running...";
  if (timer) clearInterval(timer);
  tick();
  timer = setInterval(tick, 1300);
}

runBtn.addEventListener("click", startDemo);
showVector(vectors[0]);
