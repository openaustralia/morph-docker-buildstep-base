all: build

build:
	docker build -t openaustralia/morph-docker-buildstep-base .
