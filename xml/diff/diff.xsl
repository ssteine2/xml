<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:set="http://exslt.org/sets">

    <xsl:output method="xml" />

    <xsl:variable
        name="i"
        select="document('diffin1.xml')" />
    <xsl:variable
        name="e"
        select="document('diffin2.xml')" />
    <xsl:template match="/">
        <xsl:apply-templates select="set:difference($i, $e)" />
    </xsl:template>
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
