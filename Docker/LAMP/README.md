# LAMP環境構築 by Docker

## 概要
覚書である。順次記載予定。

### 構築手順
Debian系のディストリビューション（DebianやUbuntu）。(apt-get)

```
git clone https://github.com/naga3/docker-lamp.git
cd docker-lamp/
Dockerfileの書き換え
  libpng12-devをlibpng-devに書き換え
docker-compose.ymlの書き換え
  phpmyadmin部分を追加
docker-compose up -d
```

### 動作確認
以下にアクセスして確認。
```
http://localhost
http://localhost:8080
```


## 参考  
[Docker Composeを使ってLAMP環境を立ち上げる](https://qiita.com/naga3/items/d1a6e8bbd0799159042e)  
[dockerでlamp環境構築](https://qiita.com/kateyose/items/463eafdaf3aae675fd41)
