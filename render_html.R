rmarkdown::render("housing_nationalism.Rmd", BiocStyle::html_document())

text <- read_lines(here::here("housing_nationalism.html"))
text <- text |> gsub(", NULL| and NULL","",x=_)
header_end <- which(grepl('class="date"',text))
text <- c(text[1:header_end],
          "<h4 style='font-size: 14.5pt;font-weight: bold;text-indent: 0;'>The Version of Record of this manuscript has been published and is available in Journal of Ethnic and Migration Studies 2023-12-20 <a href='http://dx.doi.org/10.1080/1369183X.2023.2293635' target='blank_'>DOI:10.1080/1369183X.2023.2293635</a>)</h4>",
          text[(header_end+1):length(text)])
text[grepl("Appendix",text)] <- ""

#text <- text |> gsub('\\\\label[^\\}]+\\}',"",x=_)
#text <- text |> gsub('\\(#fig:[^\\)]+\\)',"",x=_)
#text <- text |> gsub('<span class="math inline">[^<]+</span>',"xxx",x=_)

text |> write_lines(here::here("index.html"))
unlink(here::here("housing_nationalism.html"))
