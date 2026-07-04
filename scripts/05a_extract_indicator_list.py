import pandas as pd

df = pd.read_csv(
    "datasets/raw/WB_WDI.csv",
    usecols=["INDICATOR", "INDICATOR_LABEL"],
    low_memory=False
)

keywords = [
    "Population",
    "GDP",
    "Life expectancy",
    "Electricity",
    "Unemployment",
    "Inflation"
]

for keyword in keywords:

    print("\n" + "=" * 80)
    print(keyword)
    print("=" * 80)

    result = df[
        df["INDICATOR_LABEL"].str.contains(
            keyword,
            case=False,
            na=False
        )
    ][["INDICATOR", "INDICATOR_LABEL"]].drop_duplicates()

    print(result.to_string(index=False))