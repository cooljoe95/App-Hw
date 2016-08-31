puts 'Input your email: '
email = gets.chomp

user = User.find_by(email: email)
raise "Email not Found" if user.nil?

puts 'What do your want to do?'
puts '0. Create shortened URL'
puts '1. Visit shortened URL'
choice = gets.chomp.to_i

if choice == 0
  puts 'Type in your long url'
  long_url = gets.chomp

  short_url = ShortenedUrl.create_for_user_and_long_url!(user, long_url)

  puts "Short url is: #{short_url['short_url']}"
  puts "Goodbye!"
elsif choice == 1
  puts "Type in the short url: "
  short_url = gets.chomp
  url_object = ShortenedUrl.find_by(short_url: short_url)
  long_url = url_object['long_url']
  puts "Launching #{long_url}..."
  Visit.record_visit!(user, url_object)
  Launchy.open("#{long_url}")
  puts "Goodbye!"
end
