## 1 ハンズオン
- nginx  
docker run --name some-nginx -d -p 8080:80 nginx  
docker ps -a  
docker rm {CONTAINER ID}  
docker images  
docker rmi {image id}  

- wordpress  
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:5.7  
docker run --name some-wordpress -e WORDPRESS_DB_PASSWORD=my-secret-pw --link some-mysql:mysql -d -p 8080:80 wordpress  


## 2 run,pull,Proxy  
docker run: Dockerイメージのダウンロードからコンテナの起動まで  
docker pull: Dockerイメージのダウンロードだけ  

docker pull nginx  
docker run -d --name nginx-container -p 8181:80 nginx  

Proxy設定  
mkdir -p /etc/systemd/system/docker.service.d  
vi /etc/systemd/system/docker.service.d/http-proxy.conf  
[Service]  
Environment="HTTP_PROXY=http://<プロキシサーバのIPアドレス>:<プロキシサーバのポート>/ HTTPS_PROXY=http://<プロキシサーバのIPアドレス>:<プロキシサーバのポート>/"  
systemctl daemon-reload  
systemctl restart docker  


# 3.ディレクトリ共有、イメージ作成  
CentOSコンテナの起動  
[ホスト]  
docker pull centos:7  
mkdir -p /{任意}/tomcat-container/logs  
docker run -it -d -p 18080:8080 -v /{任意}/tomcat-container/logs:/share/logs --name tomcat centos:7  

CentOSコンテナの中でTomcatインストール  
[ホスト]  
curl -O http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz  

ホスト側からコンテナ内にファイルをコピーします。  
[ホスト]  
docker cp apache-tomcat-9.0.27.tar.gz tomcat:/opt/  
  
※備考  
コンテナからファイルを取得することも可能です。以下のようなコマンドになります。  
docker cp <コンテナ名>:<コンテナ内のコピー元ファイル> <ホスト側のコピー先ディレクトリ>  

コンテナにログインします。  
[ホスト]  
docker exec -it tomcat bash  

コンテナ内でTomcatのインストールをしましょう。  
[コンテナ内]  
yum install -y java  
cd /opt/  
tar zxf apache-tomcat-9.0.27.tar.gz  
cd apache-tomcat-9.0.27  
./bin/startup.sh  

http://localhost:18080/  

これでTomcatのコンテナができました。自分でWebアプリケーションを作成していたら、Tomcat配下のwebappsディレクトリに配置すれば、コンテナ内で自分のアプリケーションを起動させることができます。  

-------  
- ホスト側とのディレクトリ共有  

コンテナにログインして、ログ出力先を変えましょう。  
[コンテナ内]  
cd /opt/apache-tomcat-9.0.27/  
sed -i -e "s/\${catalina.base}\/logs/\/share\/logs/g" ./conf/logging.properties  
./bin/shutdown.sh  
./bin/startup.sh  
ls -la /share/logs/  
ログが出力されることを確認  

[ホスト]  
/{任意}/tomcat-container  
ls -la  
ログが出力されることを確認  

[ホスト]  
docker stop tomcat  
ls -la  
ログが出力されることを確認  

ホスト側とコンテナ内でディレクトリ共有する目的の例としては、以下のようなケースがあります。  
設定ファイルをホスト側においておき、その設定ファイルをコンテナ内で使用する。  
ソースコードがあるディレクトリを共有させて、コンテナ内でビルドやユニットテストを実行できるようにする。  

-------  
- コンテナからDockerイメージを作成し、使ってみよう    
1. Dockerfileを使用してDockerイメージを作成する    
2. コンテナからDockerイメージを作成する ←今回はこちら  

コンテナを停止  
[ホスト]  
docker stop tomcat  

Dockerイメージを作成  
[ホスト]  
docker commit tomcat tomcat-image  
(docker commit <コンテナ名> <作成するDockerイメージ名>)  

Dockerイメージができたことを確認  
[ホスト]  
docker images  

- 作成したDockerイメージを使用してコンテナ起動  

mkdir -p /{任意}/tomcat-container/logs2  
docker run -it -d -p 18082:8080 -v /{任意}/tomcat-container/logs2:/share/logs --name tomcat2 tomcat-image  

実際にコンテナの中を確認し、Tomcatも起動。  
[ホスト]  
docker exec -it tomcat2 bash  
[コンテナ内]  
ls /opt  
（Tomcatディレクトリが確かに存在しますね。）  
cd /opt/apache-tomcat-9.0.27  
./bin/startup.sh  

http://localhost:18082/  

元のコンテナを動かす  
[ホスト]  
docker start tomcat  
docker ps -a  

------  
- コンテナ削除時のログ確認  
[ホスト]  
docker stop tomcat  
docker rm tomcat  
ls -la /{任意}/tomcat-container/logs/  


# 4.Dockerfile  
Dockerfileを使用して、Dockerイメージを作成  
cd <Dockerfileが存在するディレクトリ>  
docker build -t tomcat:1 .  
docker images  

このDockerイメージを使用して、コンテナを起動  
docker run -it -d --name tomcat-1 -p 8081:8080 tomcat:1  

http://localhost:8081  

以下のコマンドを実行することで、DockerfileのCMDで実行したコンソールログが確認  
docker logs -f tomcat-1  

----  
- Dockerfileを書く際のポイントや嵌りどころ、注意点について  

1. cd後改行してコマンド実行すると、cd前のディレクトリで実行される  

2. -fオプションで、使用するDockerfileを指定可能  
docker build -t tomcat:2 -f Dockerfile_2 .  

3. Dockerfileはなるべく1コマンドで実行すること  


# 5.コンテナ間通信  

コンテナ間通信をする方法は、以下の二つ  
1. Dockerネットワークを作成してコンテナ名で接続できるようにする←こちらが推奨    
2. 「--link」オプションを使用する    


「wordpress-network」というDockerネットワークを作成（bridgeタイプ）  
docker network create wordpress-network  
docker network ls  

Dockerネットワークの詳細を確認  
docker network inspect wordpress-network  

ネットワークを指定してコンテナを起動  
docker run --name mysql --network wordpress-network -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:5.7  
docker run --name wordpress --network wordpress-network -e WORDPRESS_DB_PASSWORD=my-secret-pw -p 8080:80 -d wordpress  
※WordPressのDockerイメージでは、MySQLへの接続先の指定として、「mysql」というホスト名を指定している。そのためmysqlを指定。  

http://localhost:8080  

注意点として、以下のようにホストから接続できるようにポート設定していたとする。「コンテナ間通信」でmysqlにアクセスする場合は、3306ポートを使用する。  
docker run --name mysql --network wordpress-network -p 13306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:5.7  

---
- Nginx、Tomcatコンテナでのコンテナ間通信  

Nginxイメージ、Tomcatイメージの作成  
cd nginx  
docker build -t nginx-tomcat:1 .  
cd tomcat  
docker build -t tomcat:1 .  

Dockerネットワーク作成、コンテナ起動  
docker network create tomcat-network  
docker run --name tomcat-1 --network tomcat-network -d tomcat:1  
docker run --name nginx-tomcat-1 --network tomcat-network -p 10080:80 -d nginx-tomcat:1  
docker ps -a  

http://localhost:10080/tomcat/


# 6.docker compose  
docker-compose.yml  
docker runコマンドにある「--link」オプションは、docker-compose.ymlには出ない。  
docker-compose.ymlを使用すると、自動でDockerネットワークを作成する。  
service名を使って自動で名前解決ができるようになっています。  
そのため、--linkオプションについては、docker-compose.ymlでは指定する必要はない。  

---
docker-compose.ymlを作成  
docker-compose build  
docker images  
docker-compose up -d  
docker-compose ps  
http://localhost:8081  
docker-compose down --rmi all  

---  
docker-compose build \  
  --build-arg http_proxy=http://<プロキシサーバのIP>:<プロキシサーバのポート> \  
  --build-arg https_proxy=http://<プロキシサーバのIP>:<プロキシサーバのポート>


## 参考
[Docker入門（第一回）～Dockerとは何か、何が良いのか～](https://knowledge.sakura.ad.jp/13265/)  
