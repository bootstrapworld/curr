#lang curr/lib

@main-contents{
@(elem #:style bs-coursename-style "Bootstrap:Algebra")

@boxed-text{@animated-gif{splash.png}gibber@(hyperlink "../../Standards.shtml" "gibber")gibber}

@bold{@(hyperlink "https://www.bootstrapWorld.org/workshops" "gibber")}

@; workbook link names and targets
gibber@italic{gibber}gibber
@(apply itemlist
        (append
         (for/list ([n (in-range 1 (add1 9))])
           (unit-summary/links n))
         (list 
          @summary-item/unit-link["gibber" "units/Supplemental/index"]{
          gibber}
          )
         (list
          ;;???
          @summary-item/no-link["Gibber gibber Gibber"]{
           @lulu-button[]
           gibber@hyperlink["http://www.lulu.com/commerce/index.php?fBuyContent=14790241" "gibber"], 
               gibber @hyperlink["resources/workbook/StudentWorkbook.pdf" "gibber"].  gibber
           @hyperlink["https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0"]{gibber}. }
           
          @item{@italic{gibber} 
           @hyperlink["mailto:contact@bootstrapworld.org" "gibber"] gibber}
          )
         )
         #:style "BSUnitList"
)

gibber
@itemlist[#:style "BSResourceList"
        @item{@(hyperlink "resources/teachers/index.shtml" "gibber" ) gibber}
               ;;???
          @summary-item/custom["Gibber gibber Gibber" @(list (hyperlink "https://groups.google.com/d/forum/bootstrap-announce" "gibber")
                                                       (hyperlink "https://groups.google.com/d/forum/bootstrap-discuss" "gibber"))]{
            gibber}
]
            
@(copyright)
}
