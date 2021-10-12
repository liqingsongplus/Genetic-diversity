
#' Genetic diversity
#'
#' You can use "diveristy()" to compute the genetic diversity of SNPs.
#' @param data A genotype frame of SNPs in HMP formate
#'
#' @return A data frame about genetic diversity that can discribe the SNPs.
#' @export
#'
#' @examples data("E5b_hmp")
#' diveristy(E5b_hmp)
diveristy <- function(data) {
  A1 <- data[, -c(1:11)]
  B <- NULL
  out <- NULL
  for (n in 1:nrow(A1)) {
    AA1 <- table(t(A1[n, ]))
    AA <- AA1[rownames(AA1) != "NN"]
    CC <- rbind(number = AA, frequency = AA / sum(AA))
    CC1 <- cbind.data.frame(
      Genotype = colnames(CC),
      frequency = round(CC[2, ], 4),
      number = CC[1, ]
    )
    B <- rbind(B, CC1)
    for (i in 1:nrow(AA)) {
      if (strsplit(rownames(AA), "")[[i]][1] !=
        strsplit(rownames(AA), "")[[i]][2]) {
        C <- sum(AA[[i]])
      } else {
        D1 <- max(AA[[i]])
      }
    }
    D2 <- (D1 + C / 2) / sum(AA)
    D3 <- 1 - D2
    MAF <- min(D2, D3)
    Ho <- C / sum(AA)
    He <- MAF * (1 - MAF) * 2
    PIC <- 1 - MAF^2 - (1 - MAF)^2 - 2 * (MAF^2) * ((1 - MAF)^2)
    out <- rbind.data.frame(out, c(
      data[n, 1], data[n, 4], data[n, 2],
      round(Ho, 4), round(He, 4), round(PIC, 4),
      round(MAF, 4)
    ))
    if (nrow(AA) == 2) {
      out <- rbind(out, NA)
    } else if (nrow(AA) == 3) {
      out <- rbind(out, NA, NA)
    }
  }
  colnames(out) <- c("dbSNP", "Position", "Ref/Alt", "Ho", "He", "PIC", "MAF")
  colnames(B) <- c("Genotype", "Freq_of_geno", "number")
  BB <- cbind(out, B)
  rownames(BB) <- NULL
  return(BB)
}
