var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var app = express();
const port = 3000;

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'fSu4T@910S88OFj4MazvZ7MtX',
  database: 'join_us'
});

app.get("/", function(request, response) {
  var q = 'SELECT COUNT(*) AS count FROM users';
  connection.query(q, function(error, results) {
    if (error) throw error;
    var count = results[0].count;
    // var message = "We have " + count + " users";
    // response.send(message);
    response.render("home", {count: count});
  });
});

app.get("/joke", function(request, response) {
  let joke = "<strong>What do you call a dog that does magic tricks?</strong> <em>A labracadabrador.</em>";
  response.send(joke);
});

app.get("/random_num", function(request, response) {
  var randomNumber = Math.floor(Math.random() * 10) + 1
  response.send("Your random number is " + randomNumber);
});

app.post('/register', function(request, response) {
  var person = {
    email: request.body.email
  };
  connection.query('INSERT INTO users SET ?', person, function(err, result) {
    if (err) throw err;
    response.redirect("/");
  });
});

app.listen(port, function(){
  console.log(`App is running on port ${port}!`);
});

//
