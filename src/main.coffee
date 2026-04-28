RPC = ({ url, token }) ->
  config =
    method: 'POST'
    headers:
      'Content-Type': 'application/json'

  if token
    config.headers.Authorization = token

  (name, input) ->
    body = if input
      fn: name
      in: input
    else
      fn: name

    body = JSON.stringify body
    c = { config..., body }
      
    fetch url, c
      .then (response) ->
        if response.ok
          response.json()
        else
          Promise.reject response.status

export { RPC }
