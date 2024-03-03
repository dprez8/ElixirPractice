# Makefile

.PHONY: build run test

build:
	docker-compose build

run:
	docker-compose up

test:
	docker-compose run app mix test