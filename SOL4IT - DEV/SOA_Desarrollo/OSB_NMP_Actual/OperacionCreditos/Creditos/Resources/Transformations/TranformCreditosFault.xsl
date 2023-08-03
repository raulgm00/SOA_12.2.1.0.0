<xsl:stylesheet version="1.0" exclude-result-prefixes="ctx soap con1 urn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ctx="http://www.bea.com/wli/sb/context" xmlns:n0="urn:sap-com:document:sap:soap:functions:mc-style" xmlns:OrTrS="http://servicios.montedepiedad.com.mx/NMP/Services/OrdenesTrabajo" xmlns:con1="http://www.bea.com/wli/sb/stages/transform/config">
  <xsl:include href="../../../../Common/XSLT/TemplateFaultsMontePiedad.xsl"/>
  <xsl:output indent="yes"/>
  <xsl:param name="app"/>
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
     <xsl:variable name="descError">
      <xsl:choose>
        <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/*[contains(local-name(), 'Exception')]">
          <xsl:choose>
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail//*:Name = 'ExContrato'">            
              <xsl:text>El contrato es invalido'</xsl:text>
            </xsl:when>
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail//*:Name = 'ExGestion'">
              <xsl:text>Error al obtener los datos de Gestión de Venta</xsl:text>
            </xsl:when>
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail//*:Name = 'ExHistorial'">
              <xsl:text>Error al obtener el Historial de Solicitud</xsl:text>
            </xsl:when>
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail//*:Name = 'ExTablaAmort'">
              <xsl:text>Error al obtener los datos para la Tabla de Amortización</xsl:text>
            </xsl:when>
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail//*:Name = 'ExSaldos'">
              <xsl:text>Error al obtener los Saldos</xsl:text>
            </xsl:when>
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail//*:Name = 'ExCliente'">
              <xsl:text>El Cliente no existe en SAP</xsl:text>
            </xsl:when>
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail//*:Name = 'ExNoInfo'">
              <xsl:text>El Cliente no tiene Contratos ni Solicitudes relacionadas</xsl:text>
            </xsl:when>
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail//*:Name = 'ExFechaPago'">
              <xsl:text>La fecha de pago es inválida</xsl:text>
            </xsl:when>
            <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail//*:Name = 'ExErrorData'">
              <xsl:text>No existen datos para las condiciones proporcionadas</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail//*:Text"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring">
          <xsl:value-of select="substring(ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:faultstring,0,1000)"/>              
        </xsl:when>
        <xsl:when test="$appCode = 'NMP'">            
          <xsl:value-of select="substring(ctx:fault/ctx:reason,0,1000)"/>              
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="faultstring">
            <xsl:with-param name="beaCode" select="$beaCode"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>  
    <xsl:variable name="faultString">
      <xsl:choose>
        <xsl:when test="$app = 1">     
          <xsl:value-of select="concat('SAP Error: ',$descError)"/>              
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat('OSB Error: ',$descError)"/>       
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codigoError">
    <xsl:choose>
        <xsl:when test="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/*[contains(local-name(), 'Exception')]">
          <xsl:value-of select="ctx:fault/ctx:details/con1:ReceivedFaultDetail/con1:detail/*:Name"/>
        </xsl:when>
        <xsl:otherwise>
           <xsl:call-template name="codigoError">
            <xsl:with-param name="beaCode" select="$beaCode"/>
          </xsl:call-template> 
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>    
     <!--Create Fault -->
       <soap:Fault>
      <faultcode>soap:Client</faultcode>
      <faultstring>
        <xsl:value-of select="$faultString"/>
      </faultstring>
      <detail>
        <messageError xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage">
          <codigoError>
            <xsl:value-of select="$codigoError"/>
          </codigoError>
          <descripcionError>
            <xsl:value-of select="$descError"/>
          </descripcionError>
          <tipoError>
            <xsl:call-template name="tipoError">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </tipoError>
          <severidad>
            <xsl:call-template name="severidad">
              <xsl:with-param name="beaCode" select="$beaCode"/>
            </xsl:call-template>
          </severidad>
        </messageError>
      </detail>
    </soap:Fault>
   </xsl:template>
</xsl:stylesheet>