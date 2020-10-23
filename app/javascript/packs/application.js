// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "../plugins/flatpickr";


// Internal imports
import { initMapbox } from '../plugins/init_mapbox';
import { initSweetalert } from '../plugins/init_sweetalert';
import { initAutocomplete } from '../plugins/init_autocomplete';

// Events

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
  initSweetalert('#sweet-alert2', {
  title: "Réservation confirmée",
  text: "Votre plante arrivera bientôt chez vous !",
  icon: "success",
  iconColor: "#aac4b5",
  button: "Top !",
  closeOnClickOutside: false
}, (value) => {
  if (value) {
    const link = document.querySelector('#booking-link');
    link.click();
  }
});
  initSweetalert('#sweet-alert', {
  title: "Voulez-vous vraiment supprimer cette plante ?",
  text: "Toute suppression est définitive",
  icon: "warning",
  iconColor: "#aac4b5",
  buttons: ["Surtout pas !", "Sans regret :)"],
  dangerMode: true,
  className: "",
  closeOnClickOutside: true
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});
})


