<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:adminservice="http://www.ibm.com/websphere/appserver/schemas/5.0/adminservice.xmi"
	xmlns:applicationserver="http://www.ibm.com/websphere/appserver/schemas/5.0/applicationserver.xmi"
	xmlns:applicationserver.ejbcontainer="http://www.ibm.com/websphere/appserver/schemas/5.0/applicationserver.ejbcontainer.xmi"
	xmlns:applicationserver.ejbcontainer.messagelistener="http://www.ibm.com/websphere/appserver/schemas/5.0/applicationserver.ejbcontainer.messagelistener.xmi"
	xmlns:applicationserver.webcontainer="http://www.ibm.com/websphere/appserver/schemas/5.0/applicationserver.webcontainer.xmi"
	xmlns:channelservice="http://www.ibm.com/websphere/appserver/schemas/6.0/channelservice.xmi"
	xmlns:channelservice.channels="http://www.ibm.com/websphere/appserver/schemas/6.0/channelservice.channels.xmi"
	xmlns:coregroupbridgeservice="http://www.ibm.com/websphere/appserver/schemas/6.0/coregroupbridgeservice.xmi"
	xmlns:loggingservice.http="http://www.ibm.com/websphere/appserver/schemas/6.0/loggingservice.http.xmi"
	xmlns:loggingservice.ras="http://www.ibm.com/websphere/appserver/schemas/5.0/loggingservice.ras.xmi"
	xmlns:namingserver="http://www.ibm.com/websphere/appserver/schemas/5.0/namingserver.xmi"
	xmlns:orb="http://www.ibm.com/websphere/appserver/schemas/5.0/orb.xmi"
	xmlns:pmiservice="http://www.ibm.com/websphere/appserver/schemas/5.0/pmiservice.xmi"
	xmlns:process="http://www.ibm.com/websphere/appserver/schemas/5.0/process.xmi"
	xmlns:processexec="http://www.ibm.com/websphere/appserver/schemas/5.0/processexec.xmi"
	xmlns:threadpoolmanager="http://www.ibm.com/websphere/appserver/schemas/6.0/threadpoolmanager.xmi"
	xmlns:tperfviewer="http://www.ibm.com/websphere/appserver/schemas/6.0/tperfviewer.xmi"
	xmlns:traceservice="http://www.ibm.com/websphere/appserver/schemas/5.0/traceservice.xmi"
	xmlns:resources.j2c="http://www.ibm.com/websphere/appserver/schemas/5.0/resources.j2c.xmi"
	xmlns:resources.jdbc="http://www.ibm.com/websphere/appserver/schemas/5.0/resources.jdbc.xmi"
	xmlns:resources.jms="http://www.ibm.com/websphere/appserver/schemas/5.0/resources.jms.xmi"
	xmlns:resources.jms.mqseries="http://www.ibm.com/websphere/appserver/schemas/5.0/resources.jms.mqseries.xmi"
	xmlns:resources.mail="http://www.ibm.com/websphere/appserver/schemas/5.0/resources.mail.xmi"
	xmlns:resources.url="http://www.ibm.com/websphere/appserver/schemas/5.0/resources.url.xmi"
	xmlns:libraries="http://www.ibm.com/websphere/appserver/schemas/5.0/libraries.xmi"
	xmlns:namebindings="http://www.ibm.com/websphere/appserver/schemas/5.0/namebindings.xmi"
	xmlns:xmi="http://www.omg.org/XMI"
	xmlns:pmeserver="http://www.ibm.com/websphere/appserver/schemas/5.0/pmeserver.xmi"
	xmlns:objectpoolmanager="http://www.ibm.com/websphere/appserver/schemas/5.0/objectpoolmanager.xmi"
	xmlns:scheduler="http://www.ibm.com/websphere/appserver/schemas/5.0/scheduler.xmi"
	xmlns:workmanager="http://www.ibm.com/websphere/appserver/schemas/5.0/workmanager.xmi"
	xmlns:variables="http://www.ibm.com/websphere/appserver/schemas/5.0/variables.xmi"
	xmlns="dcx/websphere/serverAdjustments-1.0"
	version="1.0">
	<xsl:output
		method="xml"
		indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates select="WebSphereServerConfig" />
	</xsl:template>
	<xsl:template match="WebSphereServerConfig">
		<xsl:element name="ServerAdjustments">
			<xsl:attribute name="xsi:schemaLocation">
				<xsl:text>dcx/websphere/serverAdjustments-1.0 serverAdjustments-1.0.xsd</xsl:text>
			</xsl:attribute>
			<xsl:element name="ServerAdjustment">
				<xsl:apply-templates select="process:Server" />
				<xsl:if test="libraries:Library or namebindings:StringNameSpaceBinding">
					<xsl:element name="Environment">
						<xsl:apply-templates select="libraries:Library" />
						<xsl:apply-templates select="namebindings:StringNameSpaceBinding" />
					</xsl:element>
				</xsl:if>
				<xsl:element name="Ressources">
					<xsl:apply-templates select="xmi:XMI/resources.jdbc:JDBCProvider[contains(@name, 'DB2 Universal JDBC Driver')]" />
					<xsl:apply-templates select="xmi:XMI/resources.jdbc:JDBCProvider[contains(@name, 'Oracle JDBC Driver')]" />
					<xsl:apply-templates select="xmi:XMI/resources.jdbc:JDBCProvider[contains(@name, 'WebSphere embedded ConnectJDBC driver for MS SQL Server')]" />
					<!-- <xsl:apply-templates select="xmi:XMI/resources.jdbc:JDBCProvider[contains(@name, 'Cloudscape JDBC Provider')]" /> -->
					<xsl:apply-templates select="xmi:XMI/resources.jms:JMSProvider[@name='WebSphere MQ JMS Provider']" />
					<xsl:apply-templates select="xmi:XMI/resources.jms:JMSProvider[@name='WebSphere JMS Provider']" />
					<xsl:apply-templates select="xmi:XMI/workmanager:TimerManagerProvider/factories" />
					<xsl:apply-templates select="xmi:XMI/workmanager:WorkManagerProvider/factories" />
					<xsl:apply-templates select="xmi:XMI/scheduler:SchedulerProvider/factories" />
					<xsl:if test="xmi:XMI/resources.mail:MailProvider/factories">
						<xsl:apply-templates select="xmi:XMI/resources.mail:MailProvider" />
					</xsl:if>
					<xsl:if test="xmi:XMI/resources.url:URLProvider/factories">
						<xsl:apply-templates select="xmi:XMI/resources.url:URLProvider" />
					</xsl:if>
				</xsl:element>
				<xsl:apply-templates select="//services[@xmi:type='threadpoolmanager:ThreadPoolManager']/threadPools[@name='WebContainer']" />
				<xsl:apply-templates select="//services[@xmi:type='orb:ObjectRequestBroker']/threadPool[@name='ORB.thread.pool']" />
				<xsl:apply-templates select="variables:VariableMap/entries" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="process:Server">
		<xsl:element name="ServerName">
			<xsl:value-of select="@name" />
		</xsl:element>
		<xsl:element name="ContainerServices">
			<xsl:element name="TransactionService">
				<xsl:element name="TotalTransactionLifetimeTimeout">
					<xsl:value-of select="//services[@xmi:type='applicationserver:TransactionService']/@totalTranLifetimeTimeout" />
				</xsl:element>
			</xsl:element>
			<xsl:element name="OrbService">
				<xsl:element name="PassByReference">
					<xsl:value-of select="not(//services[@xmi:type='orb:ObjectRequestBroker']/@noLocalCopies)" />
				</xsl:element>
			</xsl:element>
			<xsl:element name="StartupBeansService">
				<xsl:element name="EnableService">
					<xsl:value-of select="../pmeserver:PMEServerExtension/startupBeansService/@enable" />
				</xsl:element>
			</xsl:element>
		</xsl:element>
		<xsl:element name="WebContainer">
			<xsl:element name="SessionManagement">
				<xsl:element name="SessionTimeout">
					<xsl:value-of select="//services[@xmi:type='applicationserver.webcontainer:SessionManager']/tuningParams/@invalidationTimeout" />
				</xsl:element>
				<xsl:element name="EnableCookies">
					<xsl:value-of select="//services[@xmi:type='applicationserver.webcontainer:SessionManager']/@enableCookies" />
				</xsl:element>
				<xsl:element name="EnableUrlRewriting">
					<xsl:value-of select="//services[@xmi:type='applicationserver.webcontainer:SessionManager']/@enableUrlRewriting" />
				</xsl:element>
				<xsl:element name="DistributedSessionSettings">
					<xsl:element name="WriteFrequency">
						<xsl:choose>
							<xsl:when test="//services[@xmi:type='applicationserver.webcontainer:SessionManager']/tuningParams/@writeFrequency='END_OF_SERVLET_SERVICE'">
								<xsl:text>EndOfServletService</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//services[@xmi:type='applicationserver.webcontainer:SessionManager']/tuningParams/@writeFrequency" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
					<xsl:element name="WriteContents">
						<xsl:choose>
							<xsl:when test="//services[@xmi:type='applicationserver.webcontainer:SessionManager']/tuningParams/@writeContents='ALL_SESSION_ATTRIBUTES'">
								<xsl:text>AllSessionAttributes</xsl:text>
							</xsl:when>
							<xsl:when test="//services[@xmi:type='applicationserver.webcontainer:SessionManager']/tuningParams/@writeContents='UPDATED_SESSION_ATTRIBUTES'">
								<xsl:text>UpdatedSessionAttributes</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//services[@xmi:type='applicationserver.webcontainer:SessionManager']/tuningParams/@writeContents" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:element>
					<xsl:element name="SessionCleanupTime1">
						<xsl:value-of select="//services[@xmi:type='applicationserver.webcontainer:SessionManager']/tuningParams/invalidationSchedule/@firstHour" />
					</xsl:element>
					<xsl:element name="SessionCleanupTime2">
						<xsl:value-of select="//services[@xmi:type='applicationserver.webcontainer:SessionManager']/tuningParams/invalidationSchedule/@secondHour" />
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>
		<xsl:if test="//services[@xmi:type='applicationserver.ejbcontainer.messagelistener:MessageListenerService']">
			<xsl:element name="MessageListenerService">
				<xsl:apply-templates select="//services[@xmi:type='applicationserver.ejbcontainer.messagelistener:MessageListenerService']/listenerPorts" />
			</xsl:element>
		</xsl:if>
		<xsl:element name="ProcessExecution">
			<xsl:element name="RunAsUser">
				<xsl:value-of select="//execution/@runAsUser" />
			</xsl:element>
			<xsl:element name="RunAsGroup">
				<xsl:value-of select="//execution/@runAsGroup" />
			</xsl:element>
		</xsl:element>
		<xsl:element name="ProcessDefinition">
			<xsl:element name="JavaVirtualMachine">
				<xsl:element name="InitialHeapSize">
					<xsl:value-of select="//jvmEntries/@initialHeapSize" />
				</xsl:element>
				<xsl:element name="MaximumHeapSize">
					<xsl:value-of select="//jvmEntries/@maximumHeapSize" />
				</xsl:element>
				<xsl:element name="GenericJvmArguments">
					<xsl:value-of select="//jvmEntries/@genericJvmArguments" />
				</xsl:element>
				<xsl:apply-templates select="//jvmEntries/systemProperties" />
			</xsl:element>
			<xsl:apply-templates select="//environment" />
		</xsl:element>
		<xsl:apply-templates select="components/classloaders" />
	</xsl:template>
	<xsl:template match="listenerPorts">
		<xsl:element name="MessageListener">
			<xsl:element name="ListenerName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="InitialState">
				<xsl:choose>
					<xsl:when test="stateManagement/@initialState='START'">
						<xsl:text>started</xsl:text>
					</xsl:when>
					<xsl:when test="stateManagement/@initialState='STOP'">
						<xsl:text>stopped</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="stateManagement/@initialState" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="ConnectionFactoryJndiName">
				<xsl:value-of select="@connectionFactoryJNDIName" />
			</xsl:element>
			<xsl:element name="DestinationJndiName">
				<xsl:value-of select="@destinationJNDIName" />
			</xsl:element>
			<xsl:element name="MaximumSessions">
				<xsl:value-of select="@maxSessions" />
			</xsl:element>
			<xsl:element name="MaximumRetries">
				<xsl:value-of select="@maxRetries" />
			</xsl:element>
			<xsl:element name="MaximumMessages">
				<xsl:value-of select="@maxMessages" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="systemProperties|environment|resourceProperties">
		<xsl:element name="CustomProperty">
			<xsl:element name="CustomPropertyName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="CustomPropertyValue">
				<xsl:value-of select="@value" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="classloaders">
		<xsl:element name="ClassLoader">
			<xsl:element name="ClassLoaderMode">
				<xsl:choose>
					<xsl:when test="@mode='PARENT_FIRST'">
						<xsl:text>ParentFirst</xsl:text>
					</xsl:when>
					<xsl:when test="@mode='PARENT_LAST'">
						<xsl:text>ParentLast</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="@mode" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:apply-templates select="libraries" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="libraries">
		<xsl:element name="SharedLibraryReference">
			<xsl:value-of select="@libraryName" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="libraries:Library">
		<xsl:element name="SharedLibrary">
			<xsl:element name="SharedLibraryName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:apply-templates select="classPath" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="classPath">
		<xsl:element name="SharedLibraryClasspathEntry">
			<xsl:value-of select="." />
		</xsl:element>
	</xsl:template>
	<xsl:template match="namebindings:StringNameSpaceBinding">
		<xsl:element name="StringNameSpaceBinding">
			<xsl:element name="StringNameSpaceBindingName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="StringNameSpaceBindingValue">
				<xsl:value-of select="@stringToBind" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="resources.jdbc:JDBCProvider">
		<xsl:element name="JdbcProvider">
			<xsl:element name="JdbcProviderName">
				<xsl:choose>
					<xsl:when test="starts-with(@name, 'DB2 Universal JDBC')">
						<xsl:text>Db2UniversalJdbcDriver</xsl:text>
					</xsl:when>
					<xsl:when test="starts-with(@name, 'Oracle JDBC')">
						<xsl:text>OracleJdbcDriver</xsl:text>
					</xsl:when>
					<xsl:when test="starts-with(@name, 'WebSphere embedded ConnectJDBC')">
						<xsl:text>MssqlJdbcDriver</xsl:text>
					</xsl:when>
					<xsl:when test="starts-with(@name, 'Cloudscape JDBC')">
						<xsl:text>Cloudscape</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="@name" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="JdbcProviderDriverFile">
				<xsl:value-of select="substring-after(classpath,'/')" />
			</xsl:element>
			<xsl:element name="XaEnabled">
				<xsl:value-of select="@xa" />
			</xsl:element>
			<xsl:apply-templates select="factories" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="factories[@xmi:type='resources.jdbc:DataSource']">
		<xsl:element name="Datasource">
			<xsl:element name="DatasourceName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="DatasourceJndiName">
				<xsl:value-of select="@jndiName" />
			</xsl:element>
			<xsl:if test="starts-with(../@name, 'DB2 Universal JDBC')">
				<xsl:element name="DatabaseServer">
					<xsl:value-of select="propertySet/resourceProperties[@name='databaseName']/@value" />
				</xsl:element>
				<xsl:element name="DatabaseName">
					<xsl:value-of select="propertySet/resourceProperties[@name='serverName']/@value" />
				</xsl:element>
				<xsl:element name="DatabasePort">
					<xsl:value-of select="propertySet/resourceProperties[@name='portNumber']/@value" />
				</xsl:element>
			</xsl:if>
			<xsl:element name="CmpEnabled">
				<xsl:variable
					name="datasourceId"
					select="@xmi:id" />
				<xsl:choose>
					<xsl:when test="../../resources.j2c:J2CResourceAdapter/factories[@cmpDatasource=$datasourceId]">
						<xsl:text>true</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>false</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:if test="@authDataAlias">
				<xsl:element name="ComponentManagedAuthAlias">
					<xsl:value-of select="substring-after(@authDataAlias,'/')" />
				</xsl:element>
			</xsl:if>
			<xsl:apply-templates select="connectionPool" />
			<xsl:element name="PreparedStatementCacheSize">
				<xsl:value-of select="@statementCacheSize" />
			</xsl:element>
			<xsl:apply-templates select="propertySet/resourceProperties[@name='user' or @name='password']" />
			<xsl:if test="starts-with(../@name, 'Oracle')">
				<xsl:apply-templates select="propertySet/resourceProperties[@name='URL']" />
			</xsl:if>
			<xsl:if test="contains(../@name, 'MS SQL Server')">
				<xsl:apply-templates select="propertySet/resourceProperties[@name='databaseName' or @name='serverName' or @name='portNumber']" />
			</xsl:if>
			<xsl:if test="starts-with(../@name, 'Cloudscape')">
				<xsl:apply-templates select="propertySet/resourceProperties[@name='databaseName']" />
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template match="connectionPool">
		<xsl:element name="ConnectionPoolProperties">
			<xsl:element name="MinConnectionPoolSize">
				<xsl:value-of select="@minConnections" />
			</xsl:element>
			<xsl:element name="MaxConnectionPoolSize">
				<xsl:value-of select="@maxConnections" />
			</xsl:element>
			<xsl:element name="PurgePolicy">
				<xsl:value-of select="@purgePolicy" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="resources.jms:JMSProvider[@name='WebSphere MQ JMS Provider']">
		<xsl:element name="WebSphereMqMessaging">
			<xsl:apply-templates select="factories[@xmi:type='resources.jms.mqseries:MQQueueConnectionFactory']" />
			<xsl:apply-templates select="factories[@xmi:type='resources.jms.mqseries:MQQueue']" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="factories[@xmi:type='resources.jms.mqseries:MQQueueConnectionFactory']">
		<xsl:element name="QueueConnectionFactory">
			<xsl:element name="QueueConnectionFactoryName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="QueueConnectionFactoryJndiName">
				<xsl:value-of select="@jndiName" />
			</xsl:element>
			<xsl:element name="XaEnabled">
				<xsl:value-of select="@XAEnabled" />
			</xsl:element>
			<xsl:element name="QueueConnectionFactoryQueueManager">
				<xsl:value-of select="@queueManager" />
			</xsl:element>
			<xsl:element name="QueueConnectionFactoryHost">
				<xsl:value-of select="@host" />
			</xsl:element>
			<xsl:element name="QueueConnectionFactoryPort">
				<xsl:value-of select="@port" />
			</xsl:element>
			<xsl:element name="QueueConnectionFactoryChannel">
				<xsl:value-of select="@channel" />
			</xsl:element>
			<xsl:element name="QueueConnectionFactoryTransportType">
				<xsl:choose>
					<xsl:when test="@transportType = 'CLIENT'">
						<xsl:text>Client</xsl:text>
					</xsl:when>
					<xsl:when test="@transportType = 'BINDINGS'">
						<xsl:text>Bindings</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>@transportType</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="QueueConnectionFactoryClientId">
				<xsl:value-of select="@clientID" />
			</xsl:element>
			<xsl:apply-templates select="connectionPool" />
			<xsl:apply-templates select="sessionPool" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="sessionPool">
		<xsl:element name="SessionPoolProperties">
			<xsl:element name="MinSessionPoolSize">
				<xsl:value-of select="@minConnections" />
			</xsl:element>
			<xsl:element name="MaxSessionPoolSize">
				<xsl:value-of select="@maxConnections" />
			</xsl:element>
			<xsl:element name="PurgePolicy">
				<xsl:value-of select="@purgePolicy" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="factories[@xmi:type='resources.jms.mqseries:MQQueue']">
		<xsl:element name="QueueDestination">
			<xsl:element name="QueueDestinationName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="QueueDestinationJndiName">
				<xsl:value-of select="@jndiName" />
			</xsl:element>
			<xsl:element name="QueueDestinationBaseQueueName">
				<xsl:value-of select="@baseQueueName" />
			</xsl:element>
			<xsl:element name="TargetClient">
				<xsl:value-of select="@targetClient" />
			</xsl:element>
			<xsl:if test="@CCSID">
				<xsl:element name="CCSID">
					<xsl:value-of select="@CCSID" />
				</xsl:element>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template match="resources.jms:JMSProvider[@name='WebSphere JMS Provider']">
		<xsl:element name="V5DefaultMessaging">
			<xsl:apply-templates select="factories[@xmi:type='resources.jms.internalmessaging:WASQueueConnectionFactory']" />
			<xsl:apply-templates select="factories[@xmi:type='resources.jms.internalmessaging:WASQueue']" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="factories[@xmi:type='resources.jms.internalmessaging:WASQueueConnectionFactory']">
		<xsl:element name="QueueConnectionFactory">
			<xsl:element name="QueueConnectionFactoryName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="QueueConnectionFactoryJndiName">
				<xsl:value-of select="@jndiName" />
			</xsl:element>
			<xsl:element name="QueueConnectionFactoryNode">
				<xsl:value-of select="@node" />
			</xsl:element>
			<xsl:element name="XaEnabled">
				<xsl:value-of select="@XAEnabled" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="factories[@xmi:type='resources.jms.internalmessaging:WASQueue']">
		<xsl:element name="QueueDestination">
			<xsl:element name="QueueDestinationName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="QueueDestinationJndiName">
				<xsl:value-of select="@jndiName" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="factories[@xmi:type='workmanager:TimerManagerInfo']">
		<xsl:element name="TimerManager">
			<xsl:element name="TimerManagerName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="TimerManagerJndiName">
				<xsl:value-of select="@jndiName" />
			</xsl:element>
			<xsl:if test="@numAlarmThreads">
				<xsl:element name="TimerThreads">
					<xsl:value-of select="@numAlarmThreads" />
				</xsl:element>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template match="factories[@xmi:type='workmanager:WorkManagerInfo']">
		<xsl:element name="WorkManager">
			<xsl:element name="WorkManagerName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="WorkManagerJndiName">
				<xsl:value-of select="@jndiName" />
			</xsl:element>
			<xsl:element name="WorkRequestQueueFullAction">
				<xsl:choose>
					<xsl:when test="@workReqQFullAction = 1">
						<xsl:text>Fail</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Block</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="WorkTimeout">
				<xsl:value-of select="@workTimeout" />
			</xsl:element>
			<xsl:element name="AlarmThreads">
				<xsl:value-of select="@numAlarmThreads" />
			</xsl:element>
			<xsl:element name="MaxThreads">
				<xsl:value-of select="@maxThreads" />
			</xsl:element>
			<xsl:element name="Growable">
				<xsl:value-of select="@isGrowable" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="factories[@xmi:type='scheduler:SchedulerConfiguration']">
		<xsl:element name="Scheduler">
			<xsl:element name="SchedulerName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="SchedulerJndiName">
				<xsl:value-of select="@jndiName" />
			</xsl:element>
			<xsl:element name="SchedulerDatasourceJndiName">
				<xsl:value-of select="@datasourceJNDIName" />
			</xsl:element>
			<xsl:element name="TablePrefix">
				<xsl:value-of select="@tablePrefix" />
			</xsl:element>
			<xsl:if test="@pollInterval">
				<xsl:element name="PollInterval">
					<xsl:value-of select="@pollInterval" />
				</xsl:element>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template match="resources.mail:MailProvider">
		<xsl:element name="MailProvider">
			<xsl:apply-templates select="factories" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="factories[@xmi:type='resources.mail:MailSession']">
		<xsl:element name="MailSession">
			<xsl:element name="MailSessionName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="MailSessionJndiName">
				<xsl:value-of select="@jndiName" />
			</xsl:element>
			<xsl:element name="MailTransportHost">
				<xsl:value-of select="@mailTransportHost" />
			</xsl:element>
			<xsl:element name="MailTransportUserId">
				<xsl:value-of select="@mailTransportUser" />
			</xsl:element>
			<xsl:element name="MailTransportPassword">
				<xsl:value-of select="@mailTransportPassword" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="resources.url:URLProvider">
		<xsl:element name="UrlProvider">
			<xsl:apply-templates select="factories" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="factories[@xmi:type='resources.url:URL']">
		<xsl:element name="Url">
			<xsl:element name="UrlName">
				<xsl:value-of select="@name" />
			</xsl:element>
			<xsl:element name="UrlJndiName">
				<xsl:value-of select="@jndiName" />
			</xsl:element>
			<xsl:element name="UrlSpecification">
				<xsl:value-of select="@spec" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="threadPools[@name='WebContainer']">
		<xsl:element name="WebContainerThreadPool">
			<xsl:element name="MinimumSize">
				<xsl:value-of select="@minimumSize" />
			</xsl:element>
			<xsl:element name="MaximumSize">
				<xsl:value-of select="@maximumSize" />
			</xsl:element>
			<xsl:element name="Growable">
				<xsl:value-of select="@isGrowable" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="threadPool[@name='ORB.thread.pool']">
		<xsl:element name="OrbThreadPool">
			<xsl:element name="MinimumSize">
				<xsl:value-of select="@minimumSize" />
			</xsl:element>
			<xsl:element name="MaximumSize">
				<xsl:value-of select="@maximumSize" />
			</xsl:element>
			<xsl:element name="Growable">
				<xsl:value-of select="@isGrowable" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="variables:VariableMap/entries">
		<xsl:element name="WebsphereVariable">
			<xsl:element name="WebsphereVariableName">
				<xsl:value-of select="@symbolicName" />
			</xsl:element>
			<xsl:element name="WebsphereVariableValue">
				<xsl:value-of select="@value" />
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
