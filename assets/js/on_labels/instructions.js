import $ from 'jquery';
window.jQuery = $;
window.$ = $;

//import { Ajax } from "phoenix";
//Ajax.request("GET", "/api/foo/index.json", "application/json", "", 1000, onTimeout, callback);
export class ShowInstructions {
  constructor() {} //constructor

  show() {
    console.log('on ShowInstructions');
  }
} //ViewInstructions

class Present {
  constructor() {}

  request(url, field = '', logo = '') {

    let request = $.ajax({
      url: url,
      method: 'POST', // whatever You need
      data: {
        input: field,
      }, //
      beforeSend: function(xhr) {
        xhr.setRequestHeader("X-CSRF-Token", window.csrf_token);
      },
      dataType: 'json',
    });

    request.done(function(res) {
      $('.info_res').remove();
     // console.log('11111111111111111')
      if (res == null || res == '') {
        $('.info_area').append('<div class="info_res" ></div>');
        $('.info_res').append(
          '<span class="info_res_logo">' +
            logo +
            ' ' +
            ' For Field ' +
            field +
            ': ' +
            '</span>',
        );

        $('.info_res').append(
          '<span class="nothing_found" >' +
            ' Nothing Found ' +
            '</span>',
        );
      } else {
        $('.info_area').append('<div class="info_res"></div>');
        //  $('.info_res').append('<span>'+ res+ '</span>');
        $('.info_res').append(
          '<span class="info_res_logo">' +
            logo +
            ' ' +
            ' For Field: ' +
            '<span>' +
            '<strong>' +
            field +
            '</strong>' +
            '</span>' +
            ' ' +
            '</span>' +
            '<br />'

        );
        //$('.info_res').append( '<span>'+ res[0][0]+ '</span>');
        $('.info_res').append('<span>' + res + '</span>');
        //if( res[0][1] !== null &&  res[0][1].length > 0 ){
        // $('.info_res').append( '<span style="color:#dd4814;">'+ " Reference: " + res[0][1] + '</span>');
        // }
        //console.log(res );
      }
      //alert( "Request success: " + res );
      //let area = d3.select(".info_area");
      // let area_g = area.append('g');
      // area_g.text(a_text)
      //     .transition()
      //     .duration(7000)
      //     .style('opacity', 0.9)
      //     .duration(2000)
      //     .style('opacity', 0.6)
      //     .duration(2000)
      //     .style('opacity', 0.3)
      //     .duration(3000)
      //     .remove(this);
    });

    request.fail(function(jqXHR, textStatus) {
      $('.info_area').append(
        '<div class="info_res" style="background-color:##fc8d59;color:#ffffbf;"></div>',
      );
      $('.info_res').append('<span>' + textStatus + '</span>');
    });
  } //request
} //class

class Response {
  constructor() {} //constructor

  bind_events(field, field_id = '') {
    $('.label_info').mouseenter(function(e) {

      let id = $(this).attr('id');
      switch (id) {
        case 'button_instructions': {

          $('#button_instructions').click(function(e) {
            let url = '/definitions/search_instructions';
            let logo = 'Instructions and Reference ';
            let present = new Present();

            present.request(url, field, logo);

            return false;
          });

          break;
        } //case
        //////////////////

        case 'button_support_definitions': {
          $('#button_support_definitions').click(function(e) {
            let url = '/definitions/search_support_definitions';
            let logo = 'Supporting Definition ';
            let present = new Present();

            present.request(url, field, logo);

            return false;
          });

          break;
        } //case
        case 'button_option_definitions': {
          $('#button_option_definitions').click(function(e) {
            let url = '/definitions/search_option_definitions';
            let option_field = $('#' + field_id + ' :selected').text();
            let combined_field = field + '=' + option_field;
            let logo = ' Option ';
            let present = new Present();

            present.request(url, combined_field, logo);
            return false;
          });

          break;
        } //case
        ///////////////////
        case 'button_notes': {
          $('#button_notes').click(function(e) {
            let url = '/definitions/search_notes';
            let logo = 'Notes';
            let present = new Present();

            present.request(url, field, logo);
            return false;
          });

          break;
        } //case
        //////////////////
        case 'button_field_name': {
          $('#button_field_name').click(function(e) {
            $('.info_res').remove();
            $('.info_area').append('<div class="info_res"></div>');
            $('.info_res').append(

                '<span style="color:#000;font-weight: 600;">' +
                '<span>' +
                '<strong>' +
                ' Field Name: ' +
                '</strong>' +
                '</span>' +
                field +
                '</span>'

            );
            // return false;
          });

          break;
        } //case
        //////////////////

        default: {
             'sorry.............'
          //statements;
          break;
        } //case
      }
    });
  } //bindEvents
} //class Response
/////////////////////////

class Info_buttons {
  constructor(label_obj) {
    this.label_obj = label_obj;
  } //consturctor

  build(a_div) {
   // ['#e41a1c','#377eb8','#4daf4a','#984ea3','#ff7f00']
    $('.label_info_div')
      .append(
        $(
          "<span  style='color:#d7191c;' title='View Coding Instructions' id='button_instructions' class='label_info'><i class='fa fa-tint'></i></span>",
        ),
      )
      .append(
        $(
          "<span style='color:#fdae61' title='View Supporting Definition' id='button_support_definitions' class='label_info'><i class='fa  fa-book'></i></span>",
        ),
      )
      .append(
        $(
          "<span style='color:#abdda4' title='View the Notes'  id= 'button_notes'  class='label_info'><i class='fa fa-sticky-note'></span>",
        ),
      )
      .append(
        $(
          "<span style='color:#2b83ba'  title='If selection View Option Definition'  id= 'button_option_definitions' class='label_info'><i class='fa fa-list'></i></span>",
        ),
      )
      .append(
        $(
          "<span style='color:#33a02c' title='Show Field Name' id= 'button_field_name' class='label_info'><i class='fa fa-anchor'></i></span>",
        ),
      );
  } //build
}

class Main_button {
  constructor() {
    let label_with_button = $(
         "<span style='color:#0F3D0F' title='Click to View Element Info' class='label_with_button'><i class='fa fa-gg'></i></span>",

    //).appendTo('.control-label');
    ).appendTo('.field_help');

  }

  make() {
      // console.log("++++++++++++=IN")

    $('.field_help').mouseenter(function(e) {
      $(this).append(
       $("<span style='background-color:#f5f5f5' class='label_info_div'></span>"),
      );

      let info_buttons = new Info_buttons($(this));

      info_buttons.build();
      return false;
    });

    $('.field_help').mouseover(function(e) {
      $('.label_check_div').show();
      $('.label_info_div').show();

      let next_item = $(this).next();
      let item_name = next_item.attr('name');

      //code = $( "." + @searching_term + " :selected").val();
      //console.log("------item name------------------------------------"
     // + JSON.stringify(item_name))
      let start_name = item_name.indexOf('[');
      let end_name = item_name.indexOf(']');
      let field = item_name.substring(start_name + 1, end_name);

      let field_id  = next_item.attr('id');
     // console.log("-----------field-------------------------------"+field)
      //console.log("------------field_id------------------------------"+field_id)
      let response = new Response();
      response.bind_events(field, field_id);

      return false;
    });

    $('.field_help').mouseleave(function(e) {
      $('.label_info_div').remove();
      return false;
    });
  } //make
} //class
const init_draw_instructions = () => {
  const main = new Main_button();
  main.make();
};

init_draw_instructions();
