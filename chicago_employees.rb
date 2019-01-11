require 'http'   #this is the name of the gem

response = HTTP.get("http://data.cityofchicago.org/resource/xzkq-xp2w.json")
employees = response.parse    #parse is not the meta information, just the body. taken apart and converted into Ruby


employees.each do |employee|     #whatever is after the do and before the end is the "block", "employee" block variables becomes the first hash in the Chicago Data array. 

name = employee["name"]
salary = employee["annual_salary"]
puts "#{name} makes #{salary}"

end


