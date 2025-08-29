---@type LazySpec
local uname = vim.env.USER or os.getenv "USER" or "user"

return {
  {
    "folke/snacks.nvim",
    opts = {
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
