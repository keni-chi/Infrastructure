# Memory

## 概要
覚書である。

### swapfile 作成
sudo dd if=/dev/zero of=/swapfile bs=1M count=2048  
sudo chmod 600 /swapfile  
sudo mkswap /swapfile  
sudo swapon /swapfile  

### 自動マウント設定
#### バックアップ
sudo cp -p /etc/fstab /etc/fstab.bak
#### 自動マウント書き込み
sudo echo "/swapfile  swap        swap    defaults        0   0" >> /etc/fstab
M

## 参考
[EC2 サーバー内に SWAP ファイルを作る (お手軽版)](https://qiita.com/katzueno/items/0a63b46c69602ecdeae5)
