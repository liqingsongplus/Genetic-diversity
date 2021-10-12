#' LD block heatmap
#'
#' ld_plot() is used to produce a graphical display, as a heat map, of pairwise
#'  linkage disequilibrium (LD) measurements for SNPs.
#' @param data A genotype frame of SNPs in HMP format
#' @param pos The position of snps on chromosomes
#'
#' @return The file named LDheatmap.pdf will be generated in the current
#' directory.
#' @export
#'
#' @examples
#' library(genetic) # 加载包
#' data("E5b_hmp") # 读取数据
#' ld_plot(E5b_hmp, E5b_hmp$pos) # 在当前文件夹下生成LDheatmap.pdf
ld_plot <- function(data, pos) {
  row.names(data) <- pos
  snpdata <- as.data.frame(t(data[, -c(1:11)]))
  for (i in seq_len(ncol(snpdata))) {
    for (j in seq_len(nrow(snpdata))) {
      snpdata[j, i] <- gsub("([A-Z])([A-Z])", "\\1/\\2", snpdata[j, i])
      snpdata[j, i] <- gsub("N/N", "", snpdata[j, i])
    }
  }
  for (i in seq_len(ncol(snpdata))) {
    snpdata[, i] <- genetics::as.genotype(snpdata[, i])
  }
  color.rgb <- colorRampPalette(rev(c("white", "red")), space = "rgb")
  pdf("LDheatmap.pdf")
  LDheatmap::LDheatmap(snpdata, as.numeric(pos),
    color = color.rgb(10), flip =
      TRUE, SNP.name = colnames(snpdata), LDmeasure = "D'"
  )
  dev.off()
}
