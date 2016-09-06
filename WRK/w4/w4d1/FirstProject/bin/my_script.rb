require 'addressable/uri'
require 'rest-client'
require 'byebug'
# require_relative '../app/models/user.rb'

def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.html',
      query_values: {
       'some_category[a_key]' => 'another value',
       'some_category[a_second_key]' => 'yet another value',
       'some_category[inner_inner_hash][key]' => 'value',
       'something_else' => 'aaahhhhh'
     }
    ).to_s

    # puts RestClient.get('http://localhost:3000/users?some_cateo')
    puts RestClient.get(url)
end

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: name, email: email } }
  )
end

def show_user(id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}"
  ).to_s

  puts RestClient.get(
    url
  )
end

def update(id, options = {})
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}"
  ).to_s

  puts RestClient.patch(
    url,
    { user: options}
  )
end

def destroy(id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}"
  ).to_s

  puts RestClient.delete(
    url

  )
end

# create_user("hello", "gizmo@shdfj.gizmo")
 # update(1, {email: "jello"})
begin
  show_user(2)
  destroy(2)
rescue Exception => e
  puts e.message
end
