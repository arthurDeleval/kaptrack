import flatpickr from "flatpickr";
import "flatpickr/dist/themes/airbnb.css"

const flatpickrFonction = () =>{ 
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true
  });
}

export {flatpickrFonction};