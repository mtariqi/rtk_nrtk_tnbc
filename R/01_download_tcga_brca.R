# Create a clean, working script
#!/usr/bin/env Rscript
# TCGA-BRCA Data Download Script
# Based on blueprint Part 4.1

# Install required packages if needed
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

packages <- c("TCGAbiolinks", "SummarizedExperiment", "DT", "dplyr")
for (pkg in packages) {
    if (!require(pkg, character.only = TRUE)) {
        BiocManager::install(pkg)
        library(pkg, character.only = TRUE)
    }
}

# Create data directories
data_dir <- "~/rtk_nrtk_tnbc/data/raw/tcga"
dir.create(data_dir, recursive = TRUE, showWarnings = FALSE)
setwd(data_dir)

cat("\n📊 Starting TCGA-BRCA data download...\n")
cat("========================================\n")

# Step 1: Query available data
cat("\n1️⃣ Querying TCGA-BRCA project...\n")
query_rna <- GDCquery(
    project = "TCGA-BRCA",
    data.category = "Transcriptome Profiling",
    data.type = "Gene Expression Quantification",
    workflow.type = "STAR - Counts"
)

# Get sample information
samples_down <- getResults(query_rna, cols = "cases")
cat(sprintf("   Found %d samples\n", length(samples_down)))

# Step 2: Separate tumor (TP) and normal (NT) samples
cat("\n2️⃣ Separating tumor and normal samples...\n")
tumor_samples <- TCGAquery_SampleTypes(
    barcode = samples_down,
    typesample = "TP"  # Primary Tumor
)

normal_samples <- TCGAquery_SampleTypes(
    barcode = samples_down,
    typesample = "NT"  # Solid Tissue Normal
)

cat(sprintf("   Tumor samples: %d\n", length(tumor_samples)))
cat(sprintf("   Normal samples: %d\n", length(normal_samples)))

# For testing, use a smaller subset (remove for full download)
# tumor_samples <- tumor_samples[1:20]
# normal_samples <- normal_samples[1:5]

# Step 3: Download RNA-seq data
cat("\n3️⃣ Downloading RNA-seq data (this may take a while)...\n")

# Download tumor samples
query_tumor <- GDCquery(
    project = "TCGA-BRCA",
    data.category = "Transcriptome Profiling",
    data.type = "Gene Expression Quantification",
    workflow.type = "STAR - Counts",
    barcode = tumor_samples
)

cat("   Downloading tumor samples...\n")
GDCdownload(query_tumor, method = "api", files.per.chunk = 10)

# Download normal samples
query_normal <- GDCquery(
    project = "TCGA-BRCA",
    data.category = "Transcriptome Profiling",
    data.type = "Gene Expression Quantification",
    workflow.type = "STAR - Counts",
    barcode = normal_samples
)

cat("   Downloading normal samples...\n")
GDCdownload(query_normal, method = "api", files.per.chunk = 10)

# Step 4: Prepare data
cat("\n4️⃣ Preparing expression data...\n")

data_tumor <- GDCprepare(
    query_tumor,
    save = TRUE,
    save.filename = "TCGA_BRCA_tumor_RNAseq.rda"
)

data_normal <- GDCprepare(
    query_normal,
    save = TRUE,
    save.filename = "TCGA_BRCA_normal_RNAseq.rda"
)

# Step 5: Extract expression matrices
cat("\n5️⃣ Extracting expression matrices...\n")

# Get expression data
expr_tumor <- assay(data_tumor)
expr_normal <- assay(data_normal)

# Get clinical data
clinical_tumor <- colData(data_tumor)
clinical_normal <- colData(data_normal)

# Save as RDS for easy loading
saveRDS(expr_tumor, file = "TCGA_BRCA_tumor_expression.rds")
saveRDS(expr_normal, file = "TCGA_BRCA_normal_expression.rds")
saveRDS(clinical_tumor, file = "TCGA_BRCA_tumor_clinical.rds")
saveRDS(clinical_normal, file = "TCGA_BRCA_normal_clinical.rds")

cat("\n✅ TCGA-BRCA RNA-seq download complete!\n")
cat(sprintf("   Tumor matrix: %d genes x %d samples\n", nrow(expr_tumor), ncol(expr_tumor)))
cat(sprintf("   Normal matrix: %d genes x %d samples\n", nrow(expr_normal), ncol(expr_normal)))
cat(sprintf("   Files saved in: %s\n", data_dir))

# Step 6: Download mutation data (MAF)
cat("\n\n6️⃣ Downloading mutation data...\n")

query_maf <- GDCquery(
    project = "TCGA-BRCA",
    data.category = "Simple Nucleotide Variation",
    data.type = "Masked Somatic Mutation",
    access = "open"
)

GDCdownload(query_maf)
maf_data <- GDCprepare(query_maf)
saveRDS(maf_data, file = "TCGA_BRCA_mutations.rds")

cat("✅ Mutation data downloaded\n")

# Step 7: Download copy number data
cat("\n7️⃣ Downloading copy number data...\n")

query_cnv <- GDCquery(
    project = "TCGA-BRCA",
    data.category = "Copy Number Variation",
    data.type = "Copy Number Segment"
)

GDCdownload(query_cnv)
cnv_data <- GDCprepare(query_cnv)
saveRDS(cnv_data, file = "TCGA_BRCA_cnv.rds")

cat("✅ Copy number data downloaded\n")
cat("\n🎯 All TCGA-BRCA data downloaded successfully!\n")
