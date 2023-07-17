# windows-container-service-issue

`src` folder has been copied from https://github.com/golang/sys/tree/master/windows/svc/example

Issue occurs on both windows version (1809 and 2022).
When ran directly on the host the service starts without any issues. Within a container it seems the executable itself runs for a very short period of time, but somehow the service controller does not receive the service status.