# export CUDA_VISIBLE_DEVICES=2
dataset='iuxray' # 'harvard' 'mimic'

python llava/eval/model_vqa_${dataset}.py \
    --model-base '/data02/users/ysc/MMed-RAG/llava_mistral_pth' \
    --model-path '/data02/users/ysc/RULE-main/ysc-dpo' \
    --question-file '/data02/users/ysc/RULE-main/retrieve/re_json_ysc_test.jsonl' \
    --image-folder '/data02/users/ysc/MMed-RAG/IU/iu_xray/images' \
    --answers-file './output_iuxray_test.jsonl'