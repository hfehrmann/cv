open Latex

type month =
  | Jan
  | Feb
  | Mar
  | Apr
  | May
  | Jun
  | Jul
  | Aug
  | Sep
  | Oct
  | Nov
  | Dec

let short_month = function
  | Jan -> text "Jan"
  | Feb -> text "Feb"
  | Mar -> text "Mar"
  | Apr -> text "Apr"
  | May -> text "May"
  | Jun -> text "Jun"
  | Jul -> text "Jul"
  | Aug -> text "Aug"
  | Sep -> text "Sep"
  | Oct -> text "Oct"
  | Nov -> text "Nov"
  | Dec -> text "Dec"

let long_month = function
  | Jan -> text "January"
  | Feb -> text "February"
  | Mar -> text "March"
  | Apr -> text "April"
  | May -> text "May"
  | Jun -> text "June"
  | Jul -> text "July"
  | Aug -> text "August"
  | Sep -> text "September"
  | Oct -> text "October"
  | Nov -> text "November"
  | Dec -> text "December"

type date =
  | YearMonth of (month * int)
  | Year of int
  | Present

let short_date_latex = function
  | YearMonth (m, y) -> short_month m ^^ text ". " ^^ latex_of_int y
  | Year y -> latex_of_int y
  | Present -> text "Present"

let long_date_latex = function
  | YearMonth (m, y) -> long_month m ^^ text " " ^^ latex_of_int y
  | Year y -> latex_of_int y
  | Present -> text "Present"
