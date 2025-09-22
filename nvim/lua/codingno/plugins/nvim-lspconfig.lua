return {
	"neovim/nvim-lspconfig",
	config = function ()
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = require('cmp').config.window.bordered().border,  -- Use cmp's bordered window for hover
        winhighlight = "Normal:CmpDocumentation,CursorLine:CmpDocumentationSel,Search:None",  -- Optional styling
      }),
    }

    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

    end

		local lspconfig = require("lspconfig")
		lspconfig.gopls.setup({
      -- handlers = handlers,
      on_attach = on_attach,
      capabilities = capabilities,
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					usePlaceholders = true,
					completeUnimported = true,
					codelenses = {
						generate = true,
						gc_details = true,
						tidy = true,
						upgrade_dependency = true,
					},
					experimentalPostfixCompletions = true,
					buildFlags = {"-tags=integration"}
				},
			},
		});

    -- Konfigurasi Vacuum untuk efm
    local vacuum = {
      lintCommand = "vacuum lint --format json ${INPUT}",
      lintFormats = { "%f:%l:%c: %m" },
      lintIgnoreExitCode = true,
      lintSource = "vacuum",
      lintStdin = false,
      formatCommand = "", -- vacuum tidak punya formatter
      formatStdin = false,
    }

    lspconfig.efm.setup({
      init_options = { documentFormatting = false, documentRangeFormatting = false },
      filetypes = { 
        "yaml", 
        "json",
      },
      settings = {
        rootMarkers = { ".git/" },
        languages = {
          yaml = { vacuum },
          json = { vacuum },
        },
      },
    })

    lspconfig.tsserver.setup {
      handlers = handlers,
      on_attach = on_attach,
      root_dir = require('lspconfig.util').root_pattern("tsconfig.json"),
      capabilities = capabilities,
      -- init_options = {
      --   preferences = {
      --     disableSuggestions = true,
      --   }
      -- }
    }

    lspconfig.svelte.setup {
      on_attach = function(client, bufnr)
        -- optionally auto reload
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.svelte", "+*.ts" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end,
      capabilities = capabilities,
    }

    lspconfig.pyright.setup {
      handlers = handlers,
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
      on_init = function(client)
        local path = client.workspace_folders[1].name
        local venv = path .. '/.venv/bin/python'
        if vim.fn.executable(venv) == 1 then
          client.config.settings.python = {
            pythonPath = venv
          }
        end
      end,
    }

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { "+*.ts", "+*.js" },
      command = "set filetype=typescript",
    })

    -- List of LSP servers
    local servers = {
      'lua_ls',
      'marksman',
      'intelephense',
      'tailwindcss',
      'stimulus_ls',
      'yamlls',
    }

    -- Loop over the list of servers and set them up
    for _, lsp in ipairs(servers) do
      require('lspconfig')[lsp].setup {
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
		vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set('n', '<space>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
				-- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', '<space>f', function()
					vim.lsp.buf.format { async = true }
				end, opts)
			end,
		})
	end,
}
