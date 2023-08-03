<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:tns="http://qualitas.com.mx/Comun/CentroCostos/validarCentroCostos/v1/" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/sp/SPServiciosPrestadorDB" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xml:id="id_1" oraxsl:ignorexmlids="true" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/ObtenerServicioPorPrestadorApp/ObtenerServicioPorPretstadorPrj/SPServiciosPrestadorDB" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:client="http://qualitas.com.mx/ValidarCentroDeCostosApp/ValidarCentrosDeCostosPrj/ValidarCentroDeCostosBPEL" xmlns:ns2="http://qualitas.com.mx/comunes/objetosComunes/v1/">
   <oracle-xsl-mapper:schema xml:id="id_2">
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources xml:id="id_3">
         <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
            <oracle-xsl-mapper:schema location="../WSDLs/SPServiciosPrestadorDB.wsdl" xml:id="id_5"/>
            <oracle-xsl-mapper:rootElement name="OutputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/SPServiciosPrestadorDB" xml:id="id_6"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets xml:id="id_7">
         <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
            <oracle-xsl-mapper:schema location="http://11.50.0.22:7007/soa-infra/services/GPADomain/ValidarCentrosDeCostosPrj!1.0/WSDLs/ValidarCentroDeCostosBPEL.wsdl" xml:id="id_9"/>
            <oracle-xsl-mapper:rootElement name="ValidarCentroCostosRequest" namespace="http://qualitas.com.mx/Comun/CentroCostos/validarCentroCostos/v1/" xml:id="id_10"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [MON DEC 19 16:03:48 CST 2016].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/" xml:id="id_11">
      <tns:ValidarCentroCostosRequest xml:id="id_12">
         <xsl:for-each xml:id="id_13" select="/ns0:OutputParameters/ns0:P_RECORDSET">
            <tns:Input xml:id="id_14">
               <tns:centroCostos xml:id="id_15">
                  <xsl:value-of select="ns0:P_RECORDSET_Row/ns0:CENTRO_COSTO" xml:id="id_16"/>
               </tns:centroCostos>
               <tns:idTipoServicio xml:id="id_17">
                  <xsl:value-of xml:id="id_18" select="&quot;3&quot;"/>
               </tns:idTipoServicio>
            </tns:Input>
         </xsl:for-each>
      </tns:ValidarCentroCostosRequest>
   </xsl:template>
</xsl:stylesheet>