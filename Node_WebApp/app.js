// RANDOMLY GENERATE AND INSERT 500+ USERS
var faker = require("faker");
var mysql = require("mysql");

function generateAddress() {
  console.log("----------------------");
  console.log(faker.address.streetAddress());
  console.log(faker.address.city());
  console.log(faker.address.state());
}

generateAddress();
generateAddress();
generateAddress();
