var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "password",
  database: "bamazon"
});

connection.connect(function(err) {
  console.log("Connected as id: " + connection.threadId);
  if(err) throw err;
  start();
});

function start() {
  inquirer.prompt([
    {
      name: "productId",
      type: "message",
      message: "Please enter product ID"
    },
    {
      name: "numUnits",
      type: "message",
      message: "Please enter number of units"
    }
  ]).then(function(answer) {
    var unitId = answer.productId;
    var units = answer.numUnits;
    checkInventory(unitId, units);
  });
}

function checkInventory(product, qty) {
  connection.query("SELECT * FROM products WHERE ?", {
      item_id: product
    }, function(err, res) {
        if (err) throw err;
        var remUnits = res[0].stock_quantity;
        var price = res[0].price;
        var name = res[0].product_name;
        var newUnits = remUnits - qty;
        if (qty > remUnits) {
          console.log("Insufficient Quantity");
        } else {
          connection.query("UPDATE products SET ? WHERE ?", [{
            stock_quantity: newUnits
          },
          {
            item_id: product
          }], function(err, res) {});
          console.log("You purchased " + qty + " " + name + "s");
          console.log("Your total is " + price * qty);
          process.exit();
        }
      });
}