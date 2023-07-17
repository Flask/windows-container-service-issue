FROM golang:1.20-nanoserver-ltsc2022 as build

WORKDIR /svc

COPY src .

RUN go mod init github.com/flask/windows-container-service-issue && go mod tidy

ENV GOOS=windows
ENV GOARCH=386
RUN go build -o servicetest.exe .

FROM mcr.microsoft.com/windows/server:ltsc2022

COPY --from=build svc/servicetest.exe /

RUN servicetest.exe install

CMD ["servicetest.exe", "start"]
