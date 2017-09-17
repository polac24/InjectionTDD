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
                  ActionExtensionID = "Xcode.BreakpointAction.AppleScript">
                  <ActionContent
                     script = "display notification &quot;Suceeded @$arg4@ tests&quot; with title &quot;Tests Succeeded&quot; subtitle @(const char *)[(NSString*)[$arg3 description] UTF8String]@">
                  </ActionContent>
               </BreakpointActionProxy>
            </Actions>
            <Locations>
               <Location
                  shouldBeEnabled = "Yes"
                  ignoreCount = "0"
                  continueAfterRunningActions = "No"
                  symbolName = "InjectionTDD.InjectionTDDTestsObserver.finishedSuccessed (Swift.String) -&gt; ()"
                  moduleName = "InjectionTDD"
                  usesParentBreakpointCondition = "Yes"
                  timestampString = "526152723.679896"
                  startingColumnNumber = "9223372036854775807"
                  endingColumnNumber = "9223372036854775807"
                  startingLineNumber = "20"
                  endingLineNumber = "20"
                  offsetFromSymbolStart = "24">
               </Location>
               <Location
                  shouldBeEnabled = "Yes"
                  ignoreCount = "0"
                  continueAfterRunningActions = "No"
                  symbolName = "@objc InjectionTDD.InjectionTDDTestsObserver.finishedSuccessed (Swift.String) -&gt; ()"
                  moduleName = "InjectionTDD"
                  usesParentBreakpointCondition = "Yes"
                  timestampString = "526152723.682948"
                  startingColumnNumber = "9223372036854775807"
                  endingColumnNumber = "9223372036854775807"
                  startingLineNumber = "0"
                  endingLineNumber = "0"
                  offsetFromSymbolStart = "4">
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
                  ActionExtensionID = "Xcode.BreakpointAction.AppleScript">
                  <ActionContent
                     script = "display notification &quot;Failed with @$arg4@ tests (@$arg5@ failures)&quot; with title &quot;Tests Failed&quot; subtitle @(const char *)[(NSString*)[$arg3 description] UTF8String]@">
                  </ActionContent>
               </BreakpointActionProxy>
            </Actions>
            <Locations>
               <Location
                  shouldBeEnabled = "Yes"
                  ignoreCount = "0"
                  continueAfterRunningActions = "No"
                  symbolName = "InjectionTDD.InjectionTDDTestsObserver.finishedWithError (Swift.String) -&gt; ()"
                  moduleName = "InjectionTDD"
                  usesParentBreakpointCondition = "Yes"
                  timestampString = "526152723.66867"
                  startingColumnNumber = "9223372036854775807"
                  endingColumnNumber = "9223372036854775807"
                  startingLineNumber = "21"
                  endingLineNumber = "21"
                  offsetFromSymbolStart = "24">
               </Location>
               <Location
                  shouldBeEnabled = "Yes"
                  ignoreCount = "0"
                  continueAfterRunningActions = "No"
                  symbolName = "@objc InjectionTDD.InjectionTDDTestsObserver.finishedWithError (Swift.String) -&gt; ()"
                  moduleName = "InjectionTDD"
                  usesParentBreakpointCondition = "Yes"
                  timestampString = "526152723.671602"
                  startingColumnNumber = "9223372036854775807"
                  endingColumnNumber = "9223372036854775807"
                  startingLineNumber = "0"
                  endingLineNumber = "0"
                  offsetFromSymbolStart = "4">
               </Location>
            </Locations>
         </BreakpointContent>
      </BreakpointProxy>


    </xsl:copy>
</xsl:template>


</xsl:stylesheet> 

