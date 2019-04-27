# Jenkins

## 概要
覚書である。順次記載予定。


### master
docker-compose up -d

Webブラウザ上でhttp://localhost:18080/

docker ps -a
docker exec -it ${containerID} bash
cat /var/jenkins_home/secrets/initialAdminPassword

Webブラウザ上でパスワード入力し設定を進める

docker container exec -it master ssh-keygen -t rsa -C ""

### slave
docker-compose up -d
docker-compose ps




## 参考
[DockerでJenkinsを構築](https://qiita.com/i_whammy_/items/84b71c56d70817803472)  
[Jenkinsのパスワード確認](https://qiita.com/penguin_dream/items/e1c8a7174fc27d1e0b49)
[Jenkinsの使い方](https://eng-entrance.com/jenkins-use)  
[slave](https://teratail.com/questions/126089)
