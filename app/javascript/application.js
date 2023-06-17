// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "flowbite/dist/flowbite.turbo.js";
import "./channels";

const scrollToBottom = () => {
  const ol = document.getElementById("messages-list");
  ol.scrollTop = ol.scrollHeight;
};

document.addEventListener("turbo:load", () => {
  scrollToBottom();
  const textarea = document.getElementById("textarea");
  const button = document.getElementById("button");
  textarea.addEventListener("keydown", (event) => {
    if (event.key === "Enter" && !!textarea.value.trim().length) {
      button.click();
    }
  });
});
