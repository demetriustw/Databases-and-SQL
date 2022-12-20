const { consumers } = require("stream");
var express = require("express");
var mysql = require("mysql");
var app = express();

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "join_us",
  password: "Ago0dPas5W0rd",
});

app.get("/", function (req, res) {
  // Find count of users in DB
  var q = "SELECT COUNT(*) FROM users";
  connection.query(q, function (err, results) {
    if (err) throw err;
    console.log(results);
  });
  // Respond with that count
  res.send("We have " + count + " users in our db");
});

app.get("/joke", function (req, res) {
  var joke =
    "What do you call a dog that does magic tricks? A labracadabrador.";
  res.send(joke);
});

app.get("/random_num", function (req, res) {
  var num = Math.floor(Math.random() * 10) + 1;
  res.send("Your lucky number is " + num);
});

app.listen(8080, function (err) {
  if (err) console.log("Error in server setup");
  console.log("Server running on 8080!");
});
