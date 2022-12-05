local base = {}

function base.digitalWidth(n, b)
	local b = b or 10

	return math.ceil(log(n, b))
end

function base.tostr(n, b)
	local b = b or 10
	local numerals = "01234567890"
	local s = ""

	for i = 0, base.digitalWidth(n, b) - 1 do
		local d = math.abs(math.floor((n / b^i) % b))
		print(d)
		s = numerals:sub(d + 1, d + 1) .. s
	end

	return s
end

return base
