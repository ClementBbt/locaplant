import swal from 'sweetalert';

const initSweetalert = () => {
  const swalInstance = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      event.preventDefault();
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

swalInstance('#sweet-alert2', {
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

swalInstance('#sweet-alert', {
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
}


export { initSweetalert };
