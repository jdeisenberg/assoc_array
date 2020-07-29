# Assoc for Arrays

This module emulates the functions for Association Lists from OCaml’s `List` module (ref: https://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html), except with arrays.

An “association array“ is an array of two-tuples, where the first item is the key and the second item is the corresponding value.

This module has methods that let you specify a predicate function for comparing items for equality. It also includes a method that will find all the values for a given key.

# Build

```bash
# for yarn
yarn build

# for npm
npm run build
```

# Build + Watch

```bash
# for yarn
yarn start

# for npm
npm run start
```

