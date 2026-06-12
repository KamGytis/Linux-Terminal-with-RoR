function initTerminal() {
 let currentFolderId = 1;
 const input = document.getElementById("input");
 const output = document.getElementById("output");
 let currentDir = ".";
 let folder_id = 0;

 if (!input || !output) return;

 console.log("terminal initialized");

 function print(text) {
 output.innerHTML += `<div>${text}</div>`;
 }

 input.addEventListener("keydown", async (e) => {
 if (e.key !== "Enter") return;

 const command = input.value.trim();
 if (!command) return;

 print("> " + command);

const res = await fetch("/execute", {
 method: "POST",
 headers: {
 "Content-Type": "application/json",
 "X-CSRF-Token": document.querySelector('[name="csrf-token"]').content
 },
 body: JSON.stringify({ command: command, folder_id: currentFolderId })
 });

 const data = await res.json();
 currentFolderId = data.new_folder_id;
 print(data.output);

 input.value = "";
});
}

document.addEventListener("turbo:load", initTerminal);