<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../ObtenerCursosSocioTecBPELProcess.wsdl"/>
      <rootElement name="processResponse" namespace="http://xmlns.oracle.com/nmpApp/WSObtenerCursosSocioTec/ObtenerCursosSocioTecBPELProcess"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="../NmpProxy.wsdl"/>
      <rootElement name="ObtenerCursosSocioTecResponse" namespace="http://xmlns.montepiedad.com.mx/nmp/cenmp"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.0(build 130301.0647.0008) AT [WED MAR 19 14:46:23 CST 2014]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:client="http://xmlns.oracle.com/nmpApp/WSObtenerCursosSocioTec/ObtenerCursosSocioTecBPELProcess"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:nmp="http://xmlns.montepiedad.com.mx/nmp/cenmp"
                xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:http="http://schemas.xmlsoap.org/wsdl/http/"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpmn="http://schemas.oracle.com/bpm/xpath"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl client wsdl plnk xsd soap12 soapenc soap nmp mime http aia bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref bpmn ldap">
  <xsl:template match="/">
    <nmp:ObtenerCursosSocioTecResponse>
      <xsl:for-each select="/client:processResponse/client:Cursos">
        <nmp:Cursos>
          <nmp:IdCurso>
            <xsl:value-of select="client:IdCurso"/>
          </nmp:IdCurso>
          <nmp:DescCurso>
            <xsl:value-of select="client:DescCurso"/>
          </nmp:DescCurso>
          <nmp:IdGrupo>
            <xsl:value-of select="client:IdGrupo"/>
          </nmp:IdGrupo>
          <nmp:CveGrupo>
            <xsl:value-of select="client:CveGrupo"/>
          </nmp:CveGrupo>
          <nmp:FechaInicio>
            <xsl:value-of select="client:FechaInicio"/>
          </nmp:FechaInicio>
          <nmp:FechaFin>
            <xsl:value-of select="client:FechaFin"/>
          </nmp:FechaFin>
          <nmp:FechaInicioInsc>
            <xsl:value-of select="client:FechaInicioInsc"/>
          </nmp:FechaInicioInsc>
          <nmp:FechaFinInsc>
            <xsl:value-of select="client:FechaFinInsc"/>
          </nmp:FechaFinInsc>
          <nmp:LigaAccesoSABA>
            <xsl:value-of select="client:LigaAccesoSABA"/>
          </nmp:LigaAccesoSABA>
        </nmp:Cursos>
      </xsl:for-each>
      <nmp:ErrorCode>
        <xsl:value-of select="/client:processResponse/client:ErrorCode"/>
      </nmp:ErrorCode>
      <nmp:ErrorDescription>
        <xsl:value-of select="/client:processResponse/client:ErrorDescription"/>
      </nmp:ErrorDescription>
      <nmp:ErrorDetail>
        <xsl:value-of select="/client:processResponse/client:ErrorDetail"/>
      </nmp:ErrorDetail>
    </nmp:ObtenerCursosSocioTecResponse>
  </xsl:template>
</xsl:stylesheet>