"""
VCF utilities for RTK-NRTK project
"""
from cyvcf2 import VCF
import pandas as pd

def load_vcf(vcf_path):
    """Load VCF file and return variants as DataFrame"""
    vcf = VCF(vcf_path)
    
    variants = []
    for variant in vcf:
        variants.append({
            'chrom': variant.CHROM,
            'pos': variant.POS,
            'ref': variant.REF,
            'alt': ','.join(str(a) for a in variant.ALT),
            'qual': variant.QUAL,
            'filter': variant.FILTER,
            'dp': variant.INFO.get('DP', 0)
        })
    
    vcf.close()
    return pd.DataFrame(variants)

def get_kinase_variants(vcf_path, kinase_genes=None):
    """
    Filter variants for kinase genes
    You'll need gene coordinates for this
    """
    df = load_vcf(vcf_path)
    # Add gene filtering logic here
    return df

if __name__ == "__main__":
    # Test
    df = load_vcf("data/test/test.vcf")
    print(f"Loaded {len(df)} variants")
    print(df.head())

