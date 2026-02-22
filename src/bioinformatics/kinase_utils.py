"""
Utility functions for kinase analysis
"""

RTK_GENES = [
    "EGFR", "ERBB2", "ERBB3", "ERBB4", "MET", "FGFR1", "FGFR2",
    "FGFR3", "FGFR4", "KDR", "PDGFRA", "PDGFRB", "KIT", "FLT3",
    "IGF1R", "INSR", "AXL", "TYRO3", "MERTK", "EPHA1", "EPHA2",
    "EPHB2", "RET", "ALK", "ROS1", "NTRK1", "NTRK2", "NTRK3"
]

NRTK_GENES = [
    "SRC", "YES1", "FYN", "LYN", "LCK", "HCK", "FGR", "BLK",
    "PTK2", "PTK2B", "JAK1", "JAK2", "JAK3", "TYK2", "ABL1",
    "ABL2", "CSK", "BTK", "ITK", "TEC", "BMX", "TNK2"
]

def get_kinase_family(gene):
    """Return the family of a given kinase gene"""
    if gene in RTK_GENES:
        return "RTK"
    elif gene in NRTK_GENES:
        return "NRTK"
    else:
        return "Unknown"
