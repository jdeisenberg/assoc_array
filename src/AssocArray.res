/**
 * An Assocation Array is an array of two-tuples, where the first element of the tuple
 * may be considered a key and the second element a value.
 *
 */

/**
 * Look for the given `key` in the array `arr`. If the key is found,
 * return the corresponding value. Otherwise, raise `Not_found`.
 * Use the given predicate function `f` to determine if a key is found.
 */
let assocBy: ('a, ('a, 'a) => bool, array<('a, 'b)>) => 'b =
  (key, f, arr) => {
    let rec helper = (index: int): 'b => {
      if (index == Array.length(arr)) {
        raise(Not_found)
      } else {
        let (k, v) = arr[index]
        f(k, key) ? v : helper(index + 1)
      }
    }
    helper(0)
}

/**
 * Look for the given `key` in the array `arr`.
 * If the key is found, return `Some(value)`. Otherwise, return `None`.
 * Use the given predicate function `f` to determine if a key is found.
 */
let assocByOpt: ('a, ('a, 'a) => bool, array<('a, 'b)>) => option<'b> = 
  (key, f, arr) => {
    let rec helper = (index: int): option<'b> => {
      if (index == Array.length(arr)) {
        None
      } else {
        let (k, v) = arr[index]
        f(k, key) ? Some(v) : helper(index + 1)
      }
    }
    helper(0)
}

/**
 * Look for the given `key` in the array `arr`. If the key is found, 
 * return the corresponding value. Otherwise, raise `Not_found`.
 * This function uses the `compare` function to compare for structural equality.
 */
let assoc: ('a, array<('a, 'b)>) => 'b =
  (key, arr) => assocBy(key, {(x, y) => compare(x, y) == 0}, arr)

/**
 * Look for the given `key` in the array `arr`.
 * If the key is found, return `Some(value)`. Otherwise, return `None`.
 * This function uses the `compare` method to compare for structural equality.
 */
let assocOpt: ('a, array<('a, 'b)>) => option<'b> =
  (key, arr) => assocByOpt(key, {(x, y) => compare(x, y) == 0}, arr)

/**
 * Look for the given `key` in the array `arr`. If the key is found,
 * return the corresponding value. Otherwise, raise `Not_found`.
 * This function uses the `===` operator to compare for physical equality.
 */
let assocQ: ('a, array<('a, 'b)>) => 'b =
  (key, arr) =>  assocBy(key, {(x, y) => x === y}, arr)

/**
 * Look for the given `key` in the array `arr`.
 * If the key is found, return`Some(value)`. Otherwise, return `None`.
 * This function uses the `===` operator to compare for physical equality.
 */
let assocOptQ: ('a, array<('a, 'b)>) => option<'b> =
  (key, arr) => assocByOpt(key, {(x, y) => x == y}, arr)

  
/**
 * Return an array of all values in `arr` with the matching `key`.
 * Use `f` as a predicate function to tell if a key matches or not.
 */
let assocAllBy: ('a, ('a, 'a) => bool, array<('a, 'b)>) => array<'b> = 
  (key, f, arr) => {
    let rec helper = (acc: array<'b>, index: int): array<'b> => {
      if (index == Array.length(arr)) {
        acc
      } else {
        let (k, v) = arr[index]
        helper(f(k, key) ? Array.append(acc, [v]) : acc, index + 1)
      }
    }
    helper([], 0)
}

/**
 * Return `true` if the given key is in the array, `false` otherwise,
 * using predicate function `f` to compare for equality.
 */
let existsAssocBy: ('a, ('a, 'a) => bool, array<('a, 'b)>) => bool = 
  (key, f, arr) => {
    switch (assocByOpt(key, f, arr)) {
      | Some(_) => true
      | None => false
    }
}

/**
 * Return `true` if the given key is in the array, `false` otherwise,
 * using `compare` to compare for structural equality.
 */
let existsAssoc: ('a, array<('a, 'b)>) => bool =
  (key, arr) => existsAssocBy(key, (x, y) => {compare(x, y) == 0}, arr)

/**
 * Return `true` if the given key is in the array, `false` otherwise,
 * using === to compare for physical equality.
 */
let existsAssocQ: ('a, array<('a, 'b)>) => bool =
  (key, arr) => existsAssocBy(key, (x, y) => {x === y}, arr)

/**
 * Returns an array without the first item with the matching key.
 * Uses predicate function `f` to compare for equalilty.
 */
let removeAssocBy: ('a, ('a, 'a) => bool, array<('a, 'b)>) => array<('a, 'b)> =
  (key, f, arr) => {
    let len = Array.length(arr)
    
    let rec helper = (index: int): int => {
      if (index == len) {
        index
      } else {
        let (k, _) = arr[index]
        f(k, key) ? index : helper(index + 1)
      }
    }
    let foundAt = helper(0)
    Array.append(Array.sub(arr, 0, foundAt),
      (foundAt < len) ? Array.sub(arr, foundAt +1, len - (foundAt + 1)) : [])
}

/**
 * Returns an array without the first item with the matching key.
 * Uses the `compare` function to compare for structural equalilty.
 */
let removeAssoc: ('a, array<('a, 'b)>) => array<('a, 'b)> =
  (key, arr) => removeAssocBy(key, (x, y) => {compare(x, y) == 0}, arr)
  
/**
 * Returns an array without the first item with the matching key.
 * Uses the `===` function to compare for physical equalilty.
 */
let removeAssocQ: ('a, array<('a, 'b)>) => array<('a, 'b)> =
  (key, arr) => removeAssocBy(key, (x, y) => {x === y}, arr)
