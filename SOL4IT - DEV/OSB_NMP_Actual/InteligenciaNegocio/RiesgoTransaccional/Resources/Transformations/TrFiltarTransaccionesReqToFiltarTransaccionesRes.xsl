<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"      
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"  
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" 
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"               
                xmlns:ns0="http://servicios.montepiedad.com.mx/NMP/Schema/RiesgoTransaccional"
                exclude-result-prefixes="xsd xsi xsl ns0 xp20 oraxsl"
                xmlns:ns1="http://servicios.montepiedad.com.mx/NMP/Schema/commons/RT">  
  <xsl:param name="periodo"/>
  <xsl:param name="tipoTransaccion"/>
  <xsl:template match="/">
    <xsl:variable name="fechaInicial"
                  select="xp20:format-dateTime(xp20:subtract-dayTimeDuration-from-dateTime(xp20:current-date(), concat('P',$periodo,'D')),'[Y0001]-[M01]-[D01]')"/>
    <xsl:variable name="fechaActual" >
      <xsl:choose>
        <xsl:when test="$periodo='2'">
          <xsl:value-of select="xp20:format-dateTime(xp20:subtract-dayTimeDuration-from-dateTime(xp20:current-date(), 'P1D'),'[Y0001]-[M01]-[D01]')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="xp20:format-dateTime(xp20:current-date(), '[Y0001]-[M01]-[D01]')"/>          
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <ns0:aplicaReglaRequest>
      <ns0:validaAlerta>
        <ns1:idCliente>
          <ns1:idCliente>
            <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:idCliente/ns1:idCliente"/>
          </ns1:idCliente>
        </ns1:idCliente>
        <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:fechaRegistroCliente">
          <ns1:fechaRegistroCliente>
            <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:fechaRegistroCliente/@xsi:nil">
              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:fechaRegistroCliente/@xsi:nil"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:fechaRegistroCliente"/>
          </ns1:fechaRegistroCliente>
        </xsl:if>
        <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:diasAltaCliente">
          <ns1:diasAltaCliente>
            <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:diasAltaCliente/@xsi:nil">
              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:diasAltaCliente/@xsi:nil"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:diasAltaCliente"/>
          </ns1:diasAltaCliente>
        </xsl:if>
        <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:idSucursal">
          <ns1:idSucursal>
            <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:idSucursal/@xsi:nil">
              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:idSucursal/@xsi:nil"/>
              </xsl:attribute>
            </xsl:if>
            <ns1:idSucursal>
              <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:idSucursal/ns1:idSucursal"/>
            </ns1:idSucursal>
          </ns1:idSucursal>
        </xsl:if>
        <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:idTransaccionNueva">
          <ns1:idTransaccionNueva>
            <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:idTransaccionNueva/@xsi:nil">
              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:idTransaccionNueva/@xsi:nil"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:idTransaccionNueva"/>
          </ns1:idTransaccionNueva>
        </xsl:if>
        <ns1:reglaId>
          <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:reglaId"/>
        </ns1:reglaId>
        <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:totalTrans">
          <ns1:totalTrans>
            <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:totalTrans/@xsi:nil">
              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:totalTrans/@xsi:nil"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:totalTrans"/>
          </ns1:totalTrans>
        </xsl:if>
        <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:totalMontoTrans">
          <ns1:totalMontoTrans>
            <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:totalMontoTrans/@xsi:nil">
              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:totalMontoTrans/@xsi:nil"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:totalMontoTrans"/>
          </ns1:totalMontoTrans>
        </xsl:if>
        <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro1">
          <ns1:parametro1>
            <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro1/@xsi:nil">
              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro1/@xsi:nil"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro1"/>
          </ns1:parametro1>
        </xsl:if>
        <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro2">
          <ns1:parametro2>
            <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro2/@xsi:nil">
              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro2/@xsi:nil"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro2"/>
          </ns1:parametro2>
        </xsl:if>
        <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro3">
          <ns1:parametro3>
            <xsl:if test="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro3/@xsi:nil">
              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro3/@xsi:nil"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:parametro3"/>
          </ns1:parametro3>
        </xsl:if>
        <xsl:for-each select="/ns0:aplicaReglaRequest/ns0:validaAlerta/ns1:transaccionList">
          <ns1:transaccionList>
            <xsl:if test="@xsi:nil">
              <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:value-of select="@xsi:nil"/>
              </xsl:attribute>
            </xsl:if>
            <ns1:idCliente>
              <ns1:idCliente>
                <xsl:value-of select="ns1:idCliente/ns1:idCliente"/>
              </ns1:idCliente>
            </ns1:idCliente>
            <ns1:monto>
              <xsl:if test="ns1:monto/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:monto/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:monto"/>
            </ns1:monto>
            <ns1:cantidadPartidas>
              <xsl:if test="ns1:cantidadPartidas/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:cantidadPartidas/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:cantidadPartidas"/>
            </ns1:cantidadPartidas>
            <ns1:cantidadTransacciones>
              <xsl:if test="ns1:cantidadTransacciones/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:cantidadTransacciones/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:cantidadTransacciones"/>
            </ns1:cantidadTransacciones>
            <ns1:fechaAnalisis>
              <xsl:if test="ns1:fechaAnalisis/@xsi:nil">
                <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                  <xsl:value-of select="ns1:fechaAnalisis/@xsi:nil"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="ns1:fechaAnalisis"/>
            </ns1:fechaAnalisis>
            <xsl:for-each select="ns1:transaccion">
              <!-- ***************** Condicion para filtrado de reglas ********************-->
              <xsl:variable name="fechaDeTransaccion"
                            select="xp20:format-dateTime(ns1:fechaOperacion/ns1:fechaOperacion,'[Y0001]-[M01]-[D01]')"/>
                <xsl:choose>
                    <xsl:when test="$tipoTransaccion = 'ALL'">
                        <xsl:if test="( xp20:compare($fechaInicial,$fechaDeTransaccion) &lt;= 0 and xp20:compare($fechaDeTransaccion,$fechaActual) &lt;= 0)">
                            <!--xsl:if test="ns1:tipoOperacion/ns1:tipoOperacion = $tipoTransaccion"-->
                            <ns1:transaccion>
                                <xsl:if test="@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                        <xsl:value-of select="@xsi:nil"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <ns1:idCliente>
                                    <xsl:if test="ns1:idCliente/@xsi:nil">
                                        <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                            <xsl:value-of select="ns1:idCliente/@xsi:nil"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <ns1:idCliente>
                                        <xsl:value-of select="ns1:idCliente/ns1:idCliente"/>
                                    </ns1:idCliente>
                                </ns1:idCliente>
                                <xsl:if test="ns1:monto">
                                    <ns1:monto>
                                        <xsl:value-of select="ns1:monto"/>
                                    </ns1:monto>
                                </xsl:if>
                                <xsl:if test="ns1:fechaOperacion">
                                    <ns1:fechaOperacion>
                                        <ns1:fechaOperacion>
                                            <xsl:value-of select="ns1:fechaOperacion/ns1:fechaOperacion"/>
                                        </ns1:fechaOperacion>
                                    </ns1:fechaOperacion>
                                </xsl:if>
                                <xsl:if test="ns1:idSucursal">
                                    <ns1:idSucursal>
                                        <ns1:idSucursal>
                                            <xsl:value-of select="ns1:idSucursal/ns1:idSucursal"/>
                                        </ns1:idSucursal>
                                    </ns1:idSucursal>
                                </xsl:if>
                                <xsl:if test="ns1:esCancelacion">
                                    <ns1:esCancelacion>
                                        <xsl:if test="ns1:esCancelacion/@xsi:nil">
                                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                                <xsl:value-of select="ns1:esCancelacion/@xsi:nil"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="ns1:esCancelacion"/>
                                    </ns1:esCancelacion>
                                </xsl:if>
                                <xsl:if test="ns1:esReempeno">
                                    <ns1:esReempeno>
                                        <xsl:if test="ns1:esReempeno/@xsi:nil">
                                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                                <xsl:value-of select="ns1:esReempeno/@xsi:nil"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="ns1:esReempeno"/>
                                    </ns1:esReempeno>
                                </xsl:if>
                                <xsl:if test="ns1:tipoOperacion">
                                    <ns1:tipoOperacion>
                                        <xsl:if test="ns1:tipoOperacion/@xsi:nil">
                                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                                <xsl:value-of select="ns1:tipoOperacion/@xsi:nil"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <ns1:tipoOperacion>
                                            <xsl:value-of select="ns1:tipoOperacion/ns1:tipoOperacion"/>
                                        </ns1:tipoOperacion>
                                    </ns1:tipoOperacion>
                                </xsl:if>
                                <xsl:if test="ns1:cantidadPartidas">
                                    <ns1:cantidadPartidas>
                                        <xsl:if test="ns1:cantidadPartidas/@xsi:nil">
                                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                                <xsl:value-of select="ns1:cantidadPartidas/@xsi:nil"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="ns1:cantidadPartidas"/>
                                    </ns1:cantidadPartidas>
                                </xsl:if>
                                <xsl:for-each select="ns1:partidasList">
                                    <ns1:partidasList>
                                        <xsl:if test="ns1:folioPartida">
                                            <ns1:folioPartida>
                                                <xsl:value-of select="ns1:folioPartida"/>
                                            </ns1:folioPartida>
                                        </xsl:if>
                                        <ns1:monto>
                                            <xsl:value-of select="ns1:monto"/>
                                        </ns1:monto>
                                        <ns1:valorOperacion>
                                            <xsl:value-of select="ns1:valorOperacion"/>
                                        </ns1:valorOperacion>
                                        <ns1:ramo>
                                            <xsl:value-of select="ns1:ramo"/>
                                        </ns1:ramo>
                                        <ns1:subRamo>
                                            <xsl:value-of select="ns1:subRamo"/>
                                        </ns1:subRamo>
                                        <xsl:if test="ns1:tipoProducto">
                                            <ns1:tipoProducto>
                                                <xsl:value-of select="ns1:tipoProducto"/>
                                            </ns1:tipoProducto>
                                        </xsl:if>
                                        <xsl:if test="ns1:producto">
                                            <ns1:producto>
                                                <xsl:value-of select="ns1:producto"/>
                                            </ns1:producto>
                                        </xsl:if>
                                        <xsl:if test="ns1:caracteristica1">
                                            <ns1:caracteristica1>
                                                <xsl:value-of select="ns1:caracteristica1"/>
                                            </ns1:caracteristica1>
                                        </xsl:if>
                                        <xsl:if test="ns1:caracteristica2">
                                            <ns1:caracteristica2>
                                                <xsl:value-of select="ns1:caracteristica2"/>
                                            </ns1:caracteristica2>
                                        </xsl:if>
                                        <xsl:if test="ns1:caracteristica3">
                                            <ns1:caracteristica3>
                                                <xsl:value-of select="ns1:caracteristica3"/>
                                            </ns1:caracteristica3>
                                        </xsl:if>
                                        <xsl:if test="ns1:cveValuador">
                                            <ns1:cveValuador>
                                                <xsl:value-of select="ns1:cveValuador"/>
                                            </ns1:cveValuador>
                                        </xsl:if>
                                        <ns1:montoPrestamo>
                                            <ns1:montoPrestamo>
                                                <xsl:value-of select="ns1:montoPrestamo/ns1:montoPrestamo"/>
                                            </ns1:montoPrestamo>
                                        </ns1:montoPrestamo>
                                        <xsl:if test="ns1:idClientePrenda">
                                            <ns1:idClientePrenda>
                                                <ns1:idClientePrenda>
                                                    <xsl:value-of select="ns1:idClientePrenda/ns1:idClientePrenda"/>
                                                </ns1:idClientePrenda>
                                            </ns1:idClientePrenda>
                                        </xsl:if>
                                        <ns1:cantidadPartidas>
                                            <xsl:value-of select="ns1:cantidadPartidas"/>
                                        </ns1:cantidadPartidas>
                                        <xsl:if test="ns1:fechaComercializacion">
                                            <ns1:fechaComercializacion>
                                                <xsl:value-of select="ns1:fechaComercializacion"/>
                                            </ns1:fechaComercializacion>
                                        </xsl:if>
                                        <ns1:tipoOperacion>
                                            <ns1:tipoOperacion>
                                                <xsl:value-of select="ns1:tipoOperacion/ns1:tipoOperacion"/>
                                            </ns1:tipoOperacion>
                                        </ns1:tipoOperacion>
                                        <xsl:if test="ns1:existAlmoneda">
                                            <ns1:existAlmoneda>
                                                <xsl:value-of select="ns1:existAlmoneda"/>
                                            </ns1:existAlmoneda>
                                        </xsl:if>
                                        <xsl:if test="ns1:montoAvaluo">
                                            <ns1:montoAvaluo>
                                                <xsl:value-of select="ns1:montoAvaluo"/>
                                            </ns1:montoAvaluo>
                                        </xsl:if>
                                        <xsl:if test="ns1:esquemaCobro">
                                            <ns1:esquemaCobro>
                                                <xsl:value-of select="ns1:esquemaCobro"/>
                                            </ns1:esquemaCobro>
                                        </xsl:if>
                                        <xsl:if test="ns1:idSucursalPartida">
                                            <ns1:idSucursalPartida>
                                                <xsl:value-of select="ns1:idSucursalPartida"/>
                                            </ns1:idSucursalPartida>
                                        </xsl:if>
                                        <xsl:if test="ns1:interesAlmoneda">
                                            <ns1:interesAlmoneda>
                                                <xsl:value-of select="ns1:interesAlmoneda"/>
                                            </ns1:interesAlmoneda>
                                        </xsl:if>
                                        <xsl:if test="ns1:comisionAlmacenaje">
                                            <ns1:comisionAlmacenaje>
                                                <xsl:value-of select="ns1:comisionAlmacenaje"/>
                                            </ns1:comisionAlmacenaje>
                                        </xsl:if>
                                        <xsl:if test="ns1:comisionComercializacion">
                                            <ns1:comisionComercializacion>
                                                <xsl:value-of select="ns1:comisionComercializacion"/>
                                            </ns1:comisionComercializacion>
                                        </xsl:if>
                                        <xsl:if test="ns1:comisionDesempenioExtemporaneo">
                                            <ns1:comisionDesempenioExtemporaneo>
                                                <xsl:value-of select="ns1:comisionDesempenioExtemporaneo"/>
                                            </ns1:comisionDesempenioExtemporaneo>
                                        </xsl:if>
                                        <xsl:if test="ns1:interesDeposito">
                                            <ns1:interesDeposito>
                                                <xsl:value-of select="ns1:interesDeposito"/>
                                            </ns1:interesDeposito>
                                        </xsl:if>
                                        <xsl:if test="ns1:interesDepositoCancelado">
                                            <ns1:interesDepositoCancelado>
                                                <xsl:value-of select="ns1:interesDepositoCancelado"/>
                                            </ns1:interesDepositoCancelado>
                                        </xsl:if>
                                        <xsl:if test="ns1:interesDevengadoAnteriorPorPeriodo">
                                            <ns1:interesDevengadoAnteriorPorPeriodo>
                                                <xsl:value-of select="ns1:interesDevengadoAnteriorPorPeriodo"/>
                                            </ns1:interesDevengadoAnteriorPorPeriodo>
                                        </xsl:if>
                                        <xsl:if test="ns1:interesDevengadoPorPeriodo">
                                            <ns1:interesDevengadoPorPeriodo>
                                                <xsl:value-of select="ns1:interesDevengadoPorPeriodo"/>
                                            </ns1:interesDevengadoPorPeriodo>
                                        </xsl:if>
                                        <xsl:if test="ns1:fechaDecremento">
                                            <ns1:fechaDecremento>
                                                <xsl:value-of select="ns1:fechaDecremento"/>
                                            </ns1:fechaDecremento>
                                        </xsl:if>
                                        <xsl:if test="ns1:saldoFavor">
                                            <ns1:saldoFavor>
                                                <xsl:value-of select="ns1:saldoFavor"/>
                                            </ns1:saldoFavor>
                                        </xsl:if>
                                    </ns1:partidasList>
                                </xsl:for-each>
                            </ns1:transaccion>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="ns1:partidasList[1]/ns1:tipoOperacion/ns1:tipoOperacion = $tipoTransaccion and ( xp20:compare($fechaInicial,$fechaDeTransaccion) &lt;= 0 and xp20:compare($fechaDeTransaccion,$fechaActual) &lt;= 0)">
                            <!--xsl:if test="ns1:tipoOperacion/ns1:tipoOperacion = $tipoTransaccion"-->
                            <ns1:transaccion>
                                <xsl:if test="@xsi:nil">
                                    <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                        <xsl:value-of select="@xsi:nil"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <ns1:idCliente>
                                    <xsl:if test="ns1:idCliente/@xsi:nil">
                                        <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                            <xsl:value-of select="ns1:idCliente/@xsi:nil"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <ns1:idCliente>
                                        <xsl:value-of select="ns1:idCliente/ns1:idCliente"/>
                                    </ns1:idCliente>
                                </ns1:idCliente>
                                <xsl:if test="ns1:monto">
                                    <ns1:monto>
                                        <xsl:value-of select="ns1:monto"/>
                                    </ns1:monto>
                                </xsl:if>
                                <xsl:if test="ns1:fechaOperacion">
                                    <ns1:fechaOperacion>
                                        <ns1:fechaOperacion>
                                            <xsl:value-of select="ns1:fechaOperacion/ns1:fechaOperacion"/>
                                        </ns1:fechaOperacion>
                                    </ns1:fechaOperacion>
                                </xsl:if>
                                <xsl:if test="ns1:idSucursal">
                                    <ns1:idSucursal>
                                        <ns1:idSucursal>
                                            <xsl:value-of select="ns1:idSucursal/ns1:idSucursal"/>
                                        </ns1:idSucursal>
                                    </ns1:idSucursal>
                                </xsl:if>
                                <xsl:if test="ns1:esCancelacion">
                                    <ns1:esCancelacion>
                                        <xsl:if test="ns1:esCancelacion/@xsi:nil">
                                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                                <xsl:value-of select="ns1:esCancelacion/@xsi:nil"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="ns1:esCancelacion"/>
                                    </ns1:esCancelacion>
                                </xsl:if>
                                <xsl:if test="ns1:esReempeno">
                                    <ns1:esReempeno>
                                        <xsl:if test="ns1:esReempeno/@xsi:nil">
                                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                                <xsl:value-of select="ns1:esReempeno/@xsi:nil"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="ns1:esReempeno"/>
                                    </ns1:esReempeno>
                                </xsl:if>
                                <xsl:if test="ns1:tipoOperacion">
                                    <ns1:tipoOperacion>
                                        <xsl:if test="ns1:tipoOperacion/@xsi:nil">
                                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                                <xsl:value-of select="ns1:tipoOperacion/@xsi:nil"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <ns1:tipoOperacion>
                                            <xsl:value-of select="ns1:tipoOperacion/ns1:tipoOperacion"/>
                                        </ns1:tipoOperacion>
                                    </ns1:tipoOperacion>
                                </xsl:if>
                                <xsl:if test="ns1:cantidadPartidas">
                                    <ns1:cantidadPartidas>
                                        <xsl:if test="ns1:cantidadPartidas/@xsi:nil">
                                            <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                                <xsl:value-of select="ns1:cantidadPartidas/@xsi:nil"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="ns1:cantidadPartidas"/>
                                    </ns1:cantidadPartidas>
                                </xsl:if>
                                <xsl:for-each select="ns1:partidasList">
                                    <ns1:partidasList>
                                        <xsl:if test="ns1:folioPartida">
                                            <ns1:folioPartida>
                                                <xsl:value-of select="ns1:folioPartida"/>
                                            </ns1:folioPartida>
                                        </xsl:if>
                                        <ns1:monto>
                                            <xsl:value-of select="ns1:monto"/>
                                        </ns1:monto>
                                        <ns1:valorOperacion>
                                            <xsl:value-of select="ns1:valorOperacion"/>
                                        </ns1:valorOperacion>
                                        <ns1:ramo>
                                            <xsl:value-of select="ns1:ramo"/>
                                        </ns1:ramo>
                                        <ns1:subRamo>
                                            <xsl:value-of select="ns1:subRamo"/>
                                        </ns1:subRamo>
                                        <xsl:if test="ns1:tipoProducto">
                                            <ns1:tipoProducto>
                                                <xsl:value-of select="ns1:tipoProducto"/>
                                            </ns1:tipoProducto>
                                        </xsl:if>
                                        <xsl:if test="ns1:producto">
                                            <ns1:producto>
                                                <xsl:value-of select="ns1:producto"/>
                                            </ns1:producto>
                                        </xsl:if>
                                        <xsl:if test="ns1:caracteristica1">
                                            <ns1:caracteristica1>
                                                <xsl:value-of select="ns1:caracteristica1"/>
                                            </ns1:caracteristica1>
                                        </xsl:if>
                                        <xsl:if test="ns1:caracteristica2">
                                            <ns1:caracteristica2>
                                                <xsl:value-of select="ns1:caracteristica2"/>
                                            </ns1:caracteristica2>
                                        </xsl:if>
                                        <xsl:if test="ns1:caracteristica3">
                                            <ns1:caracteristica3>
                                                <xsl:value-of select="ns1:caracteristica3"/>
                                            </ns1:caracteristica3>
                                        </xsl:if>
                                        <xsl:if test="ns1:cveValuador">
                                            <ns1:cveValuador>
                                                <xsl:value-of select="ns1:cveValuador"/>
                                            </ns1:cveValuador>
                                        </xsl:if>
                                        <ns1:montoPrestamo>
                                            <ns1:montoPrestamo>
                                                <xsl:value-of select="ns1:montoPrestamo/ns1:montoPrestamo"/>
                                            </ns1:montoPrestamo>
                                        </ns1:montoPrestamo>
                                        <xsl:if test="ns1:idClientePrenda">
                                            <ns1:idClientePrenda>
                                                <ns1:idClientePrenda>
                                                    <xsl:value-of select="ns1:idClientePrenda/ns1:idClientePrenda"/>
                                                </ns1:idClientePrenda>
                                            </ns1:idClientePrenda>
                                        </xsl:if>
                                        <ns1:cantidadPartidas>
                                            <xsl:value-of select="ns1:cantidadPartidas"/>
                                        </ns1:cantidadPartidas>
                                        <xsl:if test="ns1:fechaComercializacion">
                                            <ns1:fechaComercializacion>
                                                <xsl:value-of select="ns1:fechaComercializacion"/>
                                            </ns1:fechaComercializacion>
                                        </xsl:if>
                                        <ns1:tipoOperacion>
                                            <ns1:tipoOperacion>
                                                <xsl:value-of select="ns1:tipoOperacion/ns1:tipoOperacion"/>
                                            </ns1:tipoOperacion>
                                        </ns1:tipoOperacion>
                                        <xsl:if test="ns1:existAlmoneda">
                                            <ns1:existAlmoneda>
                                                <xsl:value-of select="ns1:existAlmoneda"/>
                                            </ns1:existAlmoneda>
                                        </xsl:if>
                                        <xsl:if test="ns1:montoAvaluo">
                                            <ns1:montoAvaluo>
                                                <xsl:value-of select="ns1:montoAvaluo"/>
                                            </ns1:montoAvaluo>
                                        </xsl:if>
                                        <xsl:if test="ns1:esquemaCobro">
                                            <ns1:esquemaCobro>
                                                <xsl:value-of select="ns1:esquemaCobro"/>
                                            </ns1:esquemaCobro>
                                        </xsl:if>
                                        <xsl:if test="ns1:idSucursalPartida">
                                            <ns1:idSucursalPartida>
                                                <xsl:value-of select="ns1:idSucursalPartida"/>
                                            </ns1:idSucursalPartida>
                                        </xsl:if>
                                        <xsl:if test="ns1:interesAlmoneda">
                                            <ns1:interesAlmoneda>
                                                <xsl:value-of select="ns1:interesAlmoneda"/>
                                            </ns1:interesAlmoneda>
                                        </xsl:if>
                                        <xsl:if test="ns1:comisionAlmacenaje">
                                            <ns1:comisionAlmacenaje>
                                                <xsl:value-of select="ns1:comisionAlmacenaje"/>
                                            </ns1:comisionAlmacenaje>
                                        </xsl:if>
                                        <xsl:if test="ns1:comisionComercializacion">
                                            <ns1:comisionComercializacion>
                                                <xsl:value-of select="ns1:comisionComercializacion"/>
                                            </ns1:comisionComercializacion>
                                        </xsl:if>
                                        <xsl:if test="ns1:comisionDesempenioExtemporaneo">
                                            <ns1:comisionDesempenioExtemporaneo>
                                                <xsl:value-of select="ns1:comisionDesempenioExtemporaneo"/>
                                            </ns1:comisionDesempenioExtemporaneo>
                                        </xsl:if>
                                        <xsl:if test="ns1:interesDeposito">
                                            <ns1:interesDeposito>
                                                <xsl:value-of select="ns1:interesDeposito"/>
                                            </ns1:interesDeposito>
                                        </xsl:if>
                                        <xsl:if test="ns1:interesDepositoCancelado">
                                            <ns1:interesDepositoCancelado>
                                                <xsl:value-of select="ns1:interesDepositoCancelado"/>
                                            </ns1:interesDepositoCancelado>
                                        </xsl:if>
                                        <xsl:if test="ns1:interesDevengadoAnteriorPorPeriodo">
                                            <ns1:interesDevengadoAnteriorPorPeriodo>
                                                <xsl:value-of select="ns1:interesDevengadoAnteriorPorPeriodo"/>
                                            </ns1:interesDevengadoAnteriorPorPeriodo>
                                        </xsl:if>
                                        <xsl:if test="ns1:interesDevengadoPorPeriodo">
                                            <ns1:interesDevengadoPorPeriodo>
                                                <xsl:value-of select="ns1:interesDevengadoPorPeriodo"/>
                                            </ns1:interesDevengadoPorPeriodo>
                                        </xsl:if>
                                        <xsl:if test="ns1:fechaDecremento">
                                            <ns1:fechaDecremento>
                                                <xsl:value-of select="ns1:fechaDecremento"/>
                                            </ns1:fechaDecremento>
                                        </xsl:if>
                                        <xsl:if test="ns1:saldoFavor">
                                            <ns1:saldoFavor>
                                                <xsl:value-of select="ns1:saldoFavor"/>
                                            </ns1:saldoFavor>
                                        </xsl:if>
                                    </ns1:partidasList>
                                </xsl:for-each>
                            </ns1:transaccion>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
          </ns1:transaccionList>
        </xsl:for-each>
      </ns0:validaAlerta>
    </ns0:aplicaReglaRequest>
  </xsl:template>
</xsl:stylesheet>