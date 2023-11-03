# Mermaid Live EditorをDockerコンテナで使用する
## 説明
- オンライン上でMermaid記法で書いた内容をPNG,SVGに変換できるサービスMermaid Live Editor<br>便利なサービスではあるがMermaid記法で書いた内容をアップロードしているので機密性のある情報はアップロードできない。
- [Mermaidで描いた図形を画像ファイルに出力し、キレイに拡大表示してみた](https://dev.classmethod.jp/articles/mermaid-live-editor/)でDockerコンテナ上にMermaid Live Editorを作成する方法が記述されているので試してみる。


## 利用方法
- dockerがインストールされた状態で以下コマンド実行
```
docker run --platform linux/amd64 --publish 8000:8080 --name mermaid-live-editor ghcr.io/mermaid-js/mermaid-live-editor
```
- コンテナmermaid-live-editorが作成されるので、次のアドレスにアクセスhttp://localhost:8000
- mermaid-live-editorが起動する
- 終了する場合は、```docker stop mermaid-live-editor```
- Docker Desktopを使っている場合はコンテナの停止ボタンクリックでも終了する