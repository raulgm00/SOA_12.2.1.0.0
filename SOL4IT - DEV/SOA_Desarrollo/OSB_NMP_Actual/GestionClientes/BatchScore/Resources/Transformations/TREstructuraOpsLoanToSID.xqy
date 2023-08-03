xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
(:: import schema at "../Schemas/OSBDbEventPrendarioTypeToSidXSD.xsd" ::)
declare namespace dvm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPTipoOperacion";
(:: import schema at "../Schemas/OSBTipoOperacionBatchPrendarioXSD.xsd" ::)
declare namespace src="http://servicios.montedepiedad.com.mx/NMP/Services/BatchScore";
(:: import schema at "../Schemas/OSBBatchPrendarioSvcXSD.xsd" ::)

declare namespace fnc="http://www.w3.org/2005/xquery-local-functions";

declare variable $dvmTipoOperacion as element() (:: schema-element(dvm:dvm) ::) external;
declare variable $operaciones as element() (:: schema-element(src:TaDetalleOperacionCollection) ::) external;


declare function fnc:generarEventosLoanToSID($dvmTipoOperacion as element() (:: schema-element(dvm:dvm) ::), 
                                             $operaciones as element() (:: schema-element(src:TaDetalleOperacionCollection) ::)) 
                                             as element() (:: schema-element(nmp:BatchScoreEventsDB) ::) {
    <nmp:BatchScoreEventsDB>
    {
      for $operacion in $operaciones/src:TaDetalleOperacion
      where $dvmTipoOperacion/dvm:rows/dvm:row[dvm:cell[2]=$operacion/src:tipoOperacion]/dvm:cell[4] = "1" 
         or $dvmTipoOperacion/dvm:rows/dvm:row[dvm:cell[2]=$operacion/src:tipoOperacion]/dvm:cell[4] = "2" 
      return
            <nmp:updatePrestamoRequest>
              <nmp:idCliente>0</nmp:idCliente>
              {
              if(empty($operacion/src:fechaOperacion/text())) then ()
              else <nmp:fechaOperacion>{ $operacion/src:fechaOperacion/text() }</nmp:fechaOperacion>
              }
              {	
              if(empty( $operacion/src:idSucursal/text())) then ()
              else <nmp:idSucursal>{ $operacion/src:idSucursal/text() }</nmp:idSucursal>
              }
              {
              if ($operacion/src:tipoOperacion = "AO") then <nmp:esCancelacion>true</nmp:esCancelacion>
              else  <nmp:esCancelacion>false</nmp:esCancelacion>
              }
              <nmp:ListaOperaciones>
                  <nmp:Operacion>
                    <nmp:Prestamo>
                    {
                            if(empty($operacion/src:folioPartida/text())) then () 
                            else <nmp:folioPartida>{ $operacion/src:folioPartida/text() }</nmp:folioPartida>
                    }
                    {
                            if(empty($operacion/src:idClientePrenda/text())) then () 
                            else <nmp:idClientePrenda>{ $operacion/src:idClientePrenda/text() }</nmp:idClientePrenda>
                    }
                    {
                            if(empty($operacion/src:cveValuador/text())) then () 
                            else <nmp:cveValuador>{ $operacion/src:cveValuador/text() }</nmp:cveValuador>
                    }
                    {
                            if(empty($operacion/src:fechaComercializacion/text())) then () 
                            else <nmp:fechaComercializacion>{ $operacion/src:fechaComercializacion/text() }</nmp:fechaComercializacion>
                    }
                    <nmp:ramo>{ $operacion/src:ramo/text() }</nmp:ramo>
                    <nmp:subramo>{ $operacion/src:subramo/text() }</nmp:subramo>
                    <nmp:valorOperacion>{ $operacion/src:importeOperacion/text() }</nmp:valorOperacion>
                    <nmp:tipoOperacion>{ $operacion/src:tipoOperacion/text() }</nmp:tipoOperacion>
                    {
                            if(empty($operacion/src:existenciaAlmoneda/text())) then () 
                            else <nmp:existenciaAlMoneda>{ $operacion/src:existenciaAlmoneda/text() }</nmp:existenciaAlMoneda>
                    }
                    {
                            if(empty($operacion/src:montoAvaluo/text())) then () 
                            else <nmp:montoAvaluo>{ $operacion/src:montoAvaluo/text() }</nmp:montoAvaluo>
                    }
                    {
                            if(empty($operacion/src:montoPrestamo/text())) then <nmp:montoPrestamo>0</nmp:montoPrestamo>
                            else <nmp:montoPrestamo>{ $operacion/src:montoPrestamo/text() }</nmp:montoPrestamo>
                    }
                    {
                            if(empty($operacion/src:caracteristica1/text())) then () 
                            else <nmp:caracteristica1>{ $operacion/src:caracteristica1/text() }</nmp:caracteristica1>
                    }
                    {
                            if(empty($operacion/src:caracteristica2/text())) then () 
                            else <nmp:caracteristica2>{ $operacion/src:caracteristica2/text() }</nmp:caracteristica2>
                    }
                    {
                            if(empty($operacion/src:caracteristica3/text())) then () 
                            else <nmp:caracteristica3>{ $operacion/src:caracteristica3/text() }</nmp:caracteristica3>
                    }
                    {
                            if(empty($operacion/src:producto/text())) then () 
                            else <nmp:producto>{ $operacion/src:producto/text() }</nmp:producto>
                    }
                    </nmp:Prestamo>
                    <nmp:Contabilidad>
                    {
                            if(empty($operacion/src:esquemaCobro/text())) then () 
                            else <nmp:esquemaCobro>{ $operacion/src:esquemaCobro/text() }</nmp:esquemaCobro>
                    }
                    {
                            if(empty($operacion/src:idSucursalPartida/text())) then () 
                            else <nmp:idSucursalPartida>{ $operacion/src:idSucursalPartida/text() }</nmp:idSucursalPartida>
                    }
                    {
                            if(empty($operacion/src:interesAlmoneda/text())) then () 
                            else <nmp:interesAlmoneda>{ $operacion/src:interesAlmoneda/text() }</nmp:interesAlmoneda>
                    }
                    {
                            if(empty($operacion/src:comisionAlmacenaje/text())) then () 
                            else <nmp:comisionAlmacenaje>{ $operacion/src:comisionAlmacenaje/text() }</nmp:comisionAlmacenaje>
                    }
                    {
                            if(empty($operacion/src:comisionComercializacion/text())) then () 
                            else <nmp:comisionComercializacion>{ $operacion/src:comisionComercializacion/text() }</nmp:comisionComercializacion>
                    }
                    {
                            if(empty($operacion/src:comsionDesempenioExtemporaneo/text())) then () 
                            else <nmp:comisionDesempenioExtemporaneo>{ $operacion/src:comsionDesempenioExtemporaneo/text() }</nmp:comisionDesempenioExtemporaneo>
                    }
                    {
                            if(empty($operacion/src:interesDeposito/text())) then () 
                            else <nmp:interesDeposito>{ $operacion/src:interesDeposito/text() }</nmp:interesDeposito>
                    }
                    {
                            if(empty($operacion/src:interesDepositoCancelado/text())) then () 
                            else <nmp:interesDepositoCancelado>{ $operacion/src:interesDepositoCancelado/text() }</nmp:interesDepositoCancelado>
                    }
                    {
                            if(empty($operacion/src:interesDevengadoAnteriorPorPeriodo/text())) then () 
                            else <nmp:interesDevengadoAnteriorPorPeriodo>{ $operacion/src:interesDevengadoAnteriorPorPeriodo/text() }</nmp:interesDevengadoAnteriorPorPeriodo>
                    }
                    {
                            if(empty($operacion/src:interesDevengadoPorPeriodo/text())) then () 
                            else <nmp:interesDevengadoPorPeriodo>{ $operacion/src:interesDevengadoPorPeriodo/text() }</nmp:interesDevengadoPorPeriodo>
                    }
                    {
                            if(empty($operacion/src:fechaDecremento/text())) then () 
                            else <nmp:fechaDecremento>{ $operacion/src:fechaDecremento/text() }</nmp:fechaDecremento>
                    }
                    {
                            if(empty($operacion/src:iva/text())) then () 
                            else <nmp:iva>{ $operacion/src:iva/text() }</nmp:iva>
                    }
                    {
                            if(empty($operacion/src:saldoInsoluto/text())) then () 
                            else <nmp:saldoInsoluto>{ $operacion/src:saldoInsoluto/text() }</nmp:saldoInsoluto>
                    }
                    {
                            if(empty($operacion/src:precioVenta/text())) then () 
                            else <nmp:precioVenta>{ $operacion/src:precioVenta/text() }</nmp:precioVenta>
                    }
                    {
                            if(empty($operacion/src:montoAvaluoComercial/text())) then () 
                            else <nmp:montoAvaluoComercial>{ $operacion/src:montoAvaluoComercial/text() }</nmp:montoAvaluoComercial>
                    }
                    {
                            if(empty($operacion/src:idSucursalIngreso/text())) then () 
                            else <nmp:idSucursalIngreso>{ $operacion/src:idSucursalIngreso/text() }</nmp:idSucursalIngreso>
                    }
                    {
                            if(empty($operacion/src:amortizacion/text())) then () 
                            else <nmp:amortizacion>{ $operacion/src:amortizacion/text() }</nmp:amortizacion>
                    }
                    </nmp:Contabilidad>
                  </nmp:Operacion>
              </nmp:ListaOperaciones>
            </nmp:updatePrestamoRequest>
    }
    </nmp:BatchScoreEventsDB>
};

fnc:generarEventosLoanToSID($dvmTipoOperacion, $operaciones)