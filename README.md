# imgseq2sprite

png の画像複数枚から Scratch（スクラッチ）のスプライトとして読み込めるようなファイルを作ります。

Convert a sequence of png images to a sprite file that can be imported to your Scratch project.

## 使い方 / HOW TO USE

**ファイルエクスプローラの[表示]で[ファイル名拡張子を表示]にチェックを入れておくと便利です。**

1. img フォルダの中にpngファイルを複数枚入れておきます。ファイル名の.pngを取ったものがそのままコスチューム名になります。
1. imgseq2sprite.bat をダブルクリックして実行すると、work というフォルダが出来上がります。
1. 出来上がったworkフォルダを選択し、右クリックを押して、メニューから[送る(N)]の[圧縮 (zip 形式)フォルダー]を選択すると、work.zip （すでにある場合は work (数字).zip）が出来上がります。
1. Scratchで[新しいスプライト]のところにある[ファイルから新しいスプライトをアップロード]をクリックし、出来上がった work.zipファイル（もしくは work (数字).zip）を開きます。

これでスプライトに myCandle という名前のスプライトが新しく追加できます。

1. Replace the sample image sequence in "img" folder with your image sequence. If you want to keep a used "img" folder, change the name to backup it and create a new empty "img" folder.
1. Double click imgseq2sprite.bat, and a folder named "work" will be created.
1. Select "work" folder and open a menu by right click. Select "Compressed (zipped) Folder" option from the "Send To" options.
1. Import the created zip file from Scratch.

## 画像サイズ

画像サイズは横240、高さ300を想定しているので、画像サイズが異なる場合は

```
    echo 			"rotationCenterX": 120,
    echo 			"rotationCenterY": 150
```

の数字を画像サイズの半分にしておくと、ちょうどいい感じになります。

If the image size is different from 240x300, change the above numbers in imgseq2sprite.bat.

## Sample images

Sample images in the img folder are extracted from the video

"Candle flame being blown out 1 | Free Stock Footage"

by DL Stock Footage.

- https://www.youtube.com/watch?v=aWPOiYs20XU
- https://www.facebook.com/dlstockfootage/

