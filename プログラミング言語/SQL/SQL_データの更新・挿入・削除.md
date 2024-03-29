# SQL_データの更新・挿入・削除コマンド

## UPDATE関数(データの更新)
- 条件に合致したレコードの列名1の値を更新する。
```SQL
UPDATE テーブル名 SET 列名1 = 値 WHERE 条件
```
- 複数の列を同時に更新することも可能
```SQL
UPDATE　テーブル名 SET 列名1 = 値,列名2 = 値 WHERE 条件
```
## INSERT関数(データの挿入)
- 新しいデータを追加する場合はINSERT文を以下のように記載する。
- **テーブル名の後ろの列のリストと、VALUESの後の値のリストとは、数とデータ型が合致している必要がある。**
```SQL
INSERT INTO テーブル名 (列1[,列2,列3...]) values (値1,[,値2,値3...]);
```
- テーブルに定義された全列に対して、VALUESで値が設定されている場合は、テーブル名の列リストを省略することができる。この場合、データ型だけでなく並び順も定義順にする必要がある。
  - 例：
  ```SQL
  INSERT INTO city values (DEFAULT,'Ozu','JPN','Ehime',45020);
  ```
## DELETE関数(データの削除)
- 指定したテーブルのすべての行のデータを削除
```SQL
DELETE FROM テーブル名;
```
- WHERE句で絞って、一部のデータを削除
```SQL
DELETE FROM テーブル名 WHERE 条件;
```