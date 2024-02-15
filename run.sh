# ISPRS
DATA_ROOT=dataset/ISPRS_2D/postdam/Incremental_RGB_600
DATASET=ISPRS
TASK=2-2-1 #[4-1, 2-3, 2-2-1, 2-1, offline]
EPOCH=30
BATCH=12
LOSS=bce_loss
KD_LOSS=KD_loss
LR=0.01
THRESH=0.7
MEMORY=0
CKPT=checkpoints/

python main.py --data_root ${DATA_ROOT} --model deeplabv3_resnet101 --gpu_id 0,1 --lr ${LR} \
    --batch_size ${BATCH} --train_epoch ${EPOCH}  --loss_type ${LOSS} --KD_loss_type ${KD_LOSS} --use_KD_layer_weight\
    --dataset ${DATASET} --task ${TASK} --overlap --lr_policy poly \
    --pseudo --pseudo_thresh ${THRESH} --freeze  --bn_freeze  \
    --unknown --w_transfer --amp --mem_size ${MEMORY} 

