import pandas as pd
from pathlib import Path

# -----------------------------
# Paths
# -----------------------------
RAW_FILE = Path("datasets/raw/global peace index.xlsx")
OUTPUT_FILE = Path("datasets/cleaned/peace_index.csv")

# -----------------------------
# Load Excel
# -----------------------------
df = pd.read_excel(
    RAW_FILE,
    sheet_name="Overall Scores",
    skiprows=3
)

# -----------------------------
# Remove empty columns
# -----------------------------
df = df.dropna(axis=1, how="all")

# -----------------------------
# Rename columns
# -----------------------------
df = df.rename(columns={
    "Country": "country_name",
    "iso3c": "country_code"
})

# -----------------------------
# Identify year columns
# -----------------------------
year_columns = [col for col in df.columns if str(col).isdigit()]

# -----------------------------
# Convert Wide → Long
# -----------------------------
peace_long = df.melt(
    id_vars=["country_name", "country_code"],
    value_vars=year_columns,
    var_name="year",
    value_name="peace_score"
)

# -----------------------------
# Remove missing values
# -----------------------------
peace_long = peace_long.dropna(subset=["peace_score"])

# -----------------------------
# Convert data types
# -----------------------------
peace_long["year"] = peace_long["year"].astype(int)
peace_long["peace_score"] = peace_long["peace_score"].astype(float)

# -----------------------------
# Sort
# -----------------------------
peace_long = peace_long.sort_values(
    ["country_name", "year"]
)

# -----------------------------
# Save
# -----------------------------
OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)

peace_long.to_csv(
    OUTPUT_FILE,
    index=False
)

print("=" * 50)
print("Global Peace Index Cleaned Successfully")
print("=" * 50)
print(f"Rows : {peace_long.shape[0]}")
print(f"Columns : {peace_long.shape[1]}")
print("\nPreview:\n")
print(peace_long.head())