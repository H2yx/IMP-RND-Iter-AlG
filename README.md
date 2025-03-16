# IMP-RND-Iter-AlG
A respository for randomized iterative algorithm and theoretical research of color image restoration for discrete ill-posed inverse problems

This is a project team of undergraduates from the School of Mathematical Sciences of Tongji University, in charge of a municipal project for innovation and entrepreneurship entitled "randomized iterative algorithm and theoretical research of color image restoration for discrete ill-posed inverse problems".

The details are as follows.

## 本项目的立项背景、目的和意义
### 选题背景：​
图像处理和分析技术在现代科学、工程和多媒体领域中扮演着重要角色，尤其是在图像反问题领域。图像反问题的主要目标是从观测数据中重建高质量图像，以还原真实世界的细节特征。然而，高质量的图像重建仍然是一个极具挑战性的任务，尤其是在处理大规模图像数据时，如何在保持图像平滑性的同时保留重要特征（如图像边缘）是一个关键问题。现有的图像重建算法大多基于线性或非线性变换，如傅立叶变换、小波变换、深度卷积神经网络等，但这些方法在处理复杂图像时仍存在局限性。

### 目的与意义：​
本项目旨在研究贝叶斯不适定反问题模型，探索高性能数值迭代算法的数学收敛理论，设计高效算法并分析其数学理论。通过深入研究图像反问题的数学模型和数值方法，本项目不仅为图像处理领域提供了新的理论支持，还为实际应用中的不适定反问题提供了高效的解决方案。项目的成果在科学计算领域具有重要的理论意义和实际应用价值，关注高性能数值迭代算法，结合深度学习等领域，在解决不适定反问题具有启发性意义。

## 项目的创新点与特色
### 项目创新点：​
1. **数学收敛理论的深入探索**：本项目不同于传统的工程图像复原算法研究，而是深入探索高性能数值迭代算法的数学收敛理论，建立了不同算法收敛阶的比较理论。<br>
2. **反射草图框架的构建**：在Gower和Richtarik提出的草图投影方法框架工作的基础上，增加搜索空间的维度，扩大草图反射方法中每一步中的搜索空间，设置随机分布参数的随机选取准则，引入重启动技术等，收敛率显著提升。<br>
3. **与随机特征方法的联合**：随机特征方法中涉及的优化步骤在于一个大规模稀疏最小二乘问题的求解，本项目团队将项目已经开发的关于反射草图方法的工作应用到随机特征方法中的最小二乘问题求解中去，并与Krylov子空间方法及反射方法以及PINN方法的收敛性进行比较。

### 项目特色：​​

1. **多学科交叉**：本项目结合了数学、计算机科学和图像处理等多个学科的知识，提出了基于交替方向方法的高性能数值迭代算法，具有较强的跨学科特色。<br>
2. **理论与实验结合**：本项目不仅注重理论分析，还通过大量的数值实验验证了算法的有效性，确保了理论成果的实际应用价值。<br>
3. **开源工具包**：项目开发了MATLAB/Python图像处理工具箱，包含图像处理算法与反射草图算法框架等，为相关领域的研究者提供了便捷的工具。

## 成果简述--应用成果部分
项目成果通过开源代码和工具包的形式对外发布，提供了详细的文档和示例代码，帮助相关领域的研究者快速上手并应用项目成果。

项目主要代码均已上传至github平台，项目网址：**https://github.com/H2yx/IMP-RND-Iter-AlG**

其中代码包括以下四个部分：

1. **image deblurring**：<br>主要包括对于《image deblurring》一书中各个“challenge”的代码解决尝试。
2. **nonnegative matrix decomposition**：<br>主要包括若干种矩阵非负分解的迭代法代码
3. **random sketch iterative method**：<br>包括草图投影方法的代码复现，草图反射方法框架的代码（支持多种参数的选择）以及若干经典随机迭代法
4. **random feature model**：<br>对于随机特征方法的代码复现

## 欢迎交流参考
