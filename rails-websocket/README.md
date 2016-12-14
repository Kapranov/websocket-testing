# README

> Install nodejs tool to benchmark socket.io and faye websocket server.

```
  npm install -g websocket-bench
```

> Run Rails server

```
  cd websocket-testing
  rails s -p 3000 -e development
```

> Start benchmark

```
websocket-bench -a 1000 -c 200 ws://127.0.0.1:3000/ws
websocket-bench broadcast ws://127.0.0.1:3000/ws --concurrent 10 --sample-size 100 --step-size 1000 --limit-percentile 95 --limit-rtt 250ms
```
