---@type LazySpec
local uname = vim.env.USER or os.getenv "USER" or "user"

local fb = require "telescope.builtin"

vim.keymap.set("n", "<leader>ff", function()
    fb.find_files {
        -- explicitly use ripgrep and tell it to show hidden files and ignore gitignore
        find_command = {
            "rg",
            "--files",
            "--hidden",
            "--no-ignore-vcs", -- include files ignored by git
            "--follow", -- follow symlinks (optional)
        },
    }
end, { desc = "Find files (rg: include gitignored + hidden)" })

return {
    {
        "folke/snacks.nvim",
        opts = {
            lazygit = {
                configure = false, -- disables snack's theme integration
                theme = nil, -- ensures no extra theming is applied
            },

            dashboard = {

                -- Define sections here
                sections = {
                    { section = "header" },
                    { header = "/* " .. uname .. " */", animate = true },
                },

                -- Customize the sections here
                preset = {
                    header = table.concat({

                        "          .                                     .                    ..     .   ",
                        "    .     ..             .. . ...... .                        .         .       ",
                        "        ..      .     . ...   .    .   ..                           ... . .     ",
                        "      .      .        .....  ......   ..     .   .     .. ....  .      ..  .    ",
                        "                  .    ...     ...   ....  ...       ..     .      .        .   ",
                        "   .                   ..      ..................                 ..       .    ",
                        '   . ..   ..   .     ..  .     .."~~~~~~~~~~~~"..     ..      . .               ',
                        '   ...    ...  .         ....  ."!+::::::vvvv:~"..    ...   .. . .        .     ',
                        '   ..           ...     .   .  ."+cwwww00000I:!"..   . .      ...    ..         ',
                        '   .  ..   ....              ...~:oP###$$$#$o:!"...  ...      ...               ',
                        '  ..  ..    .  .     ..    .....~:w#$XP#R$X#Xc!"...           .  .              ',
                        '    ..     .   .     .     .  ..~:w#P$RBBRP$PI:!"..    .     .....              ',
                        '       .     ..  . .         .."!:w#X#RBBB#X$XI:!".... ..     ...               ',
                        '    .       ....... .       .."!+c0#X#RBB@#XX$XI:!~.....  ....   ..     .       ',
                        '  . .        .. .. ..       ."~+vw$#0$RBRBPP0$#0c+~"...      .  ..              ',
                        '   .  ...   ..   .  . ...  ."~!voX#$0PXP#RX$P$#$0I:~"...   ... . ..             ',
                        '       . .    . .       . ..~!:I0$R#PPP$$RX$$P$$Poc:~"...     ..   ..  .  .     ',
                        '   ..   .      ..     ....."!:coX##$P$$#X#0$Xoo0wooc+~..              .         ',
                        '        . .      ..   . .."~+coo0XwIwPP$XPX#Xc+:cooI:!"....           ..        ',
                        '        .       ..    ...."!:IIIc:+vX$X00XX$0v+~~+cc:!"...   .                  ',
                        '   .    .   .. . .     ..."~+::!~~!cP##PP###Xv!"."~!!~"..                .      ',
                        '     .. ... .......     .."""""."!cP#RR#RRRXc+"....""..         ...      .      ',
                        '       ......... . .     .... ..."+IP#RR$#R#Pc+~..   ..                      .  ',
                        "      ...      .                .~+oX$R#PP$#Xc+~.                               ",
                        '                                ."!:cwwwIcowI+~".                               ',
                        "                                                                                ",
                        "",
                    }, "\n"),
                },
            },
        },
    },
}
