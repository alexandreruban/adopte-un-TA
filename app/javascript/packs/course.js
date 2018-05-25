const descr_p = document.getElementById("descr_p");
const descr_form = document.getElementById("descr_form");
const descr_edit_btn = document.getElementById("descr_edit_btn");

if (descr_edit_btn != null) {
  descr_edit_btn.addEventListener("click", function() {
    descr_p.style.display = "none";
    descr_edit_btn.style.display = "none";
    descr_form.style.display = "block";
  });
}
