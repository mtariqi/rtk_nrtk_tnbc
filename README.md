<div align="center">

# RTK–NRTK Redundancy & Crosstalk in Triple-Negative Breast Cancer

**A Multi-Layer Bioinformatics & AI-Native Analysis Pipeline**

[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.17603512-blue?style=flat-square)](https://doi.org/10.5281/zenodo.17603512)
[![Status](https://img.shields.io/badge/status-active-success?style=flat-square)](https://github.com/mtariqi/rtk_nrtk_tnbc)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)](https://opensource.org/licenses/MIT)
[![R](https://img.shields.io/badge/R-4.5%2B-276DC3?style=flat-square&logo=r&logoColor=white)](https://cran.r-project.org/)
[![Python](https://img.shields.io/badge/Python-3.11%2B-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%2F%20Unix-FCC624?style=flat-square&logo=linux&logoColor=black)](https://ubuntu.com/)

[![Last Commit](https://img.shields.io/github/last-commit/mtariqi/rtk_nrtk_tnbc?style=flat-square)](https://github.com/mtariqi/rtk_nrtk_tnbc/commits)
[![Repo Size](https://img.shields.io/github/repo-size/mtariqi/rtk_nrtk_tnbc?style=flat-square)](https://github.com/mtariqi/rtk_nrtk_tnbc)
[![Stars](https://img.shields.io/github/stars/mtariqi/rtk_nrtk_tnbc?style=flat-square)](https://github.com/mtariqi/rtk_nrtk_tnbc/stargazers)

<br>

*Northeastern University — Computational Biology Research*

</div>

---

## Overview

This repository provides a complete, end-to-end computational pipeline for investigating **Receptor Tyrosine Kinase (RTK)** and **Non-Receptor Tyrosine Kinase (NRTK)** redundancy and crosstalk in **Triple-Negative Breast Cancer (TNBC)**. The pipeline integrates multi-omic data analysis with an AI-native interpretation layer powered by LLMs, RAG, and autonomous agents.

### Research Questions

- How do RTKs and NRTKs functionally compensate for one another in TNBC?
- What novel signaling hubs emerge from RTK–NRTK crosstalk?
- Can kinase redundancy patterns predict drug resistance mechanisms?

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
- [Data Sources](#data-sources)
- [Analysis Pipeline](#analysis-pipeline)
- [Useful Aliases](#useful-aliases)
- [Current Progress](#current-progress)
- [Citation](#citation)
- [License](#license)
- [Contributors & Acknowledgments](#contributors--acknowledgments)

---

## Prerequisites

| Requirement | Version | Notes |
|-------------|---------|-------|
| [R](https://cran.r-project.org/) | 4.5+ | With BiocManager |
| [Python](https://www.python.org/) | 3.11+ | Via Conda recommended |
| [Conda / Mamba](https://docs.conda.io/) | 24.0+ | Environment management |
| [Docker](https://www.docker.com/) | Latest | For Qdrant & Jupyter services |
| Linux / Unix | Ubuntu 22.04+ | Fish shell recommended |

---

## Quick Start

### One-line setup

```bash
git clone https://github.com/mtariqi/rtk_nrtk_tnbc.git && \
  cd rtk_nrtk_tnbc && \
  bash scripts/setup/setup_env.sh
```

### Step-by-step setup

```bash
# 1. Clone the repository
git clone https://github.com/mtariqi/rtk_nrtk_tnbc.git
cd rtk_nrtk_tnbc

# 2. Create and activate the conda environment
conda env create -f envs/environment.yml
conda activate rtk_nrtk

# 3. Install R packages
Rscript scripts/setup/install_r_packages.R

# 4. Start Docker services (Qdrant vector DB + Jupyter)
cd docker && docker compose up -d

# 5. Load shell aliases (Fish shell)
source configs/fish_aliases.fish

# 6. Verify setup
jupyter notebook notebooks/00_setup_check.ipynb
```

---

## Project Structure

```
rtk_nrtk_tnbc/
├── data/                        # Data directory (gitignored)
│   ├── raw/                     # Raw data (TCGA, GEO, CCLE)
│   ├── processed/               # Cleaned and processed data
│   └── results/                 # Analysis outputs
├── R/                           # R analysis scripts
│   ├── 01_download_tcga.R       # TCGA-BRCA data download
│   ├── 02_download_geo.R        # GEO dataset download
│   └── 03_prepare_data.R        # Data preprocessing
├── src/                         # Python source modules
│   ├── bioinformatics/          # Core bioinformatics functions
│   ├── ai_pipeline/             # LLM, RAG, and agent logic
│   └── utils/                   # Shared utilities
├── scripts/                     # Shell scripts
│   ├── setup/                   # Environment setup
│   ├── download/                # Data acquisition scripts
│   └── analysis/                # Analysis automation
├── notebooks/                   # Jupyter notebooks
├── docker/
│   └── docker-compose.yml       # Qdrant + Jupyter services
├── configs/
│   └── fish_aliases.fish        # Fish shell aliases
├── envs/
│   └── environment.yml          # Conda environment spec
└── docs/                        # Documentation
```

---

## Data Sources

| Database | Data Type | Status |
|----------|-----------|--------|
| TCGA-BRCA | RNA-seq, mutations, CNV | ✅ Downloaded (1,111 samples, 4.9 GB) |
| GEO — GSE76275 | TNBC expression | ⏳ Pending |
| CCLE | Cell line expression | ⏳ Pending |
| UniProt / SwissProt | Protein sequences | ⏳ Pending |

---

## Analysis Pipeline

The pipeline is organized into five sequential phases:

### Phase 1 — Data Acquisition
- Download TCGA-BRCA RNA-seq, mutation, and CNV data
- Retrieve GEO TNBC expression datasets (GSE76275)
- Download CCLE cell line profiles
- Fetch UniProt/SwissProt protein sequences

### Phase 2 — Molecular Analysis
- RTK sequence and domain analysis
- NRTK domain architecture characterization
- SH2 binding specificity matrix construction
- Kinase phylogenetic analysis

### Phase 3 — Multi-Omic Analysis
- Differential expression: TNBC vs. normal tissue
- WGCNA co-expression network construction
- Survival analysis (Kaplan–Meier, Cox regression)
- Somatic mutation landscape analysis

### Phase 4 — Network Analysis
- RTK–RTK interaction network
- NRTK–NRTK interaction network
- RTK–NRTK crosstalk network
- Signaling hub identification

### Phase 5 — AI Pipeline
- Qdrant vector database setup and indexing
- Literature embedding with BioBERT / PubMedBERT
- Retrieval-Augmented Generation (RAG) implementation
- Autonomous LLM agent for biological interpretation

---

## Useful Aliases

Once `configs/fish_aliases.fish` is sourced, the following shortcuts are available:

| Alias | Action |
|-------|--------|
| `rtkup` | Start Docker services (Qdrant, Jupyter) |
| `rtkdown` | Stop Docker services |
| `rtkps` | List running containers |
| `rtkjup` | List Jupyter notebooks |
| `rtkcd` | Navigate to project root |
| `rtkenv` | Activate conda environment |

---

## Current Progress

**Completed**
- [x] Project structure and repository setup
- [x] Conda environment configuration
- [x] Fish shell aliases configured
- [x] TCGA-BRCA data downloaded (1,111 samples, 4.9 GB)
- [x] TCGAbiolinks installation and verification

**In Progress**
- [ ] Data cleaning and preprocessing
- [ ] RTK/NRTK gene extraction and annotation

**Up Next**
- [ ] Differential expression analysis
- [ ] Network construction
- [ ] AI pipeline deployment

---

## Citation

@software{islam2025rnaseq,
  author    = {Islam, Md Tariqul},
  title     = {mtariqi/rna-seq-realtime-pipeline: Version 1.0.0},
  year      = {2025},
  publisher = {Zenodo},
  version   = {v1.0.0},
  doi       = {10.5281/zenodo.17603512},
  url       = {https://doi.org/10.5281/zenodo.17603512}
}
```

---

## License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## Contributors & Acknowledgments

**Author:** [Md Tariqul Islam](https://github.com/mtariqi) — Northeastern University

**Acknowledgments:**
- [The Cancer Genome Atlas (TCGA)](https://www.cancer.gov/ccg/research/genome-sequencing/tcga) for open data access
- [Bioconductor](https://www.bioconductor.org/) and the [TCGAbiolinks](https://bioconductor.org/packages/release/bioc/html/TCGAbiolinks.html) development team
- The Conda-Forge and Bioconda communities
