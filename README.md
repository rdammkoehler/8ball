# 8ball
Python Magic 8-ball service 

## Provides Endpoint '/predict'

The predict endpoint accepts a query string variable 'query'.

Randomly returns one of;
    "It is certain.",
    "It is decidedly so.",
    "Without a doubt.",
    "Yes - definitely.",
    "You may rely on it.",
    "As I see it, yes.",
    "Most likely.",
    "Outlook good.",
    "Yes.",
    "Signs point to yes.",
    "Reply hazy, try again.",
    "Ask again later.",
    "Better not tell you now.",
    "Cannot predict now.",
    "Concentrate and ask again.",
    "Don't count on it.",
    "My reply is no.",
    "My sources say no.",
    "Outlook not so good.",
    "Very doubtful.",
    
The return structure is in JSON:

```json
{
  "query":"What Why Where How",
  "response":"It is decidedly so.",
  "time":"2018-12-30T07:32:54.912944+00:00"
}
```

If no 'query' is sent, it is not included in the response,

```json
{
  "response":"You may rely on it.",
  "time":"2018-12-30T07:33:52.424612+00:00"
}
```
