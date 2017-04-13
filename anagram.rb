require './lib/solver'

dictionary = []

File.open('dictionary.txt', 'r').each_line do |line|
  dictionary << line.strip
end

as = AnagramSolver.new(dictionary)
as.solve

anagram_file = File.new('anagrams.txt', 'w+')
ananagram_file = File.new('ananagrams.txt', 'w+')

as.anagrams.sort{|a, b| a[0] <=> b[0]}.each {|set| anagram_file << "#{set.join(', ')}\n"}
as.ananagrams.sort.each {|word| ananagram_file << "#{word}\n"}

anagram_file.close
ananagram_file.close
