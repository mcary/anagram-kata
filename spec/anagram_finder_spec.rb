class AnagramFinder
  def initialize(io)
  end

  def anagrams
    []
  end
end

describe "AnagramFinder" do
  it "intializes with io" do
    finder_for("")
  end

  it "finds no anagrams among no words" do
    count = finder_for("").anagrams.count
    expect(count).to eq 0
  end

  it "finds no anagrams among one word" do
    count = finder_for("foo").anagrams.count
    expect(count).to eq 0
  end

  def finder_for(str)
    AnagramFinder.new(StringIO.new(str))
  end
end
