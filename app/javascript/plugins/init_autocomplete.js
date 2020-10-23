import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('address-value');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
