export CUDA_VISIBLE_DEVICES="5,7"
cd ./retrieve/src
# harvard dataset
torchrun --nproc_per_node=2 \
    --master_port=12347 \
    -m training.main \
    --model hf-hub:thaottn/OpenCLIP-resnet50-CC12M \
    --train-data '/data02/users/ysc/RULE-main/data/training/retriever/iuxray_train.json' \
    --dataset-type radiology \
    --img_root /data02/users/ysc/MMed-RAG/IU/iu_xray/images \
    --batch-size 512 \
    --precision amp \
    --workers 4 \
    --lr 0.0001 \
    --epochs 360 \
    --val-data "/data02/users/ysc/RULE-main/data/training/retriever/iuxray_val.json" \
    --val-frequency 10 \
    --report-to tensorboard \
    --logs ./clip_ysc


