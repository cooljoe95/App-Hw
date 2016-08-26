class String

  # n!
  def first_anagram?(string)
    chars = self.split("")
    strings = []
    rec_first(length - 1, chars, strings)
    strings.include?(string)
  end

  def rec_first(num, chars, strings)
    if num == 0
      strings << chars.join
    else
      (0..num).each do |i|
        chars[i], chars[num] = chars[num], chars[i]
        rec_first(num - 1, chars, strings)
        chars[i], chars[num] = chars[num], chars[i]
      end
    end
  end

  # n^2
  def second_anagram?(string)
    self_char = self.chars
    other_char = string.chars
    self_char.each_with_index do |el, i|
      loc_other = other_char.find_index(el)
      return false if loc_other.nil?
      other_char.delete_at(loc_other)
    end
    other_char.empty?
  end

  # n log n
  def third_anagram?(string)
    self.split("").sort == string.split("").sort
  end

  # n
  def fourth_anagram?(string)
    self_times = Hash.new(0)

    self.chars.each do |char|
      self_times[char] += 1
    end

    string.chars.each do |char|
      self_times[char] -= 1
    end

    self_times.values.all? { |el| el == 0 }
  end


end
