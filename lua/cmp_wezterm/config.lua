---@class CmpWeztermOptions
---@field keyword_pattern? string
---@field label? string
---@field trigger_characters? string[]

---@class CmpWeztermRawConfig
---@field keyword_pattern string
---@field label string
---@field trigger_characters string[]
local default_config = {
  keyword_pattern = [[\w\+]],
  label = "[wez]",
  trigger_characters = { "." },
}

---@class CmpWeztermConfig: CmpWeztermRawConfig
local Config = {}

---@return nil
Config.set = function()
  local cfg = require("cmp.config").get_source_config "wezterm"
  local extended = vim.tbl_extend("force", default_config, (cfg or {}).option or {})
  vim.iter(pairs(extended)):each(function(k, v)
    Config[k] = v
  end)
end

return Config
