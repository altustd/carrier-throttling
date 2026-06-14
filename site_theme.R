library(ggplot2)
library(scales)

SITE_BLUE   <- "#185FA5"
SITE_CORAL  <- "#D85A30"
SITE_TEAL   <- "#0F6E56"
SITE_PURPLE <- "#534AB7"
SITE_AMBER  <- "#D4A044"
SITE_MUTED  <- "#888780"

theme_site <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.background   = element_rect(fill = "#fafaf8", color = NA),
      panel.background  = element_rect(fill = "#fafaf8", color = NA),
      panel.grid.major  = element_line(color = "#e4e2d8", linewidth = 0.4),
      panel.grid.minor  = element_line(color = "#f0ede8", linewidth = 0.25),
      plot.title        = element_text(color = "#2c2c2a", face = "bold",
                                       size = rel(1.15), margin = margin(b = 6)),
      plot.subtitle     = element_text(color = "#888780", size = rel(0.88),
                                       margin = margin(b = 10)),
      plot.caption      = element_text(color = "#aaa89e", size = rel(0.78)),
      axis.text         = element_text(color = "#555553", size = rel(0.9)),
      axis.title        = element_text(color = "#2c2c2a", size = rel(0.95)),
      axis.line         = element_line(color = "#d3d1c7", linewidth = 0.4),
      legend.background = element_rect(fill = "#fafaf8", color = "#d3d1c7",
                                       linewidth = 0.3),
      legend.text       = element_text(color = "#2c2c2a", size = rel(0.88)),
      legend.title      = element_text(color = "#2c2c2a", face = "bold",
                                       size = rel(0.9)),
      strip.background  = element_rect(fill = "#f0ede4", color = NA),
      strip.text        = element_text(color = "#2c2c2a", face = "bold",
                                       size = rel(0.92)),
      plot.margin       = margin(10, 14, 10, 10),
    )
}

theme_set(theme_site())

SPEED_TIER_COLORS <- c(
  "< 10 Mbps (poor)"       = SITE_CORAL,
  "10-25 Mbps (basic)"     = SITE_AMBER,
  "10–25 Mbps (basic)"  = SITE_AMBER,
  "25-100 Mbps (good)"     = SITE_TEAL,
  "25–100 Mbps (good)"  = SITE_TEAL,
  "> 100 Mbps (excellent)" = SITE_BLUE
)
