<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="dcx/websphere/siteDescriptions-1.0"
	version="1.0">
	<xsl:output
		method="xml"
		indent="yes" />
	<xsl:template match="Site">
		<xsl:element name="out">
			<xsl:value-of select="Cell[CellName='E050_WAS6_INT01']/Node[NodeName='w60in01n01']/PrimaryDnsName" />
			<xsl:value-of select="Cell[CellName='E050_WAS6_INT01']/Node[NodeName='w60in01n01']/Server[ServerName='STEST_Server']" />
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
