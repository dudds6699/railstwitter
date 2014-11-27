//so i can keep my auth on a different page and not have to commit it each time
var connections = require('./keys.js');

//our normal requires
var pg = require('pg');
var sql = require("squel").useFlavour('postgres');
var Twit = require('twit');

var T = new Twit(connections.Tweet);
var conString = connections.db;

function makeSQL(tweet){
    
    //just some simple parsing for the special geometry functions i use to store the point
    //some times 3395 or 4326
    //converts the thing to sql nice stuff
    var srid = 4326;  
    var coordinates = tweet.geo.coordinates;
    var place = tweet.place == null ? "": tweet.place.name;
    var query =
        {
               // text : "INSERT INTO tweets (username, tweet, geo) Values ($1,$2,st_setsrid(st_makepoint($3,$4),"+srid+"))",
				text : 'INSERT INTO tweets ("twitterID", "tweetID", username, place, coords, created_at, tweettext) Values ($1,$2, $3, $4 ,st_setsrid(st_makepoint($5,$6),'+srid+'), $7, $8)',
				values:[tweet.user.id_str ,tweet.id_str, tweet.user.screen_name, place, coordinates[1] , coordinates[0], new Date(), tweet.text  ]
        };
        
    return query;

}

function connectToDb(sql){

        
        console.log(sql.values)
        
        var query = client.query(sql);
        
        query.on('end', function (result){
            console.log(result);
        });
                
}

//my stream
var stream = T.stream('statuses/sample');

//streams the tweet and then goes and gets it
stream.on('tweet', function(tweet) {
    if (tweet.geo !== null)
        connectToDb(makeSQL(tweet));
});

var client = new pg.Client(conString);
client.connect();
//client.on('drain', client.end.bind(client));

client.on('error', function(error){
    console.log(error);
    client.end.bind(client);
});