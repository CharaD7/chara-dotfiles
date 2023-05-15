---@diagnostic disable: undefined-global
local status_ok, code_runner = pcall(require, 'code-runner')
if not status_ok then return end

code_runner.setup {
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		javascript = "node",
		python = "python3 -u",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
	},
}
