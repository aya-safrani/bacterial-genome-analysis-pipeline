"""Targeted search of PGPR / stress-related functions in an eggNOG-mapper annotation file."""
import sys
import pandas as pd

# keywords per function (adapt and extend)
FUNCTIONS = {
    "siderophores": ["siderophore", "enterobactin", "aerobactin", "ferrichrome", "ferric citrate"],
    "heavy_metals": ["copper", "zinc", "cadmium", "arsenic", "mercury", "heavy metal"],
    "osmotic_stress": ["osmo", "betaine", "trehalose", "proline"],
    "oxidative_stress": ["catalase", "superoxide", "peroxidase", "oxidative"],
}

annot = pd.read_csv(sys.argv[1], sep="\t", comment="#", header=None, dtype=str).fillna("")
text = annot.apply(lambda r: " ".join(r.values).lower(), axis=1)
for name, words in FUNCTIONS.items():
    hits = text.str.contains("|".join(words))
    print(f"{name}: {hits.sum()} annotated genes")
