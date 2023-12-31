<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns1 UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/top/HistoricoViaticosEmpleadoDB" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source/>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../Data/BusinessSvc/HistorialViaticosEmpleado/Resources/HistoricoViaticosEmpleadoDB_table.xsd"/>
        <oracle-xsl-mapper:rootElement name="Gpa001SolicitudCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/HistoricoViaticosEmpleadoDB"/>
        <oracle-xsl-mapper:param name="Input_HistoricoViaticos"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../Data/BusinessSvc/HistorialViaticosEmpleado/Resources/HistoricoViaticosEmpleadoDB_table.xsd"/>
        <oracle-xsl-mapper:rootElement name="Gpa001SolicitudCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/HistoricoViaticosEmpleadoDB"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [THU MAY 11 18:10:45 CDT 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="Input_HistoricoViaticos"/>
  <xsl:template match="/">
    <ns1:Gpa001SolicitudCollection>
      <xsl:for-each select="$Input_HistoricoViaticos/ns1:Gpa001SolicitudCollection/ns1:Gpa001Solicitud">
      <xsl:if test="position() = 1">
        <ns1:Gpa001Solicitud>
          <ns1:idSolicitud>
            <xsl:value-of select="ns1:idSolicitud"/>
          </ns1:idSolicitud>
          <xsl:if test="ns1:idTpSolicitud/text()">
            <ns1:idTpSolicitud>
              <xsl:value-of select="ns1:idTpSolicitud"/>
            </ns1:idTpSolicitud>
          </xsl:if>
          <xsl:if test="ns1:nuEmpleado/text()">
            <ns1:nuEmpleado>
              <xsl:value-of select="ns1:nuEmpleado"/>
            </ns1:nuEmpleado>
          </xsl:if>
          <xsl:if test="ns1:nombreEmpleado/text()">
            <ns1:nombreEmpleado>
              <xsl:value-of select="ns1:nombreEmpleado"/>
            </ns1:nombreEmpleado>
          </xsl:if>
          <xsl:if test="ns1:fhActualizacion/text()">
            <ns1:fhActualizacion>
              <xsl:if test="ns1:fhActualizacion/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:fhActualizacion/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:fhActualizacion"/>
            </ns1:fhActualizacion>
          </xsl:if>
          <xsl:if test="ns1:idUsuario/text()">
            <ns1:idUsuario>
              <xsl:if test="ns1:idUsuario/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:idUsuario/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:idUsuario"/>
            </ns1:idUsuario>
          </xsl:if>
          <xsl:if test="ns1:totalPagar/text()">
            <ns1:totalPagar>
              <xsl:if test="ns1:totalPagar/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:totalPagar/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:totalPagar"/>
            </ns1:totalPagar>
          </xsl:if>
          <xsl:if test="ns1:fhCreacion/text()">
            <ns1:fhCreacion>
              <xsl:if test="ns1:fhCreacion/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:fhCreacion/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:fhCreacion"/>
            </ns1:fhCreacion>
          </xsl:if>
          <xsl:if test="ns1:nuOrden/text()">
            <ns1:nuOrden>
              <xsl:if test="ns1:nuOrden/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:nuOrden/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:nuOrden"/>
            </ns1:nuOrden>
          </xsl:if>
          <xsl:if test="ns1:fhFinProceso/text()">
            <ns1:fhFinProceso>
              <xsl:if test="ns1:fhFinProceso/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:fhFinProceso/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:fhFinProceso"/>
            </ns1:fhFinProceso>
          </xsl:if>
          <xsl:if test="ns1:idEstadoSolicitud/text()">
            <ns1:idEstadoSolicitud>
              <xsl:if test="ns1:idEstadoSolicitud/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:idEstadoSolicitud/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:idEstadoSolicitud"/>
            </ns1:idEstadoSolicitud>
          </xsl:if>
          <xsl:if test="ns1:oficinaDestino/text()">
            <ns1:oficinaDestino>
              <xsl:if test="ns1:oficinaDestino/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:oficinaDestino/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:oficinaDestino"/>
            </ns1:oficinaDestino>
          </xsl:if>
          <xsl:if test="ns1:procesable/text()">
            <ns1:procesable>
              <xsl:if test="ns1:procesable/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:procesable/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:procesable"/>
            </ns1:procesable>
          </xsl:if>
          <xsl:if test="ns1:auxIdproyecto/text()">
            <ns1:auxIdproyecto>
              <xsl:if test="ns1:auxIdproyecto/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:auxIdproyecto/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:auxIdproyecto"/>
            </ns1:auxIdproyecto>
          </xsl:if>
          <xsl:if test="ns1:idSubtpSolic/text()">
            <ns1:idSubtpSolic>
              <xsl:if test="ns1:idSubtpSolic/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:idSubtpSolic/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:idSubtpSolic"/>
            </ns1:idSubtpSolic>
          </xsl:if>
          <xsl:if test="ns1:servicio/text()">
            <ns1:servicio>
              <xsl:if test="ns1:servicio/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:servicio/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <ns1:idServicio>
                <xsl:value-of select="ns1:servicio/ns1:idServicio"/>
              </ns1:idServicio>
              <xsl:if test="ns1:servicio/ns1:descServicio/text()">
                <ns1:descServicio>
                  <xsl:if test="ns1:servicio/ns1:descServicio/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:descServicio/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:descServicio"/>
                </ns1:descServicio>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:idTpServicio/text()">
                <ns1:idTpServicio>
                  <xsl:if test="ns1:servicio/ns1:idTpServicio/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:idTpServicio/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:idTpServicio"/>
                </ns1:idTpServicio>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:centroCosto/text()">
                <ns1:centroCosto>
                  <xsl:if test="ns1:servicio/ns1:centroCosto/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:centroCosto/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:centroCosto"/>
                </ns1:centroCosto>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:idSolicitud/text()">
                <ns1:idSolicitud>
                  <xsl:if test="ns1:servicio/ns1:idSolicitud/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:idSolicitud/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:idSolicitud"/>
                </ns1:idSolicitud>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:idPrestador/text()">
                <ns1:idPrestador>
                  <xsl:if test="ns1:servicio/ns1:idPrestador/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:idPrestador/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:idPrestador"/>
                </ns1:idPrestador>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:fhRegistro/text()">
                <ns1:fhRegistro>
                  <xsl:if test="ns1:servicio/ns1:fhRegistro/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:fhRegistro/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:fhRegistro"/>
                </ns1:fhRegistro>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:descOficina/text()">
                <ns1:descOficina>
                  <xsl:if test="ns1:servicio/ns1:descOficina/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:descOficina/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:descOficina"/>
                </ns1:descOficina>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:descArea/text()">
                <ns1:descArea>
                  <xsl:if test="ns1:servicio/ns1:descArea/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:descArea/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:descArea"/>
                </ns1:descArea>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:responsableArea/text()">
                <ns1:responsableArea>
                  <xsl:if test="ns1:servicio/ns1:responsableArea/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:responsableArea/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:responsableArea"/>
                </ns1:responsableArea>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:cveOficina/text()">
                <ns1:cveOficina>
                  <xsl:if test="ns1:servicio/ns1:cveOficina/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:cveOficina/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:cveOficina"/>
                </ns1:cveOficina>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:procesable/text()">
                <ns1:procesable>
                  <xsl:if test="ns1:servicio/ns1:procesable/@xsi:nil">
                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                      <xsl:value-of select="ns1:servicio/ns1:procesable/@xsi:nil"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns1:servicio/ns1:procesable"/>
                </ns1:procesable>
              </xsl:if>
              <xsl:if test="ns1:servicio/ns1:viaticos/text()">
                <ns1:viaticos>
                  <xsl:for-each select="ns1:servicio/ns1:viaticos/ns1:Gpa022Viaticos">
                    <ns1:Gpa022Viaticos>
                      <xsl:if test="fhInicioViaje/text()">
                        <ns1:fhInicioViaje>
                          <xsl:if test="fhInicioViaje/@xsi:nil">
                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="fhInicioViaje/@xsi:nil"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="fhInicioViaje"/>
                        </ns1:fhInicioViaje>
                      </xsl:if>
                      <xsl:if test="fhFinViaje/text()">
                        <ns1:fhFinViaje>
                          <xsl:if test="fhFinViaje/@xsi:nil">
                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="fhFinViaje/@xsi:nil"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="fhFinViaje"/>
                        </ns1:fhFinViaje>
                      </xsl:if>
                      <xsl:if test="justificacion/text()">
                        <ns1:justificacion>
                          <xsl:value-of select="justificacion"/>
                        </ns1:justificacion>
                      </xsl:if>
                      <xsl:if test="loginAutorizador/text()">
                        <ns1:loginAutorizador>
                          <xsl:if test="loginAutorizador/@xsi:nil">
                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="loginAutorizador/@xsi:nil"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="loginAutorizador"/>
                        </ns1:loginAutorizador>
                      </xsl:if>
                      <xsl:if test="nroDiasViaje/text()">
                        <ns1:nroDiasViaje>
                          <xsl:if test="nroDiasViaje/@xsi:nil">
                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="nroDiasViaje/@xsi:nil"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="nroDiasViaje"/>
                        </ns1:nroDiasViaje>
                      </xsl:if>
                      <xsl:if test="nroKms/text()">
                        <ns1:nroKms>
                          <xsl:if test="nroKms/@xsi:nil">
                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="nroKms/@xsi:nil"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="nroKms"/>
                        </ns1:nroKms>
                      </xsl:if>
                      <xsl:if test="valorAnticipo/text()">
                        <ns1:valorAnticipo>
                          <xsl:if test="valorAnticipo/@xsi:nil">
                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="valorAnticipo/@xsi:nil"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="valorAnticipo"/>
                        </ns1:valorAnticipo>
                      </xsl:if>
                      <xsl:if test="cveOficinaDestino/text()">
                        <ns1:cveOficinaDestino>
                          <xsl:if test="cveOficinaDestino/@xsi:nil">
                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="cveOficinaDestino/@xsi:nil"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="cveOficinaDestino"/>
                        </ns1:cveOficinaDestino>
                      </xsl:if>
                      <xsl:if test="idEstado/text()">
                        <ns1:idEstado>
                          <xsl:if test="idEstado/@xsi:nil">
                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="idEstado/@xsi:nil"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="idEstado"/>
                        </ns1:idEstado>
                      </xsl:if>
                      <xsl:if test="categorias/text()">
                        <ns1:categorias>
                          <xsl:for-each select="categorias/Gpa023CatViaticos">
                            <ns1:Gpa023CatViaticos>
                              <ns1:codigoTarifa>
                                <xsl:value-of select="codigoTarifa"/>
                              </ns1:codigoTarifa>
                              <xsl:if test="valorTarifa/text()">
                                <ns1:valorTarifa>
                                  <xsl:value-of select="valorTarifa"/>
                                </ns1:valorTarifa>
                              </xsl:if>
                              <xsl:if test="valorAnticipo/text()">
                                <ns1:valorAnticipo>
                                  <xsl:value-of select="valorAnticipo"/>
                                </ns1:valorAnticipo>
                              </xsl:if>
                            </ns1:Gpa023CatViaticos>
                          </xsl:for-each>
                        </ns1:categorias>
                      </xsl:if>
                      <xsl:if test="cdeudoras/text()">
                        <ns1:cdeudoras>
                          <xsl:if test="cdeudoras/@xsi:nil">
                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="cdeudoras/@xsi:nil"/>
                            </xsl:attribute>
                          </xsl:if>
                          <ns1:idCedudoras>
                            <xsl:value-of select="cdeudoras/idCedudoras"/>
                          </ns1:idCedudoras>
                          <xsl:if test="cdeudoras/nuCdeudoras/text()">
                            <ns1:nuCdeudoras>
                              <xsl:value-of select="cdeudoras/nuCdeudoras"/>
                            </ns1:nuCdeudoras>
                          </xsl:if>
                          <xsl:if test="cdeudoras/descDeudoras/text()">
                            <ns1:descDeudoras>
                              <xsl:value-of select="cdeudoras/descDeudoras"/>
                            </ns1:descDeudoras>
                          </xsl:if>
                          <xsl:if test="cdeudoras/stRegistro/text()">
                            <ns1:stRegistro>
                              <xsl:value-of select="cdeudoras/stRegistro"/>
                            </ns1:stRegistro>
                          </xsl:if>
                        </ns1:cdeudoras>
                      </xsl:if>
                      <xsl:if test="complementos/text()">
                        <ns1:complementos>
                          <xsl:for-each select="complementos/Gpa022Viaticos">
                          <xsl:if test="ns1:idEstado/text() != 2">
                                <xsl:if test="ns1:idEstado/text() != 4">
                                  <xsl:if test="ns1:idEstado/text() != 7">
                            <ns1:Gpa022Viaticos>
                              <xsl:if test="fhInicioViaje/text()">
                                <ns1:fhInicioViaje>
                                  <xsl:if test="fhInicioViaje/@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                      <xsl:value-of select="fhInicioViaje/@xsi:nil"/>
                                    </xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="fhInicioViaje"/>
                                </ns1:fhInicioViaje>
                              </xsl:if>
                              <xsl:if test="fhFinViaje/text()">
                                <ns1:fhFinViaje>
                                  <xsl:if test="fhFinViaje/@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                      <xsl:value-of select="fhFinViaje/@xsi:nil"/>
                                    </xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="fhFinViaje"/>
                                </ns1:fhFinViaje>
                              </xsl:if>
                              <xsl:if test="justificacion/text()">
                                <ns1:justificacion>
                                  <xsl:value-of select="justificacion"/>
                                </ns1:justificacion>
                              </xsl:if>
                              <xsl:if test="loginAutorizador/text()">
                                <ns1:loginAutorizador>
                                  <xsl:if test="loginAutorizador/@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                      <xsl:value-of select="loginAutorizador/@xsi:nil"/>
                                    </xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="loginAutorizador"/>
                                </ns1:loginAutorizador>
                              </xsl:if>
                              <xsl:if test="nroDiasViaje/text()">
                                <ns1:nroDiasViaje>
                                  <xsl:if test="nroDiasViaje/@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                      <xsl:value-of select="nroDiasViaje/@xsi:nil"/>
                                    </xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="nroDiasViaje"/>
                                </ns1:nroDiasViaje>
                              </xsl:if>
                              <xsl:if test="nroKms/text()">
                                <ns1:nroKms>
                                  <xsl:if test="nroKms/@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                      <xsl:value-of select="nroKms/@xsi:nil"/>
                                    </xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="nroKms"/>
                                </ns1:nroKms>
                              </xsl:if>
                              <xsl:if test="valorAnticipo/text()">
                                <ns1:valorAnticipo>
                                  <xsl:if test="valorAnticipo/@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                      <xsl:value-of select="valorAnticipo/@xsi:nil"/>
                                    </xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="valorAnticipo"/>
                                </ns1:valorAnticipo>
                              </xsl:if>
                              <xsl:if test="cveOficinaDestino/text()">
                                <ns1:cveOficinaDestino>
                                  <xsl:if test="cveOficinaDestino/@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                      <xsl:value-of select="cveOficinaDestino/@xsi:nil"/>
                                    </xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="cveOficinaDestino"/>
                                </ns1:cveOficinaDestino>
                              </xsl:if>
                              <xsl:if test="idEstado/text()">
                                <ns1:idEstado>
                                  <xsl:if test="idEstado/@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                      <xsl:value-of select="idEstado/@xsi:nil"/>
                                    </xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="idEstado"/>
                                </ns1:idEstado>
                              </xsl:if>
                              <xsl:if test="categorias/text()">
                                <ns1:categorias>
                                  <xsl:for-each select="categorias/Gpa023CatViaticos">
                                    <ns1:Gpa023CatViaticos>
                                      <ns1:codigoTarifa>
                                        <xsl:value-of select="codigoTarifa"/>
                                      </ns1:codigoTarifa>
                                      <xsl:if test="valorTarifa/text()">
                                        <ns1:valorTarifa>
                                          <xsl:value-of select="valorTarifa"/>
                                        </ns1:valorTarifa>
                                      </xsl:if>
                                      <xsl:if test="valorAnticipo/text()">
                                        <ns1:valorAnticipo>
                                          <xsl:value-of select="valorAnticipo"/>
                                        </ns1:valorAnticipo>
                                      </xsl:if>
                                    </ns1:Gpa023CatViaticos>
                                  </xsl:for-each>
                                </ns1:categorias>
                              </xsl:if>
                              <xsl:if test="cdeudoras/text()">
                                <ns1:cdeudoras>
                                  <xsl:if test="cdeudoras/@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                      <xsl:value-of select="cdeudoras/@xsi:nil"/>
                                    </xsl:attribute>
                                  </xsl:if>
                                  <ns1:idCedudoras>
                                    <xsl:value-of select="cdeudoras/idCedudoras"/>
                                  </ns1:idCedudoras>
                                  <xsl:if test="cdeudoras/nuCdeudoras/text()">
                                    <ns1:nuCdeudoras>
                                      <xsl:value-of select="cdeudoras/nuCdeudoras"/>
                                    </ns1:nuCdeudoras>
                                  </xsl:if>
                                  <xsl:if test="cdeudoras/descDeudoras/text()">
                                    <ns1:descDeudoras>
                                      <xsl:value-of select="cdeudoras/descDeudoras"/>
                                    </ns1:descDeudoras>
                                  </xsl:if>
                                  <xsl:if test="cdeudoras/stRegistro/text()">
                                    <ns1:stRegistro>
                                      <xsl:value-of select="cdeudoras/stRegistro"/>
                                    </ns1:stRegistro>
                                  </xsl:if>
                                </ns1:cdeudoras>
                              </xsl:if>
                            </ns1:Gpa022Viaticos>
                            </xsl:if>
                            </xsl:if>
                            </xsl:if>
                          </xsl:for-each>
                        </ns1:complementos>
                      </xsl:if>
                    </ns1:Gpa022Viaticos>
                  </xsl:for-each>
                </ns1:viaticos>
              </xsl:if>
            </ns1:servicio>
          </xsl:if>
        </ns1:Gpa001Solicitud>
        </xsl:if>
      </xsl:for-each>
    </ns1:Gpa001SolicitudCollection>
  </xsl:template>
</xsl:stylesheet>