# Write a #french_ssn_info method extracting infos from French SSN (Social Security Number) using regexp.
# example of numbers :
#   1 84 12 76 451 089 46
#   2 86 10 75 114 511 75
#   194073765893575
#   2890275451089 89

require 'date'
require 'yaml'

SSN_REGEXP = /^(?<gender>[12])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<zip>\d{2}|2[AB])\s?\d{3}\s?\d{3}\s?(?<key>\d{2})/

def french_ssn_info(ssn_number)
  match_data = ssn_number.match(SSN_REGEXP)
  if match_data && valid_key?(ssn_number, match_data[:key])
    gender = gender(match_data[:gender])
    month = month(match_data[:month])
    year = "19#{match_data[:year]}"
    department = department(match_data[:zip])
    return "a #{gender}, born in #{month} #{year}, in #{department}"
  else
    return "The number is invalid"
  end
end

def gender(code)
  return code == "1" ? "man" : "woman"
end

def month(code)
  return Date::MONTHNAMES[code.to_i]
end

def department(code)
  departments = YAML.load_file('data/french_departments.yml')
  return departments[code]
end

def valid_key?(ssn, key)
  ssn_without_key = ssn.delete(' ')[0..12].to_i
  return (97 - ssn_without_key) % 97 == key.to_i
end
