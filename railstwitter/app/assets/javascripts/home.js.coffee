# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    setInterval () ->
        request = $.get '/home/update'
        request.success (data) -> $('#tweetCounter').html data
    ,1000
    
$(document).ready ->
   
    $('#load').click ->
            page = $('.lazyloaded').data('page')
            request = $.get 'home/loadPages?page=' + page
            
            page++
            $('.lazyloaded').data('page', page)
            
            request.success (data) -> $('.lazyloaded > tbody').append data 
            
           