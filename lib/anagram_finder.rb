class AnagramFinder
  def initialize(io)
    self.io = io
  end

  def anagrams
    words = io.readlines.map(&:chomp)
    groups = Hash.new { [] }
    words.each do |word|
      normalized = word.chars.sort.join
      groups[normalized] += [word]
    end
    groups.values.select {|g| g.size > 1 }
  end

  private

  attr_accessor :io
end
