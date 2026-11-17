# CX Playground

The CX Playground is a web service for programmers' to test and run programs using Skycoin's programming language called "CX".

# Instructions

- Run `make run`. You will see:

```
Starting web service for CX playground on http://127.0.0.1:5336/
```

- In another terminal, run this as a hello world example:

```
curl -H "Content-Type: application/json" -X POST -d '{"code": "package main; func main() {str.print(\"Hello, world!\");}"}' http://localhost:5336/eval
```

- Get playground page
```
curl -H "Content-Type: application/json" -X GET http://localhost:5336/playground
```

- Get example file list
```
curl -H "Content-Type: application/json" -X GET http://localhost:5336/playground/examples
```

- Get example file content
```
curl -H "Content-Type: application/json" -X POST  -d '{"examplename": "example1.cx"}' http://localhost:5336/playground/examples/code
```
# How programs run

Each `/eval` and `/showast` request compiles and runs the program in a child
process, which is this binary started with `-cx-eval` or `-cx-ast`. The CX
compiler keeps process wide state, so reusing one process gave wrong results
from the second program on. A child that runs longer than 20 seconds is
killed and the reply ends with `Timed out.`

The Dockerfile predates the move to skycoin-cx and has not been rebuilt. It
needs skycoin-cx to be published, or both repositories in the build context.
