# Post Training notes 2012072257

 also see: cd /a/nad.previz/x/x__style_transfer_darkat__2010251156/dockers/jgwill-ai-tf1.12-cuda/gix-adaptive-style-transfer
(Require access right)

## Dependencies and datasets

* Data Large (a 105GB used for forms detection in the training datasets (painting))
* Docker
* GPU with NVidia drivers
* nvidia-docker linux packaging
* A Dataset of Paintings you want the model to learn from
* Adaptive Style Transfer code

# Executing the training

* The command bellow had run the Docker in BG and  started the training.
* [open run-gpu-train-bg](run-gpu-train-bg)

```sh
./run-gpu-train-bg gix_MODELNAME... # Mathing what is in /a/model/models (where path will be)
# Probably what I ran
./run-gpu-train-bg  gia_style_AcrylicPaint2012

```

# Paths

```sh
export dsroot=/a

# My Paintings digitalized (ACtually the main datasets)
$dsroot/lib/datasets/gia_style_AcrylicPaint2012

# to my currently as low as possible learning of AI, that is used to learn about structures that we might find into my painting for segmentation before the style is applied, who knows, we need it !!! :)
$dsroot/lib/data_large

# Where the model was trained (17G for 300,000 training iterations)
$dsroot/model/models/model_gia_style_AcrylicPaint2012_new

# Where I copied the checkpoints along the training
$dsroot/model/models/model_giacrypaint201205 

```


## cat [./run-gpu-train-bg](run-gpu-train-bg)

### Dependencies: 

* [_env.sh](_env.sh) 
* [_setmodel.sh](_setmodel.sh)


```sh
# Run docker using the NVIDIA-Docker 2 command (Bellow is what NVidia had ran)

# The original command was: 
#!/bin/bash

source _env.sh

source _setmodel.sh $1

echo "Mount Point::"
echo "$model_local_fullpath:$model_rel_path"

export model_name=$1

mkdir -p $model_local_fullpath
echo "bash $train_script $model_name"

$docker_exec run -it  -v $(pwd):$container_workdir \
        -v $lib_root:$lib_root \
        -v  $model_local_fullpath:/$model_rel_path \
        -e DISPLAY=$DISPLAY \
        $container_tag \
        bash $train_script $model_name


```


## ps -aef | grep docker


* Bellow is just to help understand what the nvidia-docker does as Wrapper of GPU capabilies


```sh

# This is what the docker_exec_run (which is nvidia-docker has made to run the container with GPU support)

docker run --runtime=nvidia -it -v /a/nad.previz/x/x__style_transfer_darkat__2010251156/dockers/jgwill-ai-tf1.12-cuda/gix-adaptive-style-transfer:/work -v /a/lib:/a/lib -v /a/model/models/model_gia_style_AcrylicPaint2012_new:/model/models/model_gia_style_AcrylicPaint2012_new -e DISPLAY=10.10.23.194:0.0 jgwill/gix-adaptive-style-transfer bash ./trainer.sh gia_style_AcrylicPaint2012


```

# ENV

* [_env.sh](_env.sh)

```sh
#!/bin/bash

export mount_root=/a

# That is where our datasets and other training data are located
export lib_root=$mount_root/lib
export model_root=$mount_root/model


export container_workdir=/work
export container_tag=jgwill/gix-adaptive-style-transfer
export docker_exec=nvidia-docker


export model_local_dir=$mount_root

```

----

# When training....

## Connect to the BG docker created

* Bellow is the command used to connect to the docker image (require the container name to be adjusted)
* [open exec.sh](exec.sh)


```sh
#!/bin/bash

echo "Connecting to docker..."
export container_id=2656b7e868d3

docker exec -it $container_id bash
```



# Bibliography

## Adaptive Style Transfer


* A Style-Aware Content Loss for Real-time HD Style Transfer. (n.d.). Retrieved December 7, 2020, from https://compvis.github.io/adaptive-style-transfer/


### Subref

[1] Leon Gatys, Alexander Ecker, Matthias Bethge "Image style transfer using convolutional neural networks", in CVPR 2016.

[2] Jun-Yan Zhu, Taesung Park, Phillip Isola, Alexei A. Efros "Unpaired Image-to-Image Translation using Cycle-Consistent Adversarial Networks", in ICCV 2017.

[3] Tian Qi Chen, Mark Schmidt "Fast patch-based style transfer of arbitrary style", arXiv:1612.04337

[4] Xun Huang, Serge Belongie "Arbitrary Style Transfer in Real-time with Adaptive Instance Normalization", in ICCV 2017.

[5] Li, Y., Fang, C., Yang, J., Wang, Z., Lu, X., Yang, M.H. "Universal style transfer via feature transforms", in NIPS 2017.

[6] Justin Johnson, Alexandre Alahi, Li Fei-Fei "Perceptual losses for real-time style transfer and super-resolution", in ECCV 2016.

## Zotero Libraries Item

* Sanakoyeu, A., Kotovenko, D., Lang, S., & Ommer, B. (2018). A Style-Aware Content Loss for Real-time HD Style Transfer. ArXiv:1807.10201 [Cs]. http://arxiv.org/abs/1807.10201
[Research and Code (require access) ](http://zotero.org/users/180474/items/AR8HXJRW)


