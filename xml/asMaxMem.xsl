<?xml version="1.0" encoding="UTF-8"?>
    <!-- $Id: asMaxMem.xsl 368 2009-06-03 15:13:57Z ststefa $ -->
    <!--
	Transform an arbitrary XML document to plain indented ASCII
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:iti="dcx/websphere/serverAdjustments-1.0"
    exclude-result-prefixes="xsl xsi">
    <xsl:output method="text" encoding="UTF-8" />

    <xsl:template match="iti:ServerAdjustment">
        <xsl:value-of select="iti:ServerName" />
        <xsl:value-of select="iti:ProcessDefinition/iti:JavaVirtualMachine/iti:MaximumHeapSize" />
    </xsl:template>
</xsl:stylesheet>
