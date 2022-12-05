#!/usr/bin/env lua

local maux = require("maux")
local metc = require("maux").etc

-- metc.isPrime(127)
-- metc.isPrime(33)
-- metc.isPrime(201)
-- metc.isPrime(32)
-- metc.isPrime(7901)
-- metc.isPrime(7883)
for i = 0, 5000 do
	printf("%d: %s\n", i, metc.isPrime(i))
end

