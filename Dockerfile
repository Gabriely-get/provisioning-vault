FROM alpine:3.14

ENV VAULT_VERSION 1.13.1

RUN mkdir /usr/local/share/vault
RUN mkdir /usr/local/share/vault/data

RUN apk --no-cache add \
      bash \
      ca-certificates \
      wget \
      curl

RUN wget --quiet --output-document=/tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip /tmp/vault.zip -d /vault && \
    rm -f /tmp/vault.zip && \
    chmod +x /vault

ENV PATH="PATH=$PATH:$PWD/vault"

COPY resources/config-vault.hcl /usr/local/share/vault/config/config-vault.hcl

EXPOSE 8200

ENTRYPOINT ["vault", "server", "-config=/usr/local/share/vault/config/config-vault.hcl"]