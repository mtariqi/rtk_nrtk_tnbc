# Create a test script using cyvcf2
#!/usr/bin/env python
"""
Test script for reading VCF files using cyvcf2 (10-100x faster than PyVCF)
"""

import sys
from cyvcf2 import VCF

def read_vcf_cyvcf2(vcf_file):
    """Read and display contents of a VCF file using cyvcf2"""
    try:
        print(f"\n📊 Reading VCF file: {vcf_file}")
        print("=" * 60)
        
        # Open VCF file (works with .vcf or .vcf.gz)
        vcf = VCF(vcf_file)
        
        # Print header info
        print(f"Samples: {vcf.samples}")
        print(f"Contigs: {list(vcf.seqnames)[:5]}...")
        print("-" * 60)
        
        # Read records
        record_count = 0
        for variant in vcf:
            record_count += 1
            if record_count <= 5:  # Show first 5 records
                print(f"Record {record_count}:")
                print(f"  CHROM: {variant.CHROM}")
                print(f"  POS: {variant.POS}")
                print(f"  ID: {variant.ID}")
                print(f"  REF: {variant.REF}")
                print(f"  ALT: {variant.ALT}")
                print(f"  QUAL: {variant.QUAL}")
                print(f"  FILTER: {variant.FILTER}")
                print()
        
        print(f"✅ Total records: {record_count}")
        vcf.close()
        
    except Exception as e:
        print(f"❌ Error reading VCF: {e}")
        return False
    return True

if __name__ == "__main__":
    vcf_file = sys.argv[1] if len(sys.argv) > 1 else "data/test/sample.vcf"
    read_vcf_cyvcf2(vcf_file)
