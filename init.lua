local hilbish = require 'hilbish'
-- if someone changes runner after this itll use the wrong one
-- solution? hook the setCurrent function!
local oldRunner = hilbish.runner.getCurrent and hilbish.runner.getCurrent() or 'hybrid'
local oldSetCurrent = hilbish.runner.setCurrent
function hilbish.runner.setCurrent(mode)
	if mode ~= 'linkAction' then oldRunner = mode end
	oldSetCurrent(mode)
end

local c = {
	git = 'git clone '
}

local domains = {
	['github.com'] = c.git,
	['gitlab.com'] = c.git,
}

-- TODO
-- local protocols = {}

hilbish.runner.add('linkAction', {
	run = function(input)
		local protocol, domain = input:match '^(%w+://)(%w+%.%w+)'
		if not protocol then
			return hilbish.runner.exec(input, oldRunner)
		end

		local cmd = domains[domain]
		if not cmd then
			return {
				-- dont return input to not clutter history
				exitCode = 1,
				err = 'link not supported by link.hsh link action! you can request this if you think it\'s good to be added'
			}
		end

		local exec = cmd .. input
		local exit = hilbish.run(exec)
		return {
			input = exec,
			exitCode = exit
		}
	end
})

