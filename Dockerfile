FROM node:20
WORKDIR /app

COPY ./package*.json ./
RUN npm ci

COPY . .

EXPOSE 3000

CMD if [ ${NODE_ENV} = "development" ]; then \
      npm run dev; \
    else \
      npm run start; \
    fi
