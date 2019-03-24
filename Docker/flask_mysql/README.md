# flask_mysql環境構築 by Docker

## 概要
覚書である。順次記載予定。


### 構築手順

```
git clone https://github.com/kai-kou/flask-mysql-restful-api-on-docker.git
cd flask-mysql-restful-api-on-docker
docker-compose up -d
docker-compose exec api bash
pip install cryptography
flask db upgrade
```

### 動作確認
```
curl -X POST http://localhost:5000/hoges \
  -H "Content-Type:application/json" \
  -d "{\"name\":\"hoge\",\"state\":\"hoge\"}"
```

```
curl http://localhost:5000/hoges
```


## 参考  
[PythonのFlaskでMySQLを利用したRESTfulなAPIをDocker環境で実装する](https://qiita.com/kai_kou/items/5d73de21818d1d582f00)
