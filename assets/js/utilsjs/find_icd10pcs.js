# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  complete_diagnosis = jQuery('#admission_procedure_procedure_text').autocomplete(source: (request, array) ->
    data = term: request.term
    $.ajax
      delay: 500
      minLength: 3
      url: '/icd10pcs_codes/find_long_description'
      data: data
      dataType: 'html'
      complete: (xhr, result) ->
        if result != 'success'
          return
        response = xhr.responseText
        #console.log("HTML: " + response)
        no_quotes = response.replace(/"/g, '')
        #console.log("NO QUOTES"+no_quotes)
        queries = []
        jQuery(no_quotes).each ->
           queries.push (jQuery(this).text())
        #console.log("Queries: "+queries)
        #return
        array queries 
        return
       #ajax
       jQuery( "#admission_procedure_procedure_text" )
         .on( "autocompleteselect", show_codes = (event, ui)-> 
            label =  ui.item.label
            data =  term: label
            code_field = $('#admission_procedure_icd10_pcs_code')
            $.ajax
              url: '/icd10pcs_codes/find_code'
              data: data
              success: (data) ->
                code_field.css("background-color","lightyellow")
                code_field.css("font-weight","bold")
                no_quotes_data = data.replace(/"/g, '')
                #console.log(no_quotes_data)
                code_field.val(no_quotes_data)


            return 

         )
    return
  )
  #complete
  return
