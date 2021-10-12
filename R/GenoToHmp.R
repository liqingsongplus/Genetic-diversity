
#' Convert the GENO format to HMP format
#'
#' @param tsv the geno format of SNPs (that the output format of novoSNP)
#' @param genename Genename of SNPs
#'
#' @return A date frame of SNPs in HMP format
#' @export
#'
#' @examples data(E5b_geno)
#' GenoToHmp(E5b_geno, "E5b")
GenoToHmp <- function(tsv, genename) {
  alleles <- NULL
  for (i in 1:ncol(tsv)) {
    alleles[i] <- unique(tsv[, i])[grep("/", unique(tsv[, i]))]
    tsv[, i] <- tsv[, i] %>%
      stringr::str_replace_all(c("A" = "AA", "C" = "CC", "T" = "TT", "G" = "GG",
                                 "[:alpha:]/[:alpha:]" = ""))
    tsv[tsv == ""] <- "NN"
  }
  pos <- colnames(tsv)
  rs <- paste0(genename, pos)
  hmp <- cbind.data.frame(rs, alleles, chr = NA, pos, family1 = NA, class = NA,
                          male = NA, female = NA, group = NA, other = NA,
                          sf = NA, t(tsv))
  return(hmp)
}
