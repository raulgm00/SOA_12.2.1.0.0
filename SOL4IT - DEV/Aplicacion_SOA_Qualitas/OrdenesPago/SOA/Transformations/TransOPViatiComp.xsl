<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:tns="http://qualitas.com.mx/Comunes/gestionOrdenPagoSchema/v1/" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/top/SolicitudDataSvc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xml:id="id_1" oraxsl:ignorexmlids="true" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/QualitasGPABus/SolicitudesBDQry/SolicitudDataSvc" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns2="http://qualitas.com.mx/comunes/objetosComunes/v1/" xmlns:ops="http://qualitas.com.mx/Comunes/gestionOrdenPagoBPEL/v1/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
  <oracle-xsl-mapper:schema xml:id="id_2">
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources xml:id="id_3">
      <oracle-xsl-mapper:source type="WSDL" xml:id="id_4">
        <oracle-xsl-mapper:schema location="http://11.50.0.20:7006/Finance/AP/GPA/Data/ProxySvc/SolicitudDataSvcPxy?WSDL%2FFinance%2FAP%2FGPA%2FData%2FResources%2FSolicitudDataSvc" xml:id="id_5"/>
        <oracle-xsl-mapper:rootElement name="Gpa001SolicitudCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/SolicitudDataSvc" xml:id="id_6"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets xml:id="id_7">
      <oracle-xsl-mapper:target type="WSDL" xml:id="id_8">
        <oracle-xsl-mapper:schema location="http://11.50.0.20:7007/soa-infra/services/GPADomain/GestionOrdenPago!1.0/WSDLs/GestionOrdenPagoBPEL.wsdl" xml:id="id_9"/>
        <oracle-xsl-mapper:rootElement name="guardarOrdenPagoRequest" namespace="http://qualitas.com.mx/Comunes/gestionOrdenPagoSchema/v1/" xml:id="id_10"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.1.0(XSLT Build 160608.1900.0023) AT [WED JUN 07 16:58:23 CDT 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
 
  <xsl:template match="/" xml:id="id_11">    
    <tns:guardarOrdenPagoRequest xml:id="id_12">
      <xsl:variable name="cuentaComplementos" xml:id="id_277" select="count (/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:complementos )"/>
      <!--tns:cuentaComplementos>
                        <xsl:value-of select='$cuentaComplementos'/>
      </tns:cuentaComplementos-->
      <!--SOLICITUD VIÀTICO-->
      <xsl:if xml:id="id_98" test="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:idSubtpSolic = 4">
        <tns:Input xml:id="id_13">
          <tns:cheqCert xml:id="id_29">
            <xsl:value-of xml:id="id_250" select="&quot; &quot;"/>
          </tns:cheqCert>
          <tns:ctaPagos xml:id="id_21">
            <tns:ctaPago xml:id="id_27">
              <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:ctadeudora/ns0:nuCdeudoras" xml:id="id_283"/>
            </tns:ctaPago>
            <tns:cveOficinaMov xml:id="id_22">
              <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:oficina/ns0:cvOficina" xml:id="id_287"/>
            </tns:cveOficinaMov>
            <tns:descMov xml:id="id_24">
                 <xsl:value-of xml:id="id_25" select="substring (concat (&quot;A COMP &quot;, /ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:justificacion ),1,50)"/>
            </tns:descMov>
            <xsl:choose xml:id="id_218">
              <xsl:when xml:id="id_219" test="$cuentaComplementos = 1">
                <tns:importe xml:id="id_220">
                  <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:valorAnticipo" xml:id="id_284"/>
                </tns:importe>
              </xsl:when>
              <xsl:otherwise xml:id="id_229">
                <!--xsl:for-each xml:id="id_232"
                              select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:complementos/ns0:Gpa022Viaticos/ns0:complementos/ns0:Gpa022Viaticos/ns0:complementos">
                  <xsl:choose xml:id="id_237">
                    <xsl:when xml:id="id_238"
                              test="ns0:Gpa022Viaticos/ns0:complementos/ns0:Gpa022Viaticos/ns0:idEstado = 10"-->
                      <tns:importe xml:id="id_230">
                  <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:complementos/ns0:Gpa022Viaticos/ns0:valorAnticipo" xml:id="id_288"/>
                </tns:importe>
                    <!--/xsl:when>
                  </xsl:choose>
                </xsl:for-each-->
              </xsl:otherwise>
            </xsl:choose>
            <tns:tipMov xml:id="id_174">
              <xsl:value-of xml:id="id_175" select="&quot;D&quot;"/>
            </tns:tipMov>
            <!--CONCEPTO DE GASTO, SIEMPRE 02-->
            <tns:varCta xml:id="id_177">
              <xsl:value-of xml:id="id_197" select="&quot;02&quot;"/>
            </tns:varCta>
          </tns:ctaPagos>
          <tns:cveBen xml:id="id_189">
            <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:nuEmpleado" xml:id="id_191"/>
          </tns:cveBen>
          <tns:monePag xml:id="id_181">
            <xsl:value-of xml:id="id_182" select="&quot;00&quot;"/>
          </tns:monePag>
          <xsl:choose xml:id="id_295">
            <xsl:when xml:id="id_296" test="$cuentaComplementos = 1">
              <tns:observ xml:id="id_187">
                <xsl:value-of xml:id="id_188" select="substring (concat (&quot;A COMP &quot;, /ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:justificacion ),1,50)"/>
              </tns:observ>
            </xsl:when>
            <xsl:otherwise xml:id="id_297">
              <tns:observ xml:id="id_298">
                <xsl:value-of xml:id="id_299" select="substring (concat (&quot;A COMP &quot;, /ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:complementos/ns0:Gpa022Viaticos/ns0:justificacion ),1,50)"/>
              </tns:observ>
            </xsl:otherwise>
          </xsl:choose>
          <tns:ofnaPag xml:id="id_44">
            <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:cveOficina" xml:id="id_45"/>
          </tns:ofnaPag>
          <tns:tipBen xml:id="id_42">
            <xsl:value-of xml:id="id_314" select="&quot;E&quot;"/>
          </tns:tipBen>
          <tns:usuario xml:id="id_183">
            <xsl:value-of xml:id="id_184" select="&quot;DIRECTO&quot;"/>
          </tns:usuario>
          <tns:id_solicitud xml:id="id_16">
            <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:idSolicitud" xml:id="id_17"/>
          </tns:id_solicitud>
        </tns:Input>
      </xsl:if>
      <!--CARGO AL DEUDOR-->
      <xsl:if xml:id="id_137" test="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:idSubtpSolic = 5">
        <tns:Input xml:id="id_138">
          <xsl:choose xml:id="id_243">
            <xsl:when xml:id="id_244" test="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:chequeCertificado = 1">
              <tns:cheqCert xml:id="id_139">
                <xsl:value-of xml:id="id_246" select="&quot;S&quot;"/>
              </tns:cheqCert>
            </xsl:when>
            <xsl:when xml:id="id_292" test="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:chequeCertificado = 0">
              <tns:cheqCert xml:id="id_293">
                <xsl:value-of xml:id="id_294" select="&quot; &quot;"/>
              </tns:cheqCert>
            </xsl:when>
            <xsl:otherwise xml:id="id_247">
              <tns:cheqCert xml:id="id_248">
                <xsl:value-of xml:id="id_249" select="&quot; &quot;"/>
              </tns:cheqCert>
            </xsl:otherwise>
          </xsl:choose>
          <tns:ctaPagos xml:id="id_140">
            <tns:ctaPago xml:id="id_141">
              <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:ctadeudora/ns0:nuCdeudoras" xml:id="id_282"/>
            </tns:ctaPago>
            <tns:cveOficinaMov xml:id="id_143">
              <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:oficina/ns0:cvOficina" xml:id="id_316"/>
            </tns:cveOficinaMov>
            <tns:descMov xml:id="id_144">
              <xsl:value-of xml:id="id_26" select="substring (concat (&quot;A COMP &quot;, /ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:justificacion ),1,50)"/>
            </tns:descMov>
            <tns:importe xml:id="id_195">
              <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:totalPagar" xml:id="id_315"/>
            </tns:importe>
            <tns:tipMov xml:id="id_200">
              <xsl:value-of xml:id="id_201" select="&quot;D&quot;"/>
            </tns:tipMov>
            <!--CONCEPTO DE GASTO INGRESADO EN EL FRONT-->
            <tns:varCta xml:id="id_198">
              <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:idConceptoGasto" xml:id="id_199"/>
            </tns:varCta>
          </tns:ctaPagos>
          <xsl:choose xml:id="id_301">
            <xsl:when xml:id="id_302" test="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:tipoPrestador = &quot;O&quot;">
              <tns:cveBen xml:id="id_203">
                <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:beneficiario" xml:id="id_303"/>
              </tns:cveBen>
            </xsl:when>
            <xsl:otherwise xml:id="id_318">
              <tns:cveBen xml:id="id_319">
                <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:idPrestador" xml:id="id_321"/>
              </tns:cveBen>
            </xsl:otherwise>
          </xsl:choose>
          <tns:monePag xml:id="id_164">
            <xsl:value-of xml:id="id_205" select="&quot;00&quot;"/>
          </tns:monePag>
          <tns:observ xml:id="id_206">
            <xsl:value-of xml:id="id_207" select="substring( concat (&quot;A COMP &quot;, /ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:viatico/ns0:justificacion ),1,50)"/>
          </tns:observ>
          <tns:ofnaPag xml:id="id_165">
            <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:cveOficina" xml:id="id_166"/>
          </tns:ofnaPag>
          <tns:tipBen xml:id="id_167">
            <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:servicio/ns0:tipoPrestador" xml:id="id_168"/>
          </tns:tipBen>
          <tns:usuario xml:id="id_208">
            <xsl:value-of xml:id="id_209" select="&quot;DIRECTO&quot;"/>
          </tns:usuario>
          <tns:id_solicitud xml:id="id_169">
            <xsl:value-of select="/ns0:Gpa001SolicitudCollection/ns0:Gpa001Solicitud/ns0:idSolicitud" xml:id="id_170"/>
          </tns:id_solicitud>
        </tns:Input>
      </xsl:if>
    </tns:guardarOrdenPagoRequest>
  </xsl:template>
</xsl:stylesheet>