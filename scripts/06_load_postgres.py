import pandas as pd
from sqlalchemy import create_engine

# -----------------------------
# PostgreSQL Connection
# -----------------------------
engine = create_engine(
    "postgresql+psycopg2://postgres:1910%40@localhost:5432/global_crisis_intelligence"
)

# -----------------------------
# Folder Path
# -----------------------------
base_path = r"C:\Users\prasa\OneDrive\Desktop\Global Crisis Intelligence Engine\datasets\cleaned"

files = {
    "peace_index": "peace_index.csv",
    "inflation": "inflation.csv",
    "disasters": "disasters.csv",
    "food_prices": "food_prices.csv",
    "world_indicators": "world_indicators.csv"
}

for table, file in files.items():
    print(f"Loading {table}...")

    df = pd.read_csv(f"{base_path}\\{file}")

    df.to_sql(
        table,
        engine,
        if_exists="append",
        index=False
    )

    print(f"✓ {len(df)} rows inserted into {table}")

print("\nAll datasets imported successfully!")