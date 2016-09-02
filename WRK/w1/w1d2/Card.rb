

class Card
  attr_reader :hidden, :value

  def initialize(value)
    @hidden = true
    @value = value
  end

  def hide
    @hidden = true
  end

  def reveal
    @hidden = false
  end

  def to_s
    if @hidden
      return "X"
    else
      return @value
    end
  end

  def ==(card)
    self.value == card.value
  end
end
