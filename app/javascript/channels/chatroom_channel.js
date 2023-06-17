import consumer from "./consumer";

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const ol = document.getElementById("messages-list");
    const li = document.createElement("li");
    const { user, body, created } = data.message;
    li.classList.add("w-2/3", "p-2", "mb-10", "rounded-lg", "shadow");

    if (user.id === +ol.dataset.current_user) {
      li.classList.add("ml-auto", "bg-slate-100");
    }
    li.innerHTML = `
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
        ${user.username}
      </h3>
      <p class="mb-1 text-base font-normal text-gray-500 dark:text-gray-400">
        ${body}
      </p>
      <time class="mb-4 text-sm font-normal leading-none text-gray-400 dark:text-gray-500">
        ${created} ago
      </time>
    `;
    ol.appendChild(li);
    const textarea = document.getElementById("textarea");
    textarea.value = "";
    ol.scrollTop = ol.scrollHeight;
  },
});
