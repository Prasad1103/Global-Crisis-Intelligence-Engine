import pandas as pd
from pathlib import Path

# ----------------------------------
# File Paths
# ----------------------------------
RAW_FILE = Path("datasets/raw/Inflation-data.xlsx")
OUTPUT_FILE = Path("datasets/cleaned/inflation.csv")

# ----------------------------------
# Read Annual Headline CPI Sheet
# ----------------------------------
df = pd.read_excel(
    RAW_FILE,
    sheet_name="hcpi_a"
)

# ----------------------------------
# Rename Columns
# ----------------------------------
df = df.rename(columns={
    "Country Code": "country_code",
    "Country": "country_name"
})

# ----------------------------------
# Remove Unnecessary Columns
# ----------------------------------
drop_columns = [
    "IMF Country Code",
    "Indicator Type",
    "Series Name"
]

for col in drop_columns:
    if col in df.columns:
        df.drop(columns=col, inplace=True)

# ----------------------------------
# Detect Year Columns
# ----------------------------------
year_columns = [
    col for col in df.columns
    if str(col).isdigit()
]

# ----------------------------------
# Convert Wide → Long
# ----------------------------------
inflation_long = df.melt(
    id_vars=[
        "country_code",
        "country_name"
    ],
    value_vars=year_columns,
    var_name="year",
    value_name="inflation_rate"
)

# ----------------------------------
# Remove Missing Values
# ----------------------------------
inflation_long = inflation_long.dropna(
    subset=["inflation_rate"]
)

# ----------------------------------
# Data Types
# ----------------------------------
inflation_long["year"] = inflation_long["year"].astype(int)
inflation_long["inflation_rate"] = inflation_long["inflation_rate"].astype(float)

# ----------------------------------
# Sort
# ----------------------------------
inflation_long = inflation_long.sort_values(
    ["country_name", "year"]
)

# ----------------------------------
# Save
# ----------------------------------
OUTPUT_FILE.parent.mkdir(
    parents=True,
    exist_ok=True
)

inflation_long.to_csv(
    OUTPUT_FILE,
    index=False
)

print("=" * 50)
print("Inflation Dataset Cleaned Successfully")
print("=" * 50)
print(f"Rows : {inflation_long.shape[0]}")
print(f"Columns : {inflation_long.shape[1]}")
print()
print(inflation_long.head())