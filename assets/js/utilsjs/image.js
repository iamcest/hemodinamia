//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

window.enlarge_image = (img_id) ->
  increment = 1.3
  img = $('#definitions_image'+img_id)
  h = img.height()
  w = img.width()

  img.animate({
    width: (w*increment),
    height: (h*increment)
  },2000)

window.shrink_image = (img_id) ->
  img = $('#definitions_image'+img_id)
  min_w = 420
  min_h = 420
  w = img.width()
  h = img.height()
  ratio_w = (min_w / w)
  ratio_h = (min_h / h)
  ratio = Math.min(ratio_w, ratio_h)
  new_w = (w * ratio)
  new_h = (h * ratio)
  img.animate({
    width: (new_w),
    height: (new_h)
  },3500)

