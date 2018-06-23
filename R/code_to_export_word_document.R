bookdown::preview_chapter(c("01-intro.Rmd","02-method.Rmd","03-result.Rmd","04-discussion.Rmd","05-conclusion.Rmd","06-references.Rmd"),
                          output_format = "bookdown::word_document2",
                          output_file = paste0("report", format(Sys.Date(), ("%d-%m-%y")), ".docx"),
                          output_dir = "chapter-previews",
                          output_options = list(reference_docx = "chapter-previews/my_style.docx"))




rmarkdown::render_site(output_format = 'bookdown::pdf_book', encoding = 'UTF-8')





rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')



#merge pdf in R
pdfMerge <- function(doc1, doc2, filename="final.pdf"){
  system2("C:/Program Files (x86)/PDFtk Server/bin/pdftk.exe", paste(doc1, doc2, "cat output", filename))
}

doc1 <- "_book/master2.pdf"
doc2 <- "_book/appendix.pdf"
pdfMerge(doc1,doc2, "master2_final.pdf")

system2("C:/Program Files (x86)/PDFtk Server/bin/pdftk.exe", "_book/master2.pdf _book/appendix.pdf cat output final2.pdf")
