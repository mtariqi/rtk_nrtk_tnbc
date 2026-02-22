# Create a clean script
#!/usr/bin/env Rscript
# Verify TCGAbiolinks installation and test data access

cat("🔍 Testing TCGAbiolinks...\n")

# Try to load the package
if (require(TCGAbiolinks)) {
    cat("✅ TCGAbiolinks loaded successfully\n")
    
    # Test a simple query
    cat("\n📊 Testing TCGA query...\n")
    query <- GDCquery(
        project = "TCGA-BRCA",
        data.category = "Transcriptome Profiling",
        data.type = "Gene Expression Quantification",
        workflow.type = "STAR - Counts",
        barcode = c("TCGA-3C-AAAU-01A", "TCGA-3C-AALI-01A")
    )
    
    samples <- getResults(query)
    cat(sprintf("Found %d samples in query\n", nrow(samples)))
    cat("✅ TCGA query working!\n")
    
} else {
    cat("❌ TCGAbiolinks not available\n")
}

# Test GEOquery
cat("\n🔍 Testing GEOquery...\n")
if (require(GEOquery)) {
    cat("✅ GEOquery loaded successfully\n")
    cat(sprintf("GEOquery version: %s\n", packageVersion("GEOquery")))
} else {
    cat("❌ GEOquery not available\n")
}

cat("\n🎯 Verification complete!\n")
