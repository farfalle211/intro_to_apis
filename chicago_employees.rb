require 'http'   #this is the name of the gem

response = HTTP.get("https://data.cityofchicago.org/resource/97wa-y6ff.json")   #HTTP is referring to the class inside the gem. 

drivers = response.parse    #parse is not the meta information, just the body. taken apart and converted into Ruby. Once it is parsed you can call any array method on it. 


drivers.each do |driver|     #whatever is after the do and before the end is the "block", "employee" block variables becomes the first hash in the Chicago Data array. 

name = driver["name"]
male = driver["sex"]
puts "#{name} is #{male}"

end

p drivers.count

