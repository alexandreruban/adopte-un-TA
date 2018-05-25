// app/javascript/plugins/flatpickr.js
import flatpickr from "flatpickr"
//import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import "flatpickr/dist/themes/airbnb.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

// flatpickr(".datepicker", {
//   altInput: true,
//   allowInput: true,
// })

flatpickr("#range_start", {
  altInput: true,
  allowInput: true,
  plugins: [new rangePlugin({ input: "#range_end"})]
})
