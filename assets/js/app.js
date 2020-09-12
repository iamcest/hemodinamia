// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss";
import "phoenix_html";
import $ from "jquery";
window.jQuery = $;
window.$ = $;

import Bulma from "@vizuaalog/bulmajs";
//import bulmaCollapsible from '@creativebulma/bulma-collapsible';


//import 'bulma-extensions/src/js/index.js';
// Initialize all input of date type.
//const calendars = bulmaCalendar.attach('[type="date"]', options);

// Loop on each calendar initialized
//calendars.forEach(calendar => {
//	// Add listener to date:selected event
//	calendar.on('date:selected', date => {
//		console.log(date);
//	});
//});

// To access to bulmaCalendar instance of an element
//const element = document.querySelector('#date');
//if (element) {
//	// bulmaCalendar instance is available as element.bulmaCalendar
//	element.bulmaCalendar.on('select', datepicker => {
//		console.log(datepicker.data.value());
//	});
//}

if ($("body")) {
  console.log("jquery works!");
}

import { ShowInstructions } from "./on_labels/instructions.js";

import tinymce from "tinymce/tinymce.min.js";
import "tinymce/themes/silver/theme.min.js";
import "tinymce/skins/ui/oxide/skin.min.css";
//import 'tinymce/plugins/advlist';


tinymce.init({
     forced_root_block: "",
  	selector:'.textarea',
    entity_encoding: "raw",
    height: "400",
    menubar: 'file edit view insert format tools table help',
    toolbar: 'undo redo | bold italic underline strikethrough |  link image  | bullist |fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
   force_p_newlines: false,
    //toolbar_sticky: true,
    //table_responsive_width: true,
	});


  /*
tinymce.init({
  forced_root_block: "",
  selector: ".textarea",
  toolbar: [
    "undo redo | styleselect | bold italic | link image  |  bullist | numlist | outdent | indent "
  ],
  force_p_newlines: false,
});
*/
/*
tinymce.init({
  selector: '.textarea',  // change this value according to the HTML
  toolbar: 'undo redo | styleselect | bold italic | link image',
  force_p_newlines: false,
});
*/
/*
import tinymce from 'tinymce/tinymce.min.js';
import 'tinymce/themes/silver/theme.min.js';
import 'tinymce/plugins/advlist';
//import 'tinymce/plugins/colorpicker';
//import 'tinymce/plugins/textcolor';
import 'tinymce/plugins/paste';
//import 'tinymce/plugins/link';
//import 'tinymce/skins/lightgray/skin.min.css';
//import 'tinymce/skins/ui/oxide-dark/skin.min.css';
 import 'tinymce/skins/ui/oxide/skin.min.css';

tinymce.init({
  forced_root_block : "",
  selector: '.textarea',
  toolbar: [
    'undo redo | styleselect | bold italic | link image',
    'alignleft aligncenter alignright',
    'bullist numlist outdent indent '
  ],
  force_p_newlines: false,
  toolbar: 'undo redo |  bold italic | link image | link',
});
////////////////////////////
//////////////////////////////
*/

export var App = {
  run: function() {
    ShowInstructions.init_draw_instructions();
    // Interface_buttons.draw_coronary_init();
  }
};

import LiveSocket from "phoenix_live_view";

let liveSocket = new LiveSocket("/live");
liveSocket.connect();
// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
