# FFMPEG Experiment

## Goal
Goal is to combine 1 png image (`03-tyan.png`) and 2 video files (`solchan_animated_bg_1200x1500.mp4`, `Solchan_animated_fg_softness_100_unmatted.mov`) into one video file. `03-tyan.png` and source video file (`Solchan_animated_fg_softness_100_unmatted.mov`) are with alpha channel. Final video should contains 3 media source combined layer by layer. Aplpha channels from source media files should be kept.

## Requirements
* Source video files for foreground must be type of `QuicktimeRLE` encoded with `qtrle`-codec.
* Git (https://git-scm.com/)
* Make tool (https://www.gnu.org/software/make/)
* Docker (https://www.docker.com/)

## Usage
1. Clone this repository: `git clone git@github.com:postfriday/lab-ffmpeg-overlay-with-alpha-channel.git`
1. Change directory `cd lab-ffmpeg-overlay-with-alpha-channel`
1. Execute: `make run`

Makefile contains commands:
* `run` — runs source media files processing
* `shell` — helper which allows to fall into `jrottenberg/ffmpeg` bash shell.
* `pixel_format file=<path_to_file>` – helper which shows pixel_format name for selected `file`
* `filter format=<format+name>` – helper that shows pixel formats that supports alpha channel where `format` is printout from `pixel_format` command
* `info file=<path_to_file>` – shows ffprobe file info for selected `file`

## Links
* [How to create a video from images with FFmpeg? (Stackoverflow.com)](https://stackoverflow.com/questions/24961127/how-to-create-a-video-from-images-with-ffmpeg)
* [ffmpeg Documentation](https://ffmpeg.org/ffmpeg.html)
* [Alpha Masking with FFMPEG](https://curiosalon.github.io/blog/ffmpeg-alpha-masking/)
* [Merge two videos with transparency in ffmpeg (Stackoverflow.com)](https://superuser.com/questions/1025794/merge-two-videos-with-transparency-in-ffmpeg)