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

    priority = (test) -> ['sync', 'live', 'realtime'].indexOf test

### Sanitizers

    dbname = (db) -> if isObject db then db.name else db

    docid = (doc) -> if isObject doc then doc._id else doc

    urlname = (url) ->

      url = new URL url

      "#{ url.host }#{ url.pathname }"

### Generators

    mkkey = (resource) -> switch resource.type

      when 'sync' then "#{ resource.local } <-> #{ resource.remote }"

      when 'push' then "#{ resource.local } -> #{ resource.remote }"

      when 'pull' then "#{ resource.local } <- #{ resource.remote }"

    mkconf = (resource, key = mkkey resource) ->

      return unless key

      { type, queue, local, remote } = resource

      { key, type, queue, local, remote, retry: false, live: queue in ['realtime', 'live'] }

    mkname = (target) ->

      name = unless isObject target then target else target.name

      unless name.match? /^https?:\/\// then name else urlname name

### Exports

    module.exports = {
      assign, allPass, isObject, dbname, docid, urlname, mkkey, mkconf, priority, mkname
    }

## Tests

    test = require 'tape-async'

    test 'exports', (t) ->
      t.plan 1

      t.deepEqual module.exports, {
        assign, allPass, isObject, dbname, docid, urlname, mkkey, mkconf, priority, mkname
      }

## Version 0.1.6

## License [MIT](LICENSE)

[travis]: https://img.shields.io/travis/nhz-io/nhz-io-pouch-db-manager-helpers.svg?style=flat
[npm]: https://img.shields.io/npm/v/@nhz.io/pouch-db-manager-helpers.svg?style=flat
