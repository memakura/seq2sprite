# 複数枚の画像からスクラッチ用スプライトを作るツール (Windows/Mac/Linux)

<a href="#english">(English)</a>

複数枚の画像 (png, svg) から、Scratch（スクラッチ）のスプライトファイルを作ります。

スクラッチの「ファイルから新しいコスチュームをアップロード」で複数枚の画像を読むと、順序がばらばらになって大変な場合があります。この方法だとファイル名順に画像をコスチュームとして読み込むことができます。

## かんたんな使い方の説明

コスチュームにしたい画像を `img` という名前のフォルダに入れておき、ここで紹介するスクリプトを実行すると、スクラッチで読み込めるスプライトが出来上がります。以下で詳しい手順を説明します。

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


<a name="english">

# Scratch sprite generator for Windows/Mac/Linux

Convert a sequence of images (png, svg) to a sprite file that can be imported to your Scratch project.

## Usage

1. Download [seq2sprite-master.zip](https://github.com/memakura/seq2sprite/archive/master.zip), open the zip file, and copy/move `seq2sprite-master` folder inside to other folder, for example, `Documents`.
1. Open `seq2sprite-master` folder.
1. Replace the sample image sequence in `img` folder with your image sequence. (You can first try with the original example files.)
    1. If you want to keep a used `img` folder, change the name to backup it and create a new empty `img` folder.
    1. The base name of each file (for example, c0001 of c0001.png) is used as a costume name.
    1. All the image sizes are assumed to be the same 240x300. If you want to change the size, please see <a href="#imgsize-en">here</a>.
1. Run either `seq2sprite.bat` or `seq2sprite.sh` depending your environment; see below for details.
    
### Windows (Use seq2sprite.bat)

1. Double click `seq2sprite.bat`, and a folder named `work` will be created. Wait until the opened (black) window is automatically closed.
1. Select `work` folder, open a menu by right click, and select "Compressed (zipped) Folder" option from the "Send To" options.
1. The created zip file can be imported from Scratch. You can also change the name `work.zip` to `work.sprite2` (optional).

### Mac, Linux, Windows bash (mingw, cygwin, subsystem) (Use seq2sprite.sh)

1. Open bash (terminal). If you use Mac, type "terminal" from Launchpad or Spotlight search.
1. Change directory to seq2image-master. 
   ```
   cd /Users/<user name>/Documents/seq2sprite-master
   ```
1. Run the script by `./seq2sprite.sh`, and a file called `work.sprite2` is generated.

<a name="imgsize-ja">

### Open a created sprite file from Scratch

1. Select "Upload sprite from file" icon in the "New Sprite" section, which is located at the top of "Sprites" subwindow. Load a created file (work.zip`, `work (<number>).zip`, or `work.sprite2`).
1. A sprite named "myCandle" will appear in the "Sprites" subwindow.
    1. You can change the sprite name by clicking the top-left blue "i" icon.


## Use different image size or SVG files

If each image size is different from 240 x 300, open a script file (`seq2sprite.bat` or `seq2sprite.sh`), and change the following lines. Recommended numbers are the half of your image size (each of width and height).

```
    echo 			"rotationCenterX": 120,
    echo 			"rotationCenterY": 150
```

If you want to use svg files, change `EXT=png` to `EXT=svg`.


## About the sample images

Sample images in the img folder are extracted from the video

"Candle flame being blown out 1 | Free Stock Footage"

by DL Stock Footage. They provide several nice video clips. 

- https://www.youtube.com/watch?v=aWPOiYs20XU
- https://www.facebook.com/dlstockfootage/

