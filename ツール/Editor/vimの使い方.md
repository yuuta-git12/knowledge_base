# vimの使い方

## 説明
- テキストエディタviの機能拡張版vimの使い方について記載

## vimのインストール
- Linuxへのvimのインストール方法（ディストリビューションによって異なる）
  - UbuntuなどのDebian系ディストリビューションの場合：```sudo apt install vim```
  - CentOSなどのRedHat系ディストリビューションの場合：```dnf install vim```
  
## vimの起動方法
- ```vim [編集したいファイルのパス]```
  - システムの設定ファイルを編集する場合は**sudo**を付けて実行する。


## vimのモード
### vimのモード一覧
|モード名|用途|切り替え方法|
|:---:|:---:|:---:|
|ノーマルモード|カーソルの移動、コマンドの入力ができる|vim起動直後に表示される|
|挿入モード|通常のテキストエディタと</br>同様ファイルの作成・編集ができる|「i」を押す,</br>ノーマルモードに戻す際は「Esc」を押す|
|置換モード||「Shift+R」を押す,</br>ノーマルモードに戻す際は「Esc」を押す|
|選択モード|コピぺするためのモード|「V」を押す,</br>ノーマルモードに戻す際は「Esc」を押す|
|検索モード|指定した文字列をファイル内から検索する|「/検索したい文字列」を入力し[Enter]を押す,</br>ノーマルモードに戻す際は「Esc」を押す|

### ノーマルモード(NORMAL MODE)でできること
- ファイルを開く・閉じる・保存

|コマンドの意味|入力するコマンド|備考|
|:---:|:---:|:---:|
|ファイルを開く</br>（指定したファイルがなければ新規作成される）|```vim ファイル名```||
|ファイルを保存|```:w```||
|ファイルを保存せず終了|```:q!```||
|ファイルを上書き保存して終了|```:wq```||
|ファイルの最後に移動する|`SHIFT + G`|


### 挿入モード(INSERT MODE)でできること
- 矢印キーでカーソルを動かす
- キー入力で文字を入力する
- [backspace],[delete]キーで文字を消す
- ファイル編集後、上書き保存する場合はノーマルモードに戻り```「:wq」```を押す。
  - :wq：Write（書き込み）Quit(vimを終了)の意味

### 検索モード(SEARCH MODE)でできること
- 「/検索したい文字列」で開いているファイル内の文字列を検索できる
- 検索は正規表現を使用することも出来る。
- 検索にヒットした文字列が複数ある場合は **「N」キーを押すと、次の文字列に移動する。前の文字列に戻る場合は「Shift + N」キーを押す。**

### 選択モード(VISUAL MODE)でできること
- コピー&ペーストの実行

## vimでコピー&ペースト、アンドゥする方法
### コピー&ペースト
1. コピーしたい対象の先頭にカーソルを合わせ、vimをVISUAL MODEに切り替える
2. 矢印キーでカーソルを移動させ、コピー範囲を選択する。
3. コピー範囲選択後、「Y」キーを押す。（YはYank：引っ張るの略）
4. 選択範囲がクリップボードにコピーされた。
5. ペーストしたい箇所にカーソルを合わせ、ノーマルモードで「SHIFT + P」キーを押すとペーストされる。
### アンドゥ・リドゥ
- ノーマルモードで「U」キーを押すと直前の操作が取り消される。
- ノーマルモードで「 Ctrl + R」キーを押すとやり直しのやり直しとなる。
### オプション
- コピー&ペースト、アンドゥ、リドゥともにキーの前に数字をつけると、数字の回数だけ処理を行う。
  - 例：```10 SHIFT+Pキー```を行うと、ペーストが10回行われる。


## 補足
- コンソールでは「Ctrl + Z」はアンドゥではなく、プロセスを一時停止する操作となる、一時停止した操作を再開する場合は```fg```コマンドを入力する。
- Macのvim上で「Ctrl + Z」した際、vimが終了した状態となったが、再度同じファイルをvimで開く以下の様にとファイルをどのように開くか聞いてくる。(R)ecoverを選ぶと、直前の内容が表示される。

```
E325: ATTENTION
Found a swap file by the name "./desktop/.vim_test.txt.swp"
          owned by: akikayuuta   dated: 水  1 03 13:10:17 2024
         file name: ~akikayuuta/Desktop/vim_test.txt
          modified: YES
         user name: akikayuuta   host name: akikayuutanoMacBook-Pro.local
        process ID: 1531 (STILL RUNNING)
While opening file "./desktop/vim_test.txt"
             dated: 水  1 03 12:53:43 2024

(1) Another program may be editing the same file.  If this is the case,
    be careful not to end up with two different instances of the same
    file when making changes.  Quit, or continue with caution.
(2) An edit session for this file crashed.
    If this is the case, use ":recover" or "vim -r ./desktop/vim_test.txt"
    to recover the changes (see ":help recovery").
    If you did this already, delete the swap file "./desktop/.vim_test.txt.swp"
    to avoid this message.

Swap file "./desktop/.vim_test.txt.swp" already exists!
[O]pen Read-Only, (E)dit anyway, (R)ecover, (Q)uit, (A)bort: 
```

## 参考サイト
- [Vim使い方 初心者でもすぐに始められるVimの基本](https://original-game.com/vim-mac2/)
- [Vimのモードについて。それぞれどんなことができるの？](https://original-game.com/vim-mac3/)
- [Vi (Vim) 超入門](https://www.hpc.co.jp/support/hello_vi_04/)