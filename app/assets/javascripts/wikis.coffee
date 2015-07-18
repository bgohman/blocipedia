# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->


  $('#wiki_title').keyup (e) ->
    content = marked( $(this).val() )
    $('#title-preview').html(content)

  $('#wiki_body').keyup (e) ->
    content = marked( $(this).val() )
    $('#body-preview').html(content)


