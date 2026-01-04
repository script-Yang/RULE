cd ./retrieve/src
CUDA_VISIBLE_DEVICES=3 python ./ysc_iu_retrieve_clip_VQA.py \
    --img_root /data02/users/ysc/MMed-RAG/IU/iu_xray/images \
    --train_json /data02/users/ysc/RULE-main/data/training/retriever/iuxray_train.json \
    --eval_json /data02/users/ysc/RULE-main/data/test/iuxray_test.jsonl \
    --model_name_or_path hf-hub:thaottn/OpenCLIP-resnet50-CC12M \
    --checkpoint_path /data02/users/ysc/RULE-main/retrieve/src/clip_ysc/2026_01_03-21_59_08-model_hf-hub:thaottn-OpenCLIP-resnet50-CC12M-lr_0.0001-b_512-j_4-p_amp/checkpoints/epoch_360.pt \
    --output_path ./re_json_ysc_test \
    --fixed_k 5 \



