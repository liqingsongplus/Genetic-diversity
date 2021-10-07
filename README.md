
<!-- README.md is generated from README.Rmd. Please edit that file -->

# genetic

<!-- badges: start -->
<!-- badges: end -->

The goal of genetic is to …

## Installation

You can install the released version of genetic from
the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("liqingsongplus/Genetic-diversity")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(genetic)   
data(E5b_hmp)      # load the SNPs data of common carp E5b CDS   
diveristy(E5b_hmp) # compute the genetic diversity of SNPs
ld_plot(E5b_hmp,E5b_hmp$pos) # LDheatmap.pdf will be generated in the current
directory

```
