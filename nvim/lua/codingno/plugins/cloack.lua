return {
  'laytan/cloak.nvim',
  config = function()
    require('cloak').setup({
      enabled = true,
      cloak_character = '*',
      -- Tentukan pola file yang ingin disembunyikan nilainya
      cloak_teleport = false,
      patterns = {
        {
          -- Berkas yang akan dipantau
          file_pattern = '.env*',
          -- Pola yang akan disembunyikan (biasanya setelah tanda '=')
          cloak_pattern = '=.+',
          replace = nil,
        },
      },
    })
  end
}
