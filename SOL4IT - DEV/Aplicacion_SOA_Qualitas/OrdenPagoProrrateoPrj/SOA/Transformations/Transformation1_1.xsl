<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:tns="http://service.pagos.qualitas.com.mx/" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:ns0="http://xmlns.oracle.com/GestionOrdenPagoApp/OrdenPagoProrrateoPrj/OrdenPagoProrrateo" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/OrdenPagoProrrateo.wsdl"/>
            <oracle-xsl-mapper:rootElement name="process" namespace="http://xmlns.oracle.com/GestionOrdenPagoApp/OrdenPagoProrrateoPrj/OrdenPagoProrrateo"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="http://11.50.0.73:9010/pagos-web/servicios/pagosService?wsdl"/>
            <oracle-xsl-mapper:rootElement name="generaOrden" namespace="http://service.pagos.qualitas.com.mx/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [TUE JAN 17 16:57:58 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:generaOrden>
         <OrdenPago>
            <ctaPagos>
               <ctaPago>
                  <ctaPag>
                     <xsl:value-of select="5504140900000"/>
                  </ctaPag>
                  <cveOficinaMov>
                     <xsl:value-of select="010"/>
                  </cveOficinaMov>
                  <descMov>pago serv mensajeria</descMov>
                  <importe>
                     <xsl:value-of select="23040.41"/>
                  </importe>
                  <tipMov>D</tipMov>
                  <varCta>
                     <xsl:value-of select="0800200000"/>
                  </varCta>
               </ctaPago>
               <ctaPago>
                  <ctaPag>
                     <xsl:value-of select="5504140900000"/>
                  </ctaPag>
                  <cveOficinaMov>
                     <xsl:value-of select="249"/>
                  </cveOficinaMov>
                  <descMov>pago serv mensajeria</descMov>
                  <importe>
                     <xsl:value-of select="12034.09"/>
                  </importe>
                  <tipMov>D</tipMov>
                  <varCta>
                     <xsl:value-of select="9900000902"/>
                  </varCta>
               </ctaPago>
               <ctaPago>
                  <ctaPag>
                     <xsl:value-of select="1633010030000"/>
                  </ctaPag>
                  <cveOficinaMov>
                     <xsl:value-of select="842"/>
                  </cveOficinaMov>
                  <descMov>mensajeria</descMov>
                  <importe>
                     <xsl:value-of select="6680.86"/>
                  </importe>
                  <tipMov>D</tipMov>
                  <varCta>
                     <xsl:value-of select="9900000842"/>
                  </varCta>
               </ctaPago>
            </ctaPagos>
            <cveBen>
               <xsl:value-of select="26110"/>
            </cveBen>
            <monePag>
               <xsl:value-of select="concat (0, 0 )"/>
            </monePag>
            <observ>
               <xsl:value-of select="concat (424, &quot; &quot;, &quot;pago serv mensajeria&quot; )"/>
            </observ>
            <ofnaPag>
               <xsl:value-of select="oraext:query-database (concat (&quot;SELECT OFICINA_DESTINO FROM GPA001_SOLICITUD WHERE ID_SOLICITUD = '&quot;, /ns0:process/ns0:idSolicitud, &quot;'&quot; ), false ( ), false ( ), &quot;jdbc/GPAConnDB&quot; )"/>
            </ofnaPag>
            <tipBen>T</tipBen>
            <usuario>LZARCO</usuario>
         </OrdenPago>
      </tns:generaOrden>
   </xsl:template>
</xsl:stylesheet>