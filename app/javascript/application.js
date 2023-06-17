// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import "flowbite/dist/flowbite.turbo.js";
import "./channels";

const scrollToBottom = () => {
  const ol = document.getElementById("messages-list");
  ol.scrollTop = ol.scrollHeight;
};

window.onload = function () {
  scrollToBottom();
};
