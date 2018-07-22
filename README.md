# 画像列から Scratch 用スプライトを作るツール (Windows/Mac/Linux)

[(English)](README-en.md)

複数枚の画像 (png, svg) から、Scratch（スクラッチ）のスプライトファイルを作ります。

スクラッチの「ファイルから新しいコスチュームをアップロード」で複数枚の画像を読むと、順序がばらばらになって大変です。ここで紹介するスプライト生成ツールを使うと、元の画像ファイル名と同じ順に、多くのコスチュームを持つようなスプライトを作ることができます。スクラッチでアニメーションを使ったプロジェクトを作るときなどに役に立ちます。（[デモビデオ](#demovideo)）

![flow](readme_figs/flow-ja.png)


## かんたんな使い方の説明

コスチュームにしたい画像を `img` という名前のフォルダに入れておき、ここで紹介するスクリプトを実行すると、スクラッチでスプライトとして読み込めるファイルが出来上がります。これは画像と `sprite.json` というテキストファイルをまとめて zip 形式で圧縮したものです。以下で使い方の詳しい手順を説明します。

## 使い方

1. まず[このプロジェクトのzipファイル](https://github.com/memakura/seq2sprite/archive/master.zip)をダウンロードします。
1. zipファイルの中の `img`というフォルダと、`seq2sprite.bat` もしくは `seq2sprite.sh` というスクリプト（どちらが必要かは後で説明）を適当な場所にコピーしておきます。
    - Windowsの「ドキュメント」や Macの「書類」に適当なフォルダを作って入れておくとよいです。**以下の説明では `seq2sprite` という名前のフォルダを作ったとします．**
    - `img` にはサンプル画像が入っています
1. フォルダやスクリプトを入れたフォルダ `seq2sprite` を開きます。
1. `img` フォルダの中に pngファイルを複数枚入れておきます（まずはサンプルをそのまま使ってみてください）。
    - 各ファイル名から拡張子（.pngなど）を除いた文字列がそのままそれぞれコスチューム名になります。
    - 画像サイズは全て同じ 240x300 を想定しています。サイズを変える場合は[こちら](#imgsize)を見てください。
1. 環境に合わせて `seq2sprite.bat` か `seq2sprite.sh` を実行します（詳細は以下）。

### Windows (seq2sprite.bat を利用)

**ファイルエクスプローラの [表示] で [ファイル名拡張子を表示] にチェックを入れておくと便利です。**

1. `seq2sprite.bat` をダブルクリックして実行すると、`work` というフォルダが出来上がります。**黒い画面が開きますが、勝手に閉じるまで待ってください。**
1. 出来上がった `work` フォルダを選択し、右クリックを押して、メニューから [送る(N)] の [圧縮 (zip 形式)フォルダー] を選択すると、`work.zip` （すでにある場合は `work (数字).zip`）が出来上がります。これをスクラッチで読むことができます。`work.sprite2` という名前に変えておいてもよいです。（変えなくても読み込めます。）

### Mac/Linux, Windowsのbash環境 (subsystem, mingw, cygwin) (seq2sprite.sh を利用)

**（注意）zipコマンドが必要です。**

1. bash の使えるコマンドプロンプトを開きます。(Macは Launchpad や Spotlight検索で、ter.. ぐらいを打ち込むとターミナルを選べます。）
1. スクリプトや `img` フォルダのある場所に行きます。Macだと、[書類] の下に `seq2sprite` というフォルダを作成してコピーしたのであれば、以下を打ち込んでフォルダを移動します。
   ```
   cd /Users/ユーザ名/Documents/seq2sprite
   ```
    - 最後に return を押します。途中でtabキーを押すとファイル名などが補完できます。
    - コマンド `cd` を使うと、今いるフォルダを移動します。また、`pwd` は今いるフォルダを、`ls` は今いるフォルダの中身を見ることができます（`img/` や `seq2sprite.sh` が表示されるはずです。)
1. `./seq2sprite.sh` と打ち込んでreturnキーを押すと、`work.sprite2` というファイルが出来上がるので、このファイルをスクラッチから読み込むことができます。

### 作成したスプライトファイルをスクラッチから開く方法

1. スクラッチの「スプライト」「新しいスプライト」のところにあるアイコンで [ファイルから新しいスプライトをアップロード] （下図）をクリックし、出来上がったスプライトのファイル (`work.zip`, `work (数字).zip`, もしくは　`work.sprite2`)を開きます。

   ![screenshot](readme_figs/screen-ja.png)

1. これでスプライトに myCandle という名前のスプライトが新しく追加されます。スプライトの名前は青丸で i と書かれたところをクリックすると変更できます。



<a name="demovideo">

### デモビデオ

<iframe width="522" height="315" src="https://www.youtube.com/embed/7QLjaB54ZRM?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>



<a name="imgsize">

## 異なる画像サイズやSVGファイルの利用

画像サイズは横240、高さ300を想定しているので、画像サイズが異なる場合は、スクリプト (`seq2sprite.bat` か `seq2sprite.sh`)をエディタ（メモ帳など）で開いて、

```
    "rotationCenterX": 120,
    "rotationCenterY": 150
```

の数字を画像サイズの半分にしておくと、ちょうどいい感じになります。

pngではなくsvgファイルを使う場合は `EXT=png` を `EXT=svg` に変えてください。


## サンプル画像について（クレジット）

このウェブページのキャンドル画像や `img` フォルダ内のサンプル画像は、DL Stock Footage が公開している
"Candle flame being blown out 1 | Free Stock Footage" という映像を使用させていただきました。他にもいくつかいい感じの映像が公開されています。

- [https://www.youtube.com/watch?v=dlHyoPC0hcw](https://www.youtube.com/watch?v=dlHyoPC0hcw)
- [https://www.facebook.com/dlstockfootage/](https://www.facebook.com/dlstockfootage/)

## 他の映像素材について

[https://www.techradar.com/news/the-best-free-stock-video-sites](https://www.techradar.com/news/the-best-free-stock-video-sites) などでもいろいろな映像素材サイトが紹介されています。たとえば [Videvo (Free Stock Video Footage)](https://www.videvo.net/) では自由に使えるライセンスでの公開が多いようでした（[ライセンスの詳細はこちら](https://www.videvo.net/faqs/)）。