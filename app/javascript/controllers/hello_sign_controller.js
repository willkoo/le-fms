import { Controller } from "@hotwired/stimulus"
import HelloSign from "hellosign-embedded";

export default class extends Controller {
static values = {
  contractUrl: String
}

  connect() {
    console.log("test")
    console.log(this.contractUrlValue)

    const client = new HelloSign();

    client.open(this.contractUrlValue, {
      skipDomainVerification: true,
      clientId: '68b070fa041d68446a913955fcbee0dc'
    });
  }
}
