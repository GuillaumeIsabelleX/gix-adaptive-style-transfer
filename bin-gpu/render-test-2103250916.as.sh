
sdt=$(date)
CUDA_VISIBLE_DEVICES=0 python main.py --model_name=model_gia-ds-wassily_kandinsky_v1_210310_new-210ik --phase=inference --image_size=1000 --ii_dir /a/lib/samples/content0014-0019min/ --save_dir=/a/lib/results/test-2103250916
edt=$(date)

echo "-------------------------------"
echo "Start DT: $sdt"
echo "End   DT: $edt"
