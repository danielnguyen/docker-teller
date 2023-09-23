FROM alpine:latest

# Install necessary tools/libraries
# RUN apt-get update && apt-get install -y curl perl libxml2-dev libssl-dev git wget openjdk-19-jdk g++ gcc
RUN apk update && apk upgrade \
    && \
    apk add --no-cache \
        wget \
        # Teller dependencies provided by alpine
        python3-dev \
        gcc \
        libc-dev \
        libffi-dev \
        py3-pip \
        sqlite

# Copy contents
COPY . .

# Pull in the Teller repository
RUN echo "Pulling Teller" \
    && wget -qO- https://github.com/Bizzaro/Teller/archive/master.zip | busybox unzip - \
    && mv Teller-master/ /Teller

# Switch into the cloned Teller repository
WORKDIR /Teller

RUN pip install -r requirements.txt

COPY "./scripts/docker-entrypoint.sh" "/init"

CMD ["/init"]
