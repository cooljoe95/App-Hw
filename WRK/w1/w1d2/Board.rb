class Board

  attr_reader :grid

  ROWS = 3
  COLUMNS = 4

  def initialize
    @grid = Array.new(ROWS) { [] }
    populate

  end

  def populate
    cards = []
    2.times do
      (1..(ROWS * COLUMNS / 2)).each { |value| cards << Card.new(value) }
    end
    cards = cards.shuffle
    @grid.each do |row|
      COLUMNS.times do
        row << cards.shift
      end
    end

  end

  def render
    @grid.each do |row|
      row.each do |card|
        print card.to_s
      end
      puts
    end
  end

  def won?
    @grid.each do |row|
      return false if row.any?{|card| card.hidden}
    end
    true
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def reveal(guessed_pos)
    card = @grid[guessed_pos].first
    if(card.hidden)
      card.reveal
      return card.value
    end
  end

end
