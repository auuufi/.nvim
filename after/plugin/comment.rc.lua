local status, comment = pcall(require, "Comment")
if not status then
    return
end

local utils = require("Comment.utils")

comment.setup({
    pre_hook = function(ctx)
        local lines = utils.get_lines(ctx.range)
        vim.fn.setreg("+", lines)
    end,
})
