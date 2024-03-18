# docker環境のpostgreSQLへの接続

## Docker Desktopを使った方法
1. postgresqlのコンテナをクリックしTreminalタブを選択
2. コマンドを実行する
   1. `psql -h ホスト名 -p dockerで設定しているポート番号 -U ロール名 データベース名`
   2. 例：`psql -h 127.0.0.1 -p 5432 -U postgres hogehoge`



# 参考
1. [PostgreSQLへの接続と切断](https://www.javadrive.jp/postgresql/connect/index2.html)
2. [docker上で動かしているpostgresに接続する](https://qiita.com/nakamasato/items/4155ec8acbb88af81543)
