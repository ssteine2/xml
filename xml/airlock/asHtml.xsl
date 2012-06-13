<?xml version='1.0' encoding='UTF-8'?>
    <!-- $Id: asHtml.xsl 545 2010-10-11 13:57:51Z zoezalt $ -->
    <!--
	Transform an arbitrary XML document to neseted colored HTML boxes.
	Nodes whose names end with "Url" will be rendered as hyperlinks.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <xsl:param name="depth" select="0" />
        <html>
            <head>
                <link href="asHtml.css" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <xsl:apply-templates select="*">
                    <xsl:with-param name="count" select="$depth + 1" />
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="*">
        <xsl:param name="count" select="0" />
        <xsl:choose>
            <xsl:when test="count(*) = 0">
                <div>
                    <xsl:attribute name="class">
						<xsl:text>level</xsl:text>
						<xsl:value-of select="$count" />
					</xsl:attribute>
                    <xsl:value-of select="name()" />
                    <xsl:apply-templates select="@*" />
                    <xsl:text>&#x20;:&#x20;</xsl:text>
					<xsl:choose>
						<xsl:when test="substring(name(),string-length(name())-2) = 'Url'">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="." />
								</xsl:attribute>
								<xsl:value-of select="." />
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="." />
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div>
					<xsl:attribute name="class">
						<xsl:text>level</xsl:text>
						<xsl:value-of select="$count" />
					</xsl:attribute>
					<xsl:value-of select="name()" />
					<xsl:apply-templates select="@*" />
					<xsl:apply-templates select="*">
						<xsl:with-param
							name="count"
							select="$count + 1" />
					</xsl:apply-templates>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Output the attributes as comma delimited list surrounded by brackets -->
	<xsl:template match="@*">
		<xsl:if test="position()=1">
			<xsl:text>&#x20;(</xsl:text>
		</xsl:if>
		<xsl:value-of select="name()" />
		<xsl:text>=</xsl:text>
		<xsl:value-of select="current()" />
		<xsl:choose>
			<xsl:when test="position()=last()">
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>,&#x20;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
