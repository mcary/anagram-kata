class AnagramFinder
  def initialize(io)
  end
end

describe "AnagramFinder" do
  it "intializes with io" do
    finder_for("")
  end

  def finder_for(str)
    AnagramFinder.new(StringIO.new(str))
  end
end
