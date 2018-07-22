# 複数枚の画像からスクラッチ用スプライトを作るツール (Windows/Mac/Linux)

[English](README-en.md)

複数枚の画像 (png, svg) から、Scratch（スクラッチ）のスプライトファイルを作ります。

スクラッチの「ファイルから新しいコスチュームをアップロード」で複数枚の画像を読むと、順序がばらばらになって大変な場合があります。ここで紹介するスプライト生成ツールを使うと、画像のファイル名と同じ順のコスチュームを多く持つようなスプライトを作ることができます。

![flow](readme_figs/flow-ja.png)


## かんたんな使い方の説明

コスチュームにしたい画像を `img` という名前のフォルダに入れておき、ここで紹介するスクリプトを実行すると、スクラッチでスプライトとして読み込めるファイルが出来上がります。これは画像と `sprite.json` というテキストファイルをまとめて zip 形式で圧縮したものです。以下で使い方の詳しい手順を説明します。

## 使い方

1. まず[このプロジェクトのzipファイル](https://github.com/memakura/seq2sprite/archive/master.zip)をダウンロードして、zipファイルの中の `seq2sprite-master` を適当な場所（たとえば Windowsの「ドキュメント」や Macの「書類」）にコピーしておきます。
1. `seq2sprite-master` のフォルダを開きます。
1. `img` フォルダの中に pngファイルを複数枚入れておきます（まずはサンプルをそのまま使ってみてください）。
    1. 各ファイル名から拡張子（.pngなど）を取ったものがそのままそれぞれコスチューム名になります。
    1. 画像サイズは全て同じ 240x300 を想定しています。サイズを変える場合は<a href="#imgsize-ja">こちら</a>を見てください。
1. 環境に合わせて、`seq2sprite.bat` か `seq2sprite.sh` のどちらかのスクリプトを実行します（詳細は以下）。

### Windows (seq2sprite.bat を利用)

**ファイルエクスプローラの[表示]で[ファイル名拡張子を表示]にチェックを入れておくと便利です。**

1. `seq2sprite.bat` をダブルクリックして実行すると、`work` というフォルダが出来上がります。**黒い画面が開きますが、勝手に閉じるまで待ってください。**
1. 出来上がった `work` フォルダを選択し、右クリックを押して、メニューから[送る(N)]の[圧縮 (zip 形式)フォルダー]を選択すると、`work.zip` （すでにある場合は `work (数字).zip`）が出来上がります。これをスクラッチで読むことができます。`work.sprite2` という名前に変えておいてもよいです。（変えなくても読み込めます。）

### Mac/Linux, Windowsのbash環境 (subsystem, mingw, cygwin) (seq2sprite.sh を利用)

1. bash の使えるコマンドプロンプトを開きます。(Macは Launchpad や Spotlight検索で、ter.. ぐらいを打ち込むとターミナルを選べます。）
1. コピーした場所に行きます。Macだと[書類]にコピーしたのであれば、以下を打ち込んでフォルダを移動します。
   ```
   cd /Users/ユーザ名/Documents/seq2sprite-master
   ``` 
   （最後に return を押します。途中でtabキーを押すとファイル名などが補完できます。）
1. `./seq2sprite.sh` と打ち込んでreturnキーを押すと、`work.sprite2` というファイルが出来上がるので、スクラッチから読み込むことができます。

### スクラッチからのスプライトファイルの開き方

1. スクラッチの「スプライト」「新しいスプライト」のところにあるアイコンで [ファイルから新しいスプライトをアップロード] をクリックし、出来上がったスプライトのファイル (`work.zip`, `work (数字).zip`, もしくは　`work.sprite2`)を開きます。
1. これでスプライトに myCandle という名前のスプライトが新しく追加できます。
    1. スプライトの名前は青丸で i と書かれたところをクリックすると変更できます。

![screenshot](readme_figs/screen-ja.png)


<a name="imgsize-ja">

## 異なる画像サイズやSVGファイルの利用

画像サイズは横240、高さ300を想定しているので、画像サイズが異なる場合は、スクリプト (`seq2sprite.bat` か `seq2sprite.sh`)をエディタ（メモ帳など）で開いて、

```
    echo 			"rotationCenterX": 120,
    echo 			"rotationCenterY": 150
```

の数字を画像サイズの半分にしておくと、ちょうどいい感じになります。

pngではなくsvgファイルを使う場合は `EXT=png` を `EXT=svg` に変えてください。


## サンプル画像について

DL Stock Footage の "Candle flame being blown out 1 | Free Stock Footage"
を ffmpeg により切り出して png ファイルを用意しました。他にもいくつかいい感じの映像が公開されています。

- https://www.youtube.com/watch?v=aWPOiYs20XU
- https://www.facebook.com/dlstockfootage/

