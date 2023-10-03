# xdebugの設定方法

## 概要

php用のデバッガーxdebugの環境毎の設定方法を記載

---

## php.iniファイルの探し方

どの環境下でもphp.iniに設定用の記述が必要。php.iniファイルの検索方法は以下の通り

- php.iniファイルを探すコマンド
    - php.iniが保存されているディレクトリが表示される。

```php
php -i|grep php.ini
```

　・実行結果の例

```php
Configuration File (php.ini) Path => /etc
Loaded Configuration File => /etc/php.ini
/etc/php.d/99-egg-php.ini
```

---

## VM環境のphp.iniの設定

```jsx
zend_extension="/var/tmp/pear-build-roottyn3YS/install-xdebug-3.1.6/usr/lib64/php/modules/xdebug.so"
html_errors=on
xdebug.mode = debug
xdebug.start_with_request = yes
xdebug.log=/tmp/xdebug.log
```

---

## Docker環境の場合

1. docker内のphp.iniの場所を確認
2. docker desktopから対象のコンテナのFilesを開きphp.iniを開く
3. Dynamic Extensionsと記載された行の下に以下の内容を追加
4. Xdebug2.x系の設定

```php
;;;;;;;;;;;;;;;;;;;;;;
; Dynamic Extensions ;
;;;;;;;;;;;;;;;;;;;;;;

zend_extension="/usr/lib64/php/modules/xdebug.so"

xdebug.default_enable = 1　→xdebug.mode = debug
xdebug.remote_autostart = 1　→xdebug.start_with_request = yes
xdebug.remote_connect_back = 0　→xdebug.discover_client_host
xdebug.remote_enable = 1　　　　→xdebug.mode = debug
xdebug.remote_handler = "dbgp"
xdebug.remote_port = 9003 →xdebug.client_port = 9003
xdebug.remote_log = "/tmp/xdebug_log" →　xdebug.log
xdebug.remote_host = "host.docker.internal" →　xdebug.client_host
```

1. Xdebug3.x系の設定

```jsx
テスト１　失敗
zend_extension="/usr/lib64/php/modules/xdebug.so"
xdebug.mode = debug
xdebug.start_with_request = yes
xdebug.client_port = 9003

**成功　記載したファイル /etc/php.d/15-xdebug.ini**
zend_extension="/usr/lib64/php/modules/xdebug.so"
xdebug.mode = debug
xdebug.start_with_request = yes
xdebug.client_port = 9003
xdebug.discover_client_host = false
xdebug.remote_handler = "dbgp"
xdebug.log = "/tmp/xdebug_log"
xdebug.client_host = "host.docker.internal"

```

1. VScodeで拡張機能PHP Debugをインストール　

参考：

- Xdebug2.x系ではあるが設定に関して分かりやすくまとめてある。

[[PHP] Xdebug のリモートデバッグ、理解していますか？ - Qiita](https://qiita.com/castaneai/items/d5fdf577a348012ed8af)

C:\work\digitaldenen_aster2\.vscode\launch.json

- エラー
    - Docker Desktopでphp -vすると以下の表示がでる。
    - https://kitigai.hatenablog.com/entry/2019/05/04/165522
    - 記事によると、php.iniのzend_extensionをコメントアウトする必要があるみたい

```jsx
sh-5.1# php -v

**Cannot load Xdebug - it was already loaded**

PHP 8.0.27 (cli) (built: Jan  3 2023 16:17:26) ( NTS gcc x86_64 )
Copyright (c) The PHP Group
Zend Engine v4.0.27, Copyright (c) Zend Technologies
    with Xdebug v3.1.2, Copyright (c) 2002-2021, by Derick Rethans
    with Zend OPcache v8.0.27, Copyright (c), by Zend Technologies
```

　　

/etc/php.d/15-xdebug.iniにもzendが書いてあった　重複

[PHP のバージョンアップ時にやること](https://zenn.dev/takorice/scraps/a12ffbf2394ea0)

[xdebugでリモートデバッグ出来ない時に確認すべき内容 - Qiita](https://qiita.com/berukokoko/items/45a583b5c6c8f732530c)

[vscodeでxdebug3のdocker環境を作る - Qiita](https://qiita.com/islandryu/items/b5fbebb41f6d60fcf0c2)

[【PHP】Xdebug + Docker + VSCodeによるデバッグ環境構築 | Points & Lines](https://pointsandlines.jp/server-side/php/xdebug-docker-vscode#launchjson)

- xdebugがインストールされているか確認
    - yum list installed | grep xdebug

`yum install php-devel`

`yum install php-pear`

pecl install xdebug

zend_extension=/usr/lib64/php/modules/xdebug.so

lanch.jsonの中身を以下のように修正

```jsx
"version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
			"pathMappings": {
                "/work/aster2": "${workspaceRoot}"
            }

        },
```

**work/aster2はdocker desktopのworkディレクトリから参照**

AAAの場合は「work/aster_admin_asp」とする。