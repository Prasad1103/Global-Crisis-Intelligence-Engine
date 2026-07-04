import pandas as pd
from pathlib import Path

# -----------------------------------------
# File Paths
# -----------------------------------------
RAW_FILE = Path("C:\\Users\\prasa\\OneDrive\\Desktop\\Global Crisis Intelligence Engine\\datasets\\raw\\emdat disaster.xlsx")
OUTPUT_FILE = Path("C:\\Users\\prasa\\OneDrive\\Desktop\\Global Crisis Intelligence Engine\\datasets\\cleaned\\disasters.csv")

# -----------------------------------------
# Read Excel
# -----------------------------------------
df = pd.read_excel(RAW_FILE)

# -----------------------------------------
# Keep Required Columns
# -----------------------------------------
columns = {
    "DisNo.": "disaster_code",
    "ISO": "country_code",
    "Country": "country_name",
    "Region": "region",
    "Subregion": "subregion",
    "Disaster Group": "disaster_group",
    "Disaster Subgroup": "disaster_subgroup",
    "Disaster Type": "disaster_type",
    "Disaster Subtype": "disaster_subtype",
    "Start Year": "start_year",
    "Start Month": "start_month",
    "Start Day": "start_day",
    "End Year": "end_year",
    "Total Deaths": "total_deaths",
    "Total Affected": "total_affected",
    "Total Damage ('000 US$)": "economic_damage_usd"
}

df = df[list(columns.keys())]

df = df.rename(columns=columns)

# -----------------------------------------
# Remove duplicate disasters
# -----------------------------------------
df = df.drop_duplicates()

# -----------------------------------------
# Fill missing numeric values
# -----------------------------------------
numeric_columns = [
    "total_deaths",
    "total_affected",
    "economic_damage_usd",
    "start_month",
    "start_day"
]

for col in numeric_columns:
    df[col] = df[col].fillna(0)

# -----------------------------------------
# Convert numeric columns
# -----------------------------------------
for col in numeric_columns:
    df[col] = pd.to_numeric(df[col], errors="coerce").fillna(0)

# ==========================================
# Convert numeric columns to integer
# ==========================================

int_columns = [
    "start_year",
    "start_month",
    "start_day",
    "end_year",
    "total_deaths",
    "total_affected"
]

for col in int_columns:
    df[col] = (
        pd.to_numeric(df[col], errors="coerce")
        .fillna(0)
        .astype(int)
    )
# -----------------------------------------
# Sort
# -----------------------------------------
df = df.sort_values(
    ["country_name", "start_year"]
)

# -----------------------------------------
# Save
# -----------------------------------------
OUTPUT_FILE.parent.mkdir(
    parents=True,
    exist_ok=True
)

df.to_csv(
    OUTPUT_FILE,
    index=False
)

print("=" * 60)
print("EM-DAT Dataset Cleaned Successfully")
print("=" * 60)

print("Rows :", df.shape[0])
print("Columns :", df.shape[1])

print()

print(df.head())