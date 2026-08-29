FROM alpine:3.20

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=10000 \
    CONSOLE_TOKEN=6735d1a5a6464eca39ca08bc7d519df11ff045c869d1c783

WORKDIR /app

RUN apk update && \
    apk add --no-cache \
      python3 \
      py3-pip \
      py3-virtualenv \
      bash \
      sudo \
      ca-certificates \
      curl \
      wget \
      git \
      openssh-client \
      rsync \
      nano \
      vim \
      less \
      htop \
      tree \
      unzip \
      zip \
      tar \
      gzip \
      bzip2 \
      xz \
      jq \
      file \
      lsof \
      procps \
      psmisc \
      iproute2 \
      iputils \
      net-tools \
      bind-tools \
      traceroute \
      socat \
      netcat-openbsd \
      ncdu \
      pciutils \
      usbutils \
      kmod \
      tzdata \
      dcron \
      logrotate \
      gnupg \
      openssl \
      dbus

COPY requirements.txt /app/requirements.txt
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r /app/requirements.txt

COPY server.py /app/server.py
COPY start.sh /app/start.sh
COPY static /app/static

RUN chmod +x /app/start.sh

EXPOSE 10000
CMD ["/app/start.sh"]
