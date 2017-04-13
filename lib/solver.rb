class AnagramSolver
  attr_reader :anagrams, :ananagrams
  def initialize(input)
    @dict = normalize_collection(input).sort{|a, b| a[1] <=> b[1]} #sorting after normalizing means all words in a set of anagrams will be adjacent
    @anagrams, @ananagrams = [], []
  end

  def normalize_collection(input)
    input.map {|word| [word, normalize(word)]}
  end

  def normalize(word)
    word.downcase.split('').sort.join #2 words are anagrams iff normalize returns the same for both
  end

  def solve
    while @dict.length > 0
      chunk = [@dict.shift]                                                              #sample
      chunk << @dict.shift while @dict[0] && chunk[0][1] == @dict[0][1]                  #take anagrams of sample until none remain
      chunk.length == 1 ? @ananagrams << chunk[0][0] : @anagrams << chunk.map{|w| w[0] } #if we still only have the sample, there were no anagrams
    end
  end
end
