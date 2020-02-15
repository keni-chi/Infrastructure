# GitLab

## 概要
覚書である。順次記載予定。

### コマンド
公式のdocker-compose.ymlを使う。  
sed -i -e 's/\/srv\/docker\/gitlab/\.\/srv\/docker\/gitlab/g' docker-compose.yml  
docker-compose up -d  
http://localhost:10080  


## 参考
[DockerでGitLabを構築](https://qiita.com/zamakei1016/items/c4762bb1c92121d78021)  
[sameersbn/docker-gitlab](https://github.com/sameersbn/docker-gitlab)
