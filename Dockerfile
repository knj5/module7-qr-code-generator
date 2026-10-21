FROM python:3.12-slim-bullseye

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN useradd -m myuser && \
    mkdir -p logs qr_codes && \
    chown myuser:myuser logs qr_codes

COPY --chown=myuser:myuser . .
RUN mkdir -p /app/qr_codes && chown -R myuser:myuser /app/qr_codes

USER myuser

ENTRYPOINT ["python", "main.py"]
CMD ["--url", "http://github.com/kaw393939"]
