# Logの取得方法と設定方法
## 説明
- CakePHPでのLogの取得方法と設定方法について記載

## 設定方法
- 設定内容は**config/app.php**の以下の箇所に記載されている。
```
   /**
　 * Configures logging options
   */
```
### 設定できる項目
|キー名|内容|備考|
|:----:|----|----|
|className|ログ出力処理を行うクラスを指定する||
|path|ログファイルの出力先|LOGSとなっている場合基本的にルート直下のlogsディレクトリ内に出力される|
|files|出力されるファイル名||
|scopes|設定したログファイルにログを出力する際に指定する値||
|levels|出力するログレベル||
|url|||

- pathのLOGSについては**config/pahts.php**に記載されている。
- デフォルトでは、error,debug,queriesの3つが用意されている。
  - error：エラー時のログを取得
  - debug：デバッグ時のログを取得
  - queries：DBへアクセスしたクエリーをログとして取得

### ログ取得方法
- 第一引数の内容を第二引数で設定されたログレベルのファイルに出力する
```$this->log(第一引数, LogLevel::任意のログレベルを記載);```
- 例：levelsでdebugが設定されているパスにログを出力する
```$this->log('ログテスト: ' . $log_test, LogLevel::DEBUG);```

## 参考
1. [【CakePHP入門】logメソッドの使い方まとめ（ログの出力方法）](https://www.sejuku.net/blog/26261#index_id4)
2. [CakePHP3でファイルログ出力をしたい](https://sassamori.hatenablog.com/entry/2021/02/14/220053)
3. [CakePHP3ログファイルへの出力・$this->log()、独自ログへの出力方法の解説](https://blog.s-giken.net/328.html)