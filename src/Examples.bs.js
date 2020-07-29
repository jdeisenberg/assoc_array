// Generated by BUCKLESCRIPT, PLEASE EDIT WITH CARE
'use strict';

var AssocArray$Assoc_array = require("./AssocArray.bs.js");

var data = [
  [
    1,
    "one"
  ],
  [
    2,
    "two"
  ],
  [
    3,
    "three"
  ],
  [
    2,
    "one plus one"
  ],
  [
    4,
    "four"
  ]
];

console.log("assoc 2", AssocArray$Assoc_array.assoc(2, data));

console.log("assocOpt 2", AssocArray$Assoc_array.assocOpt(2, data));

console.log("assocOpt 5", AssocArray$Assoc_array.assocOpt(5, data));

console.log("assocOptQ 2", AssocArray$Assoc_array.assocOptQ(2, data));

console.log("assocOptQ 5", AssocArray$Assoc_array.assocOptQ(5, data));

console.log("assocAllBy 2", AssocArray$Assoc_array.assocAllBy(2, (function (x, y) {
            return x === y;
          }), data));

console.log("assocAllBy 4", AssocArray$Assoc_array.assocAllBy(4, (function (x, y) {
            return x === y;
          }), data));

console.log("assocAllBy 5", AssocArray$Assoc_array.assocAllBy(5, (function (x, y) {
            return x === y;
          }), data));

console.log("existsAssoc 2", AssocArray$Assoc_array.existsAssoc(2, data));

console.log("existsAssoc 5", AssocArray$Assoc_array.existsAssoc(5, data));

var d2 = AssocArray$Assoc_array.removeAssoc(2, data);

console.log("remove 2", d2);

var d3 = AssocArray$Assoc_array.removeAssoc(4, data);

console.log("remove 4", d3);

var d4 = AssocArray$Assoc_array.removeAssoc(1, data);

console.log("remove 1", d4);

var d5 = AssocArray$Assoc_array.removeAssoc(5, data);

console.log("remove 5", d5);

var d6 = AssocArray$Assoc_array.removeAssocAllBy(2, (function (x, y) {
        return x === y;
      }), data);

console.log("remove all 2", d6);

var d7 = AssocArray$Assoc_array.removeAssocAllBy(5, (function (x, y) {
        return x === y;
      }), data);

console.log("remove all 5", d7);

exports.data = data;
exports.d2 = d2;
exports.d3 = d3;
exports.d4 = d4;
exports.d5 = d5;
exports.d6 = d6;
exports.d7 = d7;
/*  Not a pure module */
