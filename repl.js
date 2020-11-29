/* Save the file to $VIMCONFIG/coc-extensions for both vim & neovim
	This is no longer True: Usage: xmap <silent> <TAB> <Plug>(coc-repl-sendtext)
	instead use below in .vimrc or init.vim:
		autocmd FileType scala vmap <silent> <localleader>\ m0:CocCommand repl.sendtext<CR>'0j
		autocmd Filetype scala imap <localleader>\ <Esc>0v$:CocCommand repl.sendtext<CR>j
		autocmd Filetype scala nmap <localleader>\ 0v$:CocCommand repl.sendtext<CR>j
		autocmd FileType scala nnoremap <leader>r :CocCommand repl.openTerminal<CR>
		autocmd FileType scala nnoremap <localeader>r :CocCommand repl.disposeTerminal<CR>

	Need to wait before sending chunks of code ~ need it to wait
  Make it goto end of visual NOT next line: Mark in vim & move to the mark?
	console vs repl
  const logger =  require('./util/logger')('workspace')

*/
const {commands, workspace} = require('coc.nvim')

function multln(str) {
			if (str.substring(0, str.length -1).includes('\n') ||
					str.substring(0, str.length -1).includes('\r') ) return true
			else return false
		}
  
exports.activate = context => {
  let {nvim} = workspace
  let terminal
  let prog = ''
  context.subscriptions.push(commands.registerCommand('repl.openTerminal', async () => {
		let filetype = await nvim.eval('&filetype')
		let doc = workspace.getDocument(workspace.bufnr)
		if (filetype == 'javascript') {
			prog = 'node'
		} else if (filetype == 'typescript') {
			prog = 'ts-node'
		} else if (filetype == 'scala') {
			var splt = doc._uri.split('/').reverse()
			if (splt[1] == 'scala') prog = 'sbt console' 
			else prog = 'mill -i ' + splt[2] + '.console'
		}
		terminal = await workspace.createTerminal({
			name: prog || 'terminal'
		})
		if (prog) {
			let winid = await nvim.call('win_getid')
			/* console.warn('prog-----')
				 console.warn(splt[1], prog, winid)
				 console.warn(nvim.nvim_get_current_win) */
			terminal.sendText(prog, true)
			nvim.call('win_gotoid', winid, true)
		}
  }))

  context.subscriptions.push(commands.registerCommand('repl.showTerminal', async () => {
    if (terminal) {
      terminal.show()
    }
  }))

  context.subscriptions.push(commands.registerCommand('repl.disposeTerminal', async () => {
    if (terminal) {
      terminal.dispose()
    }
  }))

  //context.subscriptions.push(workspace.registerKeymap(['x'], 'repl-sendtext', async () => {
  context.subscriptions.push(commands.registerCommand('repl.sendtext', async () => {
    //await nvim.call('eval', 'feedkeys("\\<esc>", "in")')
    //if !(terminal) repl.openTerminal
  let winid = await nvim.call('win_getid')
    let filetype = await nvim.eval('&filetype')
    let doc = workspace.getDocument(workspace.bufnr)
    if (!doc) return
    let visualmode = await nvim.call('visualmode')
    let range = await workspace.getSelectedRange(visualmode, doc)
    if (!range) return
    var text = doc.textDocument.getText(range)
    if (filetype == 'scala' && multln(text) &&
				prog.trim().substring(prog.trim().length-7)== 'console' 
		) {
			text = ':paste\n' + text + '\04'
		}
    if (text && terminal) terminal.sendText(text, true)
    nvim.call('win_gotoid', winid, true)
  }, {sync: false, silent: true}))
}
