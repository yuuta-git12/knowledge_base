# シーケンスに関するSQL

## シーケンスの作成
|SQL|内容|
|---|---|
|`CREATE SEQUENCE シーケンス名`|指定した名前のシーケンスが作成される|
## シーケンス番号の確認
|SQL|内容|
|---|---|
|`SELECT MAX(id) FROM スキーマ番号.テーブル名`|テーブル内の最大のidの確認|
|`select currval('スキーマ番号.シーケンス名')`|idの現在のシーケンスの確認|