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
- 例１:
  ```SQL
  SELECT countrylanguage.*,country.Name from countrylanguage inner join country on 
  countrylanguage.CountryCode = country.Code WHERE LANGUAGE = 'Japanese';
  ```
  - テーブル`countrylanguage`と`country`の内部結合
  - 結合条件：`countrylanguage`の`CountryCode`と`country`の`Code`が等しいレコードを取得する
  - 取得する列は`countrylanguage`のすべての列と`country`の`Name`カラム
  - 最後、取得したレコードから`WHERE`で`language`が`Japnanese`のレコードだけを抜き出す。
- 例２：
  - キー（列）の値、ここでは「スタッフ.性別 = 性別マスタ.ID」が一致するレコードのみ取得される。
  ```SQL
  SELECT
    スタッフ."ID" AS スタッフID,
    スタッフ.姓,
    スタッフ.名,
    スタッフ.性別 AS 性別ID,
    性別マスタ.名称 AS 性別名称
  FROM
    スタッフ INNER JOIN 性別マスタ
  ON
    スタッフ.性別 = 性別マスタ."ID";
  ```
  ![INNER JOIN参考画像](/src/image/inner_join.png)


### 外部結合(OUTER JOIN)
- １つ目のテーブルを基準として、結合条件に不一致のレコードも結合する。
- `LEFT JOIN`：２つのテーブルのうち左側つまり、「１つ名のテーブル名」のすべての行が表示される。
- `RIGHT JOIN`：２つのテーブルのうち右側つまり、「２つ名のテーブル名」のすべての行が表示される。
```SQL
SELECT 選択したい列のリスト FROM １つ目のテーブル名 LEFT JOIN 2つ目のテーブル名 ON 結合条件;
SELECT 選択したい列のリスト FROM １つ目のテーブル名 RIGHT JOIN 2つ目のテーブル名 ON 結合条件;
```
- 例：
  - INNER JOINとは異なり、JOIN句の左側テーブル（JOINの前に記述するテーブル)、ここでは「スタッフ」テーブルのレコードは全て取得される。スタッフテーブルのレコードは、性別列の値が性別マスタテーブルに存在しても、しなくても、取得される。
  ```SQL
  SELECT
    スタッフ."ID" AS スタッフID,
    スタッフ.姓,
    スタッフ.名,
    スタッフ.性別 AS 性別ID,
    性別マスタ.名称 AS 性別名称
  FROM
    スタッフ LEFT JOIN 性別マスタ
  ON
    スタッフ.性別 = 性別マスタ."ID";
  ```
  ![LEFT JOIN参考画像](/src/image/left_join.png)