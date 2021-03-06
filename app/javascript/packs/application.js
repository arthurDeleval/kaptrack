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

import 'flag-icon-css/css/flag-icon.css'
import { flatpickrFonction } from '../plugins/flatpickr';
import { initRevenueChart } from '../plugins/revenue_chart';
import { initMarginChart } from '../plugins/margins_chart';
import { initAverageTicketChart } from '../plugins/average_ticket_by_day';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import {displayRecipeProductLine} from "./display_recipe_product_line";
import {displayDish} from "./display_new_dish_performance";
import {submitForm} from "./submit_form";
import {loadDynamicBannerText} from '../components/banner';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  displayDish();
  displayRecipeProductLine();
  flatpickrFonction();
  initAverageTicketChart();
  initMarginChart();
  initRevenueChart();
  submitForm();
  loadDynamicBannerText();
});
