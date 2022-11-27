InPlaceCopy
===========
A tool to make a file copy in the same directory.

This tool is similar to Windows Explorer functionality when right-clicking and dragging a file into the same directory, but copying is done by clicking a context menu item.

When is it needed
-----------------

File managers like Far Manager can display the Windows Explorer context menu, but cannot use its drag-and-drop functionality. This is where this tool comes into play.

How to use
----------

Place the executable somewhere in "Program Files" and create a context menu item for all file types like in the InPlaceCopy.reg example.

Additionally, you can specify /quiet as the second key if you don't want to be asked whether to make a copy.
