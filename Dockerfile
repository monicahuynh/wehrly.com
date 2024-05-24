FROM node:lts-alpine

EXPOSE 5000
ENV PORT 5000

WORKDIR /app

ADD . .

CMD ["node", "index.html"]
