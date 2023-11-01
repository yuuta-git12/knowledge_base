# コンテナのIPアドレスの確認方法

## 概要
- 開発環境でAPI通信の実装を行う際、コンテナ同士のIPアドレスが必要になることがある。
- dockerコマンドでコンテナのIPアドレスを調べる方法を記載


## 手順
1. 以下のコマンでコンテナIDを取得
   1. ```docker ps```
   2. 出力結果のCONTAINER ID欄の値をコピー
2. コンテナIDを指定してIPアドレスを取得
   1. ```docker inspect [1-2で取得したコンテナID] | grep IPAddress```
   2. 出力結果の"IPAddress"の右側に表示される数字がコンテナIDで指定したコンテナのIPアドレス
   
## 補足
- ```docker inspect```はDockerによって管理されている構築物の詳細情報を表示する。
  - [docker inspect](https://docs.docker.jp/engine/reference/commandline/inspect.html)

## 参考
- ```docker 割り振られているIPアドレスを確認する```[https://mebee.info/2021/08/05/post-40153/]