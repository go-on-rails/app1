# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
    $('.task_row').click ->
        $('.solution', this).slideToggle(50)
    $('input[name="commit"]').click ->
        data = $('#task_numbers').val()
        if data.match(/^\s$/)
            alert 'Введите хоть что-нибудь!'
            return false
        unless check(data)
            do showError
            return false

check = (text) ->
    splited_numbers = text.split(/[\s]*(?:[;]|[\s])[\s]*/)
    for number in splited_numbers
      if not number.match(/^-?\d+\.?\d*$/)
        return false

    return true

showError = ->
    alert 'Вы ввели данные, несоответствующие формату!'
    $('#task_numbers').select()