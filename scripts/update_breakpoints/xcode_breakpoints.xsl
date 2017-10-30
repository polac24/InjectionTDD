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
<xsl:template match="BreakpointProxy[BreakpointContent[contains(@symbolName , 'TDDInjection')]]"/>

<xsl:template match="Breakpoints">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      <BreakpointProxy
         BreakpointExtensionID = "Xcode.Breakpoint.SymbolicBreakpoint">
         <BreakpointContent
            shouldBeEnabled = "Yes"
            ignoreCount = "0"
            continueAfterRunningActions = "Yes"
            symbolName = "[TDDInjectionTestsObserver succeededWithTitle:allCasesCount:]"
            moduleName = "">
            <Actions>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- int $count = $arg4">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- $count = $arg4; int $dummyV = 1">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- const char * $testName = (const char *)[(NSString*)[$arg3 description] UTF8String]">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- $testName = (const char *)[(NSString*)[$arg3 description] UTF8String]; int $dummyV = 1">
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
                  symbolName = "-[TDDInjectionTestsObserver succeededWithTitle:allCasesCount:]"
                  moduleName = "InjectionTDD"
                  usesParentBreakpointCondition = "Yes"
                  offsetFromSymbolStart = "0">
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
            symbolName = "[TDDInjectionTestsObserver failedWithTitle:allFailedCasesCount:allFailuresCount:]"
            moduleName = "">
            <Actions>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- int $count = $arg4">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- $count = $arg4; int $dummyV = 1">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- int $failures = $arg5">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- $failures = $arg5; int $dummyV = 1">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- const char * $testName = (const char *)[(NSString*)[$arg3 description] UTF8String]">
                  </ActionContent>
               </BreakpointActionProxy>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.DebuggerCommand">
                  <ActionContent
                     consoleCommand = "e -l objc -- $testName = (const char *)[(NSString*)[$arg3 description] UTF8String]; int $dummyV = 1">
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
                  symbolName = "-[TDDInjectionTestsObserver failedWithTitle:allFailedCasesCount:allFailuresCount:]"
                  moduleName = "InjectionTDD"
                  usesParentBreakpointCondition = "Yes"
                  offsetFromSymbolStart = "0">
               </Location>
            </Locations>
         </BreakpointContent>
      </BreakpointProxy>
    </xsl:copy>
</xsl:template>


</xsl:stylesheet> 

