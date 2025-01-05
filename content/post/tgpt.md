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

**Vision:** Jarvis in your terminal, access to all personal web accounts and complete autonomy, with ability to spin up more Agents as required.

### demo

Some demo runs of `tgpt`

1. **Basic Command Generation:**
   - Ask `tgpt` to create a directory and navigate into it:
     ```bash
     tgpt "Create a directory named 'project' and navigate into it"
     ```

2. **Web Search and Command Execution:**
   - Use `tgpt` to search for a command to list all Docker containers:
     ```bash
     tgpt "Find the command to list all Docker containers"
     ```

3. **Complex Task Automation:**
   - Automate moving a Docker image from `/root` to `/home`:
     ```bash
     tgpt "Move the Docker image location from /root to /home"
     ```

4. **Interactive Command Execution:**
   - Ask `tgpt` to find and execute a command to update the system:
     ```bash
     tgpt "Update the system packages"
     ```

5. **Incorporating Web Information:**
   - Use `tgpt` to pull the latest news headlines and display them:
     ```bash
     tgpt "Fetch and display the latest news headlines"
     ```

These examples demonstrate how `tgpt` can simplify command-line tasks by generating and executing commands based on natural language instructions.

## implementation and learnings

Then, after writing a lot of scaffolding, I decided to use `langgraph`. The first thing I learnt was that building agents with `langgraph` is quite cumbersome. 
The framework brings along all sorts of concepts of its own, and since the AI Agent field is evolving
so quickly, `langchain` itself changes a lot from time to time.

## conclusion: feedback welcome!

I would love some feedback on this tool. Currently, the planner isn't that great, and I intend
to introduce a better planner soon with self-reflection built in.

I also have a bunch of features I want to build out, detailed in the TODO.md document in the repo.

Till the next build, thanks for reading! A small start might lead to great things, and many great
things are planned :)

