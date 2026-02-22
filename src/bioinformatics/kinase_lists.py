# Create Python script to fetch RTK and NRTK lists
"""
RTK and NRTK gene lists for TNBC analysis
Based on Part 3.2.1 and 3.3.1 of the blueprint
"""

# Receptor Tyrosine Kinases (RTKs) - 58 total
RTK_LIST = [
    # EGFR family
    'EGFR', 'ERBB2', 'ERBB3', 'ERBB4',
    # Insulin receptor family
    'INSR', 'IGF1R', 'INSRR',
    # PDGFR family
    'PDGFRA', 'PDGFRB', 'CSF1R', 'KIT', 'FLT3',
    # VEGFR family
    'FLT1', 'KDR', 'FLT4',
    # FGFR family
    'FGFR1', 'FGFR2', 'FGFR3', 'FGFR4',
    # PTK7 family
    'PTK7',
    # TRK family
    'NTRK1', 'NTRK2', 'NTRK3',
    # ROR family
    'ROR1', 'ROR2',
    # MUSK family
    'MUSK',
    # MET family
    'MET', 'MST1R',
    # TAM family
    'TYRO3', 'AXL', 'MERTK',
    # TEK family
    'TEK', 'TIE1',
    # EPH family
    'EPHA1', 'EPHA2', 'EPHA3', 'EPHA4', 'EPHA5', 'EPHA6', 'EPHA7', 'EPHA8',
    'EPHA10', 'EPHB1', 'EPHB2', 'EPHB3', 'EPHB4', 'EPHB6',
    # RET family
    'RET',
    # RYK family
    'RYK',
    # DDR family
    'DDR1', 'DDR2',
    # ROS family
    'ROS1',
    # AATYK family
    'AATK', 'AATYK', 'AATYK2', 'LMTK2', 'LMTK3',
    # ALK family
    'ALK', 'LTK',
    # STYK1
    'STYK1'
]

# Non-Receptor Tyrosine Kinases (NRTKs) - 32 total
NRTK_LIST = [
    # SRC family (SFKs)
    'SRC', 'YES1', 'FYN', 'LYN', 'LCK', 'HCK', 'FGR', 'BLK', 'YRK',
    # FAK family
    'PTK2', 'PTK2B',
    # JAK family
    'JAK1', 'JAK2', 'JAK3', 'TYK2',
    # ABL family
    'ABL1', 'ABL2',
    # ZAP70 family
    'ZAP70', 'SYK',
    # TEC family
    'TEC', 'BTK', 'ITK', 'TXK', 'BMX',
    # ACK family
    'TNK1', 'TNK2',
    # CSK family
    'CSK', 'CTK', 'SRMS', 'BRK', 'FRK'
]

# Combined list for convenience
ALL_KINASES = sorted(RTK_LIST + NRTK_LIST)

# UniProt IDs mapping (to be populated)
UNIPROT_IDS = {
    'EGFR': 'P00533',
    'SRC': 'P12931',
    # Add more as needed
}

def get_kinase_family(gene):
    """Return family for a given kinase gene"""
    if gene in RTK_LIST:
        # Determine which RTK subfamily
        if gene in ['EGFR', 'ERBB2', 'ERBB3', 'ERBB4']:
            return 'EGFR family'
        elif gene in ['INSR', 'IGF1R', 'INSRR']:
            return 'Insulin receptor family'
        # Add more family classifications
        else:
            return 'Other RTK'
    elif gene in NRTK_LIST:
        if gene in ['SRC', 'YES1', 'FYN', 'LYN', 'LCK', 'HCK', 'FGR', 'BLK']:
            return 'SRC family'
        elif gene in ['JAK1', 'JAK2', 'JAK3', 'TYK2']:
            return 'JAK family'
        # Add more family classifications
        else:
            return 'Other NRTK'
    else:
        return 'Unknown'

if __name__ == '__main__':
    print(f"Total RTKs: {len(RTK_LIST)}")
    print(f"Total NRTKs: {len(NRTK_LIST)}")
    print(f"Total kinases: {len(ALL_KINASES)}")
    print(f"\nFirst 10 kinases: {ALL_KINASES[:10]}")

