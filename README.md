node-cache
==========

Memcache system for node js. ncache allows servers to store in memory data using the key value pattern, this elements will be in memory until they expire.

## Using node-cache

Install it in your node server using npm install ncache - https://npmjs.org/package/ncache

* [set](#set)
* [get](#get)
* [remove](#remove)

<a name="set" />
### set(key, value, seconds)
Stores in the cache the value using the key as index (if the key exists it will overrite it). The entry will expire based on the number of seconds it receive

Usage:

    var Cache = require("ncache");
    var foo = {
        id: 10,
        name, "FOO"
    };
    Cache.set(foo.id, foo, 25);         /* foo will be in memcache for 25 seconds, and we will acces it with its id*/

<a name="get" />
### set(key)
Returns the value stored with the key if exists, if not it will return null

Usage:

    var Cache = require("ncache");
    var foo = {
        id: 10,
        name, "FOO"
    };
    Cache.set(foo.id, foo, 25);
    Cache.get(10);                      /* Returns {id:10, name: "foo"} if the countdown hasn't finished, else null */

<a name="remove" />
### remove(key)
Removes from the cache, if the element was in cache it will return true, if it wasn't false

Usage:

    var Cache = require("ncache");
    var foo = {
        id = 10;
        name = "FOO"
    };
    Cache.set(foo.id, foo, 25);

    Cache.remove(10);                   /* Returns true if it is still in cache, if it isn't false */

    Cache.get(10);                      /* Returns null */


