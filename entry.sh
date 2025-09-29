#!/bin/bash
python -m sglang.launch_server \
    --model-path "$MODEL_PATH" \
    --host 127.0.0.1 \
    --port 30000 \
    --mem-fraction-static "$MEM_FRACTION" \
    --enable-metrics