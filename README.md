## layout preview

![pwndbg](https://github.com/user-attachments/assets/6cdf4cfb-0ed6-40fa-a29f-b129e3a4441f)

## invert the stack

if you want to invert the stack, so the higher addresses are on top and the stack grows downward, you can update the pwndbg configs. 

locate the context.py file (pwndbg/pwndbg/commands/context.py) and locate the context_stack function:
```
@serve_context_history
def context_stack(target=sys.stdout, with_banner=True, width=None):
    result = [pwndbg.ui.banner("stack", target=target, width=width)] if with_banner else []
    telescope = pwndbg.commands.telescope.telescope(
        pwndbg.aglib.regs.sp, to_string=True, count=stack_lines
    )

    if telescope:
        result.extend(telescope)

    return result

```

add, telescope = telescope[::-1], above the result.extend line:
```
    if telescope:
        telescope = telescope[::-1]
        result.extend(telescope)
```
