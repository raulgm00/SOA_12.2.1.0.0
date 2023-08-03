xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
(:: import schema at "../Schemas/OSBDbEventPrendarioTypeToScoreXSD.xsd" ::)
declare namespace dvm="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPTipoOperacion";
(:: import schema at "../Schemas/OSBTipoOperacionBatchPrendarioXSD.xsd" ::)
declare namespace src="http://servicios.montedepiedad.com.mx/NMP/Services/BatchScore";
(:: import schema at "../Schemas/OSBBatchPrendarioSvcXSD.xsd" ::)

declare namespace fnc="http://www.w3.org/2005/xquery-local-functions";

declare variable $dvmTipoOperacion as element() (:: schema-element(dvm:dvm) ::) external;
declare variable $operaciones as element() (:: schema-element(src:TaDetalleOperacionCollection) ::) external;

declare function fnc:generarEventosLoanToScore($dvmTipoOperacion as element() (:: schema-element(dvm:dvm) ::), 
                                               $operaciones as element() (:: schema-element(src:TaDetalleOperacionCollection) ::)) 
                                               as element() (:: schema-element(nmp:BatchScoreEventsDB) ::) {
    <nmp:BatchScoreEventsDB>
    {
    for $idClientePrenda in distinct-values($operaciones/src:TaDetalleOperacion/src:idClientePrenda)
    return <nmp:updatePrestamoRequest>
              <nmp:idCliente>0</nmp:idCliente>
                <nmp:fechaOperacion>{$operaciones/src:TaDetalleOperacion[src:idClientePrenda = $idClientePrenda][1]/src:fechaOperacion/text()}</nmp:fechaOperacion>                            
                <nmp:esCancelacion>false</nmp:esCancelacion>        
                <nmp:ListaOperaciones>
                {
                for $operacion in $operaciones/src:TaDetalleOperacion
                where $operacion/src:idClientePrenda = $idClientePrenda
                  and $dvmTipoOperacion/dvm:rows/dvm:row[dvm:cell[2]=$operacion/src:tipoOperacion]/dvm:cell[4] = "1" 
                return <nmp:Operacion>
                          { 
                          if(empty($operacion/src:folioPartida/text())) then () 
                          else <nmp:folioPartida>{$operacion/src:folioPartida/text()}</nmp:folioPartida> 
                          }
                          { 
                          if(empty($operacion/src:idClientePrenda/text())) then () 
                          else <nmp:idClientePrenda>{$operacion/src:idClientePrenda/text()}</nmp:idClientePrenda>
                          }
                          { 
                          if(empty($operacion/src:cveValuador/text())) then () 
                          else <nmp:cveValuador>{$operacion/src:cveValuador/text()}</nmp:cveValuador>
                          }
                          { 
                          if(empty($operacion/src:fechaComercializacion/text())) then () 
                          else <nmp:fechaComercializacion>{$operacion/src:fechaComercializacion/text()}</nmp:fechaComercializacion>
                          }
                          <nmp:ramo>{$operacion/src:ramo/text()}</nmp:ramo>
                          <nmp:subramo>{$operacion/src:subramo/text()}</nmp:subramo>
                          <nmp:valorOperacion>{$operacion/src:importeOperacion/text()}</nmp:valorOperacion>
                          <nmp:tipoOperacion>{$operacion/src:tipoOperacion/text()}</nmp:tipoOperacion>
                          { 
                          if(empty($operacion/src:existenciaAlmoneda/text())) then () 
                          else <nmp:existenciaAlMoneda>{$operacion/src:existenciaAlmoneda/text()}</nmp:existenciaAlMoneda>
                          }
                          { 
                          if(empty($operacion/src:montoAvaluo/text())) then () 
                          else <nmp:montoAvaluo>{$operacion/src:montoAvaluo/text()}</nmp:montoAvaluo>
                          }
                          { 
                          if(empty($operacion/src:montoPrestamo/text())) then <nmp:montoPrestamo>0</nmp:montoPrestamo>
                          else <nmp:montoPrestamo>{$operacion/src:montoPrestamo/text()}</nmp:montoPrestamo>
                          }
                          {
                          if(empty($operacion/src:caracteristica1/text())) then ()
                          else <nmp:caracteristica1>{$operacion/src:caracteristica1/text()}</nmp:caracteristica1>
                          }
                          {
                          if(empty($operacion/src:caracteristica2/text())) then ()
                          else <nmp:caracteristica2>{$operacion/src:caracteristica2/text()}</nmp:caracteristica2>
                          }
                          {
                          if(empty($operacion/src:caracteristica3/text())) then ()
                          else <nmp:caracteristica3>{$operacion/src:caracteristica3/text()}</nmp:caracteristica3>
                          }
                        </nmp:Operacion>
                  }
                </nmp:ListaOperaciones>
           </nmp:updatePrestamoRequest>
    }
    </nmp:BatchScoreEventsDB>
};

fnc:generarEventosLoanToScore($dvmTipoOperacion, $operaciones)