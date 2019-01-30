# Git

## 概要
Gitコマンドについて以下に示す。

### コミット
git add .  
git commit -m "{コメント}"  
git push origin {ブランチ名}

### リセット
git reset --hard origin/{ブランチ名}

### マージ
git fetch --all  
git add .  
git commit -m "{コメント}"  
git merge --no-ff origin/{マージ先ブランチ名}  
git statusで１つずつファイルを見てどちらかを選ぶ。  

### リベース
正確な手順は残していなかったため、参考程度。  

git stash（必要ならば：変更を一時的に退避）  
git checkout {ブランチ名}  
git pull  

git rebase {rebase先ブランチ名}  
手作業で修正  
git status（確認）  
git rebase --continue  

git add .  
git commit -m "{コメント}"  
git push origin {ブランチ名}  

### ブランチ削除
git branch -d {ブランチ名}  
git push origin :{ブランチ名}  

### gitレポジトリとhttpで通信する場合にユーザ情報の入力を省略
ホームディレクトリに.netrcを以下内容で作成する。  
参考文献: https://qiita.com/r-tamura/items/c6e49a3eb7f7f8aafb9d  
>machine xxxx.com
>login XXXXXXXX
>password XXXXXXX
>protocol https

### git configの設定
参考文献: https://note.nkmk.me/git-config-setting/
git config user.email  # 確認  
git config --global user.email example@example.com  # 設定
