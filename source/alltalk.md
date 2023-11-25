# Alltalk

Alltalk is *an interactive object-oriented programming language*, a Smalltalk programming language dialect by [Hugh Sparks](https://www.csparks.com/), see a dedicated [page](https://alltalk.csparks.com/index.xml).

## Overview

TBD


## Conversation with author

Glad to hear from people who try it out. My goal was to create a Smalltalk-like experience but with a read/write syntax. Many popular interactive programming languages feature what I like to call "write-only" syntax.

Alltalk looks a bit retro these days. I created the first version for the PDP-11 in 1979 inspired by the Smalltalk-76 work at Xerox PARC. It borrows from the fashionable languages of that era: Pascal, Modula, Ada, and other dinosaurs.
Right now, Alltalk is closed-source freeware. I'd like to open it up to get help from the community, but I also use it for industrial applications and I just don't have time to do a proper job of moderation. (I'm in Japan right now using it to build a large earthquake simulator.) I'm sure Alltalk will improve rapidly when I involve more developers and I think Github would be an excellent place to do that.

I'll add you to my rarely-updated mailing list so you'll know when I "go public."

Alltalk really needs a user guide and tutorial, but here are some non-obvious tricks:

If you haven't figured this out yet, semicolon <enter> is used to trigger compilation and execution of whatever you type in the listener window.
   'this is as string'.writeln; <enter>

There is a shortcut for "#writeln ;" - Just use colon:
   'this is a string': <enter>
There are other keywords that only work in the listener:

You set the compiler context using WITH:

WITH Button

Now any method you type in will become part of class Button and any VAR you create will become a class variable Button. (But you can't create more instance variables without re-defining the class.)
Or you can enter an instance:

WITH x

Now you can see all the variables in the context of whatever is in the variable x.

Finally, when you hit a breakpoint, there is an implicit WITH to enter the object that's the receiver of the method you're debugging. You can also see the parameter and local variables in that context.

Debugging:
The browser itself has some methods used to demonstrate debugging.

Open the source for Browser in the browser:

    Category "Programming" -> class Browser -> method "test"

Turn on debugging by clicking the "D" toggle button on the browser menu bar.

Click on the first executable line of the method for #test and press the "O" button to set a breakpoint.
Now use the listener window to execute:

    browser.test

The debugger buttons have pop-up labels to show what they do.

Most-but-not-all classes have help files that contain demonstrations. Here are a few that are fun to see:

Gtk -> GtkDatabox

Now select "Help" from the file menu, then "Compile All" in the workspace that pops up.

Gtk -> GtkDrawingArea (now select Help and compile all in the workspace)

Same drill for most of the other classes.

Sockets and Concurrency are interesting.

Class Module lets you open external shared libraries: DLLs in Windows or dynamic shared libraries in linux. Once open, you can send messages to the module instance passing any of the basic scalar or array types and the module function will execute. I've only tested this with external dynamic libraries/DLLs writting in standard C, but it should work for other languages with similar calling conventions.
Have fun!

-Hugh Sparks

On 8/8/2019 9:52 PM, David Landa wrote:
Dear Hugh, I am playing with your Alltalk and I am trying to understand how this Smalltalk implementation works. I can read all the `.alt` files but I am also interested in the interpreter itself.
Is the source code available elsewhere, e.g github.com? Anyway, this is a really nice piece of software -- it works on my new Windows 10 machine without problems -- Thank you!
Best regards, David Landa