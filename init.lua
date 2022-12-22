local function isModuleAvailable(name)
	if package.loaded[name] then
		return true
	else
		for _, searcher in ipairs(package.loaders) do
			local loader = searcher(name)
			if type(loader) == 'function' then
				package.preload[name] = loader
				return true
			end
		end
		return false
	end
end

local function load_script(name)
	local ok, _ = pcall(require, name)
	if not ok then
		print('Failed to load ' .. name)
	end
end

require('config.options')
if isModuleAvailable('dracula') then
	load_script('config.dracula')  -- has to be done before the plugin loads
end
--load_script('load_impatient')
load_script('config.plugins')
require('config.keybinds')
