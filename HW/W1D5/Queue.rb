class Queue

	def initialize
		@queue = []
	end

	def enqueue(el)
		@queue.concat([el])
	end

	def dequeue
		@queue.shift
	end

	def show
		return nil if @queue.empty?
		@queue
	end

end


j = Queue.new
j.enqueue('hi')
j.enqueue("how")
j.enqueue("are")
j.enqueue("you")
p j.show
p j.dequeue
p j.dequeue
j.enqueue("bill")
p j.show
p j.dequeue
p j.dequeue
p j.dequeue
p j.dequeue
p j.show
