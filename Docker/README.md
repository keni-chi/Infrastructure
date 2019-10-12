# Docker

## 概要
覚書である。順次記載予定。

### 構築(Windwos)  
- Hyper-Vおよびコンテナー機能の有効化  
- インストーラでのインストール  
- 起動し、ログインして完了  

### 構築(Mac)  
- Hyper-Vおよびコンテナー機能の有効化  
- インストーラでのインストール  
- Preferences → Advancedでメモリ設定    

### dockerコマンド基本  

#### 確認
docker -v  # バージョン確認  
docker-compose --version    # バージョン確認  
docker-machine --version    # バージョン確認  

docker ps  # デーモンが動いているか確認  
docker images  # 取得済みのイメージ一覧を確認  

#### 取得・実行
docker run hello-world  # Hello Worldを動作   
docker pull alpine  # alpin linuxを取得  
docker run alpine echo "hello from alpine"  # linuxでコマンド実行  
docker run -it alpine bin/sh   # -it 対話的に作業

#### コンテナ停止
docker stop {CONTAINER ID}

#### コンテナ起動
docker start {CONTAINER ID}  
docker attach {CONTAINER ID}  # コンテナで起動しているPID=1のプロセスの標準入出力(STDIN/STDOUT)に接続(attach)。接続時はdocker startなどで起動していること。

#### コンテナ削除
docker rm {CONTAINER ID}  # コンテナは停止していること。削除すると、そのコンテナをstartコマンドで再開できなくなる。  

#### イメージ削除  
docker rmi {image id}  
or  
docker rmi {リポジトリ名}:{タグ}

### コンテナでWebサーバを動かしてみる  
- 80   
docker run --name static-site -e AUTHOR="Docker" -d -p 80:80 seqvence/static-site  # コンテナ立ち上げ   
ブラウザでhttp://localhost/にアクセス。

- 8080   
docker run --name static-site2 -e AUTHOR="My second Docker" -d -p 8080:80 seqvence/static-site  # コンテナ立ち上げ     
ブラウザでhttp://localhost:8080 にアクセス。  

### イメージのビルド
- Dockerfile  
  - FROM	ベースイメージとなるイメージを指定  
  - RUN	イメージをビルドするためのコマンドを指定  
  - COPY	ホストからコンテナ内にファイルをコピー  
  - EXPOSE	外部に公開するコンテナのポートを指定  
  - CMD	イメージからコンテナを起動するときに実行するコマンドを指定  
  - 詳細は「https://github.com/dockersamples/example-voting-app」を参照。  

- Dockerデーモンを起動してから以下のビルドを行う。  
  - docker build -t {イメージ名} .  
    // -t ビルド成功後、作成されたメッセージにリポジトリ名（とオプションタグ）を付与  
  - docker run -p xxxx:xxxx --name {コンテナに割り当てる名前} {イメージ名}    

### イメージをpush/pull
- push  
  - ブラウザで、namespaceとrepositorynameを設定し、リポジトリを作成する。  
  - (AWS)マネコンやCLIで、リポジトリを作成する。   
  - (AWS)aws ecr get-login --region {リージョン}  
  - docker login  
  - docker images  # pushするイメージを確認  
  - docker tag {別名を設定したいイメージID} {別名}  
  - (AWS)docker tag {別名を設定したいイメージID} {リポジトリの URI}  
  - docker images  # 別名になったことを確認  
  - docker push {別名}  
  - ブラウザで、登録されたことを確認。  

- pull  
  - docker pull {別名}  

### Docker Compose
- docker-compose.yml   
  - 主なkey  
    - services: 機能単位  
    - volumes: ンテナのライフサイクルが終了した後でもデータを保管しておけるデータ領域。トップレベルの場合、複数のコンテナから参照できる。  
    - networks: 各サービスがどのネットワークに接続するか定義。同じネットワークに所属していれば、他サービスへアクセス可能。  
  - その他key  
    - image: 起動するイメージ名  

- コマンド
  - docker-compose up  //起動。「docker run -p xxxx:xxxx {起動するイメージ名}」と同じ意味。   
  - ブラウザでhttp://localhost:xxxxにアクセス。
  - その他コマンド例
    - docker-compose up -d   //バックグランドで実行
    - docker-compose stop  //コンテナを停止する
    - docker-compose start   //コンテナを再開
    - docker-compose start {起動するイメージ名}   //特定のコンテナを指定して開始
    - docker-compose down   // コンテナの停止および破棄（コンテナ・ネットワーク）  
    - docker-compose down --rmi all   //停止＆削除（コンテナ・ネットワーク・イメージ）  
    - docker-compose down -v  // 停止＆削除（コンテナ・ネットワーク・ボリューム）  


- docker-compose.yml(例１)
```
version: '3'
services:
  {サービス名}:
    image: {起動するイメージ名}
    ports:
    - "xxx:xxx"
```   

- docker-compose.yml(例２)
```
version: '3'
services:
    {サービス名1}:
      build: ./{フォルダ}
      command: python {app.py}
      valumes:
        - {./vote:/app}
      ports:
        - "xxx:xxx"
      networks:
        - {front}
        - {back}
          ・
          ・
          ・
    {サービス名N}:
      build: ./{フォルダ}
      command: python {app.py}
      valumes:
        - {./vote:/app}
      ports:
        - "xxx:xxx"
      networks:
        - {front}
        - {back}
volumes:
    {xxxx}:
networks:
    {front}:
    {back}:
```   

### DockerHub
docker login

docker-compose up -d --build

docker build -t [Dockerhubユーザ名]/python_env .  
docker images  
docker push [Dockerhubユーザ名]/python_env  
登録された事を確認  
docker-compose down --rmi all  

pull用のディレクトリへ移動  
Dockerfile作成  
docker build -t [Dockerhubユーザ名]/python_env .  
docker run -it [Dockerhubユーザ名]/python_env bin/sh  
exit  
docker run -it [Dockerhubユーザ名]/python_env bash  
pip install numpy  
exit  
docker push [Dockerhubユーザ名]/python_env  


### コンテナ間通信
docker run -d -p 25525:80 --name nginx_test nginx  
docker run -it --link nginx_test:nginx ubuntu:14.04  
env | grep NGINX  
cat /ect/hosts | grep nginx  
ping nginx  
apt-get update && apt-get install -y curl  
curl nginx  

### 容量削減
sudo du -h /var/lib/docker/image/overlay2/  
sudo du -h --max-depth 2 /  
sudo du -h --max-depth 1 /var/lib/docker/overlay2  
docker system prune -a  


## 参考  
- 構築  
[Docker for WindowsをWindows10 Proにインストール](https://qiita.com/anikundesu/items/7ecf20b7e8a60f8439a8)  
[Windows10 Pro上でHyper-Vコンテナーを使い始める手順](https://qiita.com/anikundesu/items/90a7706b434daed5e266)  
[【備忘録】Docker for Windows インストール１](https://qiita.com/manamiTakada/items/c1394e5e3358802a9446)  
[さわって理解するDocker入門](https://www.ogis-ri.co.jp/otc/hiroba/technical/docker/part1.html)  
[Docker Compose - docker-compose.yml リファレンス](https://qiita.com/zembutsu/items/9e9d80e05e36e882caaa)  
[いまさらDockerに入門したので分かりやすくまとめます](https://qiita.com/gold-kou/items/44860fbda1a34a001fc1)  
[Docker Hubの使い方とGitHubからのDockerイメージ自動ビルド](https://www.atmarkit.co.jp/ait/articles/1408/26/news038.html)  
[Dockerhubへの初プッシュ](https://qiita.com/moru3/items/32931813db81d891effb)  
[dockerで簡易にpython3の環境を作ってみる](https://qiita.com/reflet/items/4b3f91661a54ec70a7dc)  
[Docker container間の連携について](https://qiita.com/taka4sato/items/b1bf33941a1ec8b69fd2)  
[【Docker】これは役に立つ!! docker-compose.ymlの例まとめ](https://qiita.com/okamu_/items/1c8e5fde742ca165fa12)  
[Dockerfileを書いてみる](https://qiita.com/nl0_blu/items/1de829288db2670276e8)

- ライフサイクル
[Docker ライフサイクル 概要図 ＆ 環境複製手順](https://qiita.com/TakahiRoyte/items/39dcf18da0ef2d1fe8b0)  
[Docker入門 コンテナのライフサイクル](https://qiita.com/mtakehara21/items/08b6a3f0a7b44588ed94)  

- pod
[k8s pod 概要について自習ノート](https://qiita.com/MahoTakara/items/f5130bb6e9e493c46c6b)　　
[Docker（コンテナ型仮想化）と Kubernetes についての簡単な紹介](https://ubiteku.oinker.me/2017/02/21/docker-and-kubernetes-intro/)  
