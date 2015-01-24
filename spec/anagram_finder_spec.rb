require 'anagram_finder'

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

  it "finds one anagram among: dad, add" do
    count = finder_for("dad\nadd").anagrams.count
    expect(count).to eq 1
  end

  it "outputs anagram correctly" do
    anas = finder_for("dad\nadd").anagrams
    expect(anas.first.sort).to eq ["add", "dad"]
  end

  it "finds two anagrams among: dad, add, eat, ate" do
    count = finder_for("dad\nadd\neat\nate").anagrams.count
    expect(count).to eq 2
  end

  it "outputs two anagrams correctly" do
    anas = finder_for("dad\nadd\neat\nate").anagrams
    expect(anas.sort.map(&:sort)).to eq [["add", "dad"], ["ate", "eat"]]
  end

  def finder_for(str)
    AnagramFinder.new(StringIO.new(str))
  end
end
