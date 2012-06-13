<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:xmi="http://www.omg.org/XMI">
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/">
        <Server>
            <xsl:attribute name="name">
                <xsl:value-of select="@name" />
            </xsl:attribute>
            <xsl:apply-templates select="stateManagement | statisticsProvider | errorStreamRedirect | outputStreamRedirect | processDefinition" />
            <services>
                <xsl:for-each select="services">
                    <service>
                        <xsl:attribute name="xmi:type">
                            <xsl:value-of select="@xmi:type" />
                        </xsl:attribute>
                        <xsl:if test="enable">
                            <xsl:attribute name="enable">
                                <xsl:value-of select="@enable" />
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@startupTraceSpecification">
                            <xsl:attribute name="startupTraceSpecification">
                                <xsl:value-of select="@startupTraceSpecification" />
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:apply-templates select="*" />
                    </service>
                </xsl:for-each>
            </services>
            <components>
                <xsl:for-each select="components">
                    <component>
                        <xsl:attribute name="xmi:type">
                            <xsl:value-of select="@xmi:type" />
                        </xsl:attribute>
                        <xsl:apply-templates select="*" />
                    </component>
                </xsl:for-each>
            </components>
        </Server>
    </xsl:template>

    <xsl:template match="stateManagement">
        <stateManagement>
            <xsl:attribute name="initialState">
                <xsl:value-of select="@initialState" />
            </xsl:attribute>
        </stateManagement>
    </xsl:template>

    <xsl:template match="statisticsProvider">
        <statisticsProvider>
            <xsl:attribute name="initialState">
                <xsl:value-of select="@initialState" />
            </xsl:attribute>
        </statisticsProvider>
    </xsl:template>

    <xsl:template match="errorStreamRedirect">
        <errorStreamRedirect>
            <xsl:attribute name="fileName">
                <xsl:value-of select="@fileName" />
            </xsl:attribute>
            <xsl:attribute name="maxNumberOfBackupFiles">
                <xsl:value-of select="@maxNumberOfBackupFiles" />
            </xsl:attribute>
            <xsl:attribute name="rolloverType">
                <xsl:value-of select="@rolloverType" />
            </xsl:attribute>
        </errorStreamRedirect>
    </xsl:template>

    <xsl:template match="outputStreamRedirect">
        <outputStreamRedirect>
            <xsl:attribute name="fileName">
                <xsl:value-of select="@fileName" />
            </xsl:attribute>
            <xsl:attribute name="maxNumberOfBackupFiles">
                <xsl:value-of select="@maxNumberOfBackupFiles" />
            </xsl:attribute>
            <xsl:attribute name="rolloverType">
                <xsl:value-of select="@rolloverType" />
            </xsl:attribute>
        </outputStreamRedirect>
    </xsl:template>

    <xsl:template match="processDefinition">
        <processDefinition>
            <xsl:attribute name="executableName">
                <xsl:value-of select="@executableName" />
            </xsl:attribute>
            <xsl:attribute name="workingDirectory">
                <xsl:value-of select="@workingDirectory" />
            </xsl:attribute>
            <xsl:apply-templates select="execution | ioRedirect | environment | monitoringPolicy | jvmEntries" />
        </processDefinition>
    </xsl:template>

    <xsl:template match="execution">
        <execution>
            <xsl:attribute name="processPriority">
                <xsl:value-of select="@processPriority" />
            </xsl:attribute>
            <xsl:attribute name="umask">
                <xsl:value-of select="@umask" />
            </xsl:attribute>
            <xsl:attribute name="runAsUser">
                <xsl:value-of select="@runAsUser" />
            </xsl:attribute>
            <xsl:attribute name="runAsGroup">
                <xsl:value-of select="@runAsGroup" />
            </xsl:attribute>
        </execution>
    </xsl:template>

    <xsl:template match="ioRedirect">
        <ioRedirect>
            <xsl:attribute name="stdoutFilename">
                <xsl:value-of select="@stdoutFilename" />
            </xsl:attribute>
            <xsl:attribute name="stderrFilename">
                <xsl:value-of select="@stderrFilename" />
            </xsl:attribute>
        </ioRedirect>
    </xsl:template>

    <xsl:template match="environment">
        <environment>
            <xsl:attribute name="name">
                <xsl:value-of select="@name" />
            </xsl:attribute>
            <xsl:attribute name="value">
                <xsl:value-of select="@value" />
            </xsl:attribute>
        </environment>
    </xsl:template>

    <xsl:template match="monitoringPolicy">
        <monitoringPolicy>
            <xsl:attribute name="nodeRestartState">
                <xsl:value-of select="@nodeRestartState" />
            </xsl:attribute>
        </monitoringPolicy>
    </xsl:template>

    <xsl:template match="jvmEntries">
        <jvmEntries>
            <xsl:attribute name="verboseModeClass">
                <xsl:value-of select="@verboseModeClass" />
            </xsl:attribute>
            <xsl:attribute name="verboseModeJNI">
                <xsl:value-of select="@vverboseModeJNI" />
            </xsl:attribute>
            <xsl:attribute name="verboseModeGarbageCollection">
                <xsl:value-of select="@verboseModeGarbageCollection" />
            </xsl:attribute>
            <xsl:attribute name="initialHeapSize">
                <xsl:value-of select="@initialHeapSize" />
            </xsl:attribute>
            <xsl:attribute name="maximumHeapSize">
                <xsl:value-of select="@maximumHeapSize" />
            </xsl:attribute>
            <xsl:attribute name="runHProf">
                <xsl:value-of select="@runHProf" />
            </xsl:attribute>
            <xsl:attribute name="debugMode">
                <xsl:value-of select="@debugMode" />
            </xsl:attribute>
            <xsl:attribute name="genericJvmArguments">
                <xsl:value-of select="@genericJvmArguments" />
            </xsl:attribute>
        </jvmEntries>
    </xsl:template>

    <xsl:template match="services">
        <service>
            <xsl:attribute name="xmi:type">
                <xsl:value-of select="@xmi:type" />
            </xsl:attribute>
            <xsl:if test="@enable">
                <xsl:attribute name="enable">
                    <xsl:value-of select="@enable" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@totalTranLifetimeTimeout">
                <xsl:attribute name="totalTranLifetimeTimeout">
                    <xsl:value-of select="@totalTranLifetimeTimeout" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="*" />
        </service>
    </xsl:template>

    <xsl:template match="components">
        <component>
            <xsl:attribute name="xmi:type">
                <xsl:value-of select="@xmi:type" />
            </xsl:attribute>
            <xsl:apply-templates select="*" />
        </component>
    </xsl:template>

    <xsl:template match="listenerPorts">
        <listenerPorts>
            <xsl:attribute name="name">
                <xsl:value-of select="@name" />
            </xsl:attribute>
            <xsl:attribute name="connectionFactoryJNDIName">
                <xsl:value-of select="@connectionFactoryJNDIName" />
            </xsl:attribute>
            <xsl:attribute name="destinationJNDIName">
                <xsl:value-of select="@destinationJNDIName" />
            </xsl:attribute>
            <xsl:attribute name="maxSessions">
                <xsl:value-of select="@maxSessions" />
            </xsl:attribute>
            <xsl:attribute name="maxRetries">
                <xsl:value-of select="@maxRetries" />
            </xsl:attribute>
            <xsl:attribute name="maxMessages">
                <xsl:value-of select="@maxMessages" />
            </xsl:attribute>
            <xsl:apply-templates select="*" />
        </listenerPorts>
    </xsl:template>

    <xsl:template match="threadPool">
        <threadPool>
            <xsl:attribute name="minimumSize">
                <xsl:value-of select="@minimumSize" />
            </xsl:attribute>
            <xsl:attribute name="maximumSize">
                <xsl:value-of select="@maximumSize" />
            </xsl:attribute>
        </threadPool>
    </xsl:template>

    <xsl:template match="cacheSettings">
        <cacheSettings>
            <xsl:attribute name="cleanupInterval">
                <xsl:value-of select="@cleanupInterval" />
            </xsl:attribute>
            <xsl:attribute name="cacheSize">
                <xsl:value-of select="@cacheSize" />
            </xsl:attribute>
        </cacheSettings>
    </xsl:template>

    <xsl:template match="traceLog">
        <traceLog>
            <xsl:attribute name="fileName">
                <xsl:value-of select="@fileName" />
            </xsl:attribute>
            <xsl:attribute name="rolloverSize">
                <xsl:value-of select="@rolloverSize" />
            </xsl:attribute>
            <xsl:attribute name="maxNumberOfBackupFiles">
                <xsl:value-of select="@maxNumberOfBackupFiles" />
            </xsl:attribute>
        </traceLog>
    </xsl:template>
</xsl:stylesheet>
