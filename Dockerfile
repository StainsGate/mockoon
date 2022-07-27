FROM node:14-alpine

RUN npm install -g @mockoon/cli@2.0.0
COPY mockoon-mise1.json ./mockoon-mise1.json

# Do not run as root.
RUN adduser --shell /bin/sh --disabled-password --gecos "" mockoon
RUN chown -R mockoon ./mockoon-mise1.json
USER mockoon

EXPOSE 3000

ENTRYPOINT ["mockoon-cli", "start", "--hostname", "0.0.0.0", "--daemon-off", "--data", "mockoon-mise1.json", "--container"]

# Usage: docker run -p <host_port>:<container_port> mockoon-test