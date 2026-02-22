# Create a test script
import vcf

# Read VCF file
vcf_reader = vcf.Reader(filename='example.vcf')

# Process records
for record in vcf_reader:
    print(record.CHROM, record.POS, record.REF, record.ALT)

