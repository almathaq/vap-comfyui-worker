FROM runpod/worker-comfyui:5.8.5-base
RUN comfy-node-install comfyui_ipadapter_plus comfyui_controlnet_aux
COPY avatar_ref.png /comfyui/input/avatar_ref.png
RUN comfy model download --url https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors --relative-path models/ipadapter --filename ip-adapter-plus_sdxl_vit-h.safetensors
RUN comfy model download --url https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors --relative-path models/clip_vision --filename CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
