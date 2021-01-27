-- load and parse the toml file
T = require "toml"
f = assert(io.open("data.toml", "r")):read("*all")
data = T.parse(f)

local function first_name()
   return data.info.first_name
end

local function last_name()
   return data.info.last_name
end

local function phone()
   return data.info.phone
end

local function email()
   return data.info.email
end

local function website()
   return data.info.website
end

local function education()
   return {
      date = data.education.when,
      degree = data.education.degree,
      university = data.education.university,
      location = data.education.city,
      descriptions = data.education.descriptions
   }
end

return {
   first_name = first_name,
   last_name = last_name,
   phone = phone,
   email = email,
   website = website,
   education = education
}
