<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:ns0="http://qualitas.com.mx/Pagos/CuentasContables/AsignarCuentasContables/v1/" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/sp/SPGuardarCcDB" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xml:id="id_1" oraxsl:ignorexmlids="true" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns1="http://qualitas.com.mx/comunes/objetosComunes/v1/" xmlns:client="http://qualitas.com.mx/Pagos/CuentasContables/AsignarCuentasContables/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns2="http://xmlns.oracle.com/pcbpel/adapter/db/AsignarCuentasContablesApp/AsignarContablesPrj/SPGuardarCcDB" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/">
   <oracle-xsl-mapper:schema xml:id="id_2">
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources xml:id="id_3">
         <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
            <oracle-xsl-mapper:schema location="../WSDLs/AsignarCuentasContables.wsdl" xml:id="id_5"/>
            <oracle-xsl-mapper:rootElement name="GuardarSolicitudRequest" namespace="http://qualitas.com.mx/Pagos/CuentasContables/AsignarCuentasContables/v1/" xml:id="id_6"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets xml:id="id_7">
         <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
            <oracle-xsl-mapper:schema location="../WSDLs/SPGuardarCcDB.wsdl" xml:id="id_9"/>
            <oracle-xsl-mapper:rootElement name="InputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/SPGuardarCcDB" xml:id="id_10"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [THU JAN 26 14:28:23 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/" xml:id="id_11">
      <tns:InputParameters xml:id="id_12">
         <tns:P_IDSOLICITUD xml:id="id_13">
            <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:idSolicitud" xml:id="id_14"/>
         </tns:P_IDSOLICITUD>
         <tns:P_IDDESCIVA xml:id="id_19">
            <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:idDescIVA" xml:id="id_20"/>
         </tns:P_IDDESCIVA>
         <tns:P_IDUSUARIO xml:id="id_15">
            <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:idUsuario" xml:id="id_16"/>
         </tns:P_IDUSUARIO>
         <tns:P_DESCPAGO xml:id="id_17">
            <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:descPago" xml:id="id_18"/>
         </tns:P_DESCPAGO>
         <tns:P_CCSUBTOTAL xml:id="id_21">
            <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:ccSubtotal" xml:id="id_22"/>
         </tns:P_CCSUBTOTAL>
         <tns:P_CCIVA xml:id="id_23">
            <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:ccIva" xml:id="id_24"/>
         </tns:P_CCIVA>
         <tns:P_CCRETIVA xml:id="id_27">
            <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:ccRetencionIVA" xml:id="id_28"/>
         </tns:P_CCRETIVA>
         <tns:P_CCISR xml:id="id_25">
            <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:ccRetencionISR" xml:id="id_26"/>
         </tns:P_CCISR>
         <tns:P_CCOTIMP xml:id="id_29">
            <xsl:value-of select="/ns0:GuardarSolicitudRequest/ns0:Input/ns0:ccOtrosImpuestos" xml:id="id_30"/>
         </tns:P_CCOTIMP>
      </tns:InputParameters>
   </xsl:template>
</xsl:stylesheet>