require("mason-nvim-dap").setup({
	automatic_setup = true,
	handlers = {
		function(config)
			-- all sources with no handler get passed here

			-- Keep original functionality
			require("mason-nvim-dap").default_setup(config)
		end,

		["javadbg"] = function(config)
			config.adapters = {
				type = "executable",
				command = "~/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar",
			}

			require("mason-nvim-dap").default_setup(config) -- don't forget this!
		end,
		-- python = function(config)
		--     config.adapters = {
		--      args = {
		--       "-m",
		--       "debugpy.adapter",
		--      },
		--     }
		--     require('mason-nvim-dap').default_setup(config) -- don't forget this!
		-- end,
	},
})
-- require("mason-nvim-dap").setup_handlers()

-- local dap = require("dap")
-- dap.adapters.java = {
-- 	type = "executable",
-- 	command = "~/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar",
-- }
-- require 'mason-nvim-dap'.setup_handlers {
--     function(source_name)
--       -- all sources with no handler get passed here
--       -- Keep original functionality of `automatic_setup = true`
--       require('mason-nvim-dap.automatic_setup')(source_name)
--     end,
--     python = function(source_name)
--         dap.adapters.python = {
-- 	        type = "executable",
-- 	        command = "/usr/bin/python3",
-- 	        args = {
-- 		        "-m",
-- 		        "debugpy.adapter",
-- 	        },
--         }

--         dap.configurations.python = {
-- 	        {
-- 		        type = "python",
-- 		        request = "launch",
-- 		        name = "Launch file",
-- 		        program = "${file}", -- This configuration will launch the current file if used.
-- 	        },
--         }
--     end,
-- }
