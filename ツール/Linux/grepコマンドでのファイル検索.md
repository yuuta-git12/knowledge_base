# grepコマンドでのファイル検索
## grepコマンドとは
- ファイルに含まれる文字列検索を行うコマンド
- grepはglobal regular expression print(ファイル全体から正規表現に該当する箇所を出力する)が語源
## 書き方
- ```grep -r "検索したい文字列" [探すファイルがあるディレクトリパス]```
- `-r`オプションはサブディレクトリまで検索する指定
- ```例：grep -r "Test太郎" /var/share```:/var/share内のTest太郎を含むファイルを検索する
- 正規表現を使うことで複数のパターンで検索することができる。
### 正規表現の例

|正規表現の記号|意味|
|:----:|----|
|( )|グループ化|
|&#124;|左右のどちらか（または）|
|?|直前の表現が0回か1回登場|
|*|直前の表現が0回以上連続して登場|
|+|直前の表現が1回以上連続して登場|
|.|任意の一文字|
|^|行頭|
|$|行末|

### 正規表現を組み合わせて書き方(正規表現を使う際は-Eオプションを付ける)
- ```grep -r -E (Test|テスト)(太郎|たろう) /var/share```
  - グループを使えば以下の４通りのパターンで検索することができる
    - Test太郎
    - Testたろう
    - テスト太郎
    - テストたろう
  - パターンを増やして以下のようにもできる
  - ```grep -r -E (Test|テスト|てすと)(太郎|たろう|タロウ) /var/share```
- 文字と文字の間にスペースがある場合
  - 直前にスペースが0回または1回登場
    - ```grep -r -E (Test|テスト) ?(太郎|たろう) /var/share```
  - 直前にスペースが0回以上登場
    - ```grep -r -E (Test|テスト) *(太郎|たろう) /var/share```
### 大文字小文字を無視して検索する場合
- grepコマンドの `-i`オプションを使用する。
- ignore caseの略でアルファベットの大文字小文字の違いを無視して検索するオプション
- ```grep -r -i -E (Test|テスト) *(太郎|たろう) /var/share```

## 実戦での使用例
- ```php -i|grep php.ini```:php.iniファイルの保存先を表示する
  - ```php -i```：phpの情報を表示するコマンドラインオプション
  - パイプラインでphp -iの結果からphp.iniが含まれる箇所を表示する