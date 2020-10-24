// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "start", "end", "pricePerDay", "days", "total" ]

  connect() {
    console.log("Coucou");
  }

  calculateDays() {
    const firstDate = new Date(this.startTarget.value);
    const secondDate = new Date(this.endTarget.value);
    const locPrice = parseInt(this.pricePerDayTarget.innerText);
    const timeDiff = secondDate.getTime() - firstDate.getTime();
    const daysDiff = timeDiff / (1000 * 3600 * 24);
    if (daysDiff) {
      this.daysTarget.innerText = ` x ${daysDiff} jours`;
      const newPrice = locPrice * daysDiff;
      this.totalTarget.innerText = `${newPrice}€`;
    }
  };
}
