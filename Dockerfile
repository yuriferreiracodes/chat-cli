FROM python:3.13-slim
WORKDIR /app

COPY src ./src
COPY pyproject.toml README.md poetry.lock* ./

RUN pip install --no-cache-dir poetry
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi --no-root

ENV PYTHONPATH=/app
CMD ["python", "src/main.py"]