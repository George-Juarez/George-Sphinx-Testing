FROM python:3.13.3 AS uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
ENV UV_LINK_MODE=copy \
    UV_COMPILE_BYTECODE=1 \
    UV_PYTHON_DOWNLOADS=never \
    UV_PYTHON=python3.13 \
    UV_PROJECT_ENVIRONMENT=/app

FROM uv AS build

RUN --mount=type=cache,target=/root/.cache \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync \
    --locked \
    --no-dev \
    --no-install-project


FROM python:3.13.3 AS prod
ENV PATH=/app/bin:$PATH
RUN <<EOT
groupadd -r app
useradd -r -d /app -g app -N app
EOT
COPY --from=build --chown=app:app /app /app
COPY ./src /app/src
USER app
WORKDIR /app
ENTRYPOINT ["bin/python3", "-m", "flask", "--app", "src.main", "run", "--host=0.0.0.0"]
STOPSIGNAL SIGINT
