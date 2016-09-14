require 'erb'
require 'byebug'
class ShowExceptions
  def initialize(app)
    @app = app
  end
  attr_reader :app

  def call(env)
    begin
      app.call(env) # What is this doing. It is trying to do something illegal, but why is the env passed in
    rescue Exception => e
      @exception = e
      render_exception(e)
      path = "lib/templates/rescue.html.erb"
      html = ERB.new(File.read(path)).result(binding)
      return ["500", {"Content-type"=>"text/html"}, [html, @exception.class.to_s]]
    end
  end

  private

  def render_exception(e)
  end

end
