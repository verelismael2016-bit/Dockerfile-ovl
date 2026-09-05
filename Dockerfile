FROM node:20-bullseye-slim

RUN apt-get update && \
    ( for i in 1 2 3 4 5; do \
        apt-get install -y --no-install-recommends ffmpeg git && break; \
        echo "Tentative $i echouee (miroir Debian probablement desync), nouvel essai..."; \
        apt-get update; \
        sleep 5; \
      done ) && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Ainz-devs/OVL-MD-V2.git /ovl_bot

WORKDIR /ovl_bot

RUN npm install

EXPOSE 8000

CMD ["npm", "run", "Ovl"]
