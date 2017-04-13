class AnagramSolver
  attr_reader :anagrams, :ananagrams
  def initialize(input)
    @dict = normalize_collection(input).sort{|a, b| a[1] <=> b[1]}
    @anagrams, @ananagrams = [], []
  end

  def normalize_collection(input)
    input.map {|word| [word, normalize(word)]}
  end

  def normalize(word)
    word.downcase.split('').sort.join
  end

  def solve
    while @dict.length > 0
      chunk = [@dict.shift]
      chunk << @dict.shift while @dict[0] && chunk[0][1] == @dict[0][1]
      chunk.length == 1 ? @ananagrams << chunk[0][0] : @anagrams << chunk.map{|w| w[0] }
    end
  end
end
