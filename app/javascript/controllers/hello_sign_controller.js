import { Controller } from "@hotwired/stimulus"
import HelloSign from "hellosign-embedded";

export default class extends Controller {
  static values = {
    contractUrl: String
  }

  static targets = [ "confirmation" ]

  connect() {
    const client = new HelloSign();

    client.on('sign', (data) => {
      this.confirmationTarget.innerHTML = `
          <h1>That's it!</h1>
          <p>
          Your signed contract is pending approval. 
          We'll let you know when we're ready.
          </p>
      `

      try {
        fetch("/sign_contract", {
          method: "POST",
          headers: { 'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          },
          body: JSON.stringify({ contractUrl: this.contractUrlValue })
        });
      }catch(e){
        console.log(e)
      }
    });

    client.open(this.contractUrlValue, {
      skipDomainVerification: true,
      clientId: '68b070fa041d68446a913955fcbee0dc'
    });
  }
}
