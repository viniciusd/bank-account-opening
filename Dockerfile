FROM elixir:1.10.2-alpine AS server
WORKDIR /app
ENV MIX_HOME=/root/.mix/
ENV HEX_HTTP_TIMEOUT=120
RUN mix do local.hex --force, local.rebar --force
COPY . /app
RUN rm -rf  /app/_build/ || true
RUN mix deps.get
RUN MIX_ENV=prod SECRET_KEY_BASE=$(mix phx.gen.secret) mix do phx.digest, release

FROM alpine
WORKDIR /app
# ncurses is required by ERTS
RUN apk add ncurses-libs
COPY --from=server /app/_build/prod /app
EXPOSE 5000

ENTRYPOINT ["/app/rel/bank-account/bin/bank-account"]
CMD ["start"]
