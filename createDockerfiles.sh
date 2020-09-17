#!/bin/bash

REPO=mozilla/DeepSpeech
GIT=https://github.com/${REPO}
RAWGIT=https://raw.githubusercontent.com/${REPO}

# Some compute capabilities are excluded
# https://en.wikipedia.org/wiki/CUDA
# TF_CUDA_COMPUTE_CAPABILITIES 3.5,5.0,5.2,6.1,7.0,7.5

rm -f Dockerfile.build.*

for RELEASE in 0.7.4 0.8.2 0.9.0-alpha.8 ; do

    if [[ ${RELEASE} == "0.7.4" ]] ; then
        NCCL_VERSION="2.6"
    else
        NCCL_VERSION="2.7"
    fi

    curl -s ${RAWGIT}/v${RELEASE}/Dockerfile.build.tmpl | \
    sed \
        -e "s|#DEEPSPEECH_REPO#|${GIT}.git|g" \
        -e "s|#DEEPSPEECH_SHA#|v${RELEASE}|g" \
        -e "s|ENV TF_CUDA_COMPUTE_CAPABILITIES 6.0|ENV TF_CUDA_COMPUTE_CAPABILITIES 3.5,5.0,5.2,6.1,7.0,7.5|g" \
        -e "s|ENV TF_NCCL_VERSION 2.4|ENV TF_NCCL_VERSION ${NCCL_VERSION}|g" \
        > Dockerfile.build.${RELEASE}

done


