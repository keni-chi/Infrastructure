# Ansible

## 概要
覚書である。順次記載予定。

## 動作検証
Amazon linux上で、動作検証を行ったメモである。

### 構成管理される側の準備
1. Dockerfileとsshd_configを作成。

1. イメージ作成：Control Machine（構成管理をする側)  
docker login  
$ ls  
Dockerfile sshd_config  
docker build -t ubuntu_ansible .

1. コンテナ実行：Managed Node（構成管理をされる側)  
docker run -it ubuntu_ansible  
-- この時点でManaged側へ接続中 --  
service ssh start  
ifconfig eth0  
=> IP アドレスを取得（例:173.17.0.2)

### Ansible実行

1. Ansibleインストール  
pip install ansible  
ansible --version  

1. control_machine の適当なディレクトリにhostsとsetup.ymlを用意。  

1. Ansible 実行  
control_machine で以下を行う。  
$ ls  
hosts setup.yml  
ansible-playbook ./setup.yml -v -vvvv -u root -i ./hosts  
=> (実行結果が表示される）  

1. 結果確認
managed_node 側で以下の通り確認。    
$ cat /root/now.txt  


## 参考
[Ansibleの導入と簡単な使い方](https://qiita.com/nekonoprotocol/items/78884242064cdaf9f472)  
[Docker + Ansible で Hello World!](https://qiita.com/mdew150/items/19a11a5cfb45e7c82c97)  
