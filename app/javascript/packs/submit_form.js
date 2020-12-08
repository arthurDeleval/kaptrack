
const submitForm = () => {
const form = document.querySelectorAll("#edit_menu_visibility")
  form.forEach((form) => {
    form.addEventListener("click", (event) => {
      event.preventDefault();
      form.submit();
    });
  });
}


export {submitForm}
