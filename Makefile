IMAGE=r4mmer/redis

full:
	docker build -t ${IMAGE}:full -f full.Dockerfile .

cli: full
	docker build -t ${IMAGE}:cli -f cli.Dockerfile .

server: full
	docker build -t ${IMAGE}:server -f server.Dockerfile .


images: cli server
	@echo "[+] Images built!"

pushes:
	docker push ${IMAGE}:cli
	docker push ${IMAGE}:server
	docker push ${IMAGE}:full

# TODO: make other tags like `cli-5.0.3`, `cli-5.0.3-alpine3.7`
