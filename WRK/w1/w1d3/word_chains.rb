require 'set'

class WordChainer

  attr_reader :dictionary, :current_words, :all_seen_words

  def initialize(dictionary = File.readlines("dictionary.txt").map{|word| word.chomp})
    @dictionary = Set.new(dictionary)
  end

  def print
    p dictionary
  end

  def adjacent_words(word)
    result = []
    lett_arr = word.chars
    lett_arr.each_with_index do |word_letter, idx|
      ("a".."z").each do |letter|
        if lett_arr[idx] != letter
          lett_arr[idx] = letter
          if @dictionary.include?(lett_arr.join)
            result << lett_arr.join
          end
          lett_arr[idx] = word_letter
        end
      end
    end
    result
  end

  def explore_current_words(target)
    new_current_words = []

    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|

        unless @all_seen_words.has_key?(adjacent_word)
          new_current_words << adjacent_word
          @all_seen_words[adjacent_word] = current_word
          if adjacent_word == target
            return adjacent_word
          end
        end
      end
    end
    new_current_words
  end

  def run(source, target)

    @current_words = [source]
    @all_seen_words = {source => nil}
    until @current_words.empty?
      @current_words = explore_current_words(target)
      break if @current_words == target

    end
    @current_words == target
    build_path(target)
  end

  def build_path(target)
    came_from = @all_seen_words[target]
    final_arr = []
    until came_from == nil
      final_arr.insert(0, came_from)
      came_from = @all_seen_words[came_from]
    end
    final_arr << target
    puts final_arr
  end



end

j = WordChainer.new
j.run("ruby", "rock")
