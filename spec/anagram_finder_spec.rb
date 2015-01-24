class AnagramFinder
  def initialize(io)
    self.io = io
  end

  def anagrams
    words = io.readlines.map(&:chomp)
    result = []
    words.each do |word|
      anas = permutations(word).select do |w|
        w != word && words.include?(w)
      end

      if anas.any?
        anas.push word
        anas = anas.sort
        unless result.include? anas
          result.push anas
        end
      end
    end
    result
  end

  private

  attr_accessor :io

  def permutations(word)
    # The to_a.uniq is because duplicate letters result in duplicate
    # entries: "foo"'s permutation include "foo" and "foo" again, but
    # with the "o"'s reversed in the 2nd instance.
    word.chars.permutation.to_a.uniq.map(&:join)
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
