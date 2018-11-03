---
description: Contributed by Xupeng Chen
---

# 11. exRNA Biomarker

{% hint style="info" %}
### **Precision Medicine: A novel exRNA panel for cancer diagnosis**
{% endhint %}

## 背景介绍

在多种体液中，如血清、唾液以及尿液等，可以检测到一类非侵入性细胞外 RNA \(extracellular RNA, exRNA\)。诸如环状RNA \(circular RNA\)等这类具有空间结构的 RNA 分子，能够在血浆中稳定存在。这些从细胞分泌出的 exRNA 通常由微囊泡 \(microvesicles\)、外泌体\(exosome\) 包裹，或者与 RBP 密切结合形成 RNP 复合体。因为这些分子由于具备类细胞膜结构和蛋白质的保护，加上某些 RNA 具有特定的结构，exRNA 在多种体液 \(血清、唾液、尿液等\) 中可以抵抗体液中 RNase 的降解，从而稳定存在。exRNA 包括的类型很多，例如 miRNA，Y RNA, circRNA，lncRNA 等，每种又有不同的加工、剪切和修饰产物，这种多样性为更 好的临床检验带来了新的期望。这些 exRNA 可以成为一类有效的生物标志物，服务于人体健康状况检测和疾病的诊断，如癌症的早期诊断、肿瘤生长状况监测、以及预后辅助诊断。

本Quiz依托于Lulab现有的一些研究结果，希望读者通过生物信息学方法，尝试使用一些机器学习方法，发现和研究与癌症发生发展相关的新型体液胞外RNA \(extracellular RNA，exRNA\)生物标志物，并应用于几种国内高致死癌症的早期诊断和预后辅助治疗。我们将在癌症病人体液 \(如血液\)中的游离、微囊泡、外泌体、RNP 等不同组分中发现和鉴定标志癌症发生发展的新型 exRNA，构建模型，最终建立一个具有更高精准度和重复性的无创检验癌症（尤其是早期癌症）的方法。

![Goal: Develop a RNA panel, paired with a machine learning model \(exSeek\) to classify cancer from control \(healthy person\) ](../../.gitbook/assets/exseek_task.png)

### 1\) 总体流程图

![](../../.gitbook/assets/wholepipe.png)

### 2\) 主要目标

利用构建出的expression matrix，分别对Colorectal Cancer vs Healthy Control和Prostate Cancer vs Healthy Control建立分类模型，找出稳健的可以区分癌症和正常样本的Feature，并进行相关分析。

![](../../.gitbook/assets/expression_matrix_demo.png)





