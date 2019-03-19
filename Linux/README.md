# Linux

## 概要
覚書である。順次記載予定。

### scriptを使ったコマンド操作ログ保存

```
script /home/ec2-user/Tool/ternm.log
{コマンド操作}
exit
```

### find/grep
- ファイル名検索
  - 指定フォルダ直下のみ  
  ls [検索対象フォルダのパス] | grep "[検索したい文字列]"   
  - 指定フォルダ配下を再帰検索  
  find [検索対象フォルダのパス] -type f -name "*[検索したい文字列]*"  
- grep  
  grep [検索したい文字列] -rl [検索対象フォルダのパス]  

### .shを実行可能にする
chmod +x xxxx.sh  

### ファイル出力
ls > output.txt  

## 参考
[find/grep](https://qiita.com/pokari_dz/items/0f14a21e3ca3df025d21)
