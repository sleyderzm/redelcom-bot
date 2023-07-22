import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['messageInput'];

  conversationId = null;
  csrfToken = null

  connect() {
    //TODO: descomentar
    this.conversationId = this.element.dataset.conversationId;
    //this.conversationId = '6';
    this.csrfToken = document.head.querySelector('[name=csrf-token]').content;
  }
  sendMessage() {
    const message = this.messageInputTarget.value;
    this.messageInputTarget.value = ''
    this.renderUserMessage(message)
    this.renderBotResponse(message, this.conversationId)
  }

  renderUserMessage(message){
    fetch('/chatbot/render_user_message', {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': this.csrfToken,
      },
      body: JSON.stringify({ message: message })
    }).then(response => response.text()).then(Turbo.renderStreamMessage);
  }
  renderBotResponse(message, conversationId){
    fetch('/chatbot/render_bot_response', {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': this.csrfToken,
      },
      body: JSON.stringify({ message: message, conversation_id: conversationId })
    }).then(response => response.text()).then(Turbo.renderStreamMessage);
  }
}
