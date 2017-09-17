#!/bin/sh
 
# Backup previous versions
cp ~/Library/Developer/Xcode/UserData/xcdebugger/Breakpoints_v2.xcbkptlist ~/Library/Developer/Xcode/UserData/xcdebugger/Breakpoints_v2.xcbkptlist~

# update INTests breakpoints
xsltproc xcode_breakpoints_binary.xsl ~/Library/Developer/Xcode/UserData/xcdebugger/Breakpoints_v2.xcbkptlist > ~/Library/Developer/Xcode/UserData/xcdebugger/Breakpoints_v2_new.xcbkptlist
mv ~/Library/Developer/Xcode/UserData/xcdebugger/Breakpoints_v2_new.xcbkptlist ~/Library/Developer/Xcode/UserData/xcdebugger/Breakpoints_v2.xcbkptlist 

