<?xml version='1.0' encoding='UTF-8'?>
<!-- $Id: toStyleSheet.xsl 368 2009-06-03 15:13:57Z ststefa $ -->
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
		indent="yes"/>
	<xsl:template match="/">
		<xsl:element name="xsl:stylesheet">
			<xsl:element name="xsl:output">
				<xsl:attribute name="method">
					<xsl:text>xml</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="indent">
					<xsl:text>yes</xsl:text>
				</xsl:attribute>
			</xsl:element>
			<xsl:element name="xsl:template">
				<xsl:attribute name="match">
					<xsl:text>/</xsl:text>
				</xsl:attribute>
				<xsl:apply-templates />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="*">
		<xsl:element name="xsl:element">
			<xsl:attribute name="name">
				<xsl:value-of select="name()" />
			</xsl:attribute>
			<xsl:element name="xsl:value-of">
				<xsl:attribute name="select">
				<xsl:text>.</xsl:text>
				</xsl:attribute>
			</xsl:element>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
