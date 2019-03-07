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
    - ocker-compose up -d   //バックグランドで実行
    - docker-compose stop  //コンテナを停止する
    - docker-compose start   //コンテナを再開
    - docker-compose start {起動するイメージ名}   //特定のコンテナを指定して開始
    - docker-compose down   // コンテナの停止および破棄


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



## 参考  
構築:  
https://qiita.com/anikundesu/items/7ecf20b7e8a60f8439a8  
https://qiita.com/anikundesu/items/90a7706b434daed5e266  
https://qiita.com/manamiTakada/items/c1394e5e3358802a9446  
操作:  
https://www.ogis-ri.co.jp/otc/hiroba/technical/docker/part1.html  
docker-compose:   
https://qiita.com/zembutsu/items/9e9d80e05e36e882caaa  
