require "date"
require 'yaml'

# Write a #french_ssn_info method extracting infos from French SSN (Social Security Number) using regexp.
# example of numbers :
#   1 84 12 76 451 089 46
#   2 86 10 75 114 511 75
#   194073765893575
#   289027545108989

def french_ssn_info(ssn_number)
  # TODO
  pattern = /^(?<gender>[12])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<zip>\d{2}|2[AB])\s?\d{3}\s?\d{3}\s?(?<key>\d{2})/
  match_data = ssn_number.match(pattern)
  if match_data
    # TODO: implement fonction
    gender = what_gender(match_data["gender"])
    year = "19#{match_data["year"]}"
    month = what_month(match_data["month"])
    zip = what_department(match_data["zip"])
    # key =
    return "a #{gender} born in #{month} #{year}, in #{zip}"
  else
      return "invalid number"
  end
end

def what_gender(number)
  number == "1" ? "man" : "woman"
end

def what_month(number)
  integer = number.to_i
  Date::MONTHNAMES[integer]
end

def what_department(number)
  departments = YAML.load_file('data/french_departments.yml')
  return departments[number]
end
