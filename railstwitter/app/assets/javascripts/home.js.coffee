# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#tweetCounter').each ->
        setInterval () ->
            request = $.get '/home/update'
            request.success (data) -> $('#tweetCounter').html data
        ,1000
        
$(document).ready ->
    $('#lastTweet').each ->
        setInterval () ->
            request = $.get '/home/lastTweet'
            request.success (data) -> 
                $('#lastTweet').slideUp ->
                    $('#lastTweet').html data.tweettext + " -" + data.username
                $('#lastTweet').slideDown ->
        ,10000
    
$(document).ready ->
   $(document).scroll ->
    if ($(window).scrollTop() >= ($(document).height() - $(window).height())*0.7)
            page = $('.lazyloaded').data('page')
            if (page != undefined)
                request = $.get '/home/loadPages?page=' + page
            
                page++
                $('.lazyloaded').data('page', page)
            
                request.success (data) -> $('.lazyloaded > tbody').append data 
            
           