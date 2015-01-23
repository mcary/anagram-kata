class AnagramFinder
  def initialize(io)
    self.io = io
  end

  def anagrams
    words = io.readlines.map(&:chomp)
    word = words.first
    if word
      anas = word.chars.permutation.select do |chars|
        w = chars.join
        w != word && words.include?(w)
      end

      if anas.any?
        [anas]
      else
        []
      end
    else
      []
    end
  end

  private

  attr_accessor :io
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

  it "finds one anagram among: dad, add" do
    count = finder_for("dad\nadd").anagrams.count
    expect(count).to eq 1
  end

  def finder_for(str)
    AnagramFinder.new(StringIO.new(str))
  end
end
