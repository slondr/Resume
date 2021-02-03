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
   local body = "\\begin{itemize}"
   for i,desc in pairs(data.education.descriptions) do
      body = body .. string.format("\\item{%s}", desc)
   end
   body = body .. "\\end{itemize}"
   return string.format("\\cventry{%s}{%s}{%s}{%s}{}{%s}",
			data.education.when,
			data.education.degree,
			data.education.university,
			data.education.city,
			body)
end

local function prog_langs()
   return data.skills.languages
end

local function web_dev()
   return data.skills.web
end

local function tech()
   return data.skills.tech
end

local function entries(obj)
   local ret = ""
   for i,exp in pairs(obj) do
      ret = ret .. string.format("\\cventry{%s}{%s}{%s}{%s}{}{\\begin{itemize}",
				 exp.when,
				 exp.title,
				 exp.employer,
				 exp.city)
      for i,desc_entry in pairs(exp.description) do
	 if desc_entry.has_tags then
	    ret = ret .. string.format("\\titem{%s}{%s}", desc_entry.text, desc_entry.tags)
	 else
	    ret = ret .. string.format("\\iitem{%s}", desc_entry.text)
	 end
      end
      ret = ret .. "\\end{itemize}}"
   end
   return ret
end
   
local function work()
   return entries(data.work)
end

local function leadership()
   return entries(data.leadership)
end

return {
   first_name = first_name,
   last_name = last_name,
   phone = phone,
   email = email,
   website = website,
   education = education,
   prog_langs = prog_langs,
   web_dev = web_dev,
   tech = tech,
   work = work,
   leadership = leadership
}
