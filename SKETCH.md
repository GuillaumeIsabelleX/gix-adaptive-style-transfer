```sh

# Each iterations make an inference
# of many res
for i in 135 150 165 180 195 210 225 240 255 270 285 ; do echo '(''./inference.sh MYMODEL_v2 /it-'$i'k-20 --ckpt_nmbr='$i'000 --multi_res=1280,2048'')' ; done


python main.py \
        --model_name=$modelname \
        --phase=inference \
        --image_size=$image_size \
        --ii_dir $content_src \
        --save_dir=$savedir/ \
	    --ckpt_nmbr=$ckpt_nmbr \
        --multi_res=1280,2048



```
###  add to python main switch 

* --multi_res=RES1,RES2

