//so i can keep my auth on a different page and not have to commit it each time
var connections = require('./keys.js');

//our normal requires
var pg = require('pg');
var sql = require("squel").useFlavour('postgres');
var Twit = require('twit');

function makeSQL(tweet){
    
    //just some simple parsing for the special geometry functions i use to store the point
    //some times 3395 or 4326
    //converts the thing to sql nice stuff
    var srid = 4326;  
    var coordinates = tweet.geo.coordinates;
    var query =
        {
               // text : "INSERT INTO tweets (username, tweet, geo) Values ($1,$2,st_setsrid(st_makepoint($3,$4),"+srid+"))",
				text : "INSERT INTO tweets (twitterID, tweetID, username, place, coords, created_at, tweettext) Values ($1,$2, $3, $4 ,st_setsrid(st_makepoint($5,$6),"+srid+"), $7)",
				values:[tweet.user.id_str ,tweet.id_str, tweet.user.screen_name, tweet.place.name, coordinates[1] , coordinates[0], date, tweet.text  ]
        };
        
    return query;

}
