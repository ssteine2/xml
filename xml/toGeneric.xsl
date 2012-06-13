<?xml version='1.0' encoding='UTF-8'?>
<!-- $Id: toGeneric.xsl 368 2009-06-03 15:13:57Z ststefa $ -->
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
		encoding="UTF-8" />
	<xsl:template match="*">
		<xsl:choose>
			<xsl:when test="count(*) > 0">
				<xsl:element name="object">
					<xsl:attribute name="type">
						<xsl:value-of select="name()" />
					</xsl:attribute>
					<xsl:apply-templates />
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="property">
					<xsl:attribute name="name">
						<xsl:value-of select="name()" />
					</xsl:attribute>
					<xsl:apply-templates />
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
