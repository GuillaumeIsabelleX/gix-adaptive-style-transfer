# notes

* I decided to publish to above in [Astia2105](https://github.com/GuillaumeAI/astia2105) which will become somewhere I work and use this as a submodule.

----

# Intentions

* A well organized distribution of used libraries with my enhancements that others can use (and so is myself)
* Write the stories bellow of each code writing activities that I had and their results and further intentions.

# Realities

* That folder is where I've done painfully most of my first AST learning, so it is messy.
* Only place where I am training the models
* Able to render(inference) using  

```sh
bash doit.sh <_RENDER_CONF.sh> <checkpoint1 checkpoint2>
```
* A New repo (that is getting better organized) where I build a Web API servicing for my stylistic model using containerized infrastructure. A bunch of scripts at different level of abstraction had enable me to understand better what the service and data model of stylization is.  So I feel ready refactoring a new unified repo.  Sounds great hein!  I also have so much writing for my thesis to do that I might keep working in this mess and clean it up from time to time... anyway, it's here:  [repo](https://github.com/GuillaumeAI/rwml__adaptive_style_transfer#intentions)
```sh
#Public
git clone https://github.com/GuillaumeAI/rwml__adaptive_style_transfer.git
#Access
git clone git@github.com:GuillaumeAI/rwml__adaptive_style_transfer.git

```
* A Web UI Experimentation of Etch a Sketch in which I have made few sub-projects that would not usually go there : 
```sh
git clone git@github.com:GuillaumeAI/x__etch-a-sketch__210224.git
```
* [gia-ast-util](https://github.com/GuillaumeAI/x__etch-a-sketch__210224/tree/master/gia-ast-util/gia-ast-util) is a set of tools to work with the Web api servicing requests and response from the /svr (rwroot) using nodejs. and [gia-lib-encoding-base64](https://github.com/GuillaumeAI/x__etch-a-sketch__210224/tree/master/gia-ast-util/gia-lib-encoding-base64) which is a library to deal with encoding in that context. (at least it made me understood it and made available to me )
```sh
npm i gia-ast-util --g
npm i gia-lib-encoding-base64 --save #if needed elsewhere
```
* And finally : [gia-ast](https://github.com/GuillaumeAI/x__etch-a-sketch__210224/tree/master/gia-ast), also a nodejs cli, that I am prototyping to interface thru CLI with CASMI-AST service.  Mostly to get inferences from various model being deployed.  I am starting to think about adding on some ways to compose multi stylistic model (which I invented) thru that interface but I don't know all the implementation details yet. for now It is :
```sh
#install
npm i gia-ast --g
#example use:
gia-ast myimage.jpg 91
gia-ast <image> <modelid>
# modelid correspond to a port range where it is deployer.  I assign one model by number and they match a 9000 + $modelid callable with something like http://localhost:9091/stylize
```
* I am in the verge of a [new gia-ast](https://github.com/GuillaumeAI/x__etch-a-sketch__210224/blob/master/gia-ast/x__yargs_cmd_210512_ast3s.js) prototype with a bit more argumentation capabilities to the cli. Nonetheless auto completion for available server port using the CASMI's API. I am also mastering [Yargs](https://yargs.js.org/) which helps implementing **commands** in the CLI. (like docker run, docker build, etc).  That is really helpful with a lot still to learn but worth the try.
* **About CASMI** : Well I was having thought on naming the server so here they are :  ...the Web API Model service (I really should find a name for it?? Cloud Applicative Model service interface (CAMSI)(CASMI: Cloud Applicative Servicing Model Interface, I like it.  It is now, set, the server infrastructure abstraction will be called CASMI, well it is in context of Adaptive Style Transfer.. so ASTCASMI or CASMIAST for Cloud Applicative Servicing Model Interface for Adaptive Style Transfer... Wow, that sound academic or poetic too much.  Anyway, I need a name so I will keep it.)
* 




----
----
----
Very old stuff and original readme
---



# Post Training notes 2012072257

* this is the GPU folder I used in a messy first try to train models.

## Dependencies and datasets

### Training Phase

* Data Large (a 105GB used for forms detection in the training datasets (painting))
* Docker
* GPU with NVidia drivers
* nvidia-docker linux packaging
* A Dataset of Paintings you want the model to learn from
* Adaptive Style Transfer code

### Inference Phase

```sh

source _status_inferer.sh model_gia-young-picasso-201210_new /it-300k-2012160311
# above give output of what might happen

./run-gpu-inference model_gia-young-picasso-201210_new /it-300k-2012160311
# Above run inference in context of GPU
# Produces an output you have to copy paste to run the inference on the container
nvidia-docker run -it  -v /a/nad.previz/x/x__style_transfer_darkat__2010251156/dockers/jgwill-ai-tf1.12-cuda/gix-adaptive-style-transfer:/work         -v /a/lib:/a/lib         -v /a/model/models:/model/models \
        -e DISPLAY=10.10.22.68:0.0         jgwill/gix-adaptive-style-transfer:gpu       bash ./inferer.sh model_gia-young-picasso-201210_new-135000 /it-135k-2012160325

```

* TODO


# Executing the training

* The command bellow had run the Docker in BG and  started the training.

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


## cat ./run-gpu-train-bg

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


