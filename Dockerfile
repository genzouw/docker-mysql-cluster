FROM mysql:5.7

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    locales \
    locale-gen ja_JP.UTF-8 \
    ;

ENV LC_ALL="ja_JP.UTF-8"
ENV LANG="ja_JP.UTF-8"
ENV LANGUAGE="ja_JP.UTF-8"

RUN locale-gen ja_JP.UTF-8; localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
