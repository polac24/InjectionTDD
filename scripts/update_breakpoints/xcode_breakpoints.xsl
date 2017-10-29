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
            symbolName = "[TDDInjectionTestsObserver failedWithTitle:allFailedCasesCount:allFailuresCount:]"
            moduleName = "">
            <Actions>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.AppleScript">
                  <ActionContent
                     script = "display notification &quot;Failed tests &quot; with title &quot;Tests Failed&quot; ">
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
                  urlString = ""
                  timestampString = "530889001.663247"
                  startingColumnNumber = "9223372036854775807"
                  endingColumnNumber = "9223372036854775807"
                  startingLineNumber = "76"
                  endingLineNumber = "76"
                  offsetFromSymbolStart = "73">
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
            symbolName = "[TDDInjectionTestsObserver succeededWithTitle:allCasesCount:]"
            moduleName = "">
            <Actions>
               <BreakpointActionProxy
                  ActionExtensionID = "Xcode.BreakpointAction.AppleScript">
                  <ActionContent
                     script = "display notification &quot;Suceeded tests&quot; with title &quot;Tests Succeeded&quot; ">
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
                  urlString = ""
                  timestampString = "530889001.667727"
                  startingColumnNumber = "9223372036854775807"
                  endingColumnNumber = "9223372036854775807"
                  startingLineNumber = "80"
                  endingLineNumber = "80"
                  offsetFromSymbolStart = "61">
               </Location>
            </Locations>
         </BreakpointContent>
      </BreakpointProxy>
    </xsl:copy>
</xsl:template>


</xsl:stylesheet> 

