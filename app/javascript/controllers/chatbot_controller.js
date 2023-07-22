import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['messageInput'];

  connect() {
    // Obtener el id del objeto @conversation
    //const conversationId = this.element.dataset.conversationId;
    const conversationId = '6';

    // Hacer algo con el id
    console.log("Id del objeto @conversation:", conversationId);
  }
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
