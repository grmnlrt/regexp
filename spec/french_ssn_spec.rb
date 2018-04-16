require_relative "../french_ssn"

describe "#french_ssn_info" do
  it "should return 'number invalid' when passed empty string" do
    result = french_ssn_info("")
    expected = "invalid number"
    expect(result).to eq expected
  end

  it "should return 'a man born in december 1984, in Seine-Maritime' when passed 1 84 12 76 451 089 46" do
    result = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a man born in December 1984, in Seine-Maritime"
    expect(result).to eq expected
  end
end

describe "#what_gender" do
  it "should return 'woman' when passed 2" do
    result = what_gender("2")
    expected = "woman"
    expect(result).to eq expected
  end

  it "should return ''man'when passed 1" do
    result = what_gender("1")
    expected = "man"
    expect(result).to eq expected
  end
end


describe "#what_month" do
  it "should return 'January' when passed 01" do
    result = what_month("01")
    expected = "January"
    expect(result).to eq expected
  end

  it "should return 'February' when passed 02" do
    result = what_month("02")
    expected = "February"
    expect(result).to eq expected
  end
end

describe "#what_department" do
  it "should return 'Seine-Maritime' when passed 76" do
    result = what_department("76")
    expected = "Seine-Maritime"
    expect(result).to eq expected
  end

  it "should return 'Paris' when passed 75" do
    result = what_department("75")
    expected = "Paris"
    expect(result).to eq expected
  end
end

