# SQL_データの選択コマンド

## SQL文の記述順番
- `SELECT ~ FROM ~ WHERE ~ GROUB BY ~ HAVING ~ ORDER BY ~`
1. SELECT
2. FROM
3. WHERE
4. GROUB BY
5. HAVING
6. ORDER BY

## 重複の排除
  - 選択した行の値に重複があり、それを省きたい場合は「DISTINCT」を使用する。
  - 例：テーブルの列名に重複した内容がある場合、重複した分は省いて表示する
    - `SELECT DISTINCT 列名 FROM テーブル名;`
  - 例：重複を省いた列数を求めたい場合
    - `SELECT COUNT(DISTINCT 列名) FROM テーブル名;`
## ORDER BY：並び替え用の関数　ここで書く列名のことをソートキーという
- 列の昇順（少ない順）に並び替える
  - `SELECT * FROM テーブル名 ORDER BY 列名 ASC;`
- 複数の列をソートキーにしての並び替えも可能
  - `SELECT * FROM テーブル名 ORDER BY 列名1,列名2 ASC;`
- 列の降順（多い順）に並び替える
  - `SELECT * FROM テーブル名 ORDER BY 列名 DESC;`

## 集計用の関数(最大値・最小値・総数・平均)
- テーブルの行数を数える(NULLを含めた全行を集計する)
  - COUNT関数は`SELECT`,`ORDER BY`,`HAVING`の後ろにしか記述できない
  - `SELCT COUNT(*) FROM テーブル名;` 
- **以下の関数はNULLを含めずに集計する**
- 最大値：列名のうち最大の値を返す
  - `SELECT MAX(列名) FROM テーブル名`
- 最小値：列名のうち最小の値を返す
  - `SELECT MIN(列名) FROM テーブル名`
- 総数：列名の値を合計した値を返す
  - `SELECT SUM(列名) FROM テーブル名`
- 平均：列名の値の平均値を返す
  - `SELECT avg(列名) FROM テーブル名`
## 文字列を連結する 
### GROUN_CONCAT **(これはMySQLにしかない関数)**
  - 指定した列名の値を連結して返す。WHERE条件などを使って、該当する値を連結したりする。
    - `SELECT GROUP_CONCAT(列名) FROM テーブル名　WHERE 条件;`
  - 重複した値を除きたい場合はDISTINCTを使う
    - `SELECT GROUP_CONCAT(DISTINCT 列名) FROM テーブル名　WHERE 条件;`

## テーブルをグループに切り分ける
### GROUP BY関数：同じ値を持つ行をグループ化する
- 条件に合致したものを抜き出し、同じ列名の値でグループ分けする。ここでいう列名1を「集約キー」、「グループ化列」という
  - 例： `SELECT 列名1 , count(*) FROM テーブル名 WHERE 条件 GROUP BY 列名1 ;`
- 集約キーは複数使用することが可能
- `SELECT District,Name  from city WHERE CountryCode = 'JPN' GROUP BY District,Name;`
### 切り分けたグループに条件を付加する
- `HAVING`：グループ毎に集約した値を条件にして選択したい場合に使用
  - `SELECT ~ FROM ~ GROUP BY ~ HAVING グループの値に関する条件 ;`
  - 例:
  ```
  SELECT District , count(*) FROM city WHERE CountryCode = 'JPN' GROUP BY District 
  HAVING COUNT(*) = 4 ;
  ```
- `GROUP BY`と`ORDER BY`を組みわせることもできる
  - 例:
  ```
  SELECT District , count(*) FROM city WHERE CountryCode = 'JPN' GROUP BY District
  HAVING COUNT(*) > 4 ORDER BY COUNT(*) DESC ;
  ```