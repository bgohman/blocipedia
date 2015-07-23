# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  previewContent = (el, target) ->
    content = marked( $(el).val())
    $(target).html(content)

  previewContent('#wiki_title', '#title-preview')
  previewContent('#wiki_body', '#body-preview')


  $('#wiki_title').keyup (e) ->
    previewContent('#wiki_title', '#title-preview')

  $('#wiki_body').keyup (e) ->
    previewContent('#wiki_body', '#body-preview')


