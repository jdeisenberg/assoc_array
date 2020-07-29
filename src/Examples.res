open AssocArray

let data = [(1, "one"), (2, "two"), (3, "three"), (2, "one plus one"), (4, "four")]

Js.log2("assoc 2", assoc(2, data))
// Js.log2("assoc 5", AssocArray.assoc(5, data)) // throws Not_found

Js.log2("assocOpt 2", assocOpt(2, data))
Js.log2("assocOpt 5", assocOpt(5, data))

Js.log2("assocOptQ 2", assocOptQ(2, data))
Js.log2("assocOptQ 5", assocOptQ(5, data))

Js.log2("assocAllBy 2", assocAllBy(2, (x, y) => {x == y}, data))
Js.log2("assocAllBy 4", assocAllBy(4, (x, y) => {x == y}, data))
Js.log2("assocAllBy 5", assocAllBy(5, (x, y) => {x == y}, data))

Js.log2("existsAssoc 2", existsAssoc(2, data))
Js.log2("existsAssoc 5", existsAssoc(5, data))

let d2 = removeAssoc(2, data)
Js.log2("remove 2", d2)

let d3 = removeAssoc(4, data)
Js.log2("remove 4", d3)

let d4 = removeAssoc(1, data)
Js.log2("remove 1", d4)

let d5 = removeAssoc(5, data)
Js.log2("remove 5", d5)

let d6 = removeAssocAllBy(2, (x, y) => {x == y}, data)
Js.log2("remove all 2", d6)

let d7 = removeAssocAllBy(5, (x, y) => {x == y}, data)
Js.log2("remove all 5", d7)
