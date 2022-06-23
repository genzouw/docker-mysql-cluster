# Docker Compose で構築した MySQL クラスタ ( Writer x1 + Reader x2 )

## Description

技術検証をするために構築した MySQL のレプリケーション済みのクラスタ環境になります。

## Requirements

- [Docker](https://www.docker.com/)

## Installation

**You do not need to install !**

## Configuration

MySQL クラスタの構成は以下のようになっています。

- **writer** : host = `writer`, user = `user`, password = `password`
- **reader-1** : host = `reader-1`, user = `user`, password = `password`, read_only
- **reader-2** : host = `reader-2`, user = `user`, password = `password`, read_only

```text
[writer]
    ├──RELAY──  [reader-1]
    └──RELAY──  [reader-2]
```

## Usage

以下の command で起動します。

```bash
$ docker-compose up -d
```

レプリケーションクラスタが起動し終えるまでに多少時間がかかります。
30 秒程度お待ち下さい。

## Configuration

レプリケーションに利用するユーザ名、パスワードやライターノード、リーダーノードの root パスワードは `.env` で管理しています。

```bash
$ cat .env
MYSQL_WRITER_ROOT_PASSWORD=writer

MYSQL_READER_ROOT_PASSWORD=reader

MYSQL_WRITER_REPL_USER=repl
MYSQL_WRITER_REPL_PASSWORD=repl
```

## Relase Note

| date       | version | note           |
| ---------- | ------- | -------------- |
| 2022-06-23 | 0.1     | first release. |

## License

This software is released under the MIT License, see LICENSE.

## Author Information

[genzouw](https://genzouw.com)

- Twitter : @genzouw ( https://twitter.com/genzouw )
- Facebook : genzouw ( https://www.facebook.com/genzouw )
- LinkedIn : genzouw ( https://www.linkedin.com/in/genzouw/ )
- Gmail : genzouw@gmail.com
