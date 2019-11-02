# k8s

## 概要
覚書である。順次記載予定。


### メモ
- ダッシュボードを起動  
kubectl get pod --namespace=kube-system -l k8s-app=kubernetes-dashboard


- ハンズオン  
kubectl run hello-world --image=hello-world -it --restart=Never
kubectl delete pod hello-world 


ポッドを生成 kubectl apply -f pod.yml  
リスト表示 kubectl get pod  
ポッドの詳細表示 kubectl describe pod NAME  
ポッドの削除 kubectl delete pod NAME  


デプロイメントの生成 kubectl apply -f deploy.yml
リスト表示 kubectl get deploy
詳細表示 kubectl describe deploy web-deploy
デプロイメントの削除 kubectl delete deploy web-deploy


サービスの生成 kubectl apply -f service.yml
リスト表示 kubectl get service
詳細表示 kubectl describe service
負荷分散対象ポッドのリスト kubectl get po -l app=web


ポッドに対話シェルを起動して、サービス経由でポッドのNginxへアクセス
kubectl run test -it --restart=Never --image=busybox sh
wget -O - http://web-service


pending問題------

永続ボリュームの作成 kubectl apply -f pvc.yml
リスト表示 kubectl get pvc
永続ボリュームの表示 kubectl get pv
ストレージクラスの表示 kubectl get storageclass
ストレージクラスの詳細 kubectl describe storageclass  

  
MongoDBの起動 kubectl apply -f mongodb.yml  
ポッドの起動状態の確認 kubectl get pod
ポッドのIPアドレスを表示 kubectl get pod -o wide
デプロイメントの確認 kubectl get deploy
起動失敗時の原因調査1 kubectl logs POD-NAME
起動失敗時の原因調査2 Kubectl describe pod POD-NAME
起動失敗時の原因調査3 kubectl get events




kubectl apply -f svc-mongodb.yml 
kubectl get svc


ROCEKT.CHATのポッド起動 kubectl apply -f deploy-rocket.yml
起動状態の確認 kubectl get -f deploy-rocket.yml
ROCEKT.CHATのサービス作成 kubectl apply -f svc-rocket.yml
サービスの作成状態確認 kubectl get -f svc-rocket.yml
http://localhost:31000/

----
- 道場  
- 2
users
sudo chown -R {user} /usr/local/share/man/man3
sudo chmod -R 777 /usr/local/
brew install kubernetes-cli




## 参考
[独学Kubernetes　コンテナ開発の基本を最速で理解する](https://qiita.com/Brutus/items/d19af6b9c55de93663f6)  
[Kubernetesハンズオン](https://www.nic.ad.jp/ja/materials/iw/2018/proceedings/h2/h2-takara-4.pdf)  
[Kubernetes道場について](https://cstoku.dev/posts/2018/k8sdojo-01/)  
[チュートリアル](https://kubernetes.io/ja/docs/tutorials/)  
