<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/sp/SPObtenerCContablesDB" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://qualitas.com.mx/ObtenerGenericoApp/ObtenerGenericoPrj/ObtenerGenericoBPEL" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xml:id="id_1" oraxsl:ignorexmlids="true" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/" xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/ObtenerGenericoApp/ObtenerGenericoPrj/SPObtenerCContablesDB">
   <oracle-xsl-mapper:schema xml:id="id_2">
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources xml:id="id_3">
         <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
            <oracle-xsl-mapper:schema location="../WSDLs/ObtenerGenericoBPEL.wsdl" xml:id="id_5"/>
            <oracle-xsl-mapper:rootElement name="process" namespace="http://qualitas.com.mx/ObtenerGenericoApp/ObtenerGenericoPrj/ObtenerGenericoBPEL" xml:id="id_6"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets xml:id="id_7">
         <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
            <oracle-xsl-mapper:schema location="../WSDLs/SPObtenerCContablesDB.wsdl" xml:id="id_9"/>
            <oracle-xsl-mapper:rootElement name="InputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/SPObtenerCContablesDB" xml:id="id_10"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [MON JAN 02 19:15:14 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/" xml:id="id_11">
      <xsl:if xml:id="id_16" test="/ns0:process/ns0:claveCatalogo = &quot;GPA003A&quot;">
         <tns:InputParameters xml:id="id_12">
            <tns:P_TIPOCC xml:id="id_17">1</tns:P_TIPOCC>
         </tns:InputParameters>
      </xsl:if>
      <xsl:if xml:id="id_21" test="/ns0:process/ns0:claveCatalogo = &quot;GPA003S&quot;">
         <tns:InputParameters xml:id="id_22">
            <tns:P_TIPOCC xml:id="id_23">2</tns:P_TIPOCC>
         </tns:InputParameters>
      </xsl:if>
      <xsl:if xml:id="id_18" test="/ns0:process/ns0:claveCatalogo = &quot;GPA003O&quot;">
         <tns:InputParameters xml:id="id_19">
            <tns:P_TIPOCC xml:id="id_20">3</tns:P_TIPOCC>
         </tns:InputParameters>
      </xsl:if>
   </xsl:template>
</xsl:stylesheet>