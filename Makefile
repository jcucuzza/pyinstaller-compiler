.SILENT:

.PHONY: build

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build/linux: ## Build linux docker image
	docker build --no-cache -t jcucuzza/pyinstaller-compiler-linux -f linux.Dockerfile .
