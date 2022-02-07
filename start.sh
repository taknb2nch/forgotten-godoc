#! /bin/sh

tag=$1

if [ -z $tag ]; then
	echo "use golang:latest"

	tag="latest"
fi

docker build -t godoc-server --build-arg GOLANG_IMAGE=golang:$tag .  && \
	docker run -d --rm --name godoc-server -p 6060:6060 godoc-server

if [ $? == 0 ]; then
	echo ""
	echo ""
	echo "godoc server for $1 started"
	echo "open http://localhost:6060 in your browser"
	echo "if you want to stop the godoc server, please run ./stop.sh"
else
	echo ""
	echo ""
	echo "failure to start godoc server for $1"
fi
