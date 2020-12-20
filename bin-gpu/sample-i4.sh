./i4.sh model_gia-young-picasso-v03-201216_new /subdir __suffix 1024 /a/lib/samples/content /a/lib/results/someoutput 285000
nvidia-docker run -it --rm --memory=3190093888 --memory-swap=-1 -v /a/gix-adaptive-style-transfer/bin-gpu:/work -v /a/lib:/a/lib -v /a/model/models:/model/models -e DISPLAY=10.10.22.143:0.0 jgwill/gix-adaptive-style-transfer:gpu
