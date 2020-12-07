FROM rust:1.35.0 as build

WORKDIR /usr/src

ENV TARGET x86_64-unknown-linux-musl
ENV NAME hello_world

RUN rustup target add $TARGET
ENV USER root
RUN cargo new $NAME

WORKDIR /usr/src/$NAME

RUN cargo build

RUN cargo install --target $TARGET --path /usr/src/$NAME

FROM scratch
COPY --from=build /usr/local/cargo/bin/hello_world /
CMD [ "/hello_world" ]
