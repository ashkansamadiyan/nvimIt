local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
    -- Try/except snippet
    s("try", fmt([[
try:
    {}
except:
    {}
    ]], {
        i(1, "#what"),
        i(2, "#Ex"),
       
    })),

    -- FastAPI route
    s("route", fmt([[
@router.post("{}", response_model={})
def {}(request: {}, {}: {}):
    qs = {{}}
    return qs
    ]], {
        i(1, "/path"),
        i(2, "ResponseModel"),
        i(3, "function_name"),
        i(4, "Request"),
        i(5, "param"),
        i(6, "Type"),
    })),

    -- Django model
    s("model", fmt([[
class {}(models.Model):
    {} = models.{}({})
    ]], {
        i(1, "ModelName"),
        i(2, "field_name"),
        i(3, "CharField"),
        i(4, "max_length=100"),
    })),
}) 
return{}