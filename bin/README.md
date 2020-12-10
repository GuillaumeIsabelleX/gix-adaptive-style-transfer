# CPU Lib of the Adaptive Style Transfer

* This library is migrating to : [github.com/GuillaumeIsabelleX/gix-adaptive-style-transfer](https://github.com/GuillaumeIsabelleX/gix-adaptive-style-transfer)


# NOTES

* This is messy and I can not clean up now 
* So bellow is what is necessary



# Infering

## --@STCGoal Start the running container context
```sh
# Start the Docker container
## Load env
source _env.sh
## CPU
$docker_exec run -it --rm -v $lib_root:$docker_lib_root -v $model_root:/model/models $container_tag

```
## --@STCGoal Inference in container context

```sh

./inference.sh picassojgwill_201208 "/150000"
./inference.sh gia-young-young-201209 "/135000-sketch_sur_toile-gia-young-young-2012092015__2k"

```