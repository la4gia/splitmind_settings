source /home/USER/PATH-TO/pwndbg/gdbinit.py
source /home/USER/PATH-TO/splitmind/gdbinit.py

set context-clear-screen on
set follow-fork-mode parent

python
import splitmind
(splitmind.Mind()
  .tell_splitter(show_titles=True)
  .tell_splitter(set_title="Main")
  .right(display="backtrace", size="28%")
  .above(of="main", display="regs", size="80%", banner="top")
  .show("regs", on="regs", banner="none")
  .right(display="disasm", size="50%")
  .show("code", on="disasm")
  .above(display="stack", size="50%")
  .below(of='backtrace', cmd="ipython", size="50%")
  .below(of="backtrace", cmd='tty; tail -f /dev/null', size="25%", clearing=False)
  .tell_splitter(set_title='Input / Output')
).build(nobanner=True)
end
set context-code-lines 30
set context-source-code-lines 30
set context-sections  "regs args code disasm stack backtrace"
