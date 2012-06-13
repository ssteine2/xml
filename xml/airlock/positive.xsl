<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: asXml.xsl 532 2010-10-05 08:03:40Z ststefa $ -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns:xmi="http://www.omg.org/XMI"
    exclude-result-prefixes="xmi">
    <xsl:output
        method="xml"
        indent="yes"
        standalone="yes" />

    <xsl:template match="ConfigRoot">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>
    
<!-- 
    <xsl:template match="VirtualHosts">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="VirtualHost">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="HostName">
        <xsl:copy>
            <xsl:apply-templates
                mode="copy"
                select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="PathRewrites">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="PathRewrite">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="from">
        <from>
            <xsl:apply-templates
                select="node()"
                mode="copy" />
        </from>
    </xsl:template>

    <xsl:template match="to">
        <to>
            <xsl:apply-templates
                select="node()"
                mode="copy" />
        </to>
    </xsl:template>
 -->

    <xsl:template match="Mappings">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Mapping">
        <xsl:if test="EntryPath!=BackendPath">
            <xsl:copy>
                <xsl:apply-templates select="node()|@*" />
            </xsl:copy>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Name">
        <xsl:copy>
            <xsl:apply-templates
                mode="copy"
                select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="EntryPath">
        <xsl:copy>
            <xsl:apply-templates
                mode="copy"
                select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="BackendPath">
        <xsl:copy>
            <xsl:apply-templates
                mode="copy"
                select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template
        match="node()|@*"
        mode="copy">
        <xsl:copy>
            <xsl:apply-templates
                mode="copy"
                select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <!-- Drop the rest -->
    <xsl:template match="node()|@*" />

</xsl:stylesheet>