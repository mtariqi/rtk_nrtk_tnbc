# Step 2: Now run these R commands (one by one)
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# Step 3: Install TCGAbiolinks
BiocManager::install("TCGAbiolinks")

# Step 4: Load it
library(TCGAbiolinks)

# Step 5: Verify it works
sessionInfo()
data_dir <- "~/rtk_nrtk_tnbc/data/raw/tcga/GDCdata"
query <- GDCquery(
  project = "TCGA-BRCA",
  data.category = "Transcriptome Profiling",
  data.type = "Gene Expression Quantification",
  workflow.type = "STAR - Counts"
)
cat("📦 Preparing TCGA-BRCA data...\n")
data <- GDCprepare(
  query,
  directory = data_dir,
  save = TRUE,
  save.filename = "~/rtk_nrtk_tnbc/data/raw/tcga/TCGA_BRCA_raw.rda"
)
data_dir <- "~/rtk_nrtk_tnbc/data/raw/tcga/GDCdata"
query <- GDCquery(
  project = "TCGA-BRCA",
  data.category = "Transcriptome Profiling",
  data.type = "Gene Expression Quantification",
  workflow.type = "STAR - Counts"
)
getResults(query)$file_name[1:5]
data <- GDCprepare(
  query,
  directory = data_dir,
  save = TRUE,
  save.filename = "~/rtk_nrtk_tnbc/data/raw/tcga/TCGA_BRCA_raw.rda"
)
library(TCGAbiolinks)
data_dir <- "~/rtk_nrtk_tnbc/data/raw/tcga"
query <- GDCquery(
  project = "TCGA-BRCA",
  data.category = "Transcriptome Profiling",
  data.type = "Gene Expression Quantification",
  workflow.type = "STAR - Counts"
)

data <- GDCprepare(
  query,
  directory = data_dir,
  save = TRUE,
  save.filename = "~/rtk_nrtk_tnbc/data/raw/tcga/TCGA_BRCA_raw.rda"
)
query_results <- getResults(query)
expected_files <- query_results$file_name[1:5]
expected_cases <- query_results$cases[1:5]
cat("Expected files (first 5):\n")
print(expected_files)
cat("\nExpected cases (first 5):\n")
print(expected_cases)
🔍 Step 2: Check What Files Actually Exist
r
# List all actual files
all_files <- list.files(
    path = "~/rtk_nrtk_tnbc/data/raw/tcga",
    pattern = "*.tsv",
    recursive = TRUE,
    full.names = TRUE
)

cat("Total files found:", length(all_files), "\n")
cat("First 5 actual files:\n")
print(basename(all_files[1:5]))
🔍 Step 3: Check if the UUIDs Match
r
# Extract UUIDs from actual files
actual_uuids <- gsub(".*/([a-f0-9-]+)\\.rna_seq.*", "\\1", all_files)
cat("First 5 actual UUIDs:\n")
print(actual_uuids[1:5])

# Compare with expected UUIDs from query
expected_uuids <- gsub("\\..*", "", expected_files)
cat("\nFirst 5 expected UUIDs:\n")
print(expected_uuids)

# Check if any match
any_match <- actual_uuids[1:5] %in% expected_uuids
cat("\nFirst 5 match expected?:", any_match, "\n")
🔧 Step 4: The Manual Approach - Read Files Directly
Since GDCprepare is being stubborn, let's read the files manually. This gives you full control:

r
# Find all count files
file_list <- list.files(
    path = "~/rtk_nrtk_tnbc/data/raw/tcga",
    pattern = "*.tsv",
    recursive = TRUE,
    full.names = TRUE
)

cat("Found", length(file_list), "TSV files\n")

# Function to read one file and extract counts
read_sample_counts <- function(file_path) {
    # Read the file, skipping the first 6 lines (N_* stats)
    df <- tryCatch({
        read.delim(file_path, skip = 6, row.names = 1)
    }, error = function(e) {
        return(NULL)
    })
    
    if (is.null(df)) return(NULL)
    
    # Extract unstranded counts
    counts <- df$unstranded
    names(counts) <- rownames(df)
    return(counts)
}

# Test on first file
cat("\nTesting on first file...\n")
test_counts <- read_sample_counts(file_list[1])
if (!is.null(test_counts)) {
    cat("Success! First file has", length(test_counts), "genes\n")
    cat("First 5 genes:", names(test_counts)[1:5], "\n")
    cat("First 5 counts:", test_counts[1:5], "\n")
}

# If test works, read all files (this will take time)
if (!is.null(test_counts)) {
    cat("\n📦 Reading all", length(file_list), "files...\n")
    
    # Get sample IDs from file paths
    sample_ids <- basename(dirname(file_list))
    
    # Initialize matrix
    expr_matrix <- matrix(NA, nrow = length(test_counts), ncol = length(file_list))
    rownames(expr_matrix) <- names(test_counts)
    colnames(expr_matrix) <- sample_ids
    
    # Read each file
    for (i in 1:length(file_list)) {
        if (i %% 100 == 0) cat("Processed", i, "samples\n")
        counts <- read_sample_counts(file_list[i])
        if (!is.null(counts)) {
            expr_matrix[, i] <- counts[rownames(expr_matrix)]
        }
    }
    
    # Remove genes that are all NA
    keep_genes <- rowSums(is.na(expr_matrix)) < ncol(expr_matrix)
    expr_matrix <- expr_matrix[keep_genes, ]
    
    cat("\n✅ Done!\n")
    cat("Expression matrix:", nrow(expr_matrix), "genes x", ncol(expr_matrix), "samples\n")
    
    # Save
    saveRDS(expr_matrix, "~/rtk_nrtk_tnbc/data/raw/tcga/expression_matrix_manual.rds")
    cat("Saved to: ~/rtk_nrtk_tnbc/data/raw/tcga/expression_matrix_manual.rds\n")
}
🔧 Step 5: Alternative - Use GDCprepare with Legacy Mode
Sometimes the legacy archive works better:

r
query_legacy <- GDCquery(
    project = "TCGA-BRCA",
    data.category = "Transcriptome Profiling",
    data.type = "Gene Expression Quantification",
    workflow.type = "STAR - Counts",
    legacy = TRUE
)






