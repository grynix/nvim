return{{
   'rcarriga/nvim-notify',
   config = function()
      vim.notify = require('notify').setup({
         stages = "slide",
         timeout = 2500,
         fps = 60,
         position = "bottom_right",
         -- render = "compact"
         icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
         },
         render = "compact",
         top_down = false,

      })
   end
}}
