FROM curlimages/curl as curler
WORKDIR /home/curl_user
RUN curl -sLO https://github.com/fullstorydev/grpcurl/releases/download/v1.8.7/grpcurl_1.8.7_linux_x86_64.tar.gz && curl -sLO https://github.com/bojand/ghz/releases/download/v0.115.0/ghz-linux-x86_64.tar.gz
RUN tar -xvf grpcurl_1.8.7_linux_x86_64.tar.gz && tar -xvf ghz-linux-x86_64.tar.gz

FROM alpine:latest
RUN apk update && apk add curl \
                          netcat-openbsd \
                          bind-tools \
                          vim \
                          nmap
COPY --from=curler /home/curl_user/grpcurl /bin/grpcurl
COPY --from=curler /home/curl_user/ghz /bin/ghz
