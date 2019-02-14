# Docker

## 概要
覚書である。順次記載予定。

### 構築  
- Hyper-Vおよびコンテナー機能の有効化  
- インストーラでのインストール  
- 起動し、ログインして完了  

### dockerコマンド基本  

#### 確認
docker -v  # バージョン確認
docker-compose --version    # バージョン確認
docker-machine --version    # バージョン確認

docker ps  # デーモンが動いているか確認  
docker images  # 取得済みのイメージ一覧を確認  

#### 取得・実行
docker run hello-world  # Hello Worldを動作   
docker pull alpine　　# alpin linuxを取得  
docker run alpine echo "hello from alpine"　　# linuxでコマンド実行  
docker run -it alpine bin/sh   # -it 対話的に作業

#### コンテナ停止
docker stop {CONTAINER ID}

#### コンテナ起動
docker start {CONTAINER ID}
docker attach {CONTAINER ID}  # コンテナで起動しているPID=1のプロセスの標準入出力(STDIN/STDOUT)に接続(attach)。接続時はdocker startなどで起動していること。

#### コンテナ削除
docker rm {CONTAINER ID}  # コンテナは停止していること。削除すると、そのコンテナをstartコマンドで再開できなくなる。


### コンテナでWebサーバを動かしてみる  
- 80   
docker run --name static-site -e AUTHOR="Docker" -d -p 80:80 seqvence/static-site  # コンテナ立ち上げ   
ブラウザでhttp://localhost/にアクセス。

- 8080   
docker run --name static-site2 -e AUTHOR="My second Docker" -d -p 8080:80 seqvence/static-site  # コンテナ立ち上げ     
ブラウザでhttp://localhost:8080 にアクセス。  

### サンプルイメージのビルド(未実施)  
- Dockerfile  
  - FROM	ベースイメージとなるイメージを指定する  
  - RUN	イメージをビルドするためのコマンドを指定する  
  - COPY	ホストからコンテナ内にファイルをコピーする  
  - EXPOSE	外部に公開するコンテナのポートを指定する  
  - CMD	イメージからコンテナを起動するときに実行するコマンドを指定する  

- Dockerデーモンを起動してから以下のビルドを行う。  
  - docker build -t {イメージ名} .  
    # -t ビルド成功後、作成されたメッセージにリポジトリ名（とオプションタグ）を付与  
  - docker run -p 8888:5000 --name myfirstapp myfirstapp  
    # --name {コンテナに割り当てる名前}  
    # {イメージ名}  

### Docker Hub へイメージを push / pull(未実施)  
- push  
  - ブラウザで、namespaceとrepositorynameを設定し、リポジトリを作成する。  
  - (AWS)マネコンやCLIで、リポジトリを作成する。   
  - (AWS)aws ecr get-login --region us-west-2  
  - docker login  
  - docker images  # pushするイメージを確認  
  - docker tag {別名を設定したいイメージID} {別名}  
  - (AWS)docker tag myfirstapp {リポジトリの URI}  
  - docker images  # 別名になったことを確認  
  - docker push {別名}  
  - ブラウザで、登録されたことを確認。  

- pull
  - docker pull {別名}  

### Docker Compose(未実施)





## 参考  
構築:  
https://qiita.com/anikundesu/items/7ecf20b7e8a60f8439a8  
https://qiita.com/anikundesu/items/90a7706b434daed5e266  
https://qiita.com/manamiTakada/items/c1394e5e3358802a9446　　
操作:  
https://www.ogis-ri.co.jp/otc/hiroba/technical/docker/part1.html
