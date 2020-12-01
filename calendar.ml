open Latex

module Current = Language.Current

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
  | Jan -> Current.short_jan
  | Feb -> Current.short_feb
  | Mar -> Current.short_mar
  | Apr -> Current.short_apr
  | May -> Current.short_may
  | Jun -> Current.short_jun
  | Jul -> Current.short_jul
  | Aug -> Current.short_aug
  | Sep -> Current.short_sep
  | Oct -> Current.short_oct
  | Nov -> Current.short_nov
  | Dec -> Current.short_dec

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
  | Present -> Current.present

let long_date_latex = function
  | YearMonth (m, y) -> long_month m ^^ text " " ^^ latex_of_int y
  | Year y -> latex_of_int y
  | Present -> Current.present
