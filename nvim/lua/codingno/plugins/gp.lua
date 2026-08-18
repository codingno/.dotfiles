-- lazy.nvim
return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      -- For customization, refer to Install > Configuration in the Documentation/Readme
      providers = {
        openai = { disable = true },
        googleai = {
          disable = false,
          endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
          secret =  os.getenv("GOOGLEAI_API_KEY"),
        },
      },
      -- default_command_agent = "Gemini 1.5 Flash",
      -- default_chat_agent = "Gemini 1.5 Flash",
    }
    require("gp").setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}
