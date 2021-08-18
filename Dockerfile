FROM gcc:latest as builder
WORKDIR /workspace
COPY a.c ./
RUN gcc a.c -o a.out

FROM busybox:glibc
WORKDIR /
COPY --from=builder /workspace/a.out .
CMD ["./a.out"]
