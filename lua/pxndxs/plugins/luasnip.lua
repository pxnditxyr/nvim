return {
	'L3MON4D3/LuaSnip',
  event = "InsertEnter",
  after = "nvim-cmp",
	version = 'v2.2.0',
	build = 'make install_jsregexp',
  config = function ()
    local ls = require( 'luasnip' )
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    local javascriptSnippets = {
      s( 'pr', {
        t( 'console.log( ' ),
        i( 1 ),
        t( ' )' ),
      } ),
      s( 'af', {
        t( 'const ' ),
        i( 1 ),
        t( ' = ( ' ),
        i( 2 ),
        t( ' ) => {' ),
        t({ '', '\t' }),
        i( 0 ),
        t({ '', '}' }),
      } ),
      s( 'ex', {
        t( "export * from '" ),
        i( 1 ),
        t( "'" ),
      } ),
      s( 'desc', {
        t( 'describe( ' ),
        i( 1 ),
        t( ', () => {' ),
        t({ '', '\t' }),
        t( 'test( ' ),
        i( 2 ),
        t( ', () => {' ),
        t({ '', '\t\t' }),
        i( 0 ),
        t({ '', '\t' }),
        t( '} )' ),
        t({ '', '} )' }),
      } ),
      s( 'test', {
        t( 'test( ' ),
        i( 1 ),
        t( ', () => {' ),
        t({ '', '\t' }),
        i( 0 ),
        t({ '', '} )' }),
      } ),
    }

    ls.add_snippets( 'javascript', javascriptSnippets )
    ls.add_snippets( 'typescript', javascriptSnippets )
    ls.add_snippets( 'typescriptreact', {
      s( 'rc', {
        t( 'export const ' ),
        i( 1 ),
        t( ' = () => {' ),
        t({ '', '\t' }),
        t( 'return (' ),
        t({ '', '\t\t' }),
        t( '<div>' ),
        t({ '', '\t\t\t' }),
        i( 0 ),
        t({ '', '\t\t' }),
        t( '</div>' ),
        t({ '', '\t' }),
        t( ')' ),
        t({ '', '}' }),
      } ),
      unpack( javascriptSnippets ),
    } )
    ls.add_snippets( 'javascriptreact', javascriptSnippets )

    vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})
  end
}
