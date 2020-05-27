#!/bin/bash
echo "OK"

eval ls
echo "test" >> output1.txt

sleep 5

abc ## エラーでもそのまま実行

cd a
echo "test" >> output2.txt
python child.py


echo "===001"
TEST_VAL=thanks # シェル変数を設定する
echo "${TEST_VAL}"
echo "===002"
# thanks # シェル変数として値が表示される
printenv TEST_VAL # 環境変数としては設定されていないため、値は表示されない
echo "===003"
export TEST_VAL # 環境変数としてエクスポートする
printenv TEST_VAL
echo "===004"
# thanks # 環境変数として値が表示される

rm -rf test.program
git clone https://github.com/keni-chi/test.program.git
echo "===005"
rm -rf test.program
