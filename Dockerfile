# global args
ARG GOLANG_IMAGE=golang:latest

#
FROM $GOLANG_IMAGE

RUN go install golang.org/x/tools/cmd/godoc@latest

EXPOSE 6060

CMD ["godoc", "-http=:6060"]
