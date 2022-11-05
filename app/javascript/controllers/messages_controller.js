import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["repliedToId", "repliedToText", "removeReplyButton"]
  connect() {
    this.removeReplyButtonTarget.style.visibility = 'hidden'
  }

  reply(event) {
    let messageId = event.target.dataset['messageId'];
    let text = event.target.previousSibling.innerText;

    this.repliedToIdTarget.value = messageId;
    this.repliedToTextTarget.innerText = text;
    this.removeReplyButtonTarget.style.visibility = 'visible'
  }

  removeReply(event) {
    event.preventDefault();
    this.removeReplyButtonTarget.style.visibility = 'hidden'
    this.repliedToIdTarget.value = null;
    this.repliedToTextTarget.innerText = "";
  }
}
