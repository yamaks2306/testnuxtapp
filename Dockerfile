FROM node:lts
WORKDIR /app
RUN addgroup --gid 3344 appuser && \
    adduser --gid 3344 appuser --uid 3344 && \
    chown appuser:appuser /app

COPY --chown=appuser:appuser . /app

USER appuser

RUN npm ci && npm run build
ENV HOST 0.0.0.0
EXPOSE 3000

CMD ["npm", "run", "start"]