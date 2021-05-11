# Run docker
docker run -it -v /a/src/gix-adaptive-style-transfer/bin-gpu:/work -v /a/lib:/a/lib -v /a/model/models/model_gia-ds-DavidBouchardGagnon-v01a-210510_new:/model/models/model_gia-ds-DavidBouchardGagnon-v01a-210510_new -e DISPLAY=fe80::486d:a515:8046:6011%enp3s0:0.0 guillaumeai/server:ast-trainer-210511 bash
# Train
python main.py --model_name=model_gia-ds-DavidBouchardGagnon-v01a-210510_new --batch_size=1 --phase=train --image_size=768 --lr=0.0002 --dsr=0.8 --ptcd=/a/lib/common/data_large --ptad=./data/gia-ds-DavidBouchardGagnon-v01a-210510
