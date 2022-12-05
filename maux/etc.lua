local etc = {}

function etc.powmod(base, exp, mod)
	local prod = 1

	for i = 1, exp do
		prod = (prod * base) % mod
	end

	return prod
end

-- assume `n` is odd and greater than 2
-- return false if composite
function etc.millerTest(n)
	local d = (n - 1)/2
	local s = 1

	while d % 2 == 0 do
		d = d / 2
		s = s + 1
	end

	for a = 2, math.min(n - 2, math.floor(2 * (math.log(n)^2))) do
		local y
		local x = etc.powmod(a, d, n)

		for i = 1, s do
			y = etc.powmod(x, 2, n)
			if y == 1 and x ~= 1 and x ~= n - 1 then
				return false
			end
			x = y
		end

		if y ~= 1 then
			return false
		end
	end
	return true
end

function etc.isPrime(n)
	if n == 2 then return true end
	if n % 2 == 0 then return false end
	
	-- https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test#Deterministic_variants
	local starWitnesses
	if n < 2047 then
		starWitnesses = {2}
	elseif n < 1373653 then
		starWitnesses = {2, 3}
	elseif n < 9080191 then
		starWitnesses = {31, 73}
	elseif n < 25326001 then
		starWitnesses = {2, 3, 5}
	elseif n < 4759123141 then
		starWitnesses = {2, 7, 61}
	elseif n < 3474749660383 then
		starWitnesses = {2, 3, 5, 7, 11, 13}
	elseif n < 341550071728321 then -- would have to be greater than 2^63-1 to continue, so we should be okay...
		starWitnesses = {2, 3, 5, 7, 11, 13, 17}
	end

	local d = (n-1)/2

	for _, a in pairs(starWitnesses) do
		local jury = etc.powmod(a, d, n)
		if jury ~= 1 and jury ~= n - 1 then
			return false
		end
	end
	return true
end

return etc

