# Create R package installation script
#!/usr/bin/env Rscript
# Install all required R packages

packages <- c(
    "TCGAbiolinks",
    "GEOquery",
    "DESeq2",
    "limma",
    "clusterProfiler",
    "ComplexHeatmap",
    "maftools",
    "WGCNA",
    "tidyverse",
    "ggplot2",
    "survival",
    "survminer"
)

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

for (pkg in packages) {
    if (!require(pkg, character.only = TRUE)) {
        BiocManager::install(pkg)
    }
}

cat("✅ All R packages installed\n")
EOF

# Create environment setup script
cat > scripts/setup/setup_env.sh << 'EOF'
#!/bin/bash
# Full environment setup script

echo "🔧 Setting up RTK-NRTK project environment..."

# Create conda environment
conda env create -f envs/environment.yml
conda activate rtk_nrtk

# Install R packages
Rscript scripts/setup/install_r_packages.R

# Create directory structure
mkdir -p data/{raw,processed,results}
mkdir -p notebooks
mkdir -p src/{bioinformatics,ai_pipeline,utils}
mkdir -p docker
mkdir -p docs

echo "✅ Setup complete!"

