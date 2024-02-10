# SQL_副問合せ・結合

## 副問合せ
- SELECTの結果を条件として、テーブルのように扱い条件文に利用すること。
- 例1：
  ```SQL
  SELECT COUNT(*) FROM cityjapan WHERE population >= (select AVG
  (population) from cityjapan);
  ```
  - 内容：テーブル`cityjapan`のカラム`population`の平均を取得し、それよりも大きい`population`を持つ、レコードの数を取得する。
- 例２：
  ```SQL
  SELECT district,name,population from cityjapan as c1 WHERE
  population > (SELECT AVG(population) from cityjapan as c2 where c1.
  district = c2.district group by district);
  ```
  -　内容：テーブル`cityjapan`でカラム`district`が同じレコードの`population`の平均を取得し、</br>それより大きい`population`を持つ、レコードを表示する。

## 結合
- 2個以上のテーブルの内容を組み合わせること。
- 内部結合(INNER JOIN)と外部結合(OUTER JOIN)が存在する。

### 内部結合(INNER JOIN)
- 結合条件に一致するレコードだけを２つのテーブルから持ってくる。
- 結合した結果に対しては、`WHERE`,`ORDER BY`,`LIMIT`,`GROUP BY`,`HAVING`を指定することもできる。
```SQL
SELECT 選択したい列のリスト FROM １つ目のテーブル名 INNER JOIN 2つ目のテーブル名 ON 結合条件;
```
- 例
  ```SQL
  SELECT countrylanguage.*,country.Name from countrylanguage inner join country on 
  countrylanguage.CountryCode = country.Code WHERE LANGUAGE = 'Japanese';
  ```
  - テーブル`countrylanguage`と`country`の内部結合
  - 結合条件：`countrylanguage`の`CountryCode`と`country`の`Code`が等しいレコードを取得する
  - 取得する列は`countrylanguage`のすべての列と`country`の`Name`カラム
  - 最後、取得したレコードから`WHERE`で`language`が`Japnanese`のレコードだけを抜き出す。

### 外部結合(OUTER JOIN)
- １つ目のテーブルを基準として、結合条件に不一致のレコードも結合する。
- `LEFT JOIN`：２つのテーブルのうち左側つまり、「１つ名のテーブル名」のすべての行が表示される。
- `RIGHT JOIN`：２つのテーブルのうち右側つまり、「２つ名のテーブル名」のすべての行が表示される。
```SQL
SELECT 選択したい列のリスト FROM １つ目のテーブル名 LEFT JOIN 2つ目のテーブル名 ON 結合条件;
SELECT 選択したい列のリスト FROM １つ目のテーブル名 RIGHT JOIN 2つ目のテーブル名 ON 結合条件;
```