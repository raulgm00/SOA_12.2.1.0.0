<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cl="http://servicios.montedepiedad.com.mx/NMP/Service/SapClientes" xmlns:n0="urn:sap-com:document:sap:soap:functions:mc-style" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
	<xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedadV2.xsl"/>
	<xsl:output indent="yes"/>
	<xsl:param name="app"/>
	<xsl:param name="serviceName"/>
	<xsl:param name="soapFault"/>
      <!--
       	<soap-env:Body  	xmlns:soap-env="http://schemas.xmlsoap.org/soap/envelope/">
	<soap-env:Fault>
	<faultcode>soap-env:Client</faultcode>
	<faultstring  	xml:lang="es">ExCatalogos</faultstring>
	<detail>
	<n0:ZlmRfcCreaBp.Exception  	xmlns:n0="urn:sap-com:document:sap:soap:functions:mc-style">
	<Name>ExCatalogos</Name>
	<Text>Error al obtener catálogo.</Text>
	<Message>
	<ID>ZLMMC_FINOBANK</ID>
	<Number>059</Number>
	</Message>
	</n0:ZlmRfcCreaBp.Exception>
	</detail>
	</soap-env:Fault>
	</soap-env:Body>
      
      -->
	<xsl:template match="/">
		<xsl:variable name="appCode" select="substring-before(ctx:fault/ctx:errorCode,'-')"/>
		<xsl:variable name="errorCode">
			<xsl:choose>
				<xsl:when test="$appCode != 'OSB'">
					<xsl:value-of select="substring-after(ctx:fault/ctx:errorCode,'-')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="number(substring-after(ctx:fault/ctx:errorCode,concat($appCode,'-')))"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="codigoError">
			<xsl:choose>
                                <xsl:when test="$soapFault//n0:ZlmRfcCreaBp.Exception">
                                  <xsl:value-of select="'NMP-SAP-1001'"/>
                                </xsl:when>
				<xsl:when test="contains($appCode,'NMP')">
					<xsl:value-of select="ctx:fault/ctx:errorCode"/>
				</xsl:when>                              
				<xsl:otherwise>
					<xsl:call-template name="codigoError">
						<xsl:with-param name="errorCode" select="$errorCode"/>
						<xsl:with-param name="serviceName" select="$serviceName"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="faultstring">
			<xsl:choose>
				<xsl:when test="($appCode = 'OSB' and ($errorCode = 382500 or $errorCode = 380001 ) ) or  ($appCode = 'NMP')">
					<xsl:choose>
						<xsl:when test="$app =1">
							<xsl:text>Error en creacion de BP</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="faultstring">
						<xsl:with-param name="errorCode" select="$errorCode"/>
						<xsl:with-param name="serviceName" select="$serviceName"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="descripcionError">
			<xsl:choose>
                                <xsl:when test="$soapFault//n0:ZlmRfcCreaBp.Exception">
                                  <xsl:value-of select="concat($soapFault//n0:ZlmRfcCreaBp.Exception/Name,'-',$soapFault//n0:ZlmRfcCreaBp.Exception/Text)"/>
                                </xsl:when>
				<xsl:when test="$appCode = 'NMP'">                                    
					<xsl:value-of select="substring(ctx:fault/ctx:reason,0,1500)"/>
				</xsl:when>
				<xsl:when test="$appCode = 'OSB'">
					<xsl:call-template name="descripcionError">
						<xsl:with-param name="errorCode" select="$errorCode"/>
						<xsl:with-param name="fault" select="/ctx:fault"/>
						<xsl:with-param name="serviceName" select="$serviceName"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring(ctx:fault/ctx:details,0,1500)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!---Generate Fault -->
		<soap:Fault>
			<faultcode>cl:sapClienteFault</faultcode>
			<faultstring>
				<xsl:value-of select="$faultstring"/>
			</faultstring>
			<detail>
				<ns1:messageError>
					<ns1:codigoError>
						<xsl:value-of select="$codigoError"/>
					</ns1:codigoError>
					<ns1:descripcionError>
						<xsl:value-of select="$descripcionError"/>
					</ns1:descripcionError>
					<ns1:tipoError>
						<xsl:call-template name="tipoError">
							<xsl:with-param name="errorCode" select="$errorCode"/>
							<xsl:with-param name="serviceName" select="$serviceName"/>
						</xsl:call-template>
					</ns1:tipoError>
					<ns1:severidad>
						<xsl:call-template name="severidad">
							<xsl:with-param name="errorCode" select="$errorCode"/>
							<xsl:with-param name="serviceName" select="$serviceName"/>
						</xsl:call-template>
					</ns1:severidad>
				</ns1:messageError>
			</detail>
		</soap:Fault>
		<!---End Generate Fault -->
	</xsl:template>
</xsl:stylesheet>