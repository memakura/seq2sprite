# imgseq2sprite (for Windows/Mac/Linux)

<a href="#English">(English)</a>

png の画像複数枚から Scratch（スクラッチ）のスプライトとして読み込めるようなファイルを作ります。

まず[このプロジェクト](https://github.com/memakura/imgseq2sprite/archive/master.zip)をダウンロードして、zipファイルの中の imgseq2sprite-master を適当な場所にコピーしておきます。

## 使い方 (Mac/Linux, Windowsのbash環境)

1. bash の使えるコマンドプロンプトを開きます。(Macは Launchpad や Spotlight検索で、ter.. ぐらいを打ち込むとターミナルを選べます。）
1. コピーした場所に行きます。Macだと[書類]にコピーしたのであれば、`cd /Users/ユーザ名/Documents/imgseq2sprite-master` と打ち込みます（tabキーを押すと補完できます。）
1. `./imgseq2sprite.sh` と打ち込んで returnキーを押すと、work.sprite2 というファイルが出来上がるので、Scratchから読み込めます。

img の中に好きな画像を複数枚置いておくと、それらをコスチュームに持つようなスプライトが出来上がります。下のWindowsの説明も参考にしてください。

## 使い方 (Windows)

**ファイルエクスプローラの[表示]で[ファイル名拡張子を表示]にチェックを入れておくと便利です。**

1. imgseq2sprite-master のフォルダを開きます。
1. img フォルダの中にpngファイルを複数枚入れておきます。ファイル名の.pngを取ったものがそのままコスチューム名になります。
1. imgseq2sprite.bat をダブルクリックして実行すると、work というフォルダが出来上がります。**黒い画面が開きますが、閉じるまで待ってください**
1. 出来上がったworkフォルダを選択し、右クリックを押して、メニューから[送る(N)]の[圧縮 (zip 形式)フォルダー]を選択すると、work.zip （すでにある場合は work (数字).zip）が出来上がります。
1. Scratchで[新しいスプライト]のところにある[ファイルから新しいスプライトをアップロード]をクリックし、出来上がった work.zipファイル（もしくは work (数字).zip）を開きます。

これでスプライトに myCandle という名前のスプライトが新しく追加できます。

## 画像サイズ

画像サイズは横240、高さ300を想定しているので、画像サイズが異なる場合は

```
    echo 			"rotationCenterX": 120,
    echo 			"rotationCenterY": 150
```

の数字を画像サイズの半分にしておくと、ちょうどいい感じになります。

If the image size is different from 240x300, change the above numbers in imgseq2sprite.bat.

## サンプル画像について

DL Stock Footage の "Candle flame being blown out 1 | Free Stock Footage"
を ffmpeg により切り出して使っています。いくつかのいい感じの映像が公開されています。

- https://www.youtube.com/watch?v=aWPOiYs20XU
- https://www.facebook.com/dlstockfootage/


<a name="English">

# imgseq2sprite

Convert a sequence of png images to a sprite file that can be imported to your Scratch project.

## Usage (Windows)

1. Replace the sample image sequence in "img" folder with your image sequence. If you want to keep a used "img" folder, change the name to backup it and create a new empty "img" folder.
1. Double click imgseq2sprite.bat, and a folder named "work" will be created. Wait until the opened window is closed.
1. Select "work" folder and open a menu by right click. Select "Compressed (zipped) Folder" option from the "Send To" options.
1. Import the created zip file from Scratch.

## Use different image size

If each image size is different from 240 x 300, change the following lines in imgseq2sprite.bat. Recommended numbers are the half of your image size (each of width and height).

```
    echo 			"rotationCenterX": 120,
    echo 			"rotationCenterY": 150
```



## About sample images

Sample images in the img folder are extracted from the video

"Candle flame being blown out 1 | Free Stock Footage"

by DL Stock Footage. They provide several nice video clips. 

- https://www.youtube.com/watch?v=aWPOiYs20XU
- https://www.facebook.com/dlstockfootage/

