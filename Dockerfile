FROM runpod/worker-comfyui:5.8.5-base
RUN comfy-node-install comfyui_ipadapter_plus comfyui_controlnet_aux
COPY avatar_ref.png /comfyui/input/avatar_ref.png
