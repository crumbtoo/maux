#!/usr/bin/env lua

package.path = string.format("%s/maux/?.lua;", os.getenv("PWD")) .. package.path

function printf(fmt, ...)
	io.write(fmt:format(...))
end

if not MAUX_NO_GLOBALS then
	require("global")
end

return {
	etc = require("etc"),
	base = require("base"),
}

