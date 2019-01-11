require 'http'

system "clear"

width = 80

puts "Welcome to the Dictionary App"
puts "=" * width
puts ""

print "Enter a word: "
input_word = gets.chomp

puts ""

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{ input_word }/definitions?limit=10&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")       #AJAX request, web request inside of the code. 

puts ""
puts "Definitions".center(width)
puts "-" * width
puts ""

definitions = response.parse    #from JSON format to Ruby Format


list_number = 1

definitions.each do |definition|
  puts "   #{list_number} - #{definition["text"]} "
  puts ""

  list_number += 1
end

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{ input_word }/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
top_example = response.parse

puts ""
puts "Top Example".center(width)
puts "-" * width
puts ""

p top_example["text"]        #you do this here because you are working with a hash.


response = HTTP.get("https://api.wordnik.com/v4/word.json/#{ input_word }/pronunciations?useCanonical=false&limit=5&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

pronunciations = response.parse

puts ""
puts "Pronunciations".center(width)
puts "-" * width
puts ""

pronunciations.each do |pronunciation|        #you do pronunciations here because you are working with an array
  puts "• #{pronunciation["raw"]}" 
  puts ""        
end