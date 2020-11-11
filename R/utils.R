
#small_caps <- function(word = "meteorologia", ...){
small_caps <- function(word = "meteorologia"){
  string_font <- '<span style="font-variant:small-caps;">WORD</span>'

    word_sc <- gsub("WORD",
         as.character(word),
         string_font)

    #knitr::knit_print(as.character(word_sc), ...)
    word_sc
}
