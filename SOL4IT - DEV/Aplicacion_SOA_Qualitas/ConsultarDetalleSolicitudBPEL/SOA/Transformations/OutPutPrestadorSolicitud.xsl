<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:tns="http://qualitas.com.mx/ConsultarDetalleSolicitud/v1/" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns0="http://xmlns.oracle.com/ObtenerPrestadorApp/ObtenerPrestadorPrj/ObtenerPrestadorBPEL" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns1="http://qualitas.com.mx/comunes/objetosComunes/v1/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns2="http://qualitas.com.mx/Importes/v1/" xmlns:ns3="http://qualitas.com.mx/comunes/" xmlns:ns4="http://qualitas.com.mx/Comun/Servicio/v1/" xmlns:client="http://qualitas.com.mx/Solicitud/ConsultarDetalleSolicitud/" xmlns:ns5="http://qualitas.com.mx/Comun/Servicio/ProyectoData/v1/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="http://localhost:7101/soa-infra/services/GPADomain/ObtenerPrestadorPrj!1.0/WSDLs/ObtenerPrestadorBPEL.wsdl"/>
            <oracle-xsl-mapper:rootElement name="processResponse" namespace="http://xmlns.oracle.com/ObtenerPrestadorApp/ObtenerPrestadorPrj/ObtenerPrestadorBPEL"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/consultarDetalleSolicitud.wsdl"/>
            <oracle-xsl-mapper:rootElement name="consultarDetalleSolicitudResponse" namespace="http://qualitas.com.mx/ConsultarDetalleSolicitud/v1/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [FRI JAN 06 20:07:12 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:consultarDetalleSolicitudResponse>
         <pagoServicios>
            <Prestador>
               <numeroPrestador>
                  <xsl:value-of select="/ns0:processResponse/ns0:numeroPrestador"/>
               </numeroPrestador>
               <nombre>
                  <xsl:value-of select="/ns0:processResponse/ns0:nombrePrestador"/>
               </nombre>
               <tipoPersona>
                  <codigo>
                     <xsl:value-of select="/ns0:processResponse/ns0:cveTipoPersona"/>
                  </codigo>
                  <descripcion>
                     <xsl:value-of select="/ns0:processResponse/ns0:tipoPersona"/>
                  </descripcion>
               </tipoPersona>
               <claveEntidad>
                  <xsl:value-of select="/ns0:processResponse/ns0:cveEntidad"/>
               </claveEntidad>
               <nacionalidad>
                  <xsl:value-of select="/ns0:processResponse/ns0:cveNacionalidad"/>
               </nacionalidad>
            </Prestador>
         </pagoServicios>
      </tns:consultarDetalleSolicitudResponse>
   </xsl:template>
</xsl:stylesheet>