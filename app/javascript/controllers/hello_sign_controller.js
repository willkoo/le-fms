import { Controller } from "@hotwired/stimulus"
import HelloSign from "hellosign-embedded";

export default class extends Controller {
static values = {
  contractUrl: String
}

  connect() {
    console.log("test")

    const client = new HelloSign();

    client.open(contractUrlValue, {
      skipDomainVerification: true;
      clientId: '68b070fa041d68446a913955fcbee0dc';
    });
  }
}
