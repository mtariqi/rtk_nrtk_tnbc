# RTK-NRTK Redundancy & Crosstalk in Triple-Negative Breast Cancer

<p align="center">
    <!-- Status Badges -->
    <img src="https://img.shields.io/badge/status-active-success?style=for-the-badge&logo=statuspage&logoColor=white" alt="Active Status">
    <img src="https://img.shields.io/badge/Northeastern_University-Research-CC0000?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI4MCIgaGVpZ2h0PSI4MCIgdmlld0JveD0iMCAwIDgwIDgwIj48cGF0aCBmaWxsPSIjRkZGRkZGIiBkPSJNMzkuOTk5IDBDMTcuOTE2IDAgMCAxNy45MTYgMCA0MHMxNy45MTYgNDAgNDAgNDAgNDAtMTcuOTE2IDQwLTQwUzYyLjA4NCAwIDQwIDB6bTAgNzJjLTE3LjY4IDAtMzItMTQuMzItMzItMzJzMTQuMzItMzIgMzItMzIgMzIgMTQuMzIgMzIgMzItMTQuMzIgMzItMzIgMzJ6bTAtNTZjLTEzLjI1NSAwLTI0IDEwLjc0NS0yNCAyNHMxMC43NDUgMjQgMjQgMjQgMjQtMTAuNzQ1IDI0LTI0LTEwLjc0NS0yNC0yNC0yNHoiLz48L3N2Zz4=" alt="Northeastern University">
    <img src="https://img.shields.io/badge/R-4.5%2B-276DC3?style=for-the-badge&logo=r&logoColor=white" alt="R 4.5+">
    <img src="https://img.shields.io/badge/Python-3.11%2B-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python 3.11+">
    <img src="https://img.shields.io/badge/Linux-Unix-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux/Unix">
    <img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Shell Script">
    <img src="https://img.shields.io/badge/CLI-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="CLI">
</p>

<p align="center">
    <!-- Repository Badges -->
    <img src="https://img.shields.io/github/license/mtariqi/rtk_nrtk_tnbc?style=for-the-badge" alt="License">
    <img src="https://img.shields.io/github/last-commit/mtariqi/rtk_nrtk_tnbc?style=for-the-badge" alt="Last Commit">
    <img src="https://img.shields.io/github/repo-size/mtariqi/rtk_nrtk_tnbc?style=for-the-badge" alt="Repo Size">
    <img src="https://img.shields.io/github/stars/mtariqi/rtk_nrtk_tnbc?style=for-the-badge" alt="Stars">
    <img src="https://img.shields.io/github/forks/mtariqi/rtk_nrtk_tnbc?style=for-the-badge" alt="Forks">
    <img src="https://img.shields.io/badge/DOI-10.XXXX%2Fzenodo.XXXXXX-blue?style=for-the-badge" alt="DOI">
</p>

<hr>

## 📋 Overview

This repository contains the complete computational pipeline for analyzing **Receptor Tyrosine Kinase (RTK)** and **Non-Receptor Tyrosine Kinase (NRTK)** redundancy networks in **Triple-Negative Breast Cancer (TNBC)**.

### 🔬 Research Questions

- 🧪 How do RTKs and NRTKs compensate for each other in TNBC?
- 🎯 What novel signaling hubs emerge from their crosstalk?
- 💊 Can we predict drug resistance mechanisms from kinase redundancy patterns?

## 🏛️ Institutional Affiliation

<p align="left">
  <img src="https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/Northeastern_University_seal.svg/1200px-Northeastern_University_seal.svg.png" width="50" height="50" alt="NU Seal">
  <strong>Northeastern University</strong> - Department of Bioinformatics
</p>

## 🚀 Quick Start

### Prerequisites

| Requirement | Version | Link |
|------------|---------|------|
| **R** | 4.5+ | [Download](https://cran.r-project.org/) |
| **Python** | 3.11+ | [Download](https://www.python.org/) |
| **Linux/Unix** | Ubuntu 22.04+ | [Download](https://ubuntu.com/) |
| **Shell** | Bash/Fish | - |
| **Conda** | 24.0+ | [Download](https://docs.conda.io/) |

### ⚡ One-line Setup (Unix/Linux)

```bash
# Clone and setup in one command
git clone https://github.com/mtariqi/rtk_nrtk_tnbc.git && cd rtk_nrtk_tnbc && bash scripts/setup/setup_env.sh

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R](https://img.shields.io/badge/R-4.5%2B-blue)](https://www.r-project.org/)
[![Python](https://img.shields.io/badge/Python-3.11%2B-green)](https://www.python.org/)
```
## 📋 Overview

This repository contains the complete computational pipeline for analyzing **Receptor Tyrosine Kinase (RTK)** and **Non-Receptor Tyrosine Kinase (NRTK)** redundancy networks in **Triple-Negative Breast Cancer (TNBC)**.

### Research Questions
- How do RTKs and NRTKs compensate for each other in TNBC?
- What novel signaling hubs emerge from their crosstalk?
- Can we predict drug resistance mechanisms from kinase redundancy patterns?
---

## Detailed Setup
# 1. Clone the repository
git clone https://github.com/mtariqi/rtk_nrtk_tnbc.git
cd rtk_nrtk_tnbc

# 2. Set up conda environment
conda env create -f envs/environment.yml
conda activate rtk_nrtk

# 3. Set up R packages
Rscript scripts/setup/install_r_packages.R

# 4. Load aliases (Fish shell)
source configs/fish_aliases.fish


## 🏗️ Project Structure

```
rtk_nrtk_tnbc/
├── data/ # Data directory (gitignored)
│ ├── raw/ # Raw data (TCGA, GEO, CCLE)
│ ├── processed/ # Processed data
│ └── results/ # Analysis results
├── scripts/ # Utility scripts
│ ├── setup/ # Environment setup scripts
│ ├── download/ # Data download scripts
│ └── analysis/ # Analysis scripts
├── R/ # R scripts
│ ├── 01_download_tcga.R # TCGA data download
│ ├── 02_download_geo.R # GEO data download
│ └── 03_prepare_data.R # Data preparation
├── src/ # Python modules
│ ├── bioinformatics/ # Core bioinformatics functions
│ ├── ai_pipeline/ # LLM/RAG pipeline
│ └── utils/ # Utility functions
├── notebooks/ # Jupyter notebooks
├── docker/ # Docker configuration
│ └── docker-compose.yml # Qdrant + Jupyter services
├── configs/ # Configuration files
│ └── fish_aliases.fish # Fish shell aliases
└── docs/ # Documentation
```

## 🚀 Quick Start

### Prerequisites
- **Ubuntu 24.04+** (or other Linux)
- **Fish shell** (recommended) or bash
- **Conda/Mamba** installed
- **Docker** (for AI pipeline)
- **R 4.5+** with BiocManager

### Setup (5 minutes)

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/rtk_nrtk_tnbc.git
cd rtk_nrtk_tnbc

# 2. Set up conda environment
conda env create -f envs/environment.yml
conda activate rtk_nrtk

# 3. Set up R packages
Rscript scripts/setup/install_r_packages.R

# 4. Load aliases (Fish shell)
source configs/fish_aliases.fish
### Prerequisites
- Ubuntu 24 LTS / Fish shell
- Conda/Mamba installed
- Docker installed
```
### Setup (5 minutes)

```bash
# 1. Clone/Access project
cd ~/rtk_nrtk_tnbc

# 2. Create conda environment
conda env create -f envs/environment.yml
conda activate rtk_nrtk

# 3. Start Docker services
cd docker && docker compose up -d

# 4. Verify setup
jupyter notebook notebooks/00_setup_check.ipynb
```
## Data Sources

Database	Data Type	                Status
TCGA-BRCA	RNA-seq, mutations, CNV	✅      Downloaded (4.9 GB)
GEO (GSE76275)	TNBC expression         	⏳ Pending
CCLE    	Cell line expression    	⏳ Pending
UniProt/SwissProt	Protein sequences	⏳ Pending

##  Analysis Pipeline

# Phase 1: Data Acquisition
TCGA-BRCA RNA-seq download

Data organization

GEO TNBC dataset download

CCLE cell line data

# Phase 2: Molecular Analysis
RTK sequence analysis

NRTK domain architecture

SH2 binding specificity matrix

Kinase phylogeny

# Phase 3: Multi-Omic Analysis
Differential expression (TNBC vs Normal)

WGCNA co-expression networks

Survival analysis

Mutation analysis

# Phase 4: Network Analysis
RTK-RTK interaction network

NRTK-NRTK interaction network

RTK-NRTK crosstalk network

Hub identification

# Phase 5: AI Pipeline
Qdrant vector database setup

Literature embedding

RAG implementation

LLM agent for interpretation


## Key Aliases

rtkup     # Start Docker services (Qdrant, Jupyter)
rtkdown   # Stop Docker services
rtkps     # Show running containers
rtkjup    # List Jupyter notebooks
rtkcd     # Go to project root
rtkenv    # Activate conda environment


## Current Progress
✅ Completed:

Project structure setup

Conda environment configuration

Fish aliases configured

TCGA-BRCA data downloaded (1,111 samples, 4.9 GB)

TCGAbiolinks installed and verified

🔄 In Progress:

Data preparation and cleaning

RTK/NRTK gene extraction

⏳ Next Up:

Differential expression analysis

Network construction

##  Citation
If you use this pipeline in your research, please cite:
Islam, M.T. (2026). RTK-NRTK Redundancy & Crosstalk in Triple-Negative 
Breast Cancer: A Multi-Layer Bioinformatics & AI-Native Analysis. 
GitHub: https://github.com/mtariqi/rtk_nrtk_tnbc
License
MIT License - see LICENSE file for details.

##  Contributors
Md Tariqul Islam - Initial work - @mtariqi

## Acknowledgments
The Cancer Genome Atlas (TCGA) for data access

Bioconductor and TCGAbiolinks developers

Conda-forge and Bioconda communities
