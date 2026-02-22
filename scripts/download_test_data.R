# Clean download test script
#!/usr/bin/env Rscript
# Download a small subset of TCGA-BRCA data for testing

library(TCGAbiolinks)

# Create data directory
data_dir <- "~/rtk_nrtk_tnbc/data/raw/tcga_test"
dir.create(data_dir, recursive = TRUE, showWarnings = FALSE)
setwd(data_dir)

cat("📥 Downloading test TCGA-BRCA data...\n")
cat("========================================\n")

# Get a few TNBC samples (basal-like subtype)
tnbc_samples <- c(
    "TCGA-BH-A0B5-01A",
    "TCGA-BH-A0B6-01A",
    "TCGA-BH-A0B7-01A",
    "TCGA-BH-A0B8-01A",
    "TCGA-A2-A0D0-01A"
)

cat(sprintf("Testing with %d samples\n", length(tnbc_samples)))

# Query RNA-seq data
query <- GDCquery(
    project = "TCGA-BRCA",
    data.category = "Transcriptome Profiling",
    data.type = "Gene Expression Quantification",
    workflow.type = "STAR - Counts",
    barcode = tnbc_samples
)

# Download data
cat("Downloading data...\n")
GDCdownload(query, method = "api")

# Prepare data
cat("Preparing data...\n")
data <- GDCprepare(query)

# Extract expression matrix
expr_matrix <- assay(data)

# Save as RDS
saveRDS(expr_matrix, file = "tcga_brca_test_expression.rds")
saveRDS(colData(data), file = "tcga_brca_test_clinical.rds")

cat(sprintf("\n✅ Test data downloaded!\n"))
cat(sprintf("Expression matrix: %d genes x %d samples\n", 
    nrow(expr_matrix), ncol(expr_matrix)))
cat(sprintf("Files saved in: %s\n", data_dir))
EOF

# Clean kinase genes check script
cat > ~/rtk_nrtk_tnbc/scripts/check_kinase_genes.R << 'EOF'
#!/usr/bin/env Rscript
# Check expression of RTK/NRTK genes in downloaded data

# Load the test data
data_file <- "~/rtk_nrtk_tnbc/data/raw/tcga_test/tcga_brca_test_expression.rds"

if (!file.exists(data_file)) {
    cat("❌ Test data not found. Run download_test_data.R first.\n")
    quit(status = 1)
}

# Load data
expr_matrix <- readRDS(data_file)

# Define RTK and NRTK genes
rtk_genes <- c("EGFR", "ERBB2", "MET", "FGFR1", "KDR", "PDGFRA", "KIT")
nrtk_genes <- c("SRC", "YES1", "PTK2", "PTK2B", "JAK1", "JAK2", "ABL1")

all_kinases <- c(rtk_genes, nrtk_genes)

# Find which genes are in the dataset
available_genes <- intersect(all_kinases, rownames(expr_matrix))

cat("📊 RTK/NRTK Genes in Test Dataset\n")
cat("==================================\n")
cat(sprintf("Total kinase genes checked: %d\n", length(all_kinases)))
cat(sprintf("Found in dataset: %d\n", length(available_genes)))

if (length(available_genes) > 0) {
    cat("\nAvailable genes:\n")
    for (gene in available_genes) {
        expr_values <- expr_matrix[gene, ]
        cat(sprintf("  %s: mean expression = %.2f\n", 
            gene, mean(expr_values, na.rm = TRUE)))
    }
}

# Check which genes are missing
missing_genes <- setdiff(all_kinases, available_genes)
if (length(missing_genes) > 0) {
    cat("\nMissing genes (need to check gene IDs):\n")
    cat(sprintf("  %s\n", paste(missing_genes, collapse = ", ")))
}

cat("\n💡 Note: Gene symbols may need mapping to Ensembl IDs\n")
