class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 1 if self.length == 0
    hashed = 0
    self.each_with_index do |el, i|
      hashed += (2 ** i) * el.hash
    end
    hashed
  end
end

class String
  def hash
    self.bytes.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashed = 0
    self.each do |k,v|
      hashed += k.object_id * v.hash
    end
    hashed
  end
end
