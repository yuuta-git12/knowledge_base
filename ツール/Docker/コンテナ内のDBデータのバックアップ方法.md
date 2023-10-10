# コンテナ内のDBデータのバックアップ方法
## 説明
- Dockerコンテナ内にある、DB用のコンテナ(SQL)からDBのバックアップデータを作成する方法

## 手順
1. 以下のコマンドでDB用のコンテナに入る。
   1. ``docker exec -it コンテナ名 bin/bach``
2. コンテナ内に入れたら以下のコマンドを実行する。
   1. ``pg_dump -h [DBサーバーのアドレス] -U [DBのユーザー名] -p [DBのポート番号] --file=[バックアップファイルの保存先パス/バックアップファイルのファイル名] --column-inserts [DB名]``
   2. 例)：pg_dump -h localhost -U postgres -p 5432 --file=database_backup.sql --column-inserts database
3. バックアップが完了したら、Docker for Desktopで該当コンテナのFilesを確認する。指定した保存先にバックアップファイルが作られているので、ローカルPCに保存する。

## 補足    
- [DBサーバーのアドレス]：dockerをローカル環境で動かしているなら基本は``localhost``で問題ない
- [DBのユーザー名]：postgresqlを使っている場合は開発環境なら``postgres``でいいかもしれない。
- [DBのポート番号]：ポート番号はDocker内でのポート番号を指定する。
  - docker設定ファイルのポートを指定する箇所で右側に書いてある番号
  - ```ports:- 'ローカルホストのポート番号:Docker内でのポート番号'```


## 参考
- [【PostgreSQL】pg_dumpコマンドを初心者向けに解説します](https://postgresweb.com/complete-explanation-of-pg_dump)
- [pg_dump](https://www.postgresql.jp/document/9.2/html/app-pgdump.html)
 
  
