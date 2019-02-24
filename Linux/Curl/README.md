# Curl   

## 概要
Curlコマンドについて以下に示す。

### GET
curl -v -H 'Content-Type:application/json' 'http://127.0.0.1:{ポート番号3000など}/{バージョンなど}/{リソース}?{param}'

### POST
curl -v -H 'Content-Type:application/json' -d @{jsonファイル名}.json 'http://127.0.0.1:{ポート番号3000など}/{リソース}'
