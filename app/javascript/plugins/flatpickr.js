import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"; // Note this is important!

const datepickers = document.querySelector('.flatpicker');
if (datepickers) {
  flatpickr(".flatpicker", {});
}
