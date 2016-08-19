class Map

	def initialize
		@my_map = []
	end

	def assign(key, value)
		array = lookup(key)
		return array[1] = value unless array.nil?
		@my_map << [key, value]
	end

	def lookup(key)
		@my_map.each do |ar|
			return ar if ar[0] == key
		end
		nil
	end

	def remove(key)
		@my_map.each_with_index do |el, i|
			if el[0] == key
				@my_map = @my_map.take(i).concat(@my_map.drop(i+1))
				return
			end
		end
	end

	def show
		@my_map
	end

end
map = Map.new
map.assign("hi", "joe")
p map.show
map.assign("What", "is up?")
map.assign("What", "is happening?")
p map.show
map.assign(1,"ferry")
map.assign(3,4)
p map.show
map.remove(3)
p map.show
