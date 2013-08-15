<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:xmi="http://www.omg.org/XMI">
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <!-- The following elements are stripped from the result -->
    <xsl:template match="interceptors" />
    <xsl:template match="statisticsProvider" />
    <xsl:template match="connectors" />
    <xsl:template match="properties" />
    <xsl:template match="plugins" />

</xsl:stylesheet>
