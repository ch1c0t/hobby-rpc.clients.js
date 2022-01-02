It is a [Hobby-RPC][hobby_rpc] client for browsers, using the built-in [Fetch API][fetch_api]. To install:

```
npm i hobby-rpc
```

A usage example:
```coffeescript
import { RPC } from 'hobby-rpc'

rpc = RPC
  url: 'https://some.domain'
  token: 'the bearer token'

output = await rpc 'SomeNullaryFunction'
output = await rpc 'SomeUnaryFunction', input
```

`input` can be any object serializable to JSON
(that's what will be passed to the remote function as an argument).
The remote server at https://some.domain is expected to implement
`SomeNullaryFunction` and `SomeUnaryFunction`.

`output` would be an object deserialized from JSON.

[hobby_rpc]: https://github.com/ch1c0t/hobby-rpc.protocol
[fetch_api]: https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API
