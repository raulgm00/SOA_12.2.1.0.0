<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ries="http://servicios.montepiedad.com.mx/NMP/Schema/RiesgoTransaccional" 
    xmlns:rt="http://servicios.montepiedad.com.mx/NMP/Schema/commons/RT"
    xmlns:nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs ries rt fn"
    version="2.0">
    <xsl:output indent="yes" />
    <xsl:template match="/">
        <ries:orquestadorAnalisisRequest>
            <ries:transaccion>
                <rt:idCliente>
                    <rt:idCliente><xsl:value-of select="//nmp:idCliente"/></rt:idCliente>
                </rt:idCliente>
                <rt:procesado>0</rt:procesado>
                <rt:monto>0</rt:monto>
                <rt:fechaOperacion>
                    <rt:fechaOperacion><xsl:value-of select="//nmp:fechaOperacion"/></rt:fechaOperacion>
                </rt:fechaOperacion>
                <rt:idSucursal>
                    <rt:idSucursal><xsl:value-of select="//nmp:idSucursal"/></rt:idSucursal>
                </rt:idSucursal>
                <rt:esCancelacion><xsl:value-of select="//nmp:esCancelacion"/></rt:esCancelacion>
                <rt:esReempeno><xsl:value-of select="//nmp:esReempeno"/></rt:esReempeno>
                <rt:cantidadPartidas>0</rt:cantidadPartidas>
               
                <xsl:for-each select="//nmp:ListaOperaciones/nmp:Operacion">
                    
                  
                <xsl:choose>
                    
                    <xsl:when test="nmp:Prestamo/nmp:tipoOperacion = 'PP'">
                        <xsl:if test="//nmp:esCancelacion = 'false'">
                        <rt:partidasList>
                           
                            <xsl:if test="nmp:Prestamo/nmp:folioPartida">
                                <rt:folioPartida><xsl:value-of select="nmp:Prestamo/nmp:folioPartida"/></rt:folioPartida>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:valorOperacion">
                                <rt:monto><xsl:value-of select="nmp:Prestamo/nmp:valorOperacion"/></rt:monto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:valorOperacion">
                                <rt:valorOperacion><xsl:value-of select="nmp:Prestamo/nmp:valorOperacion"/></rt:valorOperacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:ramo">
                                <rt:ramo><xsl:value-of select="nmp:Prestamo/nmp:ramo"/></rt:ramo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:subramo">
                                <rt:subRamo><xsl:value-of select="nmp:Prestamo/nmp:subramo"/></rt:subRamo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:tipoProducto">
                                <rt:tipoProducto><xsl:value-of select="nmp:Prestamo/nmp:tipoProducto"/></rt:tipoProducto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:producto">
                                <rt:producto><xsl:value-of select="nmp:Prestamo/nmp:producto"/></rt:producto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica1">
                                <rt:caracteristica1><xsl:value-of select="nmp:Prestamo/nmp:caracteristica1"/></rt:caracteristica1>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica2">
                                <rt:caracteristica2><xsl:value-of select="nmp:Prestamo/nmp:caracteristica2"/></rt:caracteristica2>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica3">
                                <rt:caracteristica3><xsl:value-of select="nmp:Prestamo/nmp:caracteristica3"/></rt:caracteristica3>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:cveValuador">
                                <rt:cveValuador><xsl:value-of select="nmp:Prestamo/nmp:cveValuador"/></rt:cveValuador>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:montoPrestamo">
                                <rt:montoPrestamo>
                                    <rt:montoPrestamo><xsl:value-of select="nmp:Prestamo/nmp:montoPrestamo"/></rt:montoPrestamo>
                                </rt:montoPrestamo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:idClientePrenda">
                                <rt:idClientePrenda>
                                    <rt:idClientePrenda><xsl:value-of select="nmp:Prestamo/nmp:idClientePrenda"/></rt:idClientePrenda>
                                </rt:idClientePrenda>
                            </xsl:if>
                            <rt:cantidadPartidas>0</rt:cantidadPartidas>
                            <xsl:if test="nmp:Prestamo/nmp:fechaComercializacion">
                                <rt:fechaComercializacion><xsl:value-of select="nmp:Prestamo/nmp:fechaComercializacion"/></rt:fechaComercializacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:tipoOperacion">
                                <rt:tipoOperacion>
                                    <rt:tipoOperacion><xsl:value-of select="nmp:Prestamo/nmp:tipoOperacion"/></rt:tipoOperacion>
                                </rt:tipoOperacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:existenciaAlMoneda">
                                <rt:existAlmoneda><xsl:value-of select="nmp:Prestamo/nmp:existenciaAlMoneda"/></rt:existAlmoneda>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:montoAvaluo">
                                <rt:montoAvaluo><xsl:value-of select="nmp:Prestamo/nmp:montoAvaluo"/></rt:montoAvaluo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:esquemaCobro">
                                <rt:esquemaCobro><xsl:value-of select="nmp:Contabilidad/nmp:esquemaCobro"/></rt:esquemaCobro>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:idSucursalPartida">
                                <rt:idSucursalPartida><xsl:value-of select="nmp:Contabilidad/nmp:idSucursalPartida"/></rt:idSucursalPartida>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesAlmoneda">
                                <rt:interesAlmoneda><xsl:value-of select="nmp:Contabilidad/nmp:interesAlmoneda"/></rt:interesAlmoneda>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionAlmacenaje">
                                <rt:comisionAlmacenaje><xsl:value-of select="nmp:Contabilidad/nmp:comisionAlmacenaje"/></rt:comisionAlmacenaje>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionComercializacion">
                                <rt:comisionComercializacion><xsl:value-of select="nmp:Contabilidad/nmp:comisionComercializacion"/></rt:comisionComercializacion>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionDesempenioExtemporaneo">
                                <rt:comisionDesempenioExtemporaneo><xsl:value-of select="nmp:Contabilidad/nmp:comisionDesempenioExtemporaneo"/></rt:comisionDesempenioExtemporaneo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDeposito">
                                <rt:interesDeposito><xsl:value-of select="nmp:Contabilidad/nmp:interesDeposito"/></rt:interesDeposito>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDepositoCancelado">
                                <rt:interesDepositoCancelado><xsl:value-of select="nmp:Contabilidad/nmp:interesDepositoCancelado"/></rt:interesDepositoCancelado>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDevengadoAnteriorPorPeriodo">
                                <rt:interesDevengadoAnteriorPorPeriodo><xsl:value-of select="nmp:Contabilidad/nmp:interesDevengadoAnteriorPorPeriodo"/></rt:interesDevengadoAnteriorPorPeriodo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDevengadoPorPeriodo">
                                <rt:interesDevengadoPorPeriodo><xsl:value-of select="nmp:Contabilidad/nmp:interesDevengadoPorPeriodo"/></rt:interesDevengadoPorPeriodo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:fechaDecremento">
                                <rt:fechaDecremento><xsl:value-of select="nmp:Contabilidad/nmp:fechaDecremento"/></rt:fechaDecremento>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:saldoFavor">
                                <rt:saldoFavor><xsl:value-of select="nmp:Contabilidad/nmp:saldoFavor"/></rt:saldoFavor>
                            </xsl:if>
                        
                        </rt:partidasList>
                        </xsl:if>  
                    </xsl:when>
                    
                    
                    
                    <xsl:when test="nmp:Prestamo/nmp:tipoOperacion = 'DS'">
                        <xsl:if test="//nmp:esCancelacion = 'false'">
                        <rt:partidasList>
                            <xsl:if test="nmp:Prestamo/nmp:folioPartida">
                                <rt:folioPartida><xsl:value-of select="nmp:Prestamo/nmp:folioPartida"/></rt:folioPartida>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:valorOperacion">
                                <rt:monto><xsl:value-of select="nmp:Prestamo/nmp:valorOperacion"/></rt:monto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:valorOperacion">
                                <rt:valorOperacion><xsl:value-of select="nmp:Prestamo/nmp:valorOperacion"/></rt:valorOperacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:ramo">
                                <rt:ramo><xsl:value-of select="nmp:Prestamo/nmp:ramo"/></rt:ramo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:subramo">
                                <rt:subRamo><xsl:value-of select="nmp:Prestamo/nmp:subramo"/></rt:subRamo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:tipoProducto">
                                <rt:tipoProducto><xsl:value-of select="nmp:Prestamo/nmp:tipoProducto"/></rt:tipoProducto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:producto">
                                <rt:producto><xsl:value-of select="nmp:Prestamo/nmp:producto"/></rt:producto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica1">
                                <rt:caracteristica1><xsl:value-of select="nmp:Prestamo/nmp:caracteristica1"/></rt:caracteristica1>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica2">
                                <rt:caracteristica2><xsl:value-of select="nmp:Prestamo/nmp:caracteristica2"/></rt:caracteristica2>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica3">
                                <rt:caracteristica3><xsl:value-of select="nmp:Prestamo/nmp:caracteristica3"/></rt:caracteristica3>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:cveValuador">
                                <rt:cveValuador><xsl:value-of select="nmp:Prestamo/nmp:cveValuador"/></rt:cveValuador>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:montoPrestamo">
                                <rt:montoPrestamo>
                                    <rt:montoPrestamo><xsl:value-of select="nmp:Prestamo/nmp:montoPrestamo"/></rt:montoPrestamo>
                                </rt:montoPrestamo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:idClientePrenda">
                                <rt:idClientePrenda>
                                    <rt:idClientePrenda><xsl:value-of select="nmp:Prestamo/nmp:idClientePrenda"/></rt:idClientePrenda>
                                </rt:idClientePrenda>
                            </xsl:if>
                            <rt:cantidadPartidas>0</rt:cantidadPartidas>
                            <xsl:if test="nmp:Prestamo/nmp:fechaComercializacion">
                                <rt:fechaComercializacion><xsl:value-of select="nmp:Prestamo/nmp:fechaComercializacion"/></rt:fechaComercializacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:tipoOperacion">
                                <rt:tipoOperacion>
                                    <rt:tipoOperacion><xsl:value-of select="nmp:Prestamo/nmp:tipoOperacion"/></rt:tipoOperacion>
                                </rt:tipoOperacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:existenciaAlMoneda">
                                <rt:existAlmoneda><xsl:value-of select="nmp:Prestamo/nmp:existenciaAlMoneda"/></rt:existAlmoneda>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:montoAvaluo">
                                <rt:montoAvaluo><xsl:value-of select="nmp:Prestamo/nmp:montoAvaluo"/></rt:montoAvaluo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:esquemaCobro">
                                <rt:esquemaCobro><xsl:value-of select="nmp:Contabilidad/nmp:esquemaCobro"/></rt:esquemaCobro>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:idSucursalPartida">
                                <rt:idSucursalPartida><xsl:value-of select="nmp:Contabilidad/nmp:idSucursalPartida"/></rt:idSucursalPartida>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesAlmoneda">
                                <rt:interesAlmoneda><xsl:value-of select="nmp:Contabilidad/nmp:interesAlmoneda"/></rt:interesAlmoneda>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionAlmacenaje">
                                <rt:comisionAlmacenaje><xsl:value-of select="nmp:Contabilidad/nmp:comisionAlmacenaje"/></rt:comisionAlmacenaje>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionComercializacion">
                                <rt:comisionComercializacion><xsl:value-of select="nmp:Contabilidad/nmp:comisionComercializacion"/></rt:comisionComercializacion>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionDesempenioExtemporaneo">
                                <rt:comisionDesempenioExtemporaneo><xsl:value-of select="nmp:Contabilidad/nmp:comisionDesempenioExtemporaneo"/></rt:comisionDesempenioExtemporaneo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDeposito">
                                <rt:interesDeposito><xsl:value-of select="nmp:Contabilidad/nmp:interesDeposito"/></rt:interesDeposito>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDepositoCancelado">
                                <rt:interesDepositoCancelado><xsl:value-of select="nmp:Contabilidad/nmp:interesDepositoCancelado"/></rt:interesDepositoCancelado>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDevengadoAnteriorPorPeriodo">
                                <rt:interesDevengadoAnteriorPorPeriodo><xsl:value-of select="nmp:Contabilidad/nmp:interesDevengadoAnteriorPorPeriodo"/></rt:interesDevengadoAnteriorPorPeriodo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDevengadoPorPeriodo">
                                <rt:interesDevengadoPorPeriodo><xsl:value-of select="nmp:Contabilidad/nmp:interesDevengadoPorPeriodo"/></rt:interesDevengadoPorPeriodo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:fechaDecremento">
                                <rt:fechaDecremento><xsl:value-of select="nmp:Contabilidad/nmp:fechaDecremento"/></rt:fechaDecremento>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:saldoFavor">
                                <rt:saldoFavor><xsl:value-of select="nmp:Contabilidad/nmp:saldoFavor"/></rt:saldoFavor>
                            </xsl:if>
                       
                        </rt:partidasList>
                        </xsl:if>
                    </xsl:when>
                    
                    
                    <xsl:when test="nmp:Prestamo/nmp:tipoOperacion = 'RF'">
                        <xsl:if test="//nmp:esCancelacion = 'false'">
                        <rt:partidasList>
                            <xsl:if test="nmp:Prestamo/nmp:folioPartida">
                                <rt:folioPartida><xsl:value-of select="nmp:Prestamo/nmp:folioPartida"/></rt:folioPartida>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:valorOperacion">
                                <rt:monto><xsl:value-of select="nmp:Prestamo/nmp:valorOperacion"/></rt:monto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:valorOperacion">
                                <rt:valorOperacion><xsl:value-of select="nmp:Prestamo/nmp:valorOperacion"/></rt:valorOperacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:ramo">
                                <rt:ramo><xsl:value-of select="nmp:Prestamo/nmp:ramo"/></rt:ramo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:subramo">
                                <rt:subRamo><xsl:value-of select="nmp:Prestamo/nmp:subramo"/></rt:subRamo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:tipoProducto">
                                <rt:tipoProducto><xsl:value-of select="nmp:Prestamo/nmp:tipoProducto"/></rt:tipoProducto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:producto">
                                <rt:producto><xsl:value-of select="nmp:Prestamo/nmp:producto"/></rt:producto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica1">
                                <rt:caracteristica1><xsl:value-of select="nmp:Prestamo/nmp:caracteristica1"/></rt:caracteristica1>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica2">
                                <rt:caracteristica2><xsl:value-of select="nmp:Prestamo/nmp:caracteristica2"/></rt:caracteristica2>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica3">
                                <rt:caracteristica3><xsl:value-of select="nmp:Prestamo/nmp:caracteristica3"/></rt:caracteristica3>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:cveValuador">
                                <rt:cveValuador><xsl:value-of select="nmp:Prestamo/nmp:cveValuador"/></rt:cveValuador>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:montoPrestamo">
                                <rt:montoPrestamo>
                                    <rt:montoPrestamo><xsl:value-of select="nmp:Prestamo/nmp:montoPrestamo"/></rt:montoPrestamo>
                                </rt:montoPrestamo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:idClientePrenda">
                                <rt:idClientePrenda>
                                    <rt:idClientePrenda><xsl:value-of select="nmp:Prestamo/nmp:idClientePrenda"/></rt:idClientePrenda>
                                </rt:idClientePrenda>
                            </xsl:if>
                            <rt:cantidadPartidas>0</rt:cantidadPartidas>
                            <xsl:if test="nmp:Prestamo/nmp:fechaComercializacion">
                                <rt:fechaComercializacion><xsl:value-of select="nmp:Prestamo/nmp:fechaComercializacion"/></rt:fechaComercializacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:tipoOperacion">
                                <rt:tipoOperacion>
                                    <rt:tipoOperacion><xsl:value-of select="nmp:Prestamo/nmp:tipoOperacion"/></rt:tipoOperacion>
                                </rt:tipoOperacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:existenciaAlMoneda">
                                <rt:existAlmoneda><xsl:value-of select="nmp:Prestamo/nmp:existenciaAlMoneda"/></rt:existAlmoneda>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:montoAvaluo">
                                <rt:montoAvaluo><xsl:value-of select="nmp:Prestamo/nmp:montoAvaluo"/></rt:montoAvaluo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:esquemaCobro">
                                <rt:esquemaCobro><xsl:value-of select="nmp:Contabilidad/nmp:esquemaCobro"/></rt:esquemaCobro>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:idSucursalPartida">
                                <rt:idSucursalPartida><xsl:value-of select="nmp:Contabilidad/nmp:idSucursalPartida"/></rt:idSucursalPartida>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesAlmoneda">
                                <rt:interesAlmoneda><xsl:value-of select="nmp:Contabilidad/nmp:interesAlmoneda"/></rt:interesAlmoneda>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionAlmacenaje">
                                <rt:comisionAlmacenaje><xsl:value-of select="nmp:Contabilidad/nmp:comisionAlmacenaje"/></rt:comisionAlmacenaje>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionComercializacion">
                                <rt:comisionComercializacion><xsl:value-of select="nmp:Contabilidad/nmp:comisionComercializacion"/></rt:comisionComercializacion>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionDesempenioExtemporaneo">
                                <rt:comisionDesempenioExtemporaneo><xsl:value-of select="nmp:Contabilidad/nmp:comisionDesempenioExtemporaneo"/></rt:comisionDesempenioExtemporaneo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDeposito">
                                <rt:interesDeposito><xsl:value-of select="nmp:Contabilidad/nmp:interesDeposito"/></rt:interesDeposito>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDepositoCancelado">
                                <rt:interesDepositoCancelado><xsl:value-of select="nmp:Contabilidad/nmp:interesDepositoCancelado"/></rt:interesDepositoCancelado>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDevengadoAnteriorPorPeriodo">
                                <rt:interesDevengadoAnteriorPorPeriodo><xsl:value-of select="nmp:Contabilidad/nmp:interesDevengadoAnteriorPorPeriodo"/></rt:interesDevengadoAnteriorPorPeriodo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDevengadoPorPeriodo">
                                <rt:interesDevengadoPorPeriodo><xsl:value-of select="nmp:Contabilidad/nmp:interesDevengadoPorPeriodo"/></rt:interesDevengadoPorPeriodo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:fechaDecremento">
                                <rt:fechaDecremento><xsl:value-of select="nmp:Contabilidad/nmp:fechaDecremento"/></rt:fechaDecremento>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:saldoFavor">
                                <rt:saldoFavor><xsl:value-of select="nmp:Contabilidad/nmp:saldoFavor"/></rt:saldoFavor>
                            </xsl:if>
                        </rt:partidasList>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="nmp:Prestamo/nmp:tipoOperacion = 'IA'">
                        <xsl:if test="//nmp:esCancelacion = 'false'">
                        <rt:partidasList>
                            <xsl:if test="nmp:Prestamo/nmp:folioPartida">
                                <rt:folioPartida><xsl:value-of select="nmp:Prestamo/nmp:folioPartida"/></rt:folioPartida>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:valorOperacion">
                                <rt:monto><xsl:value-of select="nmp:Prestamo/nmp:valorOperacion"/></rt:monto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:valorOperacion">
                                <rt:valorOperacion><xsl:value-of select="nmp:Prestamo/nmp:valorOperacion"/></rt:valorOperacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:ramo">
                                <rt:ramo><xsl:value-of select="nmp:Prestamo/nmp:ramo"/></rt:ramo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:subramo">
                                <rt:subRamo><xsl:value-of select="nmp:Prestamo/nmp:subramo"/></rt:subRamo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:tipoProducto">
                                <rt:tipoProducto><xsl:value-of select="nmp:Prestamo/nmp:tipoProducto"/></rt:tipoProducto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:producto">
                                <rt:producto><xsl:value-of select="nmp:Prestamo/nmp:producto"/></rt:producto>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica1">
                                <rt:caracteristica1><xsl:value-of select="nmp:Prestamo/nmp:caracteristica1"/></rt:caracteristica1>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica2">
                                <rt:caracteristica2><xsl:value-of select="nmp:Prestamo/nmp:caracteristica2"/></rt:caracteristica2>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:caracteristica3">
                                <rt:caracteristica3><xsl:value-of select="nmp:Prestamo/nmp:caracteristica3"/></rt:caracteristica3>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:cveValuador">
                                <rt:cveValuador><xsl:value-of select="nmp:Prestamo/nmp:cveValuador"/></rt:cveValuador>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:montoPrestamo">
                                <rt:montoPrestamo>
                                    <rt:montoPrestamo><xsl:value-of select="nmp:Prestamo/nmp:montoPrestamo"/></rt:montoPrestamo>
                                </rt:montoPrestamo>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:idClientePrenda">
                                <rt:idClientePrenda>
                                    <rt:idClientePrenda><xsl:value-of select="nmp:Prestamo/nmp:idClientePrenda"/></rt:idClientePrenda>
                                </rt:idClientePrenda>
                            </xsl:if>
                            <rt:cantidadPartidas>0</rt:cantidadPartidas>
                            <xsl:if test="nmp:Prestamo/nmp:fechaComercializacion">
                                <rt:fechaComercializacion><xsl:value-of select="nmp:Prestamo/nmp:fechaComercializacion"/></rt:fechaComercializacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:tipoOperacion">
                                <rt:tipoOperacion>
                                    <rt:tipoOperacion><xsl:value-of select="nmp:Prestamo/nmp:tipoOperacion"/></rt:tipoOperacion>
                                </rt:tipoOperacion>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:existenciaAlMoneda">
                                <rt:existAlmoneda><xsl:value-of select="nmp:Prestamo/nmp:existenciaAlMoneda"/></rt:existAlmoneda>
                            </xsl:if>
                            <xsl:if test="nmp:Prestamo/nmp:montoAvaluo">
                                <rt:montoAvaluo><xsl:value-of select="nmp:Prestamo/nmp:montoAvaluo"/></rt:montoAvaluo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:esquemaCobro">
                                <rt:esquemaCobro><xsl:value-of select="nmp:Contabilidad/nmp:esquemaCobro"/></rt:esquemaCobro>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:idSucursalPartida">
                                <rt:idSucursalPartida><xsl:value-of select="nmp:Contabilidad/nmp:idSucursalPartida"/></rt:idSucursalPartida>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesAlmoneda">
                                <rt:interesAlmoneda><xsl:value-of select="nmp:Contabilidad/nmp:interesAlmoneda"/></rt:interesAlmoneda>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionAlmacenaje">
                                <rt:comisionAlmacenaje><xsl:value-of select="nmp:Contabilidad/nmp:comisionAlmacenaje"/></rt:comisionAlmacenaje>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionComercializacion">
                                <rt:comisionComercializacion><xsl:value-of select="nmp:Contabilidad/nmp:comisionComercializacion"/></rt:comisionComercializacion>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:comisionDesempenioExtemporaneo">
                                <rt:comisionDesempenioExtemporaneo><xsl:value-of select="nmp:Contabilidad/nmp:comisionDesempenioExtemporaneo"/></rt:comisionDesempenioExtemporaneo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDeposito">
                                <rt:interesDeposito><xsl:value-of select="nmp:Contabilidad/nmp:interesDeposito"/></rt:interesDeposito>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDepositoCancelado">
                                <rt:interesDepositoCancelado><xsl:value-of select="nmp:Contabilidad/nmp:interesDepositoCancelado"/></rt:interesDepositoCancelado>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDevengadoAnteriorPorPeriodo">
                                <rt:interesDevengadoAnteriorPorPeriodo><xsl:value-of select="nmp:Contabilidad/nmp:interesDevengadoAnteriorPorPeriodo"/></rt:interesDevengadoAnteriorPorPeriodo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:interesDevengadoPorPeriodo">
                                <rt:interesDevengadoPorPeriodo><xsl:value-of select="nmp:Contabilidad/nmp:interesDevengadoPorPeriodo"/></rt:interesDevengadoPorPeriodo>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:fechaDecremento">
                                <rt:fechaDecremento><xsl:value-of select="nmp:Contabilidad/nmp:fechaDecremento"/></rt:fechaDecremento>
                            </xsl:if>
                            <xsl:if test="nmp:Contabilidad/nmp:saldoFavor">
                                <rt:saldoFavor><xsl:value-of select="nmp:Contabilidad/nmp:saldoFavor"/></rt:saldoFavor>
                            </xsl:if>
                        </rt:partidasList>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                       
                    </xsl:otherwise>
                    
                </xsl:choose>
              
                </xsl:for-each>
                
            </ries:transaccion>
        </ries:orquestadorAnalisisRequest>
    </xsl:template>
</xsl:stylesheet>