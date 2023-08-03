<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilREST" xmlns:ges="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilRESTTipos" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:param name="operation"/>
  <xsl:param name="app"/>
  <xsl:template name="detailFault" match="/">
    <xsl:param name="faultString"/>
    <ges:UpdateFieldsValues/>
    <ges:AfectedFields/>
    <ges:FormiikReservedWords>
      <ges:ReservedWord>AlertMessage</ges:ReservedWord>
      <ges:Value>
        <xsl:value-of select="$faultString"/>
      </ges:Value>
    </ges:FormiikReservedWords>
  </xsl:template>
  
  <xsl:template match="/"> 
     <xsl:variable name="appCode" select="substring-before(ctx:fault/ctx:errorCode,'-')"/>
  <xsl:variable name="beaCode">
    <xsl:choose>
        <xsl:when test="$appCode != 'OSB'">
        <xsl:value-of select="substring-after(ctx:fault/ctx:errorCode,'-')"/>
      </xsl:when>
        <xsl:otherwise>
        <xsl:value-of select="number(substring-after(ctx:fault/ctx:errorCode,concat($appCode,'-')))"/>
      </xsl:otherwise>
      </xsl:choose>
  </xsl:variable>
  <xsl:variable name="descErrorTemplate">        
			<xsl:call-template name="faultstring">
				<xsl:with-param name="beaCode" select="$beaCode"/>
			</xsl:call-template>
		</xsl:variable>
    <xsl:variable name="descError">
     <xsl:choose>
        <xsl:when test="/ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring">            
          <xsl:value-of select="/ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring"/>
        </xsl:when>
        <xsl:when test="$appCode = 'NMP'">            
          <xsl:value-of select="substring(ctx:fault/ctx:reason,0,1000)"/>              
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat('Error inesperado revisar con su Administrador',$descErrorTemplate)"/>              
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
     <xsl:variable name="faultString">
      <xsl:choose>
        <xsl:when test="$app = 1">            
          <xsl:value-of select="concat('[Ventas]',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 2">            
          <xsl:value-of select="concat('[Cobranza]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 3">            
          <xsl:value-of select="concat('[Preregistro]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 4">            
          <xsl:value-of select="concat('[Pendiente]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 5">            
          <xsl:value-of select="concat('[Precalificado]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 6">            
          <xsl:value-of select="concat('[Fuera Línea]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 7">            
          <xsl:value-of select="concat('[Autoasignar]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 8">            
          <xsl:value-of select="concat('[Estado Solicitud]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 9">            
          <xsl:value-of select="concat('[Consultar Agenda]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 10">            
          <xsl:value-of select="concat('[Cobranza Cliente]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 11">            
          <xsl:value-of select="concat('[Estatus Cobranza]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 12">            
          <xsl:value-of select="concat('[Estatus Solicitudes]: ',$descError)"/>              
        </xsl:when>
        <xsl:when test="$app = 13">            
          <xsl:value-of select="concat('[Consulta Buro]: ',$descError)"/>              
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat('[OSB]: ',$descError)"/>       
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <!--Create Fault -->
      <soap:Fault>
      <faultcode>ns1:fault</faultcode>
      <faultstring>
        <xsl:value-of select="$faultString"/>
      </faultstring>
      <detail>
        <xsl:choose>
          <xsl:when test="$operation = 1">
            <ns1:SendWorkOrderToClientFaultMessage>
              <xsl:call-template name="detailFault">
                <xsl:with-param name="faultString" select="$faultString"/>
              </xsl:call-template>
            </ns1:SendWorkOrderToClientFaultMessage>
          </xsl:when>
          <xsl:when test="$operation = 2">
            <ns1:FlexibleUpdateWorkOrderFault>
              <xsl:call-template name="detailFault">
                <xsl:with-param name="faultString" select="$faultString"/>
              </xsl:call-template>
            </ns1:FlexibleUpdateWorkOrderFault>
          </xsl:when>
        </xsl:choose>
      </detail>
    </soap:Fault>
    </xsl:template>
</xsl:stylesheet>