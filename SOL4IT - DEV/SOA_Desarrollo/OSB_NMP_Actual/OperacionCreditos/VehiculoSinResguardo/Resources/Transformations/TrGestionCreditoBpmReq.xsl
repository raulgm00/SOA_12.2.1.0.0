<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:soap="http://www.w3.org/2003/05/soap-envelope"
    xmlns:ges="http://xmlns.oracle.com/bpmn/bpmnProcess/GestionCreditoVSR" 
    xmlns:inic="http://xmlns.oracle.com/bpm/bpmobject/Data/IniciarGestionBO" 
    xmlns:fol="http://xmlns.oracle.com/bpm/bpmobject/Data/FolioBO" 
    xmlns:fluj="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/FlujoBPM" 
    xmlns:cli="http://xmlns.oracle.com/bpm/bpmobject/Data/ClienteBO" 
    xmlns:cot="http://servicios.montedepiedad.com.mx/NMP/Schema/CotizadorBPM" 
    xmlns:veh="http://xmlns.oracle.com/bpm/bpmobject/Data/VehiculoBO" 
    xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculoBPM" 
    xmlns:equ="http://xmlns.oracle.com/bpm/bpmobject/Data/EquipoAdicionalBO" 
    xmlns:doc="http://xmlns.oracle.com/bpm/bpmobject/Data/DocumentosBO" 
    xmlns:open="http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvcBPM"
    xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/Flujo"
    xmlns:NMPCot="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador"
    xmlns:NMPVeh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo"
    exclude-result-prefixes="xs"
    version="1.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
       
            <ges:start>
                <inic:IniciarGestionBO>
                    <inic:folio>
                        <fol:folio>
                            <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:folio"/>
                        </fol:folio>
                    </inic:folio>
                    <inic:cliente>
                        <fluj:cliente>
                            <fluj:idCliente>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:cliente/ns0:idCliente"/>
                            </fluj:idCliente>
                            <fluj:numeroCredencial>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:cliente/ns0:numeroCredencial"/>
                            </fluj:numeroCredencial>
                        </fluj:cliente>
                        <cli:nombreCliente></cli:nombreCliente>
                    </inic:cliente>
                    <inic:estadoFlujoBPM>
                        <fluj:estadoFlujoBpm>
                            <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:estadoFlujoBpm"/>
                        </fluj:estadoFlujoBpm>
                    </inic:estadoFlujoBPM>
                    <inic:estadoSolicitud>
                        <fluj:estadoSolicitud>
                            <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:estadoSolicitud"/>
                        </fluj:estadoSolicitud>
                    </inic:estadoSolicitud>
                    <inic:cotizacion>
                        <fluj:cotizacion>
                            <cot:montoAvaluo>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:cotizacion/NMPCot:montoAvaluo"/>
                            </cot:montoAvaluo>
                            <cot:montoMaximoPrestamo>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:cotizacion/NMPCot:montoMaximoPrestamo"/>
                            </cot:montoMaximoPrestamo>
                            <cot:montoPrestamoSolicitado>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:cotizacion/NMPCot:montoPrestamoSolicitado"/>
                            </cot:montoPrestamoSolicitado>
                            <fluj:montoCastigo>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:cotizacion/NMPCot:montoCastigo"/>
                            </fluj:montoCastigo>
                        </fluj:cotizacion>
                    </inic:cotizacion>
                    <inic:vehiculo>
                        <veh:datosVehiculo>
                            <nmp:tipoVehiculo>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:tipoVehiculo"/>
                            </nmp:tipoVehiculo>
                            <nmp:vin>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:vin"/>
                            </nmp:vin>
                            <nmp:serieMotor>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:serieMotor"/>
                            </nmp:serieMotor>
                            <nmp:placas>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:placas"/>
                            </nmp:placas>
                            <nmp:marca>
                                <nmp:idMarca>
                                    <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:marca/NMPVeh:idMarca"/>
                                </nmp:idMarca>
                                <!--Optional:-->
                                <xsl:if test="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:marca/NMPVeh:descripcion">
                                <nmp:descripcion>
                                    <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:marca/NMPVeh:descripcion"/>
                                </nmp:descripcion>
                                </xsl:if>  
                            </nmp:marca>
                            <nmp:submarca>
                                <nmp:idSubMarca>
                                    <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:submarca/NMPVeh:idSubMarca"/>
                                </nmp:idSubMarca>
                                <!--Optional:-->
                                <xsl:if test="/ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:submarca/NMPVeh:descripcion">
                                <nmp:descripcion>
                                    <xsl:value-of select="/ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:submarca/NMPVeh:descripcion"/>
                                </nmp:descripcion>
                                </xsl:if>
                            </nmp:submarca>
                            <nmp:modelo>
                                <nmp:idModelo>
                                    <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:modelo/NMPVeh:idModelo"/>
                                </nmp:idModelo>
                                <!--Optional:-->
                                <xsl:if test="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:modelo/NMPVeh:descripcion">
                                <nmp:descripcion>
                                    <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:modelo/NMPVeh:descripcion"/>
                                </nmp:descripcion>
                                </xsl:if>
                            </nmp:modelo>
                            <nmp:version>
                                <nmp:idVersion>
                                    <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:version/NMPVeh:idVersion"/>
                                </nmp:idVersion>
                                <!--Optional:-->
                                <xsl:if test="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:version/NMPVeh:descripcion">
                                <nmp:descripcion>
                                    <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:version/NMPVeh:descripcion"/>
                                </nmp:descripcion>
                                </xsl:if>
                            </nmp:version>
                            <nmp:kilometraje>
                                <nmp:idKilometraje>
                                    <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:kilometraje/NMPVeh:idKilometraje"/>
                                </nmp:idKilometraje>
                                <!--Optional:-->
                                <xsl:if test="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:kilometraje/NMPVeh:descripcion">
                                <nmp:descripcion>
                                    <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:kilometraje/NMPVeh:descripcion"/>
                                </nmp:descripcion>
                                </xsl:if>   
                            </nmp:kilometraje>
                            
                            <nmp:complementos>
                                <!--Zero or more repetitions:-->
                                <xsl:for-each select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:complementos/NMPVeh:complemento">
                                <nmp:complemento>
                                    <nmp:idComplemento>
                                        <xsl:value-of select="NMPVeh:idComplemento"/>
                                    </nmp:idComplemento>
                                    <!--Optional:-->
                                    <xsl:if test="NMPVeh:descripcion">
                                    <nmp:descripcion>
                                        <xsl:value-of select="NMPVeh:descripcion"/>
                                    </nmp:descripcion>
                                    </xsl:if>
                                </nmp:complemento>
                                </xsl:for-each>
                            </nmp:complementos>
                            
                            <nmp:color>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:color"/>
                            </nmp:color>
                            <nmp:serieChasis>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:serieChasis"/>
                            </nmp:serieChasis>
                            <nmp:numeroTarjetaCirculacion>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:numeroTarjetaCirculacion"/>
                            </nmp:numeroTarjetaCirculacion>
                            <nmp:numeroFactura>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:numeroFactura"/>
                            </nmp:numeroFactura>
                            <nmp:rfcEmisor>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:rfcEmisor"/>
                            </nmp:rfcEmisor>
                            <nmp:agenciaOrigen>
                                <xsl:value-of select="//ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:agenciaOrigen"/>
                            </nmp:agenciaOrigen>
                            <nmp:comentarios>
                                <xsl:value-of select="/ns0:iniciarFlujoVehiculoSinResguardoRequest/ns0:vehiculo/NMPVeh:comentarios"/>
                            </nmp:comentarios>
                        </veh:datosVehiculo>
                    </inic:vehiculo>
                </inic:IniciarGestionBO>
            </ges:start>
          
    </xsl:template>
</xsl:stylesheet>