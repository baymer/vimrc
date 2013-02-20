" Convert bookmarks list to plain text
function! OpmlToText()
  set nogdefault
  normal zRgg/<body>ditggVGpdd
  %s:\n::
  s:>:>\r:g
  normal gg=G
  %s:\(type\|title\|xmlUrl\)="\(.\{-}\)"::g
  %s:<outline\s\+text="\(.\{-}\)"\s\+htmlUrl="\(.\{-}\)"\s*/>:- \1\: \2:
  %s:<outline\s\+htmlUrl="\(.\{-}\)"\s\+text="\(.\{-}\)"\s*/>:- \1\: \2:
  %s:<outline\s\+text="\(.\{-}\)"\s*>:* \1:
  g:</outline>:d
endfunction
