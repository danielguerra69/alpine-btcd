FROM alpine:edge
MAINTAINER danielguerra
RUN apk add --update --no-cache go git musl-dev glide
ENV GOPATH=/usr
WORKDIR /usr
RUN go get -u github.com/Masterminds/glide
RUN git clone https://github.com/btcsuite/btcd $GOPATH/src/github.com/btcsuite/btcd
WORKDIR $GOPATH/src/github.com/btcsuite/btcd
RUN glide install
RUN go install . ./cmd/...
RUN rm -rf /usr/src/github.com && apk del go git musl-dev glide
RUN addgroup btcd
RUN adduser  -G btcd -s /bin/sh -D btcd
WORKDIR /home/btcd
USER btcd
RUN mkdir /home/btcd/.btcd
ADD .btcd/ /home/btcd/
VOLUME /home/btcd/.btcd
EXPOSE 8333 8334
CMD ["/usr/bin/btcd","--listen=","--rpclisten="]
