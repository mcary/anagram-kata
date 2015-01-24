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
