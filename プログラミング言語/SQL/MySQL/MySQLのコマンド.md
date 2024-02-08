# MySQLのコマンド
  
|コマンド|実行内容|
|:---:|:---:|
|`mysql -u [ユーザー名] -p`|ログイン用のコマンド</br>ユーザー名を入力するとパスワードを</br>聞いてくる、パスワードを入れるとDBにログインできる|
|`CREATE table テーブルB like テーブルA;`|テーブルAと同じ構造のテーブルBを作成する</br>(データは無し)|

## 管理コマンド
- DBMSによって異なる、以下のコマンドはMySQLでしか使えない。OracleやSQL Serverだとエラーが返される

|コマンド|実行内容|
|:---:|:---:|
|`show status "Threads_connected";`|MySQLサーバー起動後の累積接続数を出力|
|`show status like'Uptime';`|MySQLが起動してからの経過時間(秒)|
|`show status like'Queries';`|MySQLが実行したSQL文の数|
|`show databases;`|登録されているデータベースの一覧が表示される|
|`show create table テーブル名¥G`|テーブル定義を表示する(;はつけなくて良い)|
|`use データベース名;`|デフォルトデータベースを切り替える|
|`desc テーブル名;`|テーブルの列の情報を表示|





# 参考サイト
- [docker-composeで立ち上げたDockerコンテナのMySQLにログインする](https://zenn.dev/ryouzi/articles/a4fdff3c18e32a)

# エラーへの対処
- https://okuyan-techdiary.com/mysql-dbeaver-error/