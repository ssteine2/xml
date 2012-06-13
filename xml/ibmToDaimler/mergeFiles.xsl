<?xml version='1.0' encoding='UTF-8'?>
<!-- $Id: mergeFiles.xsl 368 2009-06-03 15:13:57Z ststefa $ -->
<!--
	Transform an arbitrary XML document to a generic structure of object
	and property nodes. A node with children is considered an object,
	otherwise it is considered a property
-->
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output
		method="xml"
		encoding="UTF-8"
		indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:template match="/">
		<xsl:element name="WebSphereServerConfig">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="File">
		<xsl:copy-of select="document(.)" />
	</xsl:template>
</xsl:stylesheet>
