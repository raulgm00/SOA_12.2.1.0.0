<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/sp/SPObtenerSolicitudDB" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://xmlns.oracle.com/ObtenerPrestadorApp/ObtenerPrestadorPrj/ObtenerPrestadorBPEL" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/ConsultarDetalleSolicitudApp/ConsultarDetalleSolicitudPrj/SPObtenerSolicitudDB" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns2="http://qualitas.com.mx/comunes/objetosComunes/v1/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/SPObtenerSolicitudDB.wsdl"/>
            <oracle-xsl-mapper:rootElement name="OutputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/SPObtenerSolicitudDB"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="http://localhost:7101/soa-infra/services/GPADomain/ObtenerPrestadorPrj!1.0/WSDLs/ObtenerPrestadorBPEL.wsdl"/>
            <oracle-xsl-mapper:rootElement name="process" namespace="http://xmlns.oracle.com/ObtenerPrestadorApp/ObtenerPrestadorPrj/ObtenerPrestadorBPEL"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [FRI JAN 06 19:24:38 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:process>
         <xsl:choose>
            <xsl:when test="/ns0:OutputParameters/ns0:P_TIPOSERVICIO = 3">
               <tns:numeroPrestador>
                  <xsl:value-of select="/ns0:OutputParameters/ns0:B_IDPRESTADOR"/>
               </tns:numeroPrestador>
            </xsl:when>
            <xsl:when test="/ns0:OutputParameters/ns0:P_TIPOSERVICIO = 1">
               <tns:numeroPrestador>
                  <xsl:value-of select="/ns0:OutputParameters/ns0:S_IDPRESTADOR"/>
               </tns:numeroPrestador>
            </xsl:when>
         </xsl:choose>
      </tns:process>
   </xsl:template>
</xsl:stylesheet>