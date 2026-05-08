FROM python:3.13-slim

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir .

ENV PORT=8080
EXPOSE 8080

CMD ["sh", "-c", "python -m duckduckgo_mcp_server.server --transport streamable-http --host 0.0.0.0 --port ${PORT:-8080}"]
