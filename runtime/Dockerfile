FROM alpine

ONBUILD COPY --from=builder /app/* /app/

CMD ["cat", "/app/index"]