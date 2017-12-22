default:
	cat Makefile

build:
	docker build -f __cicd__/php/Dockerfile.runtime -t phpcms.runtime:v1 .

start:
	docker-compose up -d

stop:
	docker-compose down
