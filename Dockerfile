FROM nvidia/cuda:12.6.2-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    TZ=Etc/UTC

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libnuma1 python3.10-dev python3.10 python3.10-venv python3-pip \
    git wget curl vim build-essential \
    libglib2.0-0 libsm6 libxext6 libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

RUN python -m pip install --upgrade pip && pip install uv

RUN uv venv /opt/venv

ENV VIRTUAL_ENV=/opt/venv

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN uv pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu126

RUN uv pip install --no-cache-dir \
    protobuf \
    sentencepiece \
    accelerate \
    huggingface_hub \
    transformers \
    bitsandbytes

RUN uv pip install "sglang[all]>=0.4.9.post2"
RUN uv pip install vllm==0.9.0.1

RUN mkdir -p /root/.cache/huggingface

WORKDIR /app


EXPOSE 30000



COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

CMD ["/entry.sh"]