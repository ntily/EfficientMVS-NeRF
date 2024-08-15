# EfficientMVS-NeRF: Efficient Unsupervised Multi-View Stereo with Neural Rendering

This repository introduces an approach to improve the efficiency of unsupervised Multi-View Stereo (MVS) networks. We achieve this by utilizing a single, unified cost volume for both depth prediction and neural rendering, eliminating the need for a separate cost volume regularization step for neural rendering.

**Key Features:**

* **Unified Cost Volume:** Shared for both depth prediction and neural rendering, significantly reducing memory and time consumption.
* **Efficiency:** Achieves a reduction of over 50% in both time and memory compared to RC-MVSNet, while maintaining competitive accuracy.
* **Unsupervised Learning:** Learns 3D scene structure from unlabeled multi-view images.

## Methodology

Our method combines the strengths of multi-view stereo and neural rendering using a unified cost volume. This shared representation allows for efficient and accurate depth estimation and novel view synthesis. 

**[Insert a figure illustrating your pipeline (similar to Figure 3-1 in your thesis)]**

## Getting Started

**Installation:**

1. Clone: `git clone https://github.com/your-username/EfficientMVS-NeRF.git`
2. Install: `pip install -r requirements.txt`


## Contact

Nate Ilmoma - telynathan@gmail.com

## Acknowledgments

This repository highly borrows from the following works:

* [MVSNet_pytorch](https://github.com/xy-guo/MVSNet_pytorch)
* [CasMVSNet](https://github.com/alibaba/cascade-stereo/tree/master/CasMVSNet)
* [MVSNeRF](https://github.com/apchenstu/mvsnerf)
* [RC-MVSNet](https://github.com/Boese0601/RC-MVSNet)
