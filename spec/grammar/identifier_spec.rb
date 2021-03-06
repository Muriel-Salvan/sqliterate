# coding: utf-8

describe SQLiterate::IdentifierParser do
  def parse(q)
    SQLiterate::IdentifierParser.new.parse q
  end

  def should_parse(q)
    r = parse q
    expect(r).not_to be_nil
    r
  end

  def should_reject(q)
    expect(parse q).to be_nil
  end

  it "parses simple identifier" do
    should_parse "my_$IdenTifieR_éあいうï"
  end

  it "rejects invalid identifier" do
    should_reject "my_invalid-IdenTifieR"
  end

  it "rejects keyword as identifier" do
    should_reject "select"
  end

  it "parses quoted identifier" do
    should_parse "\"select\""
  end
end
