# mount the home to load the droxul config
containertag=guillaumeai/ast:gpu-cpu-limitation-210516
cuserhome=/root
docker run -it --rm -v $(pwd):/work -v $HOME/.dropbox_uploader:$cuserhome/.dropbox_uploader -v $HOME:/config $containertag
