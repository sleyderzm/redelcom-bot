import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['messageInput'];
  sendMessage() {
    const message = this.messageInputTarget.value;
    this.messageInputTarget.value = ''
    const csrfToken = document.head.querySelector('[name=csrf-token]').content;
    fetch('/chatbot/received_user_message', {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({ message: message })
    }).then(response => response.text()).then(Turbo.renderStreamMessage);
  }
}
