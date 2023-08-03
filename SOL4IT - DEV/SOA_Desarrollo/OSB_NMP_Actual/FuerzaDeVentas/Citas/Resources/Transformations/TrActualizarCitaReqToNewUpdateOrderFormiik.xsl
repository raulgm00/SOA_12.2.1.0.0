<xsl:stylesheet version="1.0" exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCitas" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://schemas.datacontract.org/2004/07/Mobiik.Formiik.Domain.Entities" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:CitaType="http://servicios.montedepiedad.com.mx/NMP/Schema/CitaType" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/Citas_ELEMENTOS.xsd"/>
        <oracle-xsl-mapper:rootElement name="actualizarCitaRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCitas"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NewUpdateOrderFormiik.xsd"/>
        <oracle-xsl-mapper:rootElement name="Coleccion" namespace="http://schemas.datacontract.org/2004/07/Mobiik.Formiik.Domain.Entities"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI NOV 06 21:54:21 CST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <Coleccion>
      <xsl:for-each select="/ns0:actualizarCitaRequest/CitaType:Cita/CitaType:Ordenes/CitaType:Orden">
        <NewOrder id="{CitaType:orderId}" userName="{CitaType:username}">
        <Parametros>
            <xsl:if test="CitaType:Cliente/CitaType:idCliente">
              <parametro valor="{CitaType:Cliente/CitaType:idCliente}" llave="Num_Cliente"/>
              <parametro valor="{CitaType:Cliente/CitaType:idCliente}" llave="BP"/>
              <parametro valor="{CitaType:Cliente/CitaType:idCliente}" llave="BP_ID_CLIENTE_NUMBER"/>
            </xsl:if>
            <xsl:if test="CitaType:Cliente/CitaType:primerNombre">
              <parametro valor="{CitaType:Cliente/CitaType:primerNombre}" llave="Nombre1"/>
              <parametro valor="{CitaType:Cliente/CitaType:primerNombre}" llave="BP_NOMBRE1"/>
            </xsl:if>
            <xsl:if test="CitaType:Cliente/CitaType:segundoNombre">
              <parametro valor="{CitaType:Cliente/CitaType:segundoNombre}" llave="Nombre2"/>
              <parametro valor="{CitaType:Cliente/CitaType:segundoNombre}" llave="BP_NOMBRE2"/>
            </xsl:if>
            <xsl:if test="CitaType:Cliente/CitaType:apellidoMaterno">
              <parametro valor="{CitaType:Cliente/CitaType:apellidoMaterno}" llave="Apellido_Materno"/>
              <parametro valor="{CitaType:Cliente/CitaType:apellidoMaterno}" llave="BP_APMAT"/>
            </xsl:if>
            <xsl:if test="CitaType:Cliente/CitaType:apellidoPaterno">
              <parametro valor="{CitaType:Cliente/CitaType:apellidoPaterno}" llave="Apellido_Paterno"/>
              <parametro valor="{CitaType:Cliente/CitaType:apellidoPaterno}" llave="BP_APPAT"/>
            </xsl:if>
            <xsl:if test="CitaType:Cliente/CitaType:apellidoPaterno">
              <parametro valor="{CitaType:Cliente/CitaType:apellidoPaterno} {CitaType:Cliente/CitaType:apellidoMaterno}" llave="BP_APELLIDOS"/>
            </xsl:if>
            <xsl:if test="CitaType:Cliente/CitaType:genero">
              <parametro valor="{CitaType:Cliente/CitaType:genero}" llave="GeneroCB"/>
              <parametro valor="{CitaType:Cliente/CitaType:genero}" llave="BP_GENERO"/>
            </xsl:if>
            <xsl:if test="CitaType:Cliente/CitaType:fechaDeNacimiento">
              <parametro valor="{xp20:format-dateTime(CitaType:Cliente/CitaType:fechaDeNacimiento, &quot;[D01]/[M01]/[Y0001]&quot;)}" llave="FechadeNacimientoCB"/>
              <parametro valor="{xp20:format-dateTime(CitaType:Cliente/CitaType:fechaDeNacimiento, &quot;[D01]/[M01]/[Y0001]&quot;)}" llave="BP_FECNAC_DATE"/>
              <parametro valor="{xp20:format-dateTime(CitaType:Cliente/CitaType:fechaDeNacimiento, &quot;[D01]/[M01]/[Y0001]&quot;)}" llave="BP_FECNAC"/>
            </xsl:if>
            <xsl:if test="CitaType:Cliente/CitaType:rfc">
              <parametro valor="{CitaType:Cliente/CitaType:rfc}" llave="RFC"/>
            </xsl:if>
            <xsl:if test="CitaType:Cliente/CitaType:escolaridad">
              <parametro valor="{CitaType:Cliente/CitaType:escolaridad}" llave="BP_ESCOLARIDAD"/>
            </xsl:if>
             <xsl:if test="CitaType:Cliente/CitaType:nacionalidad">
              <parametro valor="{CitaType:Cliente/CitaType:nacionalidad}" llave="BP_NACIONALIDAD"/>
            </xsl:if>
            <xsl:if test="CitaType:Cliente/CitaType:estadoCivil">
              <parametro valor="{CitaType:Cliente/CitaType:estadoCivil}" llave="BP_EDOCIVIL"/>
            </xsl:if>
            <xsl:if test="CitaType:Direccion/CitaType:nombreDelaCalle">
              <parametro valor="{CitaType:Direccion/CitaType:nombreDelaCalle}" llave="Calle"/>
              <parametro valor="{CitaType:Direccion/CitaType:nombreDelaCalle}" llave="BP_CALLE"/>
            </xsl:if>
            <xsl:if test="CitaType:Direccion/CitaType:numeroExterior">
              <parametro valor="{CitaType:Direccion/CitaType:numeroExterior}" llave="Numero_Exterior"/>
              <parametro valor="{CitaType:Direccion/CitaType:numeroExterior}" llave="BP_NUMEXT"/>
            </xsl:if>
              <xsl:if test="CitaType:Direccion/CitaType:numeroInterior">
              <parametro valor="{CitaType:Direccion/CitaType:numeroInterior}" llave="Numero_Interior"/>
              <parametro valor="{CitaType:Direccion/CitaType:numeroInterior}" llave="BP_NUMINT"/>
            </xsl:if>
            <xsl:if test="CitaType:Direccion/CitaType:estado">
              <parametro valor="{CitaType:Direccion/CitaType:estado}" llave="Estado"/>
              <parametro valor="{CitaType:Direccion/CitaType:estado}" llave="BP_ESTADO"/>
            </xsl:if>
            <xsl:if test="CitaType:Direccion/CitaType:delegacionMunicipio">
              <parametro valor="{CitaType:Direccion/CitaType:delegacionMunicipio}" llave="Municipio"/>
              <parametro valor="{CitaType:Direccion/CitaType:delegacionMunicipio}" llave="BP_DELMUN"/>
            </xsl:if>
            <xsl:if test="CitaType:Direccion/CitaType:colonia">
              <parametro valor="{CitaType:Direccion/CitaType:colonia}" llave="Colonia"/>
              <parametro valor="{CitaType:Direccion/CitaType:colonia}" llave="BP_COLONIA"/>
            </xsl:if>
            <xsl:if test="CitaType:Direccion/CitaType:codigoPostal">
              <parametro valor="{CitaType:Direccion/CitaType:codigoPostal}" llave="CodigoPostal"/>
              <parametro valor="{CitaType:Direccion/CitaType:codigoPostal}" llave="BP_CODPOSTAL"/>
            </xsl:if>
            <xsl:if test="CitaType:Direccion/CitaType:ciudadPoblacion">
              <parametro valor="{CitaType:Direccion/CitaType:ciudadPoblacion}" llave="Ciudad"/>
            </xsl:if>
            <xsl:if test="CitaType:fechaOperacion">
              <parametro valor="{xp20:format-dateTime(CitaType:fechaOperacion, &quot;[D01]/[M01]/[Y0001]&quot;)}" llave="FechadeOperacion"/>
            </xsl:if>
            <xsl:if test="CitaType:estatus">
              <parametro valor="{CitaType:estatus}" llave="Estatus"/>
              <parametro valor="{CitaType:estatus}" llave="EstatusCC"/>
            </xsl:if>
            <xsl:if test="CitaType:hora">
              <parametro valor="{CitaType:hora}" llave="Hora"/>
            </xsl:if>
            <xsl:if test="CitaType:mensajeBuro">
              <parametro valor="{CitaType:mensajeBuro}" llave="MensajeBuro"/>
            </xsl:if>
            <xsl:if test="CitaType:resultadoVisitaVtas">
              <parametro valor="{CitaType:resultadoVisitaVtas}" llave="ResultadoVisitaVtas"/>
            </xsl:if>
            <xsl:if test="CitaType:gestionVtas">
              <parametro valor="{CitaType:gestionVtas}" llave="GestionVtas"/>
            </xsl:if>
            <xsl:if test="CitaType:folio">
              <parametro valor="{CitaType:folio}" llave="Folio"/>
            </xsl:if>
            <xsl:for-each select="CitaType:Telefonos/CitaType:Telefono">

              <xsl:if test="CitaType:tipoTelefono = 'CASA'">
                <parametro valor="{CitaType:numeroTelefonico}" llave="BP_CASATEL"/>
                <parametro valor="{CitaType:codigoArea}" llave="BP_CASALADA"/>
              </xsl:if>
              <xsl:if test="CitaType:tipoTelefono = 'OFICINA'">
                <parametro valor="{CitaType:numeroTelefonico}" llave="Telefono_Trabajo"/>
                <parametro valor="{CitaType:numeroTelefonico}" llave="BP_TRABTEL"/>
                <parametro valor="{CitaType:codigoArea}" llave="BP_TRABLADA"/>
                <parametro valor="{CitaType:extension}" llave="BP_TRABEXT"/>
              </xsl:if>
              <xsl:if test="CitaType:tipoTelefono = 'CELULAR'">
                <parametro valor="{CitaType:numeroTelefonico}" llave="Telefono_Celular"/>
                <parametro valor="{CitaType:numeroTelefonico}" llave="BP_CELTEL"/>
                <parametro valor="{CitaType:codigoArea}" llave="BP_CELLADA"/>
              </xsl:if>
            </xsl:for-each>
            <xsl:if test="CitaType:Calificacion/CitaType:siva">
              <parametro valor="{CitaType:Calificacion/CitaType:siva}" llave="BP_SIVA"/>
            </xsl:if>
            <xsl:if test="CitaType:Calificacion/CitaType:probabilidadIncumplimiento">
              <parametro valor="{CitaType:Calificacion/CitaType:probabilidadIncumplimiento}" llave="BP_PROBINCUMPL"/>
            </xsl:if>
             <xsl:if test="CitaType:Calificacion/CitaType:capacidadDePago">
              <parametro valor="{CitaType:Calificacion/CitaType:capacidadDePago}" llave="BP_CAPPAGO"/>
            </xsl:if>
             <xsl:if test="CitaType:Calificacion/CitaType:pagosNMP">
              <parametro valor="{CitaType:Calificacion/CitaType:pagosNMP}" llave="BP_IMP_PAGOSNMP"/>
            </xsl:if>
            <xsl:if test="CitaType:Calificacion/CitaType:prestamoProm">
              <parametro valor="{CitaType:Calificacion/CitaType:prestamoProm}" llave="BP_IMP_PRESTAMOPROM"/>
            </xsl:if>
            <xsl:if test="CitaType:Calificacion/CitaType:prestamosNMP">
              <parametro valor="{CitaType:Calificacion/CitaType:prestamosNMP}" llave="BP_IMP_PRESTAMOSNMP"/>
            </xsl:if>
            <xsl:if test="CitaType:Calificacion/CitaType:numDesempeno">
              <parametro valor="{CitaType:Calificacion/CitaType:numDesempeno}" llave="BP_NUM_DESEMPENIO"/>
            </xsl:if>
             <xsl:if test="CitaType:Calificacion/CitaType:prestamoPromValuacion">
              <parametro valor="{CitaType:Calificacion/CitaType:prestamoPromValuacion}" llave="BP_IMP_PRESTAMOPROMVALUACION"/>
            </xsl:if>
            <parametro valor="" llave="Nombre"/>
            <xsl:if test="CitaType:Conyuge/CitaType:primerNombre">
              <parametro valor="{CitaType:Conyuge/CitaType:primerNombre}" llave="PrimerNombreConyugeSol"/>
            </xsl:if>
            <xsl:if test="CitaType:Conyuge/CitaType:segundoNombre">
              <parametro valor="{CitaType:Conyuge/CitaType:segundoNombre}" llave="SegundoNombreConyugeSol"/>
            </xsl:if>
            <xsl:if test="CitaType:Conyuge/CitaType:apellidoPaterno">
              <parametro valor="{CitaType:Conyuge/CitaType:apellidoPaterno}" llave="ApPaternoConyugeSol"/>
            </xsl:if>
            <xsl:if test="CitaType:Conyuge/CitaType:apellidoMaterno">
              <parametro valor="{CitaType:Conyuge/CitaType:apellidoMaterno}" llave="ApMaternoConyugeSol"/>
            </xsl:if>
            <xsl:if test="CitaType:Conyuge/CitaType:TelFijoConyuge">
              <parametro valor="{CitaType:Conyuge/CitaType:TelFijoConyuge}" llave="TelefonoDomicilioConyugueSol"/>
            </xsl:if>
            <xsl:if test="CitaType:Conyuge/CitaType:TelCelConyuge">
              <parametro valor="{CitaType:Conyuge/CitaType:TelCelConyuge}" llave="TelefonoCelularConyugueSol"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:Nombre">
              <parametro valor="{CitaType:Negocio/CitaType:Nombre}" llave="NombreNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:Telefono">
              <parametro valor="{CitaType:Negocio/CitaType:Telefono}" llave="TelNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:Calle">
              <parametro valor="{CitaType:Negocio/CitaType:Calle}" llave="CalleNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:NumExterior">
              <parametro valor="{CitaType:Negocio/CitaType:NumExterior}" llave="NumExteriorNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:NumInterior">
              <parametro valor="{CitaType:Negocio/CitaType:NumInterior}" llave="NumInteriorNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:Lote">
              <parametro valor="{CitaType:Negocio/CitaType:Lote}" llave="LoteNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:Manzana">
              <parametro valor="{CitaType:Negocio/CitaType:Manzana}" llave="ManzanaNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:CP">
              <parametro valor="{CitaType:Negocio/CitaType:CP}" llave="CPNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:Colonia">
              <parametro valor="{CitaType:Negocio/CitaType:Colonia}" llave="ColoniaNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:Delegacion">
              <parametro valor="{CitaType:Negocio/CitaType:Delegacion}" llave="DelNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:Estado">
              <parametro valor="{CitaType:Negocio/CitaType:Estado}" llave="EstadoNegocio"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:EntreCalle1">
              <parametro valor="{CitaType:Negocio/CitaType:EntreCalle1}" llave="EntreCalle1Neg"/>
            </xsl:if>
            <xsl:if test="CitaType:Negocio/CitaType:EntreCalle2">
              <parametro valor="{CitaType:Negocio/CitaType:EntreCalle2}" llave="EntreCalle2Neg"/>
            </xsl:if>
            <xsl:if test="CitaType:Prestamo/CitaType:Monto">
              <parametro valor="{CitaType:Prestamo/CitaType:Monto}" llave="Monto"/>
            </xsl:if>
            <xsl:if test="CitaType:Prestamo/CitaType:Plazo">
              <parametro valor="{CitaType:Prestamo/CitaType:Plazo}" llave="Plazo"/>
            </xsl:if>
            <xsl:if test="CitaType:Prestamo/CitaType:Periodicidad">
              <parametro valor="{CitaType:Prestamo/CitaType:Periodicidad}" llave="Periodicidad"/>
            </xsl:if>
            <xsl:for-each select="CitaType:Referencias/CitaType:Referencia">
              <xsl:if test="CitaType:Parentesco">
                <parametro valor="{CitaType:Parentesco}" llave="{concat('ParentescoRef',position())}"/>
              </xsl:if>
              <xsl:if test="CitaType:Nombre">
                <parametro valor="{CitaType:Nombre}" llave="{concat('NomRef',position())}"/>
              </xsl:if>
              <xsl:if test="CitaType:Nombre2">
                <parametro valor="{CitaType:Nombre2}" llave="{concat('Nom2Ref',position())}"/>
              </xsl:if>
              <xsl:if test="CitaType:APaterno">
                <parametro valor="{CitaType:APaterno}" llave="{concat('APaternoRef',position())}"/>
              </xsl:if>
              <xsl:if test="CitaType:AMaterno">
                <parametro valor="{CitaType:AMaterno}" llave="{concat('AMaternoRef',position())}"/>
              </xsl:if>
              <xsl:if test="CitaType:TelCasa">
                <parametro valor="{CitaType:TelCasa}" llave="{concat('TelCasaRef',position())}"/>
              </xsl:if>
              <xsl:if test="CitaType:TelCel">
                <parametro valor="{CitaType:TelCel}" llave="{concat('TelCelRef',position())}"/>
              </xsl:if>
            </xsl:for-each>
          </Parametros>
        </NewOrder>
      </xsl:for-each>
    </Coleccion>
  </xsl:template>
</xsl:stylesheet>