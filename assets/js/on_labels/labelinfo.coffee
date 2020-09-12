# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Label_buttons_response
    constructor: (label)->
      @label = label
      @bindEvents()


    bindEvents: ->
      $("#button_instructions" ).on( "click", @show_instructions) 
      $("#button_support_definitions" ).on( "click", @show_support_definitions) 
      $("#button_notes" ).on( "click", @show_notes )
      $("#button_option_definitions" ).on( "click", @show_option_definitions) 
      $("#button_images" ).on( "click", @show_images) 

    show_instructions: (e)  =>
        @present("/definitions/find_instructions",@label,{'search_name': @label })
        e.preventDefault();
        e.stopPropagation();


    show_support_definitions: (e)  =>
        @present("/definitions/find_support_definitions",@label,{'search_name': @label })
        e.preventDefault();
        e.stopPropagation();


    show_notes: (e)  =>
       @present("/definitions/find_notes",@label,{'search_name': @label })
       e.preventDefault();
       e.stopPropagation();


    show_option_definitions: (e)  =>
        #in all select options you have to add {:class=>"admission_route"}
        code = $( "." + @label+ " :selected").val();
        @present("/definitions/find_option_definitions",@label,
         {"search_name":@label,'search_code': code })
        e.preventDefault();
        e.stopPropagation();

    show_images: (e)  =>
       @present("/definitions/find_images",@label,{'search_name': @label })
       e.preventDefault();
       e.stopPropagation();



    present: (url,label,param)  ->
        label_id = $("#" + label)
        #param = { 'search_name': label };
        ajax = jQuery.ajax({
            type:'GET',
            url: url,
            data:param,
            success: (data) ->
              jQuery('<span class="dialog"></span>')
                #.html('<table class="table">' + '<tr> ' +'<td>'  + data  + '</td>' + '</tr>' + '</table>')
                .html(data)
                .appendTo(label_id)
                .dialog({
                  dialogClass: "dialogStyle",
                  modal:true,
                  resizable:true,
                  width:"auto",
                  height:"auto",
                  title:" Coding Help  for: " + label,
                  show:{effect:"blind",duration: 1000}
                  hide:{effect: "clip",duration: 500}
                  buttons: [
                    {
                      text: "Close",
                      click: -> 
                        $( this ).dialog( "close" )
                    } 
                    ] 
                } )
          error: ->
            alert("Something Wrong Went on. Check your server connection")
          })



class Check_buttons
    constructor: (label)->
      @label = label
      @searching_term = $(@label).attr('id')

    instructions:() ->
      url = "/definitions/find_instructions"
      button = 'button_instructions'
      param = {'search_name': @searching_term }
      text = @check_for_data(url, param, button)

    definitions:() ->
      url = "/definitions/find_support_definitions"
      button = 'button_support_definitions'
      param = {'search_name': @searching_term }
      text = @check_for_data(url, param, button)

    notes:() ->
      url = "/definitions/find_notes"
      button = 'button_notes'
      param = {'search_name': @searching_term }
      text = @check_for_data(url, param, button)

    option_definitions:() ->
      url = "/definitions/find_option_definitions"
      button = 'button_option_definitions'
      code = $( "." + @searching_term + " :selected").val();
      param =  {"search_name": @searching_term, 'search_code': code }
      text = @check_for_data(url, param, button)

    images:() ->
      url = "/definitions/find_images"
      button = 'button_images'
      param = {'search_name': @searching_term }
      text = @check_for_data(url, param, button)



    #check_for_data: (url, param,  button, searching_term)->
    check_for_data: (url, param,  button) ->
      ajax = jQuery.ajax({
            type:'GET',
            url: url,
            data:param,
            success: (data) ->
              proccess_data(data,  button)

      })




    proccess_data =  (data,  button) ->
      no_data = "no_data"
      ok_glyph = "<span title='There Are Data. Please Click The Button Below' class = 'label_check btn btn-default btn-xs ok_info glyphicon glyphicon-ok' ></span"
      x_glyph = "<span title ='No Data Found' class =  'label_check btn btn-default btn-xs x_info  glyphicon glyphicon-remove' ></span"


      option_glyphs = switch button
        when  data != no_data   && 'button_instructions' then   $(".label_check_div").append($(ok_glyph)) 
        when  data == no_data   && 'button_instructions' then   $(".label_check_div").append($(x_glyph)) act_on_info_buttons(button)

        when  data != no_data  && 'button_support_definitions' then    $(".label_check_div").append($(ok_glyph))
        when  data == no_data  && 'button_support_definitions' then    $(".label_check_div").append($(x_glyph)) act_on_info_buttons(button)


        when  data != no_data  && 'button_notes' then     $(".label_check_div").append($(ok_glyph))
        when  data == no_data  && 'button_notes' then     $(".label_check_div").append($(x_glyph)) act_on_info_buttons(button)


        when  data != no_data  && 'button_option_definitions' then     $(".label_check_div").append($(ok_glyph))
        when  data == no_data  && 'button_option_definitions' then     $(".label_check_div").append($(x_glyph)) act_on_info_buttons(button)


        when  data != no_data  && 'button_images' then     $(".label_check_div").append($(ok_glyph))
        when  data == no_data  && 'button_images' then     $(".label_check_div").append($(x_glyph)) act_on_info_buttons(button)


        else null





    build: () ->
      @instructions()
      @definitions()
      @notes()
      @option_definitions()
      @images()

    act_on_info_buttons =  (button) -> 
      $('#' + button).addClass('disabled') 
      #$('#' + button').prop('disabled', true)


class Info_buttons
    constructor: (label_obj) ->
      @label_obj = label_obj

    build: () ->
      $(".label_info_div").append( $( "<span  title='View Coding Instructions' 
              id='button_instructions' 
              class='label_info btn btn-default btn-xs glyphicon glyphicon-search '></span>" ) )
            .append( $( "<span title='View Supporting Definition' 
              id='button_support_definitions' 
              class='label_info btn btn-default btn-xs glyphicon glyphicon-pencil'></span>" ) )
            .append( $( "<span title='View the Notes' 
              id= 'button_notes' 
              class='label_info btn btn-default btn-xs glyphicon glyphicon-check'></span>" ) )
            .append( $( "<span title='If selection View Option Definition' 
              id= 'button_option_definitions' 
              class='label_info btn btn-default btn-xs glyphicon glyphicon-eye-open'></span>" ) )
            .append( $( "<span title='If Image View..' 
              id= 'button_images' 
              class='label_info btn btn-default btn-xs glyphicon glyphicon-sd-video'></span>" ) )


class Label_buttons

    make: ->

      $('control-label').mouseenter  ->
        check_div = $(this).append($("<div class='label_check_div'><div>"))
        check_div = $(this).append($("<div class='label_info_div'><div>"))

        info_buttons = new Info_buttons($(this))
        info_buttons.build()

        check_buttons = new Check_buttons($(this))
        check_buttons.build()




        $(this).contextmenu (e) -> 
             $(".label_check_div").show()
             $(".label_info_div").show()
             e.preventDefault()


        searching_term = $(this).attr('id')
        label_buttons_response = new  Label_buttons_response(searching_term)

      $('label').mouseleave ->
          $( this ).find( ".glyphicon" ).remove()
          $( this ).find( ".label_check_div" ).remove()
          $( this ).find( ".label_info_div" ).remove()





class LabelD3js

    make: ->

      jQuery('label').hover  ->
        label_id = $(this).attr('id')

        svg =  d3.select('#' + label_id )
                .append("svg")
                .attr("id", "svg")
                .style("fill","lightblue")

        group = svg.append("g")


        indications = group.append('rect')

        indications.attr('x',0)
                .attr('y',0)
                .attr('rx',5)
                .attr('ry',5)
                .attr("height", "10px")
                .attr("width",  "10px")

        indications.style("stroke","blue")
            .style("fill", 'lightblue')
            .style("opacity","0.6")

      , ->
        $( this ).find( "#svg" ).remove()
        $( this ).find( ".label_info_div" ).remove()







$(document).on 'page:change', ->
  label_buttons = new Label_buttons()
  label_buttons.make()

  #label = new  LabelD3js()
  #label.make()




