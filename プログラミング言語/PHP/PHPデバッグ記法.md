# PHPデバッグ技法

## 説明
- PHPでデバッグする際のコードの書き方について記載

## 参考URL
https://qiita.com/yamamoto_hiroya/items/6ad6d448afcff1cf3791


## はじめに

`php`で`var_dump`で変数の値を確認するデバッグ手法があると思いますが、それをそのまま`html`上で表示すると

!https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a8828ba6-af87-4c50-90b7-ef14ddf043d4/https3A2F2Fqiita-image-store.s3.amazonaws.com2F02F674712F226fc0f3-ece9-0c74-7b75-2f24bf4d6264.png

こんな感じになってしまいます。
 このままでは中の構造が追いにくく分かりにくいので形を成形して表示する方法を3つ紹介します。

## サンプルコード

var_dump.php

```
<?php
$sample = array('first' => array('first_children1' => 'a', 'first_children2' => 'b', 'first_childeren3' => 'c'), 'second' => 'd', 'third' => array('third_children1' => 'e', 'third_children2' => array('grandchildren1' => 'f', 'grandchildren' => 'g')));

var_dump($sample);

```

## 1つ目: `pre`タグで囲む

var_dump.php

```
<?php
$sample = array('first' => array('first_children1' => 'a', 'first_children2' => 'b', 'first_childeren3' => 'c'), 'second' => 'd', 'third' => array('third_children1' => 'e', 'third_children2' => array('grandchildren1' => 'f', 'grandchildren' => 'g')));

echo('<pre>');
var_dump($sample);
echo('</pre>');

```

!https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6e922457-2a58-4dc7-bea1-e90bf7bf85bc/https3A2F2Fqiita-image-store.s3.amazonaws.com2F02F674712F0e45ac18-9e53-1fe7-82bf-498556ff7a67.png

`pre`タグで囲んだ中で`var_dump`すれば、コードがそのまま表示されるので改行やインデントが行われた状態で表示できます。

## 2つ目: ログに出す

var_dump.php

```
<?php
$sample = array('first' => array('first_children1' => 'a', 'first_children2' => 'b', 'first_childeren3' => 'c'), 'second' => 'd', 'third' => array('third_children1' => 'e', 'third_children2' => array('grandchildren1' => 'f', 'grandchildren' => 'g')));

ob_start();
var_dump($sample);
$out = ob_get_contents();
ob_end_clean();

// FILE_APPENDを指定することでログファイルに追記の形になる
file_put_contents('var_dump_log.txt', $out, FILE_APPEND);

```

!https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bf02612c-27f4-48cc-99ed-8e3f60f289ce/https3A2F2Fqiita-image-store.s3.amazonaws.com2F02F674712F58494002-6576-6c61-e658-6aebb3906dda.png

これは画面には出さずにログに吐き出してそのテキスト上で見るという方法です。
 ファイルを生成するしてそれを確認するのがやや手間ですが`tail`等でサブディスプレイにでも常に置いておけば画面更新時にログの結果が見れるので慣れればこれもそこそこ使えると思います。`tail -f var_dump_log.txt`

## 3つ目: デベロッパーモード上で見る

var_dump.php

```
<?php
$sample = array('first' => array('first_children1' => 'a', 'first_children2' => 'b', 'first_childeren3' => 'c'), 'second' => 'd', 'third' => array('third_children1' => 'e', 'third_children2' => array('grandchildren1' => 'f', 'grandchildren' => 'g')));

var_dump($sample);

```

!https://s3-us-west-2.amazonaws.com/secure.notion-static.com/56c8a22b-b531-43ef-a0ef-7ebf457fb0b4/https3A2F2Fqiita-image-store.s3.amazonaws.com2F02F674712F786c7e56-216a-17ce-b02a-8f4921641e27.png

多分これが一番早いと思います。
 プログラム上はただ`var_dump`するだけで、ブラウザ側でデベロッパーモードを起動して`Elements`内を見るとその中では成形されているのでそこで確認する方法。
 画像は`Google Chrome`のデベロッパーモードですが各ブラウザにデベロッパーモードは備わっているので同様のことができるはずです（確認はしていませんが…）

## おわりに

`var_dump`デバッグは初心者から上級者までお世話になるデバッグ方法だと思いますので、上記のお好きな方法で快適な`var_dump`デバッグライフをお過ごし下さい。
