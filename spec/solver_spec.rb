require './lib/solver'

RSpec::Matchers.define :be_lowercase do
  match do |actual|
    actual == actual.downcase
  end
  failure_message do |actual|
    "expected #{actual} to be #{actual.downcase}"
  end
end

RSpec.describe AnagramSolver do
  before do
    @solver = AnagramSolver.new(['Dali', 'Laid', 'Better', 'Dial', 'Times', 'Brain', 'Items', 'Sun'])
    @solver.solve
  end

  describe "normalize" do
    it "downcases the word" do
      expect(@solver.normalize('CaSe')).to be_lowercase
    end

    it "returns a word" do
      expect(@solver.normalize('test')).to be_a(String)
    end

    it "sorts letters alphabetically" do
      expect(@solver.normalize('abc')).to eq('abc')
      expect(@solver.normalize('cba')).to eq('abc')
    end
  end

  describe "normalize_collection" do
    before do
      @normalized_array = @solver.normalize_collection(['test', 'case', 'strings'])
    end
    it "returns array of length(2) arrays" do
      expect(@normalized_array).to be_a(Array)
      expect(@normalized_array[0]).to be_a(Array)
      expect(@normalized_array[0].length).to eql(2)
    end

    it "subarrays are original word and normalized word" do
      expect(@normalized_array[0]).to eql(['test', @solver.normalize('test')])
    end

  end

  describe "solve" do
    it "groups anagrams correctly" do
      expect(@solver.anagrams).to eql([["Dali", "Laid", "Dial"], ["Times", "Items"]])
    end

    it "groups ananagrams correctly" do
      expect(@solver.ananagrams).to eql(["Brain", "Better", "Sun"])
    end
  end
end
