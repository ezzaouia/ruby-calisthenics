module FunWithStrings
  def palindrome?
    (self.is_a? String) && (self.gsub(/[^a-zA-Z]/, '').downcase.reverse == self.gsub(/[^a-zA-Z]/, '').downcase)
  end
  def count_words
    words_count = {}
    return words_count if ( self.to_s == '')
    self.downcase.gsub!(/[^a-zA-Z0-9]/, ' ').split(' ').each do |word|
      words_count[word] ||= 0
      words_count[word] += 1
    end
    words_count
  end

  def anagram_groups
    anagrams = []
    anagram = []
    return [] if ( self.to_s == '')
    self.gsub(/[^a-zA-Z0-9]/, ' ').split(' ').group_by{|w| w.downcase.each_char.sort}.values
  end

end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
