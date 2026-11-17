.PHONY: build run test vet

build: ## Build the playground into ./bin
	go build -o ./bin/cxplayground .

run: build ## Serve on :5336 from this directory (examples/ and dist/ are read from the working directory)
	./bin/cxplayground

test:
	go test ./...

vet:
	go vet ./...
