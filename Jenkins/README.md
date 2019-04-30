# Jenkins

## 概要
覚書である。順次記載予定。

### コマンド
docker run --name master\
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean


## 参考
<!-- [DockerでJenkinsを構築](https://qiita.com/i_whammy_/items/84b71c56d70817803472)  
[Jenkinsのパスワード確認](https://qiita.com/penguin_dream/items/e1c8a7174fc27d1e0b49)  
[Jenkinsの使い方](https://eng-entrance.com/jenkins-use)  
[slave](https://teratail.com/questions/126089)   -->
[jenkinsコンテナでmaster-slaveクラスタを作るPOC](https://qiita.com/penguin_dream/items/154497c8b23647df9620)  
[Jenkins ジョブの作成/変更/削除](https://itsakura.com/tool-jenkins-hello#s1)  
[JenkinsとGitLabを連携する方法](https://qiita.com/takamii228/items/3598f403518c296f93f3)
