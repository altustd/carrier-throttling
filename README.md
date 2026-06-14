# Carrier Throttling Analysis

*Mobile Broadband Performance and Data Cap Behavior in the US*

Does your carrier throttle "unlimited" data after a usage threshold? This project analyzes Ookla Open Data (2022–2024 quarterly mobile tile speed tests) and FCC Measuring Broadband America panel data to look for evidence of throughput degradation by operator.

---

## Read Online

**[https://altustd.github.io/carrier-throttling/](https://altustd.github.io/carrier-throttling/)**

---

## Contents

**Part I: Data**
- [Data Sources](https://altustd.github.io/carrier-throttling/chapters/01-data-sources.html)
- [Data Preparation](https://altustd.github.io/carrier-throttling/chapters/02-data-preparation.html)

**Part II: Analysis**
- [Carrier Overview](https://altustd.github.io/carrier-throttling/chapters/03-carrier-overview.html)
- [Throughput Trends](https://altustd.github.io/carrier-throttling/chapters/04-throughput-trends.html)
- [Throttling Detection](https://altustd.github.io/carrier-throttling/chapters/05-throttling-detection.html)

**[Download PDF](https://altustd.github.io/carrier-throttling/Carrier-Throttling-Analysis.pdf)**

---

## Known Issues

- **Stale rendered output:** `chapters/02-data-preparation.qmd` was fixed
  (2026-06-14) to add a real US bounding-box filter to `ookla_us` (CONUS/AK/HI;
  previously `ookla_us` was unfiltered global data, ~87% non-US). The
  `docs/` HTML/PDF and committed figures still reflect the old global numbers
  until the project is re-rendered. Re-rendering requires rebuilding the
  `renv` environment (`renv.lock` is stale — only `renv` itself is locked;
  `sf`/`arrow`/`duckdb` also need GDAL/GEOS/PROJ/UDUNITS/Arrow C++ via
  Homebrew, not currently installed).

## Run Locally

```bash
renv::restore()
```

Then fetch raw data (run once — large downloads):

```bash
Rscript data-raw/fetch_ookla.sh
Rscript data-raw/fetch_fcc.R
```

```bash
quarto render    # HTML + PDF → docs/
quarto preview   # live preview
```

## Tech Stack

Quarto · R · tidyverse · duckdb · arrow · sf
