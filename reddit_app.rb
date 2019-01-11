require 'http'

response = HTTP.get("https://www.reddit.com/r/programming.json")

data = response.parse["data"]

data["children"].each do |child|
  p child["data"]
  p ""
end