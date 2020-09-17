# Mozilla's deepspeech-build container for many different Compute Capabilities

Supported compute capabilities (see https://en.wikipedia.org/wiki/CUDA):

   * 3.5
   * 5.0
   * 5.2
   * 6.1
   * 7.0
   * 7.5

Not all compute capabilities have been included. In orther to to configure an especific build, just change the `TF_CUDA_COMPUTE_CAPABILITIES` environment variable inside the Dockerfile.