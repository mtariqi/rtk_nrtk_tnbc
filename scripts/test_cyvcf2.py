#!/usr/bin/env python
"""
Test script for reading VCF files using cyvcf2
"""

import os
from cyvcf2 import VCF

def main():
    # Use relative path from project root
    vcf_path = "data/test/sample.vcf"
    
    print(f"Current directory: {os.getcwd()}")
    print(f"Looking for VCF at: {vcf_path}")
    print(f"Full path: {os.path.abspath(vcf_path)}")
    
    if not os.path.exists(vcf_path):
        print(f"❌ File not found: {vcf_path}")
        return
    
    print("\n📊 Reading VCF file...")
    print("=" * 50)
    
    vcf = VCF(vcf_path)
    print(f"Samples: {vcf.samples}")
    print("-" * 50)
    
    for i, variant in enumerate(vcf):
        if i < 5:  # Show first 5 variants
            print(f"{i+1}. {variant.CHROM}:{variant.POS} {variant.REF}->{variant.ALT}")
    
    print(f"\n✅ Total variants: {i+1}")
    vcf.close()

if __name__ == "__main__":
    main()
