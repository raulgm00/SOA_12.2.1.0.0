<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../NmpProxy.wsdl"/>
      <rootElement name="RegistrarSocioRequest" namespace="http://xmlns.montepiedad.com.mx/nmp/cenmp"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="WSDL">
      <schema location="../RegistrarSocioBPELProcess.wsdl"/>
      <rootElement name="process" namespace="http://xmlns.oracle.com/nmpApp/WSRegistrarSocio/RegistrarSocioBPELProcess"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.7.0(build 130301.0647.0008) AT [SUN MAR 09 16:37:49 CST 2014]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:nmp="http://xmlns.montepiedad.com.mx/nmp/cenmp"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:http="http://schemas.xmlsoap.org/wsdl/http/"
                xmlns:bpmn="http://schemas.oracle.com/bpm/xpath"
                xmlns:client="http://xmlns.oracle.com/nmpApp/WSRegistrarSocio/RegistrarSocioBPELProcess"
                xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
                exclude-result-prefixes="xsi xsl soap12 soapenc nmp soap mime xsd http wsdl plnk client aia bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref bpmn ldap">
  <xsl:template match="/">
    <client:process>
      <client:Actualizar>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Actualizar"/>
      </client:Actualizar>
      <client:Correo>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Correo"/>
      </client:Correo>
      <client:Usuario>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Usuario"/>
      </client:Usuario>
      <client:Pasword>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Pasword"/>
      </client:Pasword>
      <client:Nombre>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Nombre"/>
      </client:Nombre>
      <client:ApellidoPaterno>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:ApellidoPaterno"/>
      </client:ApellidoPaterno>
      <client:ApellidoMaterno>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:ApellidoMaterno"/>
      </client:ApellidoMaterno>
      <client:FechaNacimiento>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:FechaNacimiento"/>
      </client:FechaNacimiento>
      <client:Telefono>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:Telefono/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Telefono/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Telefono"/>
      </client:Telefono>
      <client:Celular>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:Celular/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Celular/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Celular"/>
      </client:Celular>
      <client:Escolaridad>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:Escolaridad/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Escolaridad/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Escolaridad"/>
      </client:Escolaridad>
      <client:Sexo>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:Sexo/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Sexo/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Sexo"/>
      </client:Sexo>
      <client:Calle>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:Calle/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Calle/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Calle"/>
      </client:Calle>
      <client:NumeroExt>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:NumeroExt/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:NumeroExt/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:NumeroExt"/>
      </client:NumeroExt>
      <client:NumeroInt>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:NumeroInt/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:NumeroInt/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:NumeroInt"/>
      </client:NumeroInt>
      <client:Colonia>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:Colonia/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Colonia/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Colonia"/>
      </client:Colonia>
      <client:CodigoPostal>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:CodigoPostal/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:CodigoPostal/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:CodigoPostal"/>
      </client:CodigoPostal>
      <client:Municipio>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:Municipio/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Municipio/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Municipio"/>
      </client:Municipio>
      <client:Ciudad>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:Ciudad/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Ciudad/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Ciudad"/>
      </client:Ciudad>
      <client:ContactoEmergencias>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:ContactoEmergencias/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:ContactoEmergencias/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:ContactoEmergencias"/>
      </client:ContactoEmergencias>
      <client:ContactoEmergencia1s>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:ContactoEmergencia1s/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:ContactoEmergencia1s/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:ContactoEmergencia1s"/>
      </client:ContactoEmergencia1s>
      <client:TutorResponsable>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:TutorResponsable/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:TutorResponsable/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:TutorResponsable"/>
      </client:TutorResponsable>
      <client:TelefonoEmergencia>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:TelefonoEmergencia/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:TelefonoEmergencia/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:TelefonoEmergencia"/>
      </client:TelefonoEmergencia>
      <client:Trabaja>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:Trabaja/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Trabaja/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Trabaja"/>
      </client:Trabaja>
      <client:Estudia>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:Estudia/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Estudia/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:Estudia"/>
      </client:Estudia>
      <client:CURP>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:CURP/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:CURP/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:CURP"/>
      </client:CURP>
      <client:HabilidadInformatica>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:HabilidadInformatica/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:HabilidadInformatica/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:HabilidadInformatica"/>
      </client:HabilidadInformatica>
      <client:FolioCupon>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:FolioCupon/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:FolioCupon/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:FolioCupon"/>
      </client:FolioCupon>
      <client:ClienteMP>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:ClienteMP/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:ClienteMP/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:ClienteMP"/>
      </client:ClienteMP>
      <client:NegocioPropio>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:NegocioPropio/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:NegocioPropio/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:NegocioPropio"/>
      </client:NegocioPropio>
      <client:DependientesEconomicos>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:DependientesEconomicos/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:DependientesEconomicos/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:DependientesEconomicos"/>
      </client:DependientesEconomicos>
      <client:CasaPropia>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:CasaPropia/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:CasaPropia/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:CasaPropia"/>
      </client:CasaPropia>
      <client:UtilizaInternet>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:UtilizaInternet/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:UtilizaInternet/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:UtilizaInternet"/>
      </client:UtilizaInternet>
      <client:IdMotivo>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdMotivo/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdMotivo/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdMotivo"/>
      </client:IdMotivo>
      <client:IdEstadoCivil>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdEstadoCivil/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdEstadoCivil/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdEstadoCivil"/>
      </client:IdEstadoCivil>
      <client:IdEstado>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdEstado"/>
      </client:IdEstado>
      <client:IdGrado>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdGrado"/>
      </client:IdGrado>
      <client:IdOcupacion>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdOcupacion/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdOcupacion/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdOcupacion"/>
      </client:IdOcupacion>
      <client:IdActEconomica>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdActEconomica/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdActEconomica/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdActEconomica"/>
      </client:IdActEconomica>
      <client:IdDominioIngles>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdDominioIngles/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdDominioIngles/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdDominioIngles"/>
      </client:IdDominioIngles>
      <client:IdDiscapacidad>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdDiscapacidad/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdDiscapacidad/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdDiscapacidad"/>
      </client:IdDiscapacidad>
      <client:IdMotivoAcercamiento>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdMotivoAcercamiento/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdMotivoAcercamiento/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdMotivoAcercamiento"/>
      </client:IdMotivoAcercamiento>
      <client:IdTiempoActividad>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdTiempoActividad/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdTiempoActividad/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdTiempoActividad"/>
      </client:IdTiempoActividad>
      <client:IdProblemasActualesEmpresa>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdProblemasActualesEmpresa/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdProblemasActualesEmpresa/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdProblemasActualesEmpresa"/>
      </client:IdProblemasActualesEmpresa>
      <client:IdMedio>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdMedio/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdMedio/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdMedio"/>
      </client:IdMedio>
      <client:IdCentro>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:IdMedio/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdCentro/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:IdCentro"/>
      </client:IdCentro>
     
      <client:CentroNombre>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:CentroNombre/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:CentroNombre/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:CentroNombre"/>
      </client:CentroNombre> 
     
      
      
            <client:fechaRegistro>
        <xsl:if test="/nmp:RegistrarSocioRequest/nmp:fechaRegistro/@xsi:nil">
          <xsl:attribute name="xsi:nil">
            <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:fechaRegistro/@xsi:nil"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="/nmp:RegistrarSocioRequest/nmp:fechaRegistro"/>
      </client:fechaRegistro> 
     
      
      
    </client:process>
    
    
    
  </xsl:template>
</xsl:stylesheet>