.PHONY: install test run docker-build docker-run

install:
	cd app && npm install

test:
	cd app && npm test

run:
	cd app && npm start

docker-build:
	docker build -t nodejs-cicd-local .

docker-run:
	docker run --rm -p 3000:3000 nodejs-cicd-local
