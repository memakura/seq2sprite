# Scratch sprite generator for Windows/Mac/Linux

[Japanese](README-ja.md)

Convert a sequence of images (png, svg) to a sprite file that can be imported to your Scratch project.

`New costuime > Upload costume from file` allows you to upload multiple costumes at once but does not maintain the original order of image files. Using the sprite generator tool introduced here, you can create a sprite that has a lot of costumes in the same order as the origial image-name order. This can be utilized for projects using animations.

![flow](readme_figs/flow-en.png)


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

![Screenshot](readme_figs/screen-en.png)


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

