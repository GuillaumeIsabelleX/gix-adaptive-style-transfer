content_path=/a/lib/samples/content0014-0019min

# will require to be mounted in the docker by the caller
#content_path=/model/input

image_size=1024
model_name=model_gia-young-picasso-v03-201216_new
fn_size_tag=1k
version_tag=v03



# Running the work
/work/fori.sh $image_size $version_tag $fn_size_tag $model_name $content_path
