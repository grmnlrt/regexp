require_relative "../french_ssn"

describe "#french_ssn_info" do
  it "should return 'The number is invalid' when passed an empty string" do
    actual = french_ssn_info('')
    expected = "The number is invalid"
    expect(actual).to eq(expected)
  end

  it "should return 'a man, born in December 1984, in Seine-Maritime' when passed '1 84 12 76 451 089 46'" do
    actual = french_ssn_info('1 84 12 76 451 089 46')
    expected = "a man, born in December 1984, in Seine-Maritime"
    expect(actual).to eq(expected)
  end
end

describe "#gender" do
  it "should return 'man' when passed '1'" do
    actual = gender('1')
    expected = "man"
    expect(actual).to eq(expected)
  end

  it "should return 'woman' when passed '2'" do
    actual = gender('2')
    expected = "woman"
    expect(actual).to eq(expected)
  end
end

describe "#month" do
  it "should return 'January' when passed '1'" do
    actual = month("1")
    expected = "January"
    expect(actual).to eq(expected)
  end

  it "should return 'June' when passed '6'" do
    actual = month("6")
    expected = "June"
    expect(actual).to eq(expected)
  end
end

describe "#department" do
  it "should return 'Seine-Maritime' when passed '76'" do
    actual = department('76')
    expected = 'Seine-Maritime'
    expect(actual).to eq(expected)
  end

  it "should return 'Doubs' when passed '25'" do
    actual = department('25')
    expected = 'Doubs'
    expect(actual).to eq(expected)
  end
end

describe "#valid_key?" do
  it "should return true if passed '1 84 12 76 451 089 46', '46'" do
    valid_key = valid_key?('1 84 12 76 451 089 46', '46')
    expect(valid_key).to be(true)
  end

  it "should return false if passed '1 84 12 76 451 089 47', '47'" do
    valid_key = valid_key?('1 84 12 76 451 089 47', '47')
    expect(valid_key).to be(false)
  end
end

