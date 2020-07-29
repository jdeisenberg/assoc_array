// Generated by BUCKLESCRIPT, PLEASE EDIT WITH CARE
'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Caml_obj = require("bs-platform/lib/js/caml_obj.js");
var Caml_array = require("bs-platform/lib/js/caml_array.js");
var Caml_option = require("bs-platform/lib/js/caml_option.js");

function assocBy(key, f, arr) {
  var _index = 0;
  while(true) {
    var index = _index;
    if (index === arr.length) {
      throw {
            RE_EXN_ID: "Not_found",
            Error: new Error()
          };
    }
    var match = Caml_array.caml_array_get(arr, index);
    if (Curry._2(f, match[0], key)) {
      return match[1];
    }
    _index = index + 1 | 0;
    continue ;
  };
}

function assocByOpt(key, f, arr) {
  var _index = 0;
  while(true) {
    var index = _index;
    if (index === arr.length) {
      return ;
    }
    var match = Caml_array.caml_array_get(arr, index);
    if (Curry._2(f, match[0], key)) {
      return Caml_option.some(match[1]);
    }
    _index = index + 1 | 0;
    continue ;
  };
}

function assoc(key, arr) {
  return assocBy(key, Caml_obj.caml_equal, arr);
}

function assocOpt(key, arr) {
  return assocByOpt(key, Caml_obj.caml_equal, arr);
}

function assocQ(key, arr) {
  return assocBy(key, (function (x, y) {
                return x === y;
              }), arr);
}

function assocOptQ(key, arr) {
  return assocByOpt(key, Caml_obj.caml_equal, arr);
}

function assocAllBy(key, f, arr) {
  var _acc = [];
  var _index = 0;
  while(true) {
    var index = _index;
    var acc = _acc;
    if (index === arr.length) {
      return acc;
    }
    var match = Caml_array.caml_array_get(arr, index);
    _index = index + 1 | 0;
    _acc = Curry._2(f, match[0], key) ? $$Array.append(acc, [match[1]]) : acc;
    continue ;
  };
}

function existsAssocBy(key, f, arr) {
  return assocByOpt(key, f, arr) !== undefined;
}

function existsAssoc(key, arr) {
  return existsAssocBy(key, Caml_obj.caml_equal, arr);
}

function existsAssocQ(key, arr) {
  return existsAssocBy(key, (function (x, y) {
                return x === y;
              }), arr);
}

function removeAssocBy(key, f, arr) {
  var len = arr.length;
  var helper = function (_index) {
    while(true) {
      var index = _index;
      if (index === len) {
        return index;
      }
      var match = Caml_array.caml_array_get(arr, index);
      if (Curry._2(f, match[0], key)) {
        return index;
      }
      _index = index + 1 | 0;
      continue ;
    };
  };
  var foundAt = helper(0);
  return $$Array.append($$Array.sub(arr, 0, foundAt), foundAt < len ? $$Array.sub(arr, foundAt + 1 | 0, len - (foundAt + 1 | 0) | 0) : []);
}

function removeAssoc(key, arr) {
  return removeAssocBy(key, Caml_obj.caml_equal, arr);
}

function removeAssocQ(key, arr) {
  return removeAssocBy(key, (function (x, y) {
                return x === y;
              }), arr);
}

function removeAssocAllBy(key, f, arr) {
  var len = arr.length;
  var _acc = [];
  var _index = 0;
  while(true) {
    var index = _index;
    var acc = _acc;
    if (index === len) {
      return acc;
    }
    var match = Caml_array.caml_array_get(arr, index);
    var k = match[0];
    if (Curry._2(f, k, key)) {
      _index = index + 1 | 0;
      continue ;
    }
    _index = index + 1 | 0;
    _acc = $$Array.append(acc, [[
            k,
            match[1]
          ]]);
    continue ;
  };
}

exports.assocBy = assocBy;
exports.assocByOpt = assocByOpt;
exports.assoc = assoc;
exports.assocOpt = assocOpt;
exports.assocQ = assocQ;
exports.assocOptQ = assocOptQ;
exports.assocAllBy = assocAllBy;
exports.existsAssocBy = existsAssocBy;
exports.existsAssoc = existsAssoc;
exports.existsAssocQ = existsAssocQ;
exports.removeAssocBy = removeAssocBy;
exports.removeAssoc = removeAssoc;
exports.removeAssocQ = removeAssocQ;
exports.removeAssocAllBy = removeAssocAllBy;
/* No side effect */
