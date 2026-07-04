import pandas as pd
from pathlib import Path

# ----------------------------------
# File Paths
# ----------------------------------
RAW_FILE = Path("datasets/raw/food prices.csv")
OUTPUT_FILE = Path("datasets/cleaned/food_prices.csv")

# ----------------------------------
# Load CSV
# ----------------------------------
# ----------------------------------
# Load CSV
# ----------------------------------

encodings = ["utf-8", "latin1", "cp1252"]

for enc in encodings:
    try:
        df = pd.read_csv(RAW_FILE, encoding=enc)
        print(f"Loaded successfully using encoding: {enc}")
        break
    except UnicodeDecodeError:
        print(f"Failed with encoding: {enc}")
# ----------------------------------
# Keep Required Columns
# ----------------------------------
columns = {
    "adm0_name": "country_name",
    "adm1_name": "region_name",
    "mkt_id": "market_id",
    "mkt_name": "market_name",
    "cm_id": "commodity_id",
    "cm_name": "commodity_name",
    "cur_name": "currency",
    "pt_name": "price_type",
    "um_name": "unit",
    "mp_month": "month",
    "mp_year": "year",
    "mp_price": "price"
}

df = df[list(columns.keys())]

df = df.rename(columns=columns)

# ----------------------------------
# Remove duplicates
# ----------------------------------
df = df.drop_duplicates()

# ----------------------------------
# Remove rows with missing prices
# ----------------------------------
df = df.dropna(subset=["price"])

# ----------------------------------
# Convert numeric columns
# ----------------------------------
numeric_columns = [
    "market_id",
    "commodity_id",
    "month",
    "year",
    "price"
]

for col in numeric_columns:
    df[col] = pd.to_numeric(df[col], errors="coerce")

df = df.dropna(subset=numeric_columns)

# ----------------------------------
# Convert data types
# ----------------------------------
df["market_id"] = df["market_id"].astype(int)
df["commodity_id"] = df["commodity_id"].astype(int)
df["month"] = df["month"].astype(int)
df["year"] = df["year"].astype(int)

# ----------------------------------
# Create Date Column
# ----------------------------------
df["price_date"] = pd.to_datetime(
    dict(
        year=df["year"],
        month=df["month"],
        day=1
    )
)

# ----------------------------------
# Sort
# ----------------------------------
df = df.sort_values(
    ["country_name", "commodity_name", "price_date"]
)

# ----------------------------------
# Save
# ----------------------------------
OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)

df.to_csv(
    OUTPUT_FILE,
    index=False
)

print("=" * 60)
print("Food Prices Dataset Cleaned Successfully")
print("=" * 60)

print("Rows :", df.shape[0])
print("Columns :", df.shape[1])

print(df.head())