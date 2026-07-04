import pandas as pd
from pathlib import Path

# ==========================================================
# FILE PATHS
# ==========================================================

RAW_FILE = Path("datasets/raw/WB_WDI.csv")
OUTPUT_FILE = Path("datasets/cleaned/world_indicators.csv")

# ==========================================================
# LOAD DATA
# ==========================================================

print("=" * 70)
print("Loading World Development Indicators...")
print("=" * 70)

df = pd.read_csv(
    RAW_FILE,
    low_memory=False
)

print(f"Rows Loaded    : {len(df):,}")
print(f"Columns Loaded : {len(df.columns)}")

# ==========================================================
# REQUIRED INDICATORS
# ==========================================================

required_indicators = {

    "WB_WDI_SP_POP_TOTL": "Population",

    "WB_WDI_NY_GDP_MKTP_CD": "GDP",

    "WB_WDI_NY_GDP_PCAP_CD": "GDP Per Capita",

    "WB_WDI_FP_CPI_TOTL_ZG": "Inflation",

    "WB_WDI_SP_DYN_LE00_IN": "Life Expectancy",

    "WB_WDI_EG_ELC_ACCS_ZS": "Electricity Access",

    "WB_WDI_SL_UEM_TOTL_ZS": "Unemployment"

}

# ==========================================================
# FILTER INDICATORS
# ==========================================================

df = df[df["INDICATOR"].isin(required_indicators.keys())]

print(f"\nRows After Indicator Filter : {len(df):,}")

# ==========================================================
# KEEP REQUIRED COLUMNS
# ==========================================================

df = df[[
    "REF_AREA",
    "REF_AREA_LABEL",
    "INDICATOR",
    "INDICATOR_LABEL",
    "TIME_PERIOD",
    "OBS_VALUE"
]]

# ==========================================================
# RENAME COLUMNS
# ==========================================================

df.columns = [
    "country_code",
    "country_name",
    "indicator_code",
    "indicator_name",
    "year",
    "indicator_value"
]

# ==========================================================
# CLEAN DATA
# ==========================================================

df = df.dropna(subset=["indicator_value"])

df["year"] = pd.to_numeric(
    df["year"],
    errors="coerce"
)

df["indicator_value"] = pd.to_numeric(
    df["indicator_value"],
    errors="coerce"
)

df = df.dropna(subset=["year", "indicator_value"])

df["year"] = df["year"].astype(int)

# ==========================================================
# ADD BUSINESS INDICATOR COLUMN
# ==========================================================

df["business_indicator"] = df["indicator_code"].map(
    required_indicators
)

# ==========================================================
# REMOVE DUPLICATES
# ==========================================================

df = df.drop_duplicates()

# ==========================================================
# SORT
# ==========================================================

df = df.sort_values([
    "country_name",
    "business_indicator",
    "year"
])

# ==========================================================
# SAVE
# ==========================================================

OUTPUT_FILE.parent.mkdir(
    parents=True,
    exist_ok=True
)

df.to_csv(
    OUTPUT_FILE,
    index=False
)

# ==========================================================
# SUMMARY
# ==========================================================

print("\n" + "=" * 70)
print("WORLD DEVELOPMENT INDICATORS CLEANED SUCCESSFULLY")
print("=" * 70)

print(f"Rows      : {len(df):,}")
print(f"Columns   : {len(df.columns)}")

print("\nIndicators Included:")

for indicator in sorted(df["business_indicator"].unique()):
    print(f"• {indicator}")

print("\nCountries :", df["country_code"].nunique())

print("Years     :", df["year"].min(), "-", df["year"].max())

print("\nPreview:\n")

print(df.head())

print("\nSaved To:")

print(OUTPUT_FILE)

print("=" * 70)