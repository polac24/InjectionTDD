<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="no"/> 

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="BreakpointProxy[BreakpointContent[contains(@symbolName , 'InjectionTDD')]]"/>

<xsl:template match="Breakpoints">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      <BreakpointProxy
         BreakpointExtensionID = "Xcode.Breakpoint.SymbolicBreakpoint">
         <BreakpointContent
            shouldBeEnabled = "Yes"
            ignoreCount = "0"
            continueAfterRunningActions = "Yes"
            symbolName = "InjectionTDD.InjectionTDDTestsObserver.finishedSuccessed"
            moduleName = "">
            <Actions>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- int $count = $arg2">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- $count = $arg2; int $dummyV = 1">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- const char * $testName = (const char *)[(NSString*)[$arg1 description] UTF8String]">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- $testName = (const char *)[(NSString*)[$arg1 description] UTF8String]; int $dummyV = 1">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.AppleScript">
                  <ActionContent
                     script = "display notification &quot;Suceeded @$count@ tests&quot; with title &quot;Tests Succeeded&quot; subtitle @$testName@">
                  </ActionContent>
               </BreakpointActionProxy>
            </Actions>
            <Locations>
               <Location
                  shouldBeEnabled = "Yes"
                  ignoreCount = "0"
                  continueAfterRunningActions = "No"
                  symbolName = "InjectionTDD.InjectionTDDTestsObserver.finishedSuccessed(Swift.String, testCases: Swift.Int) -&gt; ()"
                  moduleName = "InjectionTDD"
                  usesParentBreakpointCondition = "Yes"
                  urlString = ""
                  timestampString = "528046530.566203"
                  startingColumnNumber = "9223372036854775807"
                  endingColumnNumber = "9223372036854775807"
                  startingLineNumber = "18"
                  endingLineNumber = "18"
                  offsetFromSymbolStart = "28">
               </Location>
            </Locations>
         </BreakpointContent>
      </BreakpointProxy>
      <BreakpointProxy
         BreakpointExtensionID = "Xcode.Breakpoint.SymbolicBreakpoint">
         <BreakpointContent
            shouldBeEnabled = "Yes"
            ignoreCount = "0"
            continueAfterRunningActions = "Yes"
            symbolName = "InjectionTDD.InjectionTDDTestsObserver.finishedWithError"
            moduleName = "">
            <Actions>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- int $count = $arg2">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- $count = $arg2; int $dummyV = 1">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- int $failures = $arg3">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- $failures = $arg3; int $dummyV = 1">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- const char * $testName = (const char *)[(NSString*)[$arg1 description] UTF8String]">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- $testName = (const char *)[(NSString*)[$arg1 description] UTF8String]; int $dummyV = 1">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.AppleScript">
                  <ActionContent
                     script = "display notification &quot;Failed with @$count@ tests (@$failures@ failures)&quot; with title &quot;Tests Failed&quot; subtitle @$testName@">
                  </ActionContent>
               </BreakpointActionProxy>
            </Actions>
            <Locations>
               <Location
                  shouldBeEnabled = "Yes"
                  ignoreCount = "0"
                  continueAfterRunningActions = "No"
                  symbolName = "InjectionTDD.InjectionTDDTestsObserver.finishedWithError(Swift.String, failedTestCases: Swift.Int, failures: Swift.Int) -&gt; ()"
                  moduleName = "InjectionTDD"
                  usesParentBreakpointCondition = "Yes"
                  urlString = ""
                  timestampString = "528046530.56995"
                  startingColumnNumber = "9223372036854775807"
                  endingColumnNumber = "9223372036854775807"
                  startingLineNumber = "19"
                  endingLineNumber = "19"
                  offsetFromSymbolStart = "32">
               </Location>
            </Locations>
         </BreakpointContent>
      </BreakpointProxy>
    </xsl:copy>
</xsl:template>


</xsl:stylesheet> 

