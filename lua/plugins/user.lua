---@type LazySpec

local uname = os.getenv "USER"
local datetime = os.date "%Y-%m-%d %H:%M:%S"

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        -- ignore the preset and define sections yourself
        sections = {
          { section = "header" },
        },
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
            "/* " .. uname .. " */",
          }, "\n"),
        },
      },
    },
  },
  { "goolord/alpha-nvim", enabled = false },
}
