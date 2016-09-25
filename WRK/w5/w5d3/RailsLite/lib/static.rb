require 'byebug'
class Static
  def initialize(app)
		@app = app
  end

  def call(env)
		# debugger
		# @app.call(env)
		# path = Regexp.new("^/public$")
  end
end
