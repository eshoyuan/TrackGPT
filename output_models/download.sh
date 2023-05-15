#!/bin/bash

function main() {
    public_server="http://lmflow.org:5000"
    public_server_detgpt="http://lmflow.org:5000/detgpt/"
    if [ $# -lt 1 -o "$1" = "-h" -o "$1" = "--help" ]; then
        echo "Usage: bash $(basename $0) model_name"
        echo "Example: bash $(basename $0) vicuna-13b"
        echo "Example: bash $(basename $0) all"
    fi

    if [ "$1" = "robin-7b" -o "$1" = "all" ]; then
        echo "downloading robin-7b"
        filename='robin-7b.tar.gz'
        wget ${public_server}/${filename}
        tar zxvf ${filename}
        rm ${filename}
    fi

    if [ "$1" = "robin-13b" -o "$1" = "all" ]; then
        echo "downloading robin-13b"
        filename='robin-13b.tar.gz'
        wget ${public_server}/${filename}
        tar zxvf ${filename}
        rm ${filename}
    fi


    if [ "$1" = "minigpt4_7b" -o "$1" = "all" ]; then
        echo "downloading minigpt4_7b"
        filename='pretrained_minigpt4_7b.pth'
        wget ${public_server}/${filename}
    fi

    if [ "$1" = "minigpt4_13b" -o "$1" = "all" ]; then
        echo "downloading minigpt4_13b"
        filename='pretrained_minigpt4_13b.pth'
        wget ${public_server}/${filename}
    fi

    if [ "$1" = "coco_task_annotation" -o "$1" = "all" ]; then
        echo "downloading coco_task_annotation"
        filename='coco_task_annotation.json'
        wget ${public_server_detgpt}/${filename}
    fi

    if [ "$1" = "task_tuned" -o "$1" = "all" ]; then
        echo "downloading task_tuned.pth"
        filename='task_tuned.pth'
        wget ${public_server_detgpt}/${filename}
    fi

    if [ "$1" = "sam" -o "$1" = "all" ]; then
        echo "downloading sam"
        filename='sam_vit_h_4b8939.pth'
        wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth
    fi

    if ["$1" = "xmem" -o "$1" = "all" ]; then
        echo "downloading xmem"
        filename='XMem-s012.pth'
        wget https://github.com/hkchengrex/XMem/releases/download/v1.0/XMem-s012.pth
}

main "$@"