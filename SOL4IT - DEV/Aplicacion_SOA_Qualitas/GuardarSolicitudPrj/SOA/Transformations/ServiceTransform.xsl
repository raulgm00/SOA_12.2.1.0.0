<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:ns0="http://qualitas.com.mx/Solicitud/GuardarSolicitud/v1/" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:tns="http://qualitas.com.mx/Comun/Servicio/CrearServicioPorTipo/v1/" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xml:id="id_1" oraxsl:ignorexmlids="true" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns1="http://qualitas.com.mx/Importes/v1/" xmlns:ns2="http://qualitas.com.mx/comunes/objetosComunes/v1/" xmlns:ns3="http://qualitas.com.mx/Comun/Servicio/v1/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns4="http://qualitas.com.mx/Comun/Servicio/ServicioData/v1/" xmlns:client="http://qualitas.com.mx/GuardarSolicitudApp/GuardarSolicitudPrj/GuardarSolicitudBPEL" xmlns:ns5="http://qualitas.com.mx/CrearServicioApp/CrearServicioPrj/CrearServicioBPEL" xmlns:ns6="http://qualitas.com.mx/Comun/Servicio/ProyectoData/v1/" xmlns:ns8="http://qualitas.com.mx/Comun/Servicio/TipoServicioData/v1/" xmlns:ns7="http://qualitas.com.mx/Comun/Servicio/TipoServicio/v1/">
   <oracle-xsl-mapper:schema xml:id="id_2">
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources xml:id="id_3">
         <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
            <oracle-xsl-mapper:schema location="../WSDLs/GuardarSolicitudBPEL.wsdl" xml:id="id_5"/>
            <oracle-xsl-mapper:rootElement name="GuardarSolicitudRequest" namespace="http://qualitas.com.mx/Solicitud/GuardarSolicitud/v1/" xml:id="id_6"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets xml:id="id_7">
         <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
            <oracle-xsl-mapper:schema location="http://localhost:7101/soa-infra/services/default/CrearServicioPrj!1.0/WSDLs/CrearServicioBPEL.wsdl" xml:id="id_9"/>
            <oracle-xsl-mapper:rootElement name="CrearServicioRequest" namespace="http://qualitas.com.mx/Comun/Servicio/CrearServicioPorTipo/v1/" xml:id="id_10"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [SUN DEC 11 23:51:58 CST 2016].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/" xml:id="id_11">
      <tns:CrearServicioRequest xml:id="id_12">
         <tns:Input xml:id="id_13">
            <tns:servicio xml:id="id_14">
               <ns3:idSolicitud xml:id="id_15">
                  <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:idSolicitud" xml:id="id_16"/>
               </ns3:idSolicitud>
               <ns3:idPrestador xml:id="id_39">
                  <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:servicio/ns3:idPRestador" xml:id="id_40"/>
               </ns3:idPrestador>
               <ns3:CentroDeCosto xml:id="id_19">
                  <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:servicio/ns3:CentroDeCosto" xml:id="id_38"/>
               </ns3:CentroDeCosto>
               <xsl:choose xml:id="id_26">
                  <xsl:when xml:id="id_27" test="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:servicio/ns3:idTipoServicio = 1">
                     <ns3:servicioGastoFijo xml:id="id_28">
                        <ns4:subTipoServicio xml:id="id_29">
                           <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:servicio/ns3:servicioGastoFijo/ns4:subTipoServicio" xml:id="id_30"/>
                        </ns4:subTipoServicio>
                     </ns3:servicioGastoFijo>
                  </xsl:when>
               </xsl:choose>
               <xsl:choose xml:id="id_31">
                  <xsl:when xml:id="id_32" test="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:servicio/ns3:idTipoServicio = 2">
                     <ns3:servicioOperaciones xml:id="id_33">
                        <ns4:descripcion xml:id="id_34">
                           <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:servicio/ns3:servicioOperaciones/ns4:descripcion" xml:id="id_35"/>
                        </ns4:descripcion>
                        <ns4:tipoMoneda xml:id="id_36">
                           <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:servicio/ns3:servicioOperaciones/ns4:tipoMoneda" xml:id="id_37"/>
                        </ns4:tipoMoneda>
                     </ns3:servicioOperaciones>
                  </xsl:when>
               </xsl:choose>
            </tns:servicio>
         </tns:Input>
      </tns:CrearServicioRequest>
   </xsl:template>
</xsl:stylesheet>