dependency:
	go get -u github.com/golang/dep/cmd/dep
	dep ensure -update

website:
	cd website && rm -rf public && hugo

test:
	for d in $(shell go list ./... | grep -v vendor); do \
		go test -race $$d; \
	done

serve:
	cd website && hugo serve

.PHONY: dependency website serve 
