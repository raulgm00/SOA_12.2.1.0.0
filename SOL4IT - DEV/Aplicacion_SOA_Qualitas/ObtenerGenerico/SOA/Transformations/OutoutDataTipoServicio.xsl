<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/CatTipoServicioDB" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://qualitas.com.mx/ObtenerGenericoApp/ObtenerGenericoPrj/ObtenerGenericoBPEL" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xml:id="id_1" oraxsl:ignorexmlids="true" xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/ObtenerGenericoApp/ObtenerGenericoPrj/CatTipoServicioDB" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype">
   <oracle-xsl-mapper:schema xml:id="id_2">
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources xml:id="id_3">
         <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
            <oracle-xsl-mapper:schema location="../WSDLs/CatTipoServicioDB.wsdl" xml:id="id_5"/>
            <oracle-xsl-mapper:rootElement name="CatTipoServicioDBOutputCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/CatTipoServicioDB" xml:id="id_6"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets xml:id="id_7">
         <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
            <oracle-xsl-mapper:schema location="../WSDLs/ObtenerGenericoBPEL.wsdl" xml:id="id_9"/>
            <oracle-xsl-mapper:rootElement name="processResponse" namespace="http://qualitas.com.mx/ObtenerGenericoApp/ObtenerGenericoPrj/ObtenerGenericoBPEL" xml:id="id_10"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [WED NOV 30 08:57:27 CST 2016].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/" xml:id="id_11">
      <tns:processResponse xml:id="id_22">
         <xsl:for-each xml:id="id_23" select="/ns0:CatTipoServicioDBOutputCollection/ns0:CatTipoServicioDBOutput">
            <tns:resultDataResponse xml:id="id_24">
               <tns:IdCatalogo xml:id="id_25">
                  <xsl:value-of select="ns0:ID_TP_SERVICIO" xml:id="id_26"/>
               </tns:IdCatalogo>
               <tns:descripcion xml:id="id_27">
                  <xsl:value-of select="ns0:DESCRIPCION_SERVICIO" xml:id="id_28"/>
               </tns:descripcion>
            </tns:resultDataResponse>
         </xsl:for-each>
      </tns:processResponse>
   </xsl:template>
</xsl:stylesheet>