<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:tns="http://qualitas.com.mx/Comunes/gestionOrdenPagoSchema/v1/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:nsd0="http://ws.gpa.qualitas.mx/" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl nsd0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns0="http://qualitas.com.mx/comunes/objetosComunes/v1/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ops="http://qualitas.com.mx/Comunes/gestionOrdenPagoBPEL/v1/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="http://11.50.0.21:8001/GPACommonsBasic/ProrrateoSvcPort?WSDL"/>
            <oracle-xsl-mapper:rootElement name="Prorrateo" namespace=""/>
            <oracle-xsl-mapper:rootElementDatatype name="prorrateoResponse" namespace="http://ws.gpa.qualitas.mx/"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="http://11.50.0.22:7007/soa-infra/services/GPADomain/GestionOrdenPago!1.0/WSDLs/GestionOrdenPagoBPEL.wsdl"/>
            <oracle-xsl-mapper:rootElement name="guardarOrdenPagoRequest" namespace="http://qualitas.com.mx/Comunes/gestionOrdenPagoSchema/v1/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [THU JAN 19 00:11:06 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:guardarOrdenPagoRequest>
         <tns:Input>
            <xsl:for-each select="/Prorrateo/data/listaProrrateoRow">
               <tns:ctaPagos>
                  <tns:ctaPago>
                     <xsl:value-of select="/Prorrateo/data/cuentaContable"/>
                  </tns:ctaPago>
                  <tns:cveOficinaMov>
                     <xsl:value-of select="numeroOficina"/>
                  </tns:cveOficinaMov>
                  <tns:descMov>
                     <xsl:value-of select="/Prorrateo/data/descripcion"/>
                  </tns:descMov>
                  <tns:importe>
                     <xsl:value-of select="importe"/>
                  </tns:importe>
                  <tns:tipMov>D</tns:tipMov>
                  <tns:varCta>
                     <xsl:value-of select="numeroCentroCosto"/>
                  </tns:varCta>
               </tns:ctaPagos>
            </xsl:for-each>
            <tns:cveBen>26110</tns:cveBen>
            <tns:monePag>
               <xsl:value-of select="concat (0, 0 )"/>
            </tns:monePag>
            <tns:observ>
               <xsl:value-of select="/Prorrateo/data/descripcion"/>
            </tns:observ>
            <tns:ofnaPag>010</tns:ofnaPag>
            <tns:tipBen>T</tns:tipBen>
            <tns:usuario>LZARCO</tns:usuario>
         </tns:Input>
      </tns:guardarOrdenPagoRequest>
   </xsl:template>
</xsl:stylesheet>