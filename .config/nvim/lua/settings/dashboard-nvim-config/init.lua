local status_ok, db = pcall(require, "dashboard")
if not status_ok then
    vim.notify("ERROR: alpha not found!!")
    return
end

-- needed to get random footer text
math.randomseed(os.time())

db.default_banner = {
    "",
    "",
    "███████╗ █████╗ ████████╗██╗   ██╗██╗███╗   ███╗",
    "██╔════╝██╔══██╗╚══██╔══╝██║   ██║██║████╗ ████║",
    "███████╗███████║   ██║   ██║   ██║██║██╔████╔██║",
    "╚════██║██╔══██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║",
    "███████║██║  ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚══════╝╚═╝  ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
    "",
    "                 A PDE for Aliens 👽!!!                ",
    "",
}

db.custom_center = {
    {
        icon = "  ",
        desc = "New file                                ",
        shortcut = ";gn",
        action = "enew",
    },
    {
        icon = "  ",
        desc = "Recently used files                     ",
        action = "Telescope oldfiles",
        shortcut = ";fr",
    },
    {
        icon = "  ",
        desc = "Find  File                              ",
        action = "Telescope find_files find_command=rg,--hidden,--files",
        shortcut = ";ff",
    },
    {
        icon = "  ",
        desc = "Find project                            ",
        action = "Telescope project find_command=rg, --hidden, --files",
        shortcut = ";gp",
    },
    {
        icon = "  ",
        desc = "Find text                               ",
        action = ":Telescope live_grep ",
        shortcut = ";fg",
    },
    {
        icon = "  ",
        desc = "Configuration                           ",
        action = "e ~/.config/nvim/init.lua",
        shortcut = ";gc",
    },
    {
        icon = "  ",
        desc = "Quit Neovim                             ",
        action = "qa",
        shortcut = ";gq",
    },
}

local function footer()
    local randomFooterText = {
        "Vim is great!!!",
        "Why Vi use Vim!",
        "Vim -- Vi improved!",
        "Vim is awesome",
        "I love Vim",
        "Vi made easy!",
        "Other text editors are nuts!!!",
        "Vi is not a layer, it is a philosophy!",
        "I showed you my source code, Plz respond!",
        "Vi Vi Vi, the editor of the beast!!!",
        "While any Editor can save your soul, only neovim can save your soul",
    }

    return { "🪐 " .. randomFooterText[math.random(1, #randomFooterText)] }
end

db.custom_footer = footer()
db.hide_statusline = false
db.hide_tabline = false