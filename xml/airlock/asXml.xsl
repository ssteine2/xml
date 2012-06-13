<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: asXml.xsl 532 2010-10-05 08:03:40Z ststefa $ -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns:xmi="http://www.omg.org/XMI">
    <xsl:output
        method="xml"
        indent="yes" />

    <!-- Just copy all nodes and attributes -->
    <xsl:template
        match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates
                select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <!-- If desired, strip out elements by just doing nothing if matched 
    <xsl:template
        match="@id" />
    -->

</xsl:stylesheet>