LOG_OUT=./stdout.log
LOG_ERR=./stderr.log


exec 1> >(
  while read -r l; do echo "[$(date +％N"%Y-%m-%d %H:%M:%S.%3N")] $l"; done \
    | tee -a $LOG_OUT
)
exec 2>>$LOG_ERR

# 標準出力
echo A001
docker run hello-world
echo A002


# # 標準エラー出力
# ls /foo
# rm /foo
