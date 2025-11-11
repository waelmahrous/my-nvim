local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local today = function() return os.date "%Y-%m-%d" end

return {
    -- Section template
    s(
        "sec",
        fmt(
            [[
## {}
### Tasks
- [ ] {}
- [ ] {}
- [ ] {}

### Notes
{}
---
]],
            {
                i(1, "SECTION_NAME"),
                i(2, "First task"),
                i(3, "Second task"),
                i(4, "Third task"),
                i(5, "Additional notes or context"),
            }
        )
    ),

    -- Simple task with tags
    s("task", fmt("- [ ] {}  #{}", { i(1, "Describe task"), i(2, "tag") })),

    -- Quick log (daily entry)
    s(
        "log",
        fmt(
            [[
## {}
### Done
- {}
### Learned
- {}
### Blockers
- {}
---
]],
            { f(today), i(1, "Completed work"), i(2, "Insights"), i(3, "Issues") }
        )
    ),

    -- Meeting summary
    s(
        "mtg",
        fmt(
            [[
## Meeting: {}
**Date:** {}
**Attendees:** {}
### Agenda
- {}
### Discussion
- {}
### Decisions
- {}
### Action Items
- [ ] {} (Owner: {})
---
]],
            {
                i(1, "Topic"),
                f(today),
                i(2, "Names"),
                i(3, "Points to cover"),
                i(4, "Discussion details"),
                i(5, "Conclusions"),
                i(6, "Action item"),
                i(7, "Assignee"),
            }
        )
    ),

    -- Issue tracker
    s(
        "issue",
        fmt(
            [[
## {}
**Date:** {}
**Status:** {}
**Description:** {}
**Analysis:** {}
**Next Steps:**
- [ ] {}
---
]],
            {
                i(1, "ISSUE_TITLE"),
                f(today),
                i(2, "Open"),
                i(3, "Brief description"),
                i(4, "Root cause or findings"),
                i(5, "Next task"),
            }
        )
    ),

    -- Decision log
    s(
        "dec",
        fmt(
            [[
## Decision: {}
**Context:** {}
**Decision:** {}
**Date:** {}
**Owner:** {}
---
]],
            {
                i(1, "Topic"),
                i(2, "Why the decision was needed"),
                i(3, "Final choice"),
                f(today),
                i(4, "Owner"),
            }
        )
    ),

    -- Quick reference note
    s(
        "note",
        fmt(
            [[
### {}
{}
---
]],
            {
                i(1, "Title"),
                i(2, "Notes or explanation"),
            }
        )
    ),
}
