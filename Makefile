BUCKET:=artifactory-us-east-1-290728412178
bin: build
	cp ./cfn-deploy ${GOPATH}/bin

build:
	go build -o cfn-deploy .

build-linux:
	GOOS=linux GOARCH=amd64 go build -o cfn-deploy .

publish-package: build-linux
	aws s3 cp cfn-deploy s3://$(BUCKET)/drs/cfn-deploy

test:
	go test ./...