require 'json'
require 'byebug'
class Flash

  def initialize(req)
    debugger
    @req = req
    if req.cookies["_rails_lite_app_flash"]
      # Store the cookies found in the request and interpret using JSON
      # Does not get resaved, and therefore lost (not persisted)
      @prev_params = JSON.parse(req.cookies["_rails_lite_app_flash"])
    else
      @prev_params = {} #need for line 20 not to throw error
    end
    # Need this one for the cookie we will store this session
    @cur_params = {}
  end

  def []=(key, val)
    # When we set the flash, we want it to persist to the next one
    @cur_params[key.to_s] = val
  end

  def [](key)
    # Looks in any of the three variables for the key to display
    val = @cur_params[key.to_s].nil? ? @prev_params[key.to_s] : @cur_params[key.to_s]
    return val unless val.nil?
    return now[key.to_s]
  end

  def store_flash(res)
    hash = {}
    hash[:path] = '/'
    hash[:value] = @cur_params.to_json # Only storred the cur params because those are the ones we'd like to persist
    res.set_cookie("_rails_lite_app_flash", hash)
  end

  def now
    @now_params ||= {} # Only available this request cycle
  end

end
