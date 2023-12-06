# iOSでのみWebサイトの表示がおかしい場合の対処
## 説明
- iOSでのみWebサイトの表示がおかしい場合に調べたサイトのリンクを記載する
- 3の方法はiPhone実機とMacを使ったデバッグ方法、iOS向けのサイト開発には役立つ

## 実例
- 案件でiOS時のみ表示がおかしくなる事象が発生したが、CSSのpositionの内容を修正することで対応できた。4のサイトがヒントになった
  - その際に記述したCSSの一部
  - ```
    .question_title {
    background-color: #38806d;
    color: white;
    height: 50px;
    top: 0;
    font-size: 4.5vw;
    vertical-align: middle;
    width: 100%;
    margin-left: -4%;
    text-align: center;
	padding-right: 4%; //追加内容
    z-index: 999;
	position: absolute;　//追加内容
    }
    ```

## 参考
1. [iPhoneでWebサイトを見る時にHTML、CSS、Jqueryで起こるバグまとめ](https://sbwinc.co.jp/post-231/)
2. [iPhone独自のCSSを無効にする](https://yomocho.naganokanako.com/post-3139/amp/)
3. [実機iPhoneのSafariでWebインスペクタを使ってデバッグする方法](https://qiita.com/unsoluble_sugar/items/2a3d06631a6b8259dc44)
4. [【CSS】position: relative;とposition: absolute;子要素にもなる親要素にはどっちをつけるの](https://www.beginavi.net/cssposition-relative-absolute/)