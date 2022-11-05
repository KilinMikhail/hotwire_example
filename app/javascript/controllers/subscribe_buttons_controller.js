import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = [ "unsubscribeButton" ]

  connect() {
    super.connect();
  }

  unsubscribe(event) {
    event.preventDefault();
    if (confirm("Are you sure?")) {
      this.stimulate('SubscribtionsReflex#unsubscribe', this.unsubscribeButtonTarget);
    }
  }
}
