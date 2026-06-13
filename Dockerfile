FROM runpod/worker-comfyui:5.8.5-base

RUN comfy-node-install comfyui_ipadapter_plus comfyui_controlnet_aux
RUN comfy-node-install comfyui-impact-pack comfyui-impact-subpack

COPY avatar_ref.png /comfyui/input/avatar_ref.png

RUN comfy model download --url https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors --relative-path models/ipadapter --filename ip-adapter-plus_sdxl_vit-h.safetensors
RUN comfy model download --url https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors --relative-path models/clip_vision --filename CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
RUN comfy model download --url https://huggingface.co/SG161222/RealVisXL_V5.0/resolve/main/RealVisXL_V5.0_fp16.safetensors --relative-path models/checkpoints --filename RealVisXL_V5.0.safetensors
RUN comfy model download --url https://huggingface.co/Bingsu/adetailer/resolve/main/person_yolov8m-seg.pt --relative-path models/ultralytics/segm --filename person_yolov8m-seg.pt
RUN mkdir -p /comfyui/models/sams && wget -O /comfyui/models/sams/sam_vit_h_4b8939.pth https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth
