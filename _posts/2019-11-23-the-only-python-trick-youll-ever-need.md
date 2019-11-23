---
layout: post
title: "the only python trick you'll ever need (pdb: the python debugger)"
author: svineet
tags: code software-engineering
---

I've written a fair amount of python in my life, and for the most part
it has been quite a pleasant experience.

But sometimes, the sheer ease of use of python becomes an issue.
The best example for this would be Python's duck typing. Since there
is no type checking because of this, I often lose track of what exactly
a variable held, and what the structure of the variable was.

Now there are software engineering practices that can prevent this,
such as using [type hints made available in Python 3](https://docs.python.org/3/library/typing.html)

But the issue with the `typing` module and type hints in Python3 is
that they're not actually checked at all! For example, try this snippet
in the python3 interpreter

```python
>>> def foo(a: int) -> int:
...   return 2*a
... 
>>> foo("lol")
'lollol'
```

So why bother with type hints? Well, they make your code easier to understand for one, but
the better reason is that you can use something like [mypy](http://mypy-lang.org/) for
type checking.

But these are all software engineering practices. They yield good results and lower
technical debt over the longer term, but they'll slow you down if you just need to get something
up and running quickly.

So here's the hacker's tool for quick debugging of python code.

The Python Debugger
-------------------

[The python debugger](https://docs.python.org/3/library/pdb.html) is the most underused
feature of python in my opinion.

From the docs,

> `pdb` is an interactive source code debugger for Python programs.

TL; DR
------

1. You can start interactive consoles anywhere in your code, and view/edit
the variables in the context of the statements you've stopped at.
2. You can set breakpoints and inspect the stack frame interactively.

To open up an interactive console anywhere in your program, insert this line
```python
import pdb; pdb.set_trace()
```

And you'll see the `(Pdb)` prompt. Hack away.

