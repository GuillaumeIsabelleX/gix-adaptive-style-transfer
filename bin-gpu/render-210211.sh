
# Render foreach checked points the colorized scan with dimension variation and despeckcled

dim=2800
dtag=2_8k
ftag=v03

modeltag=model_gia-young-picasso-v03-201216_new
contentpath=/a/lib/samples/proto__colorizer__2102112222-dns-etc

#copying the file for this batch as we did already do with previous model
cp /a/lib/samples/proto__colorizer__2102112222/spider__21020921__02_colorized.jpg /a/lib/samples/proto__colorizer__2102112222-dns-etc

#/work/fori.sh 2800 v03 model_gia-young-picasso-v03-201216_new /a/lib/samples/proto__colorizer__2102112222-dns-etc 
echo /work/fori.sh $dim $dtag $ftag $modeltag $contentpath
sleep 5 
/work/fori.sh $dim $dtag $ftag $modeltag $contentpath

ftag=v04
modeltag=model_gia-young-picasso-v04-2012211928_new
#contentpath=

# cleaning a temp file (we already done this file)
rm /a/lib/samples/proto__colorizer__2102112222-dns-etc/spider__21020921__02_colorized.jpg

/work/fori.sh $dim $dtag $ftag $modeltag $contentpath

#rm /a/lib/samples/proto__colorizer__2102112222-dns-etc/spider__21020921__02_colorized.jpg;/work/fori.sh 2800 v04 model_gia-young-picasso-v04-2012211928_new /a/lib/samples/proto__colorizer__2102112222-dns-etc



