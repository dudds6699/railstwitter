# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


initialize = () ->
    mapOptions = {
        center: { lat: 46.534343, lng: -84.332939},
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.SATELLITE
    }
    map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions)




$(document).ready ->
    if(document.getElementById('map-canvas') != null)
        google.maps.event.addDomListener(window, "load", initialize);