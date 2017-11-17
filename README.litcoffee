# PouchDB Manager Helpers

[![Travis Build][travis]](https://travis-ci.org/nhz-io/nhz-io-pouch-db-manager-helpers)
[![NPM Version][npm]](https://www.npmjs.com/package/@nhz.io/pouch-db-manager-helpers)

## Install

```bash
npm i -S @nhz.io/pouch-db-manager-helpers
```

## Usage
```js
const helpers = require('@nhz.io/pouch-db-manager-helpers')

...
```

## Literate Source

### Helpers

    assign = (args...) -> Object.assign {}, args...

    allPass = (predicates) ->

      predicates = predicates.filter (i) -> i

      (test) ->

        return for predicate in predicates when not predicate test

        true

    isObject = (target) -> typeof target is 'object'

### Sanitizers

    dbname = (db) -> if isObject db then db.name else db

    docid = (doc) -> if isObject doc then doc._id else doc

    urlname = (url) ->

      url = new URL url

      "#{ url.host }#{ url.pathname }}"

### Exports

    module.exports = { assign, allPass, isObject, dbname, docid, urlname }

## Tests

    test = require 'tape-async'

    test 'exports', (t) ->
      t.plan 1

      t.deepEqual module.exports, { assign, allPass, isObject, dbname, docid, urlname }

## Version 0.0.0

## License [MIT](LICENSE)

[travis]: https://img.shields.io/travis/nhz-io/nhz-io-pouch-db-manager-helpers.svg?style=flat
[npm]: https://img.shields.io/npm/v/@nhz.io/pouch-db-manager-helpers.svg?style=flat
