```sh

# Each iterations make an inference
# of many res
export iterations="135 150 165 180 195 210 225 240 255 270 285"
export image_sizes="1280 2048"
export model_namespace="model_giapicallo_v03__201216"

for image_size in $image_sizes ; do 
    
    for i in $iterations ; 
        do 
        echo '(''./inference.sh MYMODEL_v2 /it-'$i'k-20 --ckpt_nmbr='$i'000 --multi_res=1280,2048'')' 

        export ckpt_nmbr=$i'000'
        export file_suffix=
        python main.py \
            --model_name=$model_namespace \
            --phase=inference \
            --image_size=$image_size \
            --ii_dir $content_src \
            --save_dir=$savedir/ \
    	    --ckpt_nmbr=$ckpt_nmbr \
            --file_suffix=
    
     done

 done

```
###  add to python main switch 

* --multi_res=RES1,RES2

