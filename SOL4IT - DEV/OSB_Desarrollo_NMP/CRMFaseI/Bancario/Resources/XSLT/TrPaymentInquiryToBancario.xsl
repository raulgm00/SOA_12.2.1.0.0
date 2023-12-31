<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../../../../../../../../OneDrive%20for%20Business/Shared%20with%20Everyone/Proyectos/NMP/Diseño/NMP_Modelo_Canonico_v19112014/EsquemasXML/ZLM_WS_PAGOLINEA.wsdl"/>
      <rootElement name="ZlmPaymentInquiryResponse" namespace="urn:sap-com:document:sap:soap:functions:mc-style"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="XSD">
      <schema location="../BancarioSvc.xsd"/>
      <rootElement name="consultarDatosResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPBancario"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.0(build 140919.1004.0161) AT [THU MAR 12 19:19:51 CST 2015]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPBancario"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:n1="urn:sap-com:document:sap:rfc:functions"
                xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:http="http://schemas.xmlsoap.org/wsdl/http/"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"
                xmlns:tns="urn:sap-com:document:sap:soap:functions:mc-style"
                xmlns:fn="http://www.w3.org/2004/07/xpath-functions"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl soap wsdl mime n1 wsp http xsd wsu tns ns0 xp20 bpws bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref ldap">
  <xsl:template match="/">
    <ns0:consultarDatosResponse>
      <ns0:pagoReferenciado>
      		<xsl:value-of select='/tns:ZlmPaymentInquiryResponse/EPagoReferenciado' />
      </ns0:pagoReferenciado>
      <ns0:InfoTicket>
        <ns0:desc1>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc1,"#"," ")'/>
        </ns0:desc1>
        <ns0:desc2>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc2,"#"," ")'/>
        </ns0:desc2>
        <ns0:desc3>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc3,"#"," ")'/>
        </ns0:desc3>
        <ns0:desc4>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc4,"#"," ")'/>
        </ns0:desc4>
        <ns0:desc5>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc5,"#"," ")'/>
        </ns0:desc5>
        <ns0:desc6>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc6,"#"," ")'/>
        </ns0:desc6>
        <ns0:desc7>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc7,"#"," ")'/>
        </ns0:desc7>
        <ns0:desc8>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc8,"#"," ")'/>
        </ns0:desc8>
        <ns0:desc9>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc9,"#"," ")'/>
        </ns0:desc9>
        <ns0:desc10>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc10,"#"," ")'/>
        </ns0:desc10>
        <ns0:desc11>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc11,"#"," ")'/>
        </ns0:desc11>
        <ns0:desc12>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc12,"#"," ")'/>
        </ns0:desc12>
        <ns0:desc13>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc13,"#"," ")'/>
        </ns0:desc13>
        <ns0:desc14>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc14,"#"," ")'/>
        </ns0:desc14>
        <ns0:desc15>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc15,"#"," ")'/>
        </ns0:desc15>
        <ns0:desc16>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc16,"#"," ")'/>
        </ns0:desc16>
        <ns0:desc17>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc17,"#"," ")'/>
        </ns0:desc17>
        <ns0:desc18>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc18,"#"," ")'/>
        </ns0:desc18>
        <ns0:desc19>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc19,"#"," ")'/>
        </ns0:desc19>
        <ns0:desc20>
          <xsl:value-of select='translate(/tns:ZlmPaymentInquiryResponse/DatosRecibo/Desc20,"#"," ")'/>
        </ns0:desc20>
      </ns0:InfoTicket>
    </ns0:consultarDatosResponse>
  </xsl:template>
</xsl:stylesheet>