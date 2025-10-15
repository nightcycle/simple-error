--!strict
-- Services
-- Packages
-- Modules
-- Types
export type SimpleError<T> = {
	Type: T,
	Message: string,
}

-- Constants
-- Variables
-- References
-- Private Functions
-- Class
local SimpleError = {}
SimpleError.__index = SimpleError

function SimpleError:__tostring()
	return `SimpleError<"{self.Type}">("{self.Message}")`
end

local lib = {}

function lib.new<T>(type: T, message: string): SimpleError<T>
	local out = {
		Type = type,
		Message = message,
	}
	setmetatable(out, SimpleError)
	table.freeze(out)

	return out :: any
end

return lib
