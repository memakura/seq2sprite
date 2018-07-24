# 画像ファイルからScratchスプライトを作るツール (Win/Mac/Linux)

[(English)](README-en.md)

ビデオの1コマ目、2コマ目、・・のように、<ruby>順序<rp>（</rp><rt>じゅんじょ</rt><rp>）</rp></ruby>のある<ruby>複数枚<rp>（</rp><rt>ふくすうまい</rt><rp>）</rp></ruby>の<ruby>画像<rp>（</rp><rt>がぞう</rt><rp>）</rp></ruby>（これを<ruby>画像列<rp>（</rp><rt>がぞうれつ</rt><rp>）</rp></ruby>や画像シーケンス (image <u>seq</u>uence) と<ruby>呼<rp>（</rp><rt>よ</rt><rp>）</rp></ruby>びます）から、<ruby>Scratch<rp>（</rp><rt>すくらっち</rt><rp>）</rp></ruby>のスプライト (<u>sprite</u>) を作るツールです。png か svg という画像ファイル<ruby>形式<rp>（</rp><rt>けいしき</rt><rp>）</rp></ruby>を使えます。

スクラッチの「ファイルから新しいコスチュームをアップロード」で複数枚の画像を読むと、<ruby>順序<rp>（</rp><rt>じゅんじょ</rt><rp>）</rp></ruby>がばらばらになって<ruby>大変<rp>（</rp><rt>たいへん</rt><rp>）</rp></ruby>です。
ここで<ruby>紹介<rp>（</rp><rt>しょうかい</rt><rp>）</rp></ruby>する <ruby>seq2sprite<rp>（</rp><rt>せっく・とぅー・すぷらいと</rt><rp>）</rp></ruby> というツールを使うと、元の画像ファイル名と同じ順に、多くのコスチュームを持つようなスプライトを作ることができます。スクラッチでアニメーションを使ったプロジェクトを作るときなどに役に立ちます。（[デモビデオ](#demovideo)）

![flow](readme_figs/flow-ja.png)


## かんたんな使い方の<ruby>説明<rp>（</rp><rt>せつめい</rt><rp>）</rp></ruby>

コスチュームにしたい複数枚の画像を `img` という名前のフォルダに入れておき、ここで紹介するスクリプトを実行すると、スクラッチでスプライトとして読み込めるファイルが<ruby>出来上<rp>（</rp><rt>できあ</rt><rp>）</rp></ruby>がります。これは画像と `sprite.json` というテキストファイルをまとめて zip という形式で<ruby>圧縮<rp>（</rp><rt>あっしゅく</rt><rp>）</rp></ruby>したものです。以下では使い方の詳しい<ruby>手順<rp>（</rp><rt>てじゅん</rt><rp>）</rp></ruby>を説明します。

## 使い方

1. まず[このプロジェクトのzipファイル](https://github.com/memakura/seq2sprite/archive/master.zip)をダウンロードします。
1. zipファイルの中の `img`というフォルダと、`seq2sprite.bat` もしくは `seq2sprite.sh` というスクリプト（どちらが<ruby>必要<rp>（</rp><rt>ひつよう</rt><rp>）</rp></ruby>かは後で説明）を<ruby>適当<rp>（</rp><rt>てきとう</rt><rp>）</rp></ruby>な場所にコピーしておきます。
    - Windowsの「ドキュメント」や Macの「<ruby>書類<rp>（</rp><rt>しょるい</rt><rp>）</rp></ruby>」に適当なフォルダを作って入れておくとよいです。**以下の説明では `seq2sprite` という名前のフォルダを作ったとします．**
    - `img` にはサンプル画像が入っています
1. フォルダやスクリプトを入れたフォルダ `seq2sprite` を開きます。
1. `img` フォルダの中に pngファイルを複数枚入れておきます（まずはサンプルをそのまま使ってみてください）。
    - <ruby>各<rp>（</rp><rt>かく</rt><rp>）</rp></ruby>ファイル名から<ruby>拡張子<rp>（</rp><rt>かくちょうし</rt><rp>）</rp></ruby>（.pngなど）を<ruby>除<rp>（</rp><rt>のぞ</rt><rp>）</rp></ruby>いた部分（c0005.png なら c0005）がそれぞれコスチューム名になります。
    - 画像サイズは全て同じ 240x300 を<ruby>想定<rp>（</rp><rt>そうてい</rt><rp>）</rp></ruby>しています。サイズを変える場合は[こちら](#imgsize)を見てください。
1. <ruby>環境<rp>（</rp><rt>かんきょう</rt><rp>）</rp></ruby>に合わせて `seq2sprite.bat` か `seq2sprite.sh` を実行します（<ruby>詳細<rp>（</rp><rt>しょうさい</rt><rp>）</rp></ruby>は<ruby>以下<rp>（</rp><rt>いか</rt><rp>）</rp></ruby>）。

### Windows (seq2sprite.bat を<ruby>利用<rp>（</rp><rt>りよう</rt><rp>）</rp></ruby>)

**ファイルエクスプローラの [<ruby>表示<rp>（</rp><rt>ひょうじ</rt><rp>）</rp></ruby>] で [ファイル名<ruby>拡張子<rp>（</rp><rt>かくちょうし</rt><rp>）</rp></ruby>を表示] にチェックを入れておくと<ruby>便利<rp>（</rp><rt>べんり</rt><rp>）</rp></ruby>です。**

1. `seq2sprite.bat` をダブルクリックして実行すると、`work` というフォルダが出来上がります。**黒い画面が開きますが、勝手に閉じるまで待ってください。**
1. 出来上がった `work` フォルダを<ruby>選択<rp>（</rp><rt>せんたく</rt><rp>）</rp></ruby>し、右クリックを<ruby>押<rp>（</rp><rt>お</rt><rp>）</rp></ruby>して、メニューから [送る(N)] の [圧縮 (zip 形式)フォルダー] を選択すると、`work.zip` （すでにある場合は `work (数字).zip`）が出来上がります。これをスクラッチで読むことができます。`work.sprite2` という名前に変えておいてもよいです。（変えなくても読み込めます。）

### Mac/Linux, Windowsのbash環境 (subsystem, mingw, cygwin) (seq2sprite.sh を利用)

**（注意）zip コマンドが必要です。<ruby>最初<rp>（</rp><rt>さいしょ</rt><rp>）</rp></ruby>から入っていることも多いです。**

1. bash の使えるコマンドプロンプトを開きます。(Macは Launchpad や Spotlight<ruby>検索<rp>（</rp><rt>けんさく</rt><rp>）</rp></ruby>で、ter.. ぐらいを打ち<ruby>込<rp>（</rp><rt>こ</rt><rp>）</rp></ruby>むとターミナルを<ruby>選<rp>（</rp><rt>えら</rt><rp>）</rp></ruby>べます。）
1. スクリプトや `img` フォルダのある場所に行きます。Macだと、[書類] の下に `seq2sprite` というフォルダを作成してコピーしたのであれば、以下を打ち込んでフォルダを移動します。
   ```
   cd /Users/ユーザ名/Documents/seq2sprite
   ```
    - <ruby>最後<rp>（</rp><rt>さいご</rt><rp>）</rp></ruby>に return を押します。<ruby>途中<rp>（</rp><rt>とちゅう</rt><rp>）</rp></ruby>でtabキーを押すとファイル名などが<ruby>補完<rp>（</rp><rt>ほかん</rt><rp>）</rp></ruby>できます。
    - コマンド `cd` を使うと、今いるフォルダを移動します。また、`pwd` は今いるフォルダを、`ls` は今いるフォルダの中身を見ることができます（`img/` や `seq2sprite.sh` が表示されるはずです。)
1. `./seq2sprite.sh` と打ち込んでreturnキーを押すと、`work.sprite2` というファイルが出来上がるので、このファイルをスクラッチから読み込むことができます。

### 作成したスプライトファイルをスクラッチから開く方法

1. スクラッチの「スプライト」「新しいスプライト」のところにあるアイコンで [ファイルから新しいスプライトをアップロード] （下図）をクリックし、出来上がったスプライトのファイル (`work.zip`, `work (数字).zip`, もしくは　`work.sprite2`)を開きます。

   ![screenshot](readme_figs/screen-ja.png)

1. これでスプライトに myCandle という名前のスプライトが新しく<ruby>追加<rp>（</rp><rt>ついか</rt><rp>）</rp></ruby>されます。スプライトの名前は青丸で i と書かれたところをクリックすると<ruby>変更<rp>（</rp><rt>へんこう</rt><rp>）</rp></ruby>できます。



<a name="demovideo">

### デモビデオ

<iframe width="522" height="315" src="https://www.youtube.com/embed/7QLjaB54ZRM?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>



<a name="imgsize">

## <ruby>異<rp>（</rp><rt>こと</rt><rp>）</rp></ruby>なる画像サイズやSVGファイルの利用

画像サイズは横240、高さ300を想定しているので、画像サイズが異なる場合は、スクリプト (`seq2sprite.bat` か `seq2sprite.sh`)をエディタ（メモ<ruby>張<rp>（</rp><rt>ちょう</rt><rp>）</rp></ruby>など）で開いて、

```
    "rotationCenterX": 120,
    "rotationCenterY": 150
```

の数字を画像サイズの半分にしておくと、ちょうどいい感じになります。

pngではなくsvgファイルを使う場合は `EXT=png` を `EXT=svg` に変えてください。


## サンプル画像について（クレジット）

このウェブページのキャンドル画像や `img` フォルダ内のサンプル画像は、DL Stock Footage が公開している
"Candle flame being blown out 1 | Free Stock Footage" という<ruby>映像<rp>（</rp><rt>えいぞう</rt><rp>）</rp></ruby>を使用させていただきました。他にもいくつか、いい感じの映像が公開されています。

- [https://www.youtube.com/watch?v=dlHyoPC0hcw](https://www.youtube.com/watch?v=dlHyoPC0hcw)
- [https://www.facebook.com/dlstockfootage/](https://www.facebook.com/dlstockfootage/)

## 他の<ruby>映像素材<rp>（</rp><rt>えいぞうそざい</rt><rp>）</rp></ruby>について

他の人が<ruby>撮影<rp>（</rp><rt>さつえい</rt><rp>）</rp></ruby>した映像や映像素材は<ruby>著作権<rp>（</rp><rt>ちょさくけん</rt><rp>）</rp></ruby>があり、自由に何にでも使えるわけではないですが、映像によっては、プロジェクトに使えるものがあります。クレジット（<ruby>誰<rp>（</rp><rt>だれ</rt><rp>）</rp></ruby>の映像か、どこから取ってきたか）を書く必要があるものも多いです。

[https://www.techradar.com/news/the-best-free-stock-video-sites](https://www.techradar.com/news/the-best-free-stock-video-sites) などでもいろいろな映像素材サイトが紹介されています。たとえば [Videvo (Free Stock Video Footage)](https://www.videvo.net/) では自由に使えるライセンスでの公開が多いようでした（[ライセンスの詳細はこちら](https://www.videvo.net/faqs/)）。