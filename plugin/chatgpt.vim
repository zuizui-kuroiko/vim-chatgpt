scriptencoding utf-8

function! SendVS(ask, line1, line2, context)

  " Save the current yank register
  let save_reg = @@
  let save_regtype = getregtype('@')

  " Yank the lines between line1 and line2 into the unnamed register
  execute 'normal! ' . a:line1 . 'G0v' . a:line2 . 'G$y'

  " Send the yanked text to ChatGPT
  let yanked_text = @@

  let prompt = 'Do you like my code?\n' . yanked_text

  if a:ask == 'ask'
    let prompt = yanked_text
    if len(a:context) > 0
      let prompt = a:context . '\n' . yanked_text
    endif
  elseif a:ask == 'rewrite'
    let prompt = ''
    if len(a:context) > 0
      let prompt = 'I have the following code snippet, can you rewrite to' . a:context . '?\n' . yanked_text
    else
      return
    endif
  elseif a:ask == 'review'
    let prompt = 'I have the following code snippet, can you provide a code review for?\n' . yanked_text
  elseif a:ask == 'explain'
    let prompt = 'I have the following code snippet, can you explain it?\n' . yanked_text
    if len(a:context) > 0
      let prompt = 'I have the following code snippet, can you explain, ' . a:context . '?\n' . yanked_text
    endif
  elseif a:ask == 'test'
    let prompt = 'I have the following code snippet, can you write a test for it?\n' . yanked_text
    if len(a:context) > 0
      let prompt = 'I have the following code snippet, can you write a test for it, ' . a:context . '?\n' . yanked_text
    endif
  elseif a:ask == 'fix'
    let prompt = 'I have the following code snippet, it has an error I need you to fix:\n' . yanked_text
    if len(a:context) > 0
      let prompt = 'I have the following code snippet I would want you to fix, ' . a:context . ':\n' . yanked_text
    endif
  endif

  call chatgpt#send(prompt)

  " Restore the original yank register
  let @@ = save_reg
  call setreg('@', save_reg, save_regtype)

endfunction

command! -range -nargs=? Ask call SendVS('ask', <line1>, <line2>, <q-args>)
command! -range -nargs=? Rewrite call SendVS('rewrite', <line1>, <line2>, <q-args>)
command! -range Review call SendVS('review', <line1>, <line2>, '')
command! -range  -nargs=? Explain call SendVS('explain', <line1>, <line2>, <q-args>)
command! -range -nargs=? MakeTest call SendVS('test', <line1>, <line2>, <q-args>)
command! -range -nargs=? Fix call SendVS('fix', <line1>, <line2>, <q-args>)
command! -nargs=* Chat call chatgpt#send(<q-args>)
"command -nargs=* ChatGPT call chatgpt#send(<q-args>)
"command -nargs=0 CodeReviewPlease call chatgpt#code_review_please()
