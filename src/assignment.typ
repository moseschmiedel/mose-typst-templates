#import "utils.typ": sans, bold

#let template(
  title, 
  course: none,
  university: none, 
  authors: (none,),
  date: none,
  break-on-heading: true,
  doc
) = {
  let header = [
    #set par(spacing: .6em)

      #bold[
        #smallcaps(title)
        #h(1fr)
        #university
      ]

      #authors.join(" ")
      #h(1fr)
      #course
  ]

  set page(
    paper: "a4",
    margin: (left: 3cm, top: 2.5cm, right: 2.5cm, bottom: 2.5cm),
    header: context [
      #if counter(page).get().first() > 1 [
        #header
      ] 
    ],
  )

  set par(justify: true)
  show heading: set text(
    font: "Source Sans 3",
  )

  let exercise-counter = counter("mtt-exercises")

  show heading.where(level: 1): it => text(24pt, smallcaps(it))
  show heading.where(level: 2): it => text(16pt, smallcaps(it))

  show heading.where(level: 2): it => {
    context {
      if break-on-heading and exercise-counter.get().first() > 0 {
        pagebreak()
      }
      exercise-counter.step()
    }
    it
  }

  set text(
    font: "Source Serif 4",
    size: 11pt,
  )

  {
    set text(12pt)

    block[
      #align(horizon)[
        #smallcaps(course)
        #h(1fr)
        #date
      ]
    ]

    align(center, 
      block[
        = #title 
        #text(14pt)[#authors.join(" ")]
      ]
    )
  }
  
  v(2em)

  doc
}