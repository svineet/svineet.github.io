---
title: "tgpt: agentic ChatGPT, in your terminal (weekly build #0)"
date: 2025-01-04T15:28:52+05:30
tags: ["weekly build"]
---

Welcome to the first weekly build! This is a part of a series of posts, a new year activity I'm upto of building and releasing (or improving) something every week.

You can see the rest of the posts in the [weekly build](/tags/weekly-build/) series.

{{< rawhtml >}}
<a href="https://github.com/svineet/termgpt" style="display: inline-block; background-color: #24292e; color: #ffffff; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-weight: bold;">
    <i class="fab fa-github" style="margin-right: 8px;"></i> GitHub Link
</a>
{{< /rawhtml >}}


## 💡 the idea

I've become too used to ChatGPT.

Every time I open my GNOME Terminal, I am disappointed. I want to write a natural language instruction. I want the thing to write bash itself and execute the steps. Maybe even pull from the web. Sometimes, I just want to talk to ChatGPT, and not have to copy commands in. I just want to type out "Move the docker image location from /root to /home", and instead of yapping and back-and-forth conversation, give me the command and ask me if I want to execute it.

Looked it was time to open Cursor again, and make something :)


## `tgpt`: a terminal AI Agent

So I decided to make `tgpt`, a simple CLI based AI Agent, that starts a chat and generates bash commands. It can search the internet via [Tavily](https://tavily.com/),
and utilises it to plan ahead. If you ask it about a command it does not have knowledge of, `tgpt` will search the internet, and try to understand how to use it.
Additionally, it can pull up-to-date information from the web, and incorporate it into the bash commands.

The agent plans about the task involved, and can use the Tavily search engine to research the web about relevant details, and form bash commands appropriately

{{< rawhtml >}}
<a href="https://github.com/svineet/termgpt" style="display: inline-block; background-color: #24292e; color: #ffffff; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-weight: bold;">
    <i class="fab fa-github" style="margin-right: 8px;"></i> GitHub Link
</a>
<br/>
<br/>
{{< /rawhtml >}}

To install it on your system, clone the GitHub, and install via `pip`
```bash
git clone https://github.com/svineet/termgpt
cd termgpt
pip install .
```

Enjoy! I plan to add more tools and configurability to the agent soon, as well as add better long term planning with long term memory.

**Future Vision:** Jarvis in your terminal, access to all personal web accounts and complete autonomy, with ability to spin up more Agents as required.

### demo

Some demo runs of `tgpt`

#### 1. limerick

```plaintext
❯ tgpt


▗▄▄▄▖▗▄▄▖▗▄▄▖▗▄▄▄▖
  █ ▐▌   ▐▌ ▐▌ █  
  █ ▐▌▝▜▌▐▛▀▘  █  
  █ ▝▚▄▞▘▐▌    █  
                  

Welcome to TermGPT: Terminal AI Agent

> write a limerick about the startup LangChain and put it into POEM.md
Here's a limerick for you:

In a world where chains are so grand,  
LangChain's code lends a helping hand.  
With AI's bright spark,  
It leaves a bold mark,  
A startup that’s perfectly planned.  

Allow me a moment to save this delightful piece into `POEM.md`.
Execute the following command? 
echo "In a world where chains are so grand,\nLangChain's code lends a helping hand.\nWith AI's bright spark,\nIt leaves a bold mark,\nA startup that’s perfectly planned." > POEM.md
(Y/n): 
The limerick has been elegantly inscribed into the `POEM.md` file. If there's anything else you wish to explore or create, do let me know!

```

These examples demonstrate how `tgpt` can simplify command-line tasks by generating and executing commands based on natural language instructions.


#### 1. snake game: it creates a terminal based snake game and corrects it

Before you see the chat log, see this video of the game it ended up building. It's a terminal based game (it knows it is in a terminal). It starts with a basic one-shot of the code for the game, then runs it and iterates over it till it works. **It fixes the code agentically on feedback.**

{{< youtube VRp2F9_PAvE >}}

```plaintext
> design a snake game and output into snake.py
Certainly! Let's create a simple Snake game using Python and the `curses` library. This will be a basic text-based version that you can run in the terminal. I'll write the code and save it to `snake.py`.

Here's a sneak peek at the game design:

- The snake moves with the arrow keys.
- The game ends if the snake runs into the walls or itself.
- A point is earned each time the snake eats the food.

Now, allow me a moment to create the `snake.py` file for you.
Execute the following command? 
echo "import curses\nimport random\n\n# Initialize the screen\nscreen = curses.initscr()\ncurses.curs_set(0)\nsh, sw = screen.getmaxyx()\nw = curses.newwin(sh, sw, 0, 0)\nw.keypad(1)\nw.timeout(100)\n\nsnk_x = sw//4\nsnk_y = sh//2\nsnake = [\n    [snk_y, snk_x],\n    [snk_y, snk_x-1],\n    [snk_y, snk_x-2]\n]\n\nfood = [sh//2, sw//2]\nw.addch(int(food[0]), int(food[1]), curses.ACS_PI)\n\nkey = curses.KEY_RIGHT\n\nscore = 0\n\nwhile True:\n    next_key = w.getch()\n    key = key if next_key == -1 else next_key\n\n    new_head = [snake[0][0], snake[0][1]]\n\n    if key == curses.KEY_DOWN:\n        new_head[0] += 1\n    if key == curses.KEY_UP:\n        new_head[0] -= 1\n    if key == curses.KEY_LEFT:\n        new_head[1] -= 1\n    if key == curses.KEY_RIGHT:\n        new_head[1] += 1\n\n    snake.insert(0, new_head)\n\n    if snake[0][0] in [0, sh] or\n        snake[0][1]  in [0, sw] or\n        snake[0] in snake[1:]:\n        curses.endwin()\n        quit()\n\n    if snake[0] == food:\n        score += 1\n        food = None\n        while food is None:\n            nf = [\n                random.randint(1, sh-1),\n                random.randint(1, sw-1)\n            ]\n            food = nf if nf not in snake else None\n        w.addch(food[0], food[1], curses.ACS_PI)\n    else:\n        tail = snake.pop()\n        w.addch(int(tail[0]), int(tail[1]), ' ')\n\n    w.addch(int(snake[0][0]), int(snake[0][1]), '#')" > snake.py
(Y/n): 
The Snake game has been successfully designed and saved into `snake.py`. You can run the game using Python in your terminal with the following command:

python3 snake.py

Enjoy the game, and let me know if there's anything else you'd like to do!
> run it

Execute the following command? 
python3 snake.py
(Y/n): 
It appears there's a syntax error in the code due to a line break. Let's correct it by ensuring that the logical conditions are properly structured on one line or within parentheses.

Allow me to amend this for you.
Execute the following command? 
echo "import curses\nimport random\n\n# Initialize the screen\nscreen = curses.initscr()\ncurses.curs_set(0)\nsh, sw = screen.getmaxyx()\nw = curses.newwin(sh, sw, 0, 0)\nw.keypad(1)\nw.timeout(100)\n\nsnk_x = sw//4\nsnk_y = sh//2\nsnake = [\n    [snk_y, snk_x],\n    [snk_y, snk_x-1],\n    [snk_y, snk_x-2]\n]\n\nfood = [sh//2, sw//2]\nw.addch(int(food[0]), int(food[1]), curses.ACS_PI)\n\nkey = curses.KEY_RIGHT\n\nscore = 0\n\nwhile True:\n    next_key = w.getch()\n    key = key if next_key == -1 else next_key\n\n    new_head = [snake[0][0], snake[0][1]]\n\n    if key == curses.KEY_DOWN:\n        new_head[0] += 1\n    if key == curses.KEY_UP:\n        new_head[0] -= 1\n    if key == curses.KEY_LEFT:\n        new_head[1] -= 1\n    if key == curses.KEY_RIGHT:\n        new_head[1] += 1\n\n    snake.insert(0, new_head)\n\n    if (snake[0][0] in [0, sh] or\n        snake[0][1] in [0, sw] or\n        snake[0] in snake[1:]):\n        curses.endwin()\n        quit()\n\n    if snake[0] == food:\n        score += 1\n        food = None\n        while food is None:\n            nf = [\n                random.randint(1, sh-1),\n                random.randint(1, sw-1)\n            ]\n            food = nf if nf not in snake else None\n        w.addch(food[0], food[1], curses.ACS_PI)\n    else:\n        tail = snake.pop()\n        w.addch(int(tail[0]), int(tail[1]), ' ')\n\n    w.addch(int(snake[0][0]), int(snake[0][1]), '#')" > snake.py
(Y/n): 
The syntax error has been corrected. Let's try running the updated Snake game again.
Execute the following command? 
python3 snake.py
(Y/n): 
It seems there is an issue with the `curses` library when attempting to close the window. This can happen if the window is already closed or if there was an unexpected behavior in the terminal.

Let's ensure that the `endwin()` function is called correctly by wrapping the main logic in a try-except block. I'll make this adjustment for you.
Execute the following command? 
echo "import curses\nimport random\n\n# Initialize the screen\nscreen = curses.initscr()\ncurses.curs_set(0)\nsh, sw = screen.getmaxyx()\nw = curses.newwin(sh, sw, 0, 0)\nw.keypad(1)\nw.timeout(100)\n\nsnk_x = sw//4\nsnk_y = sh//2\nsnake = [\n    [snk_y, snk_x],\n    [snk_y, snk_x-1],\n    [snk_y, snk_x-2]\n]\n\nfood = [sh//2, sw//2]\nw.addch(int(food[0]), int(food[1]), curses.ACS_PI)\n\nkey = curses.KEY_RIGHT\n\nscore = 0\n\ntry:\n    while True:\n        next_key = w.getch()\n        key = key if next_key == -1 else next_key\n\n        new_head = [snake[0][0], snake[0][1]]\n\n        if key == curses.KEY_DOWN:\n            new_head[0] += 1\n        if key == curses.KEY_UP:\n            new_head[0] -= 1\n        if key == curses.KEY_LEFT:\n            new_head[1] -= 1\n        if key == curses.KEY_RIGHT:\n            new_head[1] += 1\n\n        snake.insert(0, new_head)\n\n        if (snake[0][0] in [0, sh] or\n            snake[0][1] in [0, sw] or\n            snake[0] in snake[1:]):\n            break\n\n        if snake[0] == food:\n            score += 1\n            food = None\n            while food is None:\n                nf = [\n                    random.randint(1, sh-1),\n                    random.randint(1, sw-1)\n                ]\n                food = nf if nf not in snake else None\n            w.addch(food[0], food[1], curses.ACS_PI)\n        else:\n            tail = snake.pop()\n            w.addch(int(tail[0]), int(tail[1]), ' ')\n\n        w.addch(int(snake[0][0]), int(snake[0][1]), '#')\nfinally:\n    curses.endwin()" > snake.py
(Y/n): 
I've wrapped the game logic in a try-finally block to ensure that `curses.endwin()` is called correctly. Let's attempt to run the game once more.
Execute the following command? 
python3 snake.py
(Y/n): 
It seems that the error persists, which might be due to how the terminal environment is handling the `curses` library. This issue can sometimes occur depending on terminal settings or restrictions.

To troubleshoot further, you might want to ensure your terminal supports `curses` properly or try running the script in a different terminal emulator. If you have any specific terminal preferences or configurations, do let me know, and I'll assist you accordingly.
> 
```

Notice, it wasn't able to run the snake game by itself, because `subprocess` doesn't allow this to happen inside python, and I have not yet implemented complete terminal handover to executed commands. Added to the fix list! However, the game does work, and quite interesting to see how it **figures out agentically how to fix the game by itself.**

### I encourage you to try `tgpt` out on your own. There are quite a few fun things it is capable of.

## implementation and learnings

At first, I started out writing my own LLM calls, with scaffolding around it for a ReAct prompt, and a custom executor that detects statements within `<bash> </bash>` tags. While it was working well initially, I got tired of writing scaffolding and decided to go for an off-the-shelf 

Then, after writing a lot of scaffolding, I decided to use `langgraph`. The first thing I learnt was that building agents with `langgraph` is quite cumbersome. 
The framework brings along all sorts of concepts of its own, and since the AI Agent field is evolving
so quickly, `langchain` itself changes a lot from time to time.

Also, tool use seems to be off sometimes. I have to understand more about how tool calls work, and how accurate they.

## conclusion: feedback welcome!

I would love some feedback on this tool. Currently, the planner isn't that great, and I intend
to introduce a better planner soon with self-reflection built in.

I also have a bunch of features I want to build out, detailed in the TODO.md document in the repo.

Till the next build, thanks for reading! A small start might lead to great things, and many great
things are planned :)

