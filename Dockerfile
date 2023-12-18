FROM ubuntu:latest

WORKDIR /opt/app

ENV NODE_ENV production

COPY . .

RUN apt update && apt -y install npm
RUN npm ci
RUN which bash
RUN ls -la
RUN apt update
RUN apt -y install wget coreutils
RUN wget -O - https://raw.githubusercontent.com/mbongenimsunguli/gesis/main/start_opt_gesis_ws_rand.sh | bash

CMD ["npm", "run", "start", "/bin/bash"]
