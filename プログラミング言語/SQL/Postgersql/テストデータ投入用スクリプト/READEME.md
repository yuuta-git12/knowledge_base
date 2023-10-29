## 概要
- 案件で必要になった、テストデータの投入用のsqlスクリプトファイル
- GENERATE_SERIESやRANDOMなどのpostgresqlの関数を使用。
- 初めて作ったsqlクリプトファイルなので内容はかなり雑。
- 1はGENERATE_SERIES関数の説明が記載されているサイト、サンプルもあるので分かりやすかった。
- 4はデータベースのカラムに設定されている設定の読み方について記述されている。
  - 今回はis_nullableの意味がわからず調べる際に使用した。
- 6は投入する名前や住所の作成に文字列結合が必要で参考にした。


## 参考
1. [PostgreSQL: 集合を返すGENERATE_SERIES関数で大量データを生成して集計する](https://www.techscore.com/blog/2013/03/12/集合を返すgenerate_series関数で大量データを生成して集計/)
2. [SQLで大量のテストデータ作成](https://qiita.com/cobot00/items/8d59e0734314a88d74c7)
3. [#PostgreSQL Window関数で行番号や順位を抽出](https://qiita.com/nfnoface/items/72609615ede93ecea349)
4. [30.9.columns](https://www.postgresql.jp/document/8.0/html/infoschema-columns.html)
5. [【Postgres】SQLの勉強のために大量のテストデータを登録してみる](https://qiita.com/yutoun/items/2033a62d62812da359ed)
6. [postgresqlでシンプルな文字列結合](https://qiita.com/tmak_tsukamoto/items/e8d11b1fd5a479f03501)
7. [【PostgreSQL】ランダム値を生成する（random)](https://postgresweb.com/post-4946)