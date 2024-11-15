#import "utils.typ": sans

#let template(
  title, 
  course: none,
  university: none, 
  authors: (),
  date: none,
  doc
) = {
  set page(
    paper: "a4",
    header: [
      #title
      #v(1fr)
      #university
    ],
  )

  set par(justify: true)
  show heading: set text(
    font: "Source Sans 3",
  )

  set text(
    font: "Source Serif 4",
    size: 11pt,
  )

  [
    = #title
    #authors.join(" ")
    #date
  ]

  doc
}