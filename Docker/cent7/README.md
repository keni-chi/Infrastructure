# cent7

## 概要
覚書である。順次記載予定。

### 構築手順
docker build -t centos7dev .
docker run --privileged --rm -d -p 2222:22 -p 5000:80 --name cent7dev centos7dev /sbin/init
docker exec -it cent7dev bash

## 参考
[VS CodeのRemote Developmentを使ってSSH接続したEC2上のファイルを編集する](https://dev.classmethod.jp/etc/vs-code-remote-development-ec2/)  
[ssh接続先としてのdockerコンテナ作成](https://qiita.com/TakashiOshikawa/items/081d4780abdc21d63b1a)  
https://qiita.com/HoriThe3rd/items/b2f6c440f096106cf89e
[CentOS 7にPython 3.6をインストールする](http://sonaiyuutemo.hatenablog.jp/entry/2017/05/31/180025)
