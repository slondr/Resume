-- load and parse the toml file
T = require "toml"
f = assert(io.open("data.toml", "r")):read("*all")
data = T.parse(f)

local function get_first_name()
   return data.info.first_name
end

local function get_last_name()
   return data.info.last_name
end

return {
   get_first_name = get_first_name,
   get_last_name = get_last_name
}
