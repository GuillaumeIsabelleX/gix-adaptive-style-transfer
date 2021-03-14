
# Render foreach checked points the colorized scan with dimension variation and despeckcled

contentpath=/a/lib/samples/ap__210217

dim=2200
dtag=2_2k


ftag=v03
modeltag=model_gia-young-picasso-v03-201216_new




#just checking
echo /work/fori.sh $dim $dtag $ftag $modeltag $contentpath
sleep 2 


/work/fori.sh $dim $dtag $ftag $modeltag $contentpath

ftag=v04
modeltag=model_gia-young-picasso-v04-2012211928_new




/work/fori.sh $dim $dtag $ftag $modeltag $contentpath





