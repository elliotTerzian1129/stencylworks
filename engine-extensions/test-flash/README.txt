-----------------------------
INTRO
-----------------------------

The extensions framework lets you import Flash libraries (SWF) and use them  inside of your games. The most common use case is to import a sponsor's API into a Stencyl game.


-----------------------------
CONVERTING A SWC TO A SWF
-----------------------------

Stencyl only recognizes SWFs. If you have a SWC, follow these steps to extract the SWF from it.

1) Rename the SWC's extension to ZIP.
2) Unzip the file.
3) Inside will be the SWF.


-----------------------------
HOW TO MAKE A FLASH EXTENSION
-----------------------------

1) Make a new folder under plaf/haxe/extensions/

2) It must contain these 5 files.

include.nmml (leave as-is)

<?xml version="1.0" encoding="utf-8"?>
<project>
<haxeflag name="-swf-lib" value="library.swf" if="flash"/>
</project>


blocks.xml (leave as-is)

<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<palette>
</palette>


info.txt (edit the details to fit your case)

name=Test Extension (Flash SWF)
description=A test extension for Flash
author=Jon
website=http://www.stencyl.com
version=1.0
compatibility=flash

icon.png - 32 x 32 icon

library.swf - the SWF library you want to import. If it's a SWC, follow the instructions above.


2) Enable the extension inside of Stencyl
* Open game, click 'Settings'
* Flip to the Extensions page and click Enable
* Reopen the game

3) Now, you can call the code inside the SWF through code blocks.