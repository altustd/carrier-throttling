# data-raw/fetch_fcc.R
#
# Downloads FCC Measuring Broadband America (MBA) mobile data.
# The FCC publishes raw CSV/ZIP datasets at:
#   https://www.fcc.gov/oet/mba/raw-data-releases
#
# We pull the most recent available mobile test results and unit lookup tables.
#
# Usage (from project root):
#   Rscript data-raw/fetch_fcc.R

library(httr2)

dest <- "data/fcc"
dir.create(dest, showWarnings = FALSE, recursive = TRUE)

# FCC MBA raw data URLs -- mobile data files
# These are stable direct-download links from the FCC open data portal.
files <- list(
  list(
    url  = "https://www.fcc.gov/oet/mba/raw-data-releases/raw_data_2024.zip",
    dest = file.path(dest, "raw_data_2024.zip"),
    desc = "FCC MBA 2024 raw data"
  ),
  list(
    url  = "https://www.fcc.gov/oet/mba/raw-data-releases/raw_data_2023.zip",
    dest = file.path(dest, "raw_data_2023.zip"),
    desc = "FCC MBA 2023 raw data"
  ),
  list(
    url  = "https://www.fcc.gov/oet/mba/raw-data-releases/raw_data_2022.zip",
    dest = file.path(dest, "raw_data_2022.zip"),
    desc = "FCC MBA 2022 raw data"
  )
)

for (f in files) {
  if (file.exists(f$dest)) {
    message("Already downloaded: ", f$desc)
    next
  }
  message("Downloading: ", f$desc, " ...")
  tryCatch({
    request(f$url) |>
      req_timeout(300) |>
      req_perform(path = f$dest)
    message("  Saved to: ", f$dest)
  }, error = function(e) {
    message("  WARN: Could not download ", f$url)
    message("  ", conditionMessage(e))
    message("  Visit https://www.fcc.gov/oet/mba/raw-data-releases to download manually.")
  })
}

# Unzip any successfully downloaded files
zips <- list.files(dest, pattern = "\\.zip$", full.names = TRUE)
for (z in zips) {
  out_dir <- file.path(dest, tools::file_path_sans_ext(basename(z)))
  if (!dir.exists(out_dir)) {
    message("Unzipping: ", basename(z))
    unzip(z, exdir = out_dir)
  }
}

message("FCC data written to: ", dest)
