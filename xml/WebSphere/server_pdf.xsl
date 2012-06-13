<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:fo="http://www.w3.org/1999/XSL/Format" 
xmlns:process="http://www.ibm.com/websphere/appserver/schemas/5.0/process.xmi" 
version="1.0">
	<xsl:output method="xml"/>
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="first" page-height="29.7cm" page-width="21cm" margin-top="2.0cm" margin-bottom="1.5cm" margin-left="1.5cm" margin-right="1.5cm">
					<fo:region-before region-name="first-before" extent="2.0cm" background-color="#FFFFFF"/>
					<fo:region-body margin-top="2.0cm" margin-bottom="1.5cm" background-color="#FFFFFF"/>
				</fo:simple-page-master>
				<fo:page-sequence-master master-name="documentation">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference page-position="any" master-reference="first"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="documentation">
				<fo:static-content flow-name="first-before">
					<fo:block>
						<xsl:text>Server Definition </xsl:text>
						<xsl:value-of select="/process:Server/@name"/>
					</fo:block>
					<fo:block>
						<fo:leader leader-pattern="rule" rule-thickness="0.1pt" leader-length="100%"/>
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block font-size="10pt">
						<fo:block break-after="page">
							<xsl:call-template name="general"/>
							<xsl:call-template name="logfiles"/>
							<xsl:call-template name="process"/>
							<xsl:call-template name="jvm"/>
						</fo:block>
						<fo:block id="end"/>
					</fo:block>
				</fo:flow>
				<fo:static-content flow-name="first-before">
					<fo:block color="#808080" text-align="end"><fo:page-number/> von <fo:page-number-citation ref-id="end"/></fo:block>
				</fo:static-content>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	
	<xsl:template name="general">
		<fo:block font-size="14pt" font-weight="bold" padding-before="1cm" background-color="#C0C0C0">
			<xsl:text>Generelle Server Einstellungen</xsl:text>
		</fo:block>
		<fo:block>
			<fo:table table-layout="fixed">
				<fo:table-column column-width="12cm"/>
				<fo:table-column column-width="6cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Initialer Status</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/stateManagement/@initialState"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Statistik Provider</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/statisticsProvider/@specification"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Restart status</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/monitoringPolicy/@nodeRestartState"/>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template name="logfiles">
		<fo:block font-size="14pt" font-weight="bold" padding-before="1cm" background-color="#C0C0C0">
			<xsl:text>Log Dateien</xsl:text>
		</fo:block>
		<fo:block>
			<fo:table table-layout="fixed">
				<fo:table-column column-width="12cm"/>
				<fo:table-column column-width="6cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>stdout</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/outputStreamRedirect/@fileName"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>stderr</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/errorStreamRedirect/@fileName"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>native stdout</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/ioRedirect/@stdoutFilename"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>native stderr</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/ioRedirect/@stderrFilename"/>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	
	<xsl:template name="process">
		<fo:block font-size="14pt" font-weight="bold" padding-before="1cm" background-color="#C0C0C0">
			<xsl:text>Prozess Definition</xsl:text>
		</fo:block>
		<fo:block>
			<fo:table table-layout="fixed">
				<fo:table-column column-width="12cm"/>
				<fo:table-column column-width="6cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Ausführbare Datei</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/@executableName"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Arbeitsverzeichnis</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/@workingDirectory"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>umask</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/execution/@umask"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Ausführen als Benutzer</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/execution/@runAsUser"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Ausführen als Gruppe</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/execution/@runAsGroup"/>
						</fo:table-cell>
					</fo:table-row>
					<xsl:apply-templates select="/processDefinition/environment/*"/>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>

    <xsl:template match="environment/*">
		<fo:table-row>
			<fo:table-cell>
				<xsl:value-of select="@name"/>
			</fo:table-cell>
			<fo:table-cell>
				<xsl:value-of select="@value"/>
			</fo:table-cell>
		</fo:table-row>
    </xsl:template>

	<xsl:template name="jvm">
		<fo:block font-size="14pt" font-weight="bold" padding-before="1cm" background-color="#C0C0C0">
			<xsl:text>Einstellungen der JVM</xsl:text>
		</fo:block>
		<fo:block>
			<fo:table table-layout="fixed">
				<fo:table-column column-width="12cm"/>
				<fo:table-column column-width="6cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>verboseClassloader</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/jvmEntries/@verboseModeClass"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>verboseJni</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/jvmEntries/@verboseModeJNI"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>verboseGc</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/jvmEntries/@verboseModeGarbageCollection"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Initiale Heap Größe</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/jvmEntries/@initialHeapSize"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Maximale Heap Größe</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/jvmEntries/@maximumHeapSize"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>HProd Profiler aktiviert</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/jvmEntries/@runHProf"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Debug aktiviert</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/jvmEntries/@debugMode"/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<xsl:text>Zusätzliche Argumente</xsl:text>
						</fo:table-cell>
						<fo:table-cell>
							<xsl:value-of select="/processDefinition/jvmEntries/@genericJvmArguments"/>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
