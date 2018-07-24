# Scratch sprite generator for Windows/Mac/Linux

[(Japanese)](README.md)

Convert a sequence of images (png, svg) to a sprite file that can be imported to your Scratch project.

In Scratch, [Upload costume from file] allows you to upload multiple costumes at once but does not maintain the original order of image files. Using the sprite generator tool introduced here, you can create a sprite that has a lot of costumes in the same order as the original image-name order. This can be utilized for projects using, for example, realistic animations. ([Demo video](#demovideo))

![flow](readme_figs/flow-en.png)


## Usage

1. Download [zip archive of this project](https://github.com/memakura/seq2sprite/archive/master.zip), open the zip file, and copy/move `img` folder and either `seq2sprite.bat` or `seq2sprite.sh` (explained later) to other folder, for example, a new folder under your `Documents` folder.
    - In what follows, we assume that **a folder named `seq2sprite` is created under `Documents` folder** and that `img` and a script file is copied there.
    - `img` folder contains sample images.
1. Open `seq2sprite` folder.
1. Replace the sample image sequence in `img` folder with your image sequence. (You can first try with the original sample files.)
    - If you want to keep a used `img` folder, change the name to backup it and create a new empty `img` folder.
    - The base name of each file (for example, c0005 of c0005.png) is used as a costume name.
    - All the image sizes are assumed to be the same 240x300. If you want to change the size, please see <a href="#imgsize">here</a>.
1. Run either `seq2sprite.bat` or `seq2sprite.sh` depending your environment; see below for details.
    
### Windows (Use seq2sprite.bat)

1. Double click `seq2sprite.bat`, and a folder named `work` will be created. Wait until the opened (black) window is automatically closed.
1. Select `work` folder, open a menu by right click, and select "Compressed (zipped) Folder" option from the "Send To" options.
1. The created zip file can be imported from Scratch. You can also change the name `work.zip` to `work.sprite2` (optional).

### Mac, Linux, Windows bash (mingw, cygwin, subsystem) (Use seq2sprite.sh)

**(Note) zip command is required.**

1. Open bash (terminal). If you use Mac, type "terminal" from Launchpad or Spotlight search.
1. Change the current folder by typing the following command. 
   ```
   cd /Users/<user name>/Documents/seq2sprite
   ```
   - Press `return` after you typed.
   - Command `cd` means change directory (folder). You can also use `pwd` and `ls` to check the path to the current folder and files/folders under the current folder, respectively. `ls` should show `img/` and `seq2sprite.sh`.
1. Run the script by `./seq2sprite.sh`, and a file called `work.sprite2` is generated.

### Open a created sprite file from Scratch

1. Select "Upload sprite from file" icon in the "New Sprite" section (see the figure below). Load a created file (`work.zip`, `work (...).zip`, or `work.sprite2`).

   ![screenshot](readme_figs/screen-en.png)

1. A sprite named "myCandle" will appear in the "Sprites" subwindow. You can change the sprite name by clicking the top-left blue "i" icon.


<a name="demovideo">

### Demo Video

<iframe width="522" height="315" src="https://www.youtube.com/embed/7QLjaB54ZRM?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


<a name="imgsize">

## Use different image size or SVG files

If each image size is different from 240 x 300, open a script file (`seq2sprite.bat` or `seq2sprite.sh`), and change the following lines. Recommended numbers are the half of your image size (each of width and height).

```
    "rotationCenterX": 120,
    "rotationCenterY": 150
```

If you want to use svg files, change `EXT=png` to `EXT=svg`.


## About the sample images (credit)

Candle images used on this web page and the sample images in `img` folder are from the video
"Candle flame being blown out 1 | Free Stock Footage"
by DL Stock Footage. They also provide several other nice video clips. 

- [https://www.youtube.com/watch?v=dlHyoPC0hcw](https://www.youtube.com/watch?v=dlHyoPC0hcw)
- [https://www.facebook.com/dlstockfootage/](https://www.facebook.com/dlstockfootage/)

## About other video clips

[https://www.techradar.com/news/the-best-free-stock-video-sites](https://www.techradar.com/news/the-best-free-stock-video-sites) introduces many free stock video sites. For example, [Videvo (Free Stock Video Footage)](https://www.videvo.net/) has many useful videos with a free license ([see here for the details of license information](https://www.videvo.net/faqs/)).
