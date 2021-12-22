RPC = ({ url, token }) ->
  config =
    method: 'POST'
    headers:
      Authorization: token
      'Content-Type': 'application/json'

  (name, input) ->
    body = if input
      fn: name
      in: input
    else
      fn: name

    body = JSON.stringify body
    c = { config..., body }
      
    window
      .fetch url, c
      .then (response) ->
        if response.ok
          response.json()
        else
          Promise.reject response.status

export { RPC }
