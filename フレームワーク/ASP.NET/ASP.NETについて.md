# ASP.NETについて
## 説明
- ASP.NETを使った、システムを触ることになったので、学習用にメモを作成

## ASP.NETって何？
- Microsoftが作成したオープンソースのWebフレームワーク
- .NET Frameworkの上に構築されたWebアプリケーションのためのフレームワーク群
  - フレームワークのコア（中核）となる部分は同じだけど、そこからいくつかのフレームワークが派生している感じ

# 開発環境について
- ASP.NETはWindows,Macどちらでも開発できるらしい。
- Windowsの場合は、Visula Studioをインストールするだけで、簡単に開発環境を作れるらしい
- ~~Mac用の[Visual Studio for Mac](https://visualstudio.microsoft.com/ja/vs/mac/)もあるが、2024年8月31日でサポート終了するらしい。~~
  - ~~代替方法に関する情報が少ないので、ひとまずこちらを利用する。~~
- Visual Studio Codeによる代替方法があるので、そちらを利用する。
  - 拡張機能「C# Debkit」の追加
  - .NETのダウンロード(https://dotnet.microsoft.com/ja-jp/download/dotnet)
    - 最新版をダウンロードする
    - CPUアーキテクチャがArm64かx64か分からない場合,Macではターミナルで</br>以下のコマンドを叩くとCPUアーキテクチャが表示される
      - `uname -m`
  - 準備ができたら、「エクスプローラー」→「.NETプロジェクトを作成」でテンプレートが選べる。
  - ![VScode ASP.NET参考画像](/src/image/vscode_asp_net.png)

# チュートリアルについて
- ひとまず以下のチュートリアルを進めてみる
  - [チュートリアル: ASP.NET Core で Razor Pages Web アプリを作成する](https://learn.microsoft.com/ja-jp/aspnet/core/tutorials/razor-pages/?view=aspnetcore-8.0)
- 作成したアプリをVScodeで実行する場合は[実行]→[デバッグなしで実行]でブラウザが起動しアプリが表示される。
  - 内容を更新したら、その都度[デバッグの再起動]が必要
- 他のフレームワーク同様にコマンドでモデルなどを作成することができる、VSCodeの場合は全て.NET CLIで行う必要がある。
  - 頭に`dotnet ****`として実行している。
-  migrationファイルを作成して、データベースのカラム追加・削除もできる
   -  `dotnet ef migrations add ****`：DbContextで指定されたモデルに基づきスキーマを作成
   -  `dotnet ef database update`
-  DbContextは`Data/****.cs`ファイルで編集できる
-  データベースの作成フロー
   -  Moedlsディレクトリ内にテーブル名.csという名前のファイルを作成
      -  そのファイル内にモデルクラスを追加
      -  テーブルのカラムなども追記
   -  NuGet パッケージと EF ツールを追加（おそらく最初だけ）
   -  追加したモデルのスキャフォールディング
      -  `dotnet aspnet-codegenerator razorpage -m モデル名 -dc 名前空間を含めて使用するDbContextクラス -udl -outDir ビューを作成するための相対出力フォルダーパス --referenceScriptLibraries --databaseProvider 使用するデータベース`
         -  選択できるデータベースはsqlite,cosmos,postgresがある
         -  





# 参考サイト
- [ASP.NET 入門の書](https://qiita.com/Kei18/items/1a9b936216bd2458ec08)
  - ASP.NETの概要について参考に利用
- [ASP.NET Core MVCの概要](https://learn.microsoft.com/ja-jp/aspnet/core/tutorials/first-mvc-app/start-mvc?view=aspnetcore-8.0&WT.mc_id=dotnet-35129-website&tabs=visual-studio-mac)
  - ASP.NETCore MVCのチュートリアル
- [【.NET8対応】Blazorのはじめかた【環境構築から初回実行まで】](https://blazor-master.com/dotnet-8-blazor-start/)
  - VScodeでの開発環境の構築手順の参考
- [チュートリアル: ASP.NET Core の Razor Pages](https://learn.microsoft.com/ja-jp/aspnet/core/tutorials/razor-pages/razor-pages-start?view=aspnetcore-8.0&tabs=visual-studio)