ROOT=/opt
FFMPEG=docker run -it --rm -v $(shell pwd):${ROOT} --workdir=${ROOT} jrottenberg/ffmpeg -y
FFPROBE=docker run -it --rm -v $(shell pwd):${ROOT} --workdir=${ROOT} --entrypoint=ffprobe jrottenberg/ffmpeg

shell: # runs bash within ffmpeg conatiner
	docker run -it --rm -v $(shell pwd):${ROOT} --workdir=${ROOT} --entrypoint=/bin/bash jrottenberg/ffmpeg
run: # combine all source files together
	${FFMPEG} \
		-i ${ROOT}/in/solchan_animated_bg_1200x1500.mp4 \
		-i ${ROOT}/in/03-tyan.png \
		-i ${ROOT}/in/Solchan_animated_fg_softness_100_unmatted.mov \
		-filter_complex " \
			[0][1]overlay=0:0[a]; \
			[0][1]overlay=0:0[e]; \
			[a][2]blend=all_mode=glow:all_opacity=1[b]; \
			[2]alphaextract[c]; \
			[b][c]alphamerge[d]; \
			[e][d]overlay \
			" \
		-vcodec libx264 ${ROOT}/out/result.mp4
pixel_format: # shows pixel_format name of video
	${FFPROBE} -v 0 -select_streams v:0 -show_entries stream=pix_fmt -of compact=p=0:nk=1 ${file}
filter: # shows pixel formats that supports alpha channel where 'format' is printout from 'pixel_format' command
	${FFPROBE} -v 0 -show_entries pixel_format=name:flags=alpha -of compact=p=0 | grep "${format}" | grep -oP "(?<=alpha=)\d"
info: # show ffprobe file info
	${FFPROBE} ${file}
