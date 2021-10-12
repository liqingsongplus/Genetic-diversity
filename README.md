
<!-- README.md is generated from README.Rmd. Please edit that file -->

# genetic

<!-- badges: start -->
<!-- badges: end -->

You can compute genetic diversity about SNPs in HMP format.

## Installation

You can install the released version of genetic from
the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("liqingsongplus/Genetic-diversity")
```

## Example

This is a basic example which shows you how to solve a common problem:

You can use GenoToHmp() get the HMP format file of SNPs from genotype file that conducted by novoSNP, such as:
``` r
library(genetic)
data(E5b_geno) # the output file from 
GenoToHmp(E5b_geno, "E5b")
```

else:
``` r
data(E5b_hmp)      # load the SNPs data of common carp E5b CDS   
diveristy(E5b_hmp) # compute the genetic diversity of SNPs
ld_plot(E5b_hmp,E5b_hmp$pos) # LDheatmap.pdf will be generated in the current directory

```
