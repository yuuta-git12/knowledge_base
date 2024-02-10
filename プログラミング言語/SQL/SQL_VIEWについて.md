# SQL_VIEWについて

## VIEW(ビュー)について
- テーブルのようであるが、テーブルと異なり、データは持っていない。
- ただ、テーブルに対するSELECTを持っている。

## VIEWの利点
- 複雑なSELECT文を毎回記述する必要がない
- 必要な列、行だけをユーザーに見せることができる。更新時にも、ビュー定義に沿った更新んい限定することができる。
- 上記２点を、データ格納なしに実現できる。
- ビューを削除しても、参照しているテーブルは影響を受けない

## VIEWの作成・削除
### VIEWの作成
```SQL
CREATE VIEW ビュー名 ((列1[,列2,列3...])) as SELECT文;
```
- SELECT文で指定された列の全てを指定する場合はビュー名の後ろの「((列1[,列2,列3...]))」は省略できる。
- 例
    ```SQL
    CREATE VIEW cityjapan as select id,name,district,population from city 
    WHERE CountryCode = 'JPN';
    ```
  - ビュー名：cityjapan 
  - 内容：テーブル名cityからCountryCodeが`JPN`のレコードを抜き出し、そのうちのid,name,distrct,population</br>を列としたビュー「cityjapan」を作成する。
### VIEWの削除
- 指定したビュー名のビューが存在する場合はそれを削除する。
```SQL
DROP VIEW IF EXISTS ビュー名;
```