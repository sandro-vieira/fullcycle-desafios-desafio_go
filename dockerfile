FROM golang:1.21-alpine AS build

WORKDIR /user/src/app

COPY source/full-cycle-rocks.go .

RUN go build full-cycle-rocks.go

FROM scratch

COPY --from=build /user/src/app/full-cycle-rocks .

CMD [ "./full-cycle-rocks" ]