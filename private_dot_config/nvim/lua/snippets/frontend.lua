require('common_fn')
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local camel_case_to_kebab_case = function(s)
    local kebab_cased = s:gsub('([A-Z])', '-%1'):lower():gsub('^-', '')
    return kebab_cased
end

ls.add_snippets('javascript', {
    s('de', t([[debugger;]])),
    s('cl', t([[console.log('=============================+>');]])),
    s('cll', fmt([[console.log('=============================+>', {});]], {i(0)})),
    s('wait', t([[new Promise((resolve) => setTimeout(resolve, 3000));]])),

    s('im', fmt([[import {{{}}} from '{}';]], {i(0), i(1)})),
    s('imu', fmt([[import {} from 'packages/ui/{}';]], {
        i(1),
        f(function(arg)
            return camel_case_to_kebab_case(arg[1][1])
        end, {1})
    })),
    s('ex', fmt([[export {}]], {i(0)})),
    s('ef', fmt([[export {{{}}} from '{}';]], {i(0), i(1)})),

    s('req', fmt([[const {} = require('{}');]], {i(0), i(1)})),
    s('dreq', fmt([[const {{{}}} = require('{}');]], {i(0), i(1)})),

    s('l', fmt([[let {} = {};]], {i(1), i(0)})),
    s('c', fmt([[const {} = {};]], {i(1), i(0)})),
    s('dl', fmt([[let {{{}}} = {};]], {i(0), i(1)})),
    s('dc', fmt([[const {{{}}} = {};]], {i(0), i(1)})),

    s('r', fmt([[return {};]], {i(0)})),
    s('rc', fmt([[
        return (
            {}
        );
    ]], {i(0)})),

    s('pr', fmt([[new Promise((resolve, reject) => {{{}}});]], {i(0)})),
    s('prcb', fmt([[(resolve, reject) => {{{}}}]], {i(0)})),
    s('prrs', fmt([[Promise.resolve({})]], {i(0)})),
    s('prrj', fmt([[Promise.reject({})]], {i(0)})),

    s('fa', fmt([[({}) => {}]], {i(1), i(0)})),
    s('fab', fmt([[
        ({}) => {{
            {}
        }}
    ]], {i(1), i(0)})),

    s('des', fmt([[
        describe('{}', () => {{
            {}
        }});
    ]], {i(1), i(0)})),
    s('it', fmt([[
        test('should {}', () => {{
            {}
            expect().toBe();
        }});
    ]], {i(1), i(0)})),

    s('//', fmt([[/** {} */]], {i(0)})),
    s('///', fmt([[
        /**
         *  {}
         */
    ]], {i(0)})),
    s('/p', fmt([[@param {}]], {i(0)})),
    s('/r', fmt([[@return {}]], {i(0)})),
    s('/k', fmt([[@kind {}]], {i(0)})),
})

ls.filetype_extend('javascriptreact', {'javascript'})
ls.filetype_extend('typescript', {'javascript'})
ls.filetype_extend('typescriptreact', {'javascript', 'typescript', 'javascriptreact'})
