class Stack

	def initialize
		@stack = []
	end

	def add(el)
		@stack << el
	end

	def remove
		return nil if @stack.empty?
		last_el = @stack[-1]
		@stack = @stack[0...-1]
		last_el
	end

	def show
		return nil if @stack.empty?
		@stack.dup
	end

end

j = Stack.new
j.add('hi')
j.add("how")
j.add("are")
j.add("you")
p j.show
p j.remove
p j.remove
j.add("bill")
p j.show
p j.remove
p j.remove
p j.remove
p j.remove
p j.show
