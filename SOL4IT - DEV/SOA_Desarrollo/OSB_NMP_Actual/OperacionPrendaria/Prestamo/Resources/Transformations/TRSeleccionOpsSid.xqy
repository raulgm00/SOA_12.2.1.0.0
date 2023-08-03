xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$updatePrestamoRequest" element="ns1:updatePrestamoRequest" location="../Schemas/PrestamoSvcXSD.xsd" ::)
(:: pragma parameter="$dvmTipoOperacion" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns2:updatePrestamoRequest" location="../Schemas/PrestamoSvcXSD.xsd" ::)

declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace ns2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Prestamo/Resources/XQ/SeleccionOperacionesSID/";

declare function xf:SeleccionOperacionesSID($updatePrestamoRequest as element(ns1:updatePrestamoRequest), $dvmTipoOperacion as element(*))
    as element(ns2:updatePrestamoRequest) {
        <ns2:updatePrestamoRequest>
        {
        if (exists(data($updatePrestamoRequest/ns1:idCliente))) then
                if (empty($updatePrestamoRequest/ns1:idCliente/text())) then ()
                else <ns2:idCliente>{ data($updatePrestamoRequest/ns1:idCliente) }</ns2:idCliente>
        else ()
        }
        {
        if (exists(data($updatePrestamoRequest/ns1:fechaOperacion))) then
            if (empty($updatePrestamoRequest/ns1:fechaOperacion/text())) then ()
            else <ns2:fechaOperacion>{ data($updatePrestamoRequest/ns1:fechaOperacion) }</ns2:fechaOperacion>
        else ()
        }
        {
        if (exists(data($updatePrestamoRequest/ns1:idSucursal))) then
            if (empty($updatePrestamoRequest/ns1:idSucursal/text())) then ()
            else <ns2:idSucursal>{ data($updatePrestamoRequest/ns1:idSucursal) }</ns2:idSucursal>
        else ()
        }
        {
        if (exists(data($updatePrestamoRequest/ns1:esCancelacion))) then 
            if (empty($updatePrestamoRequest/ns1:esCancelacion/text())) then ()
            else <ns2:esCancelacion>{ data($updatePrestamoRequest/ns1:esCancelacion) }</ns2:esCancelacion>
        else ()
        }
        <ns2:ListaOperaciones>
        {
        for $Operacion in $updatePrestamoRequest/ns1:ListaOperaciones/ns1:Operacion
        where $dvmTipoOperacion/*:rows/*:row[*:cell[2]=$Operacion/ns1:Prestamo/ns1:tipoOperacion]/*:cell[4] = "2" 
         or $dvmTipoOperacion/*:rows/*:row[*:cell[2]=$Operacion/ns1:Prestamo/ns1:tipoOperacion]/*:cell[4] = "3"
         or $dvmTipoOperacion/*:rows/*:row[*:cell[2]=$Operacion/ns1:Prestamo/ns1:tipoOperacion]/*:cell[4] = "5"
        return
                <ns2:Operacion>
                  <ns2:Prestamo>
                  {
                  if (exists(data($Operacion/ns1:Prestamo/ns1:folioPartida))) then
                    if(empty($Operacion/ns1:Prestamo/ns1:folioPartida/text())) then ()
                    else <ns2:folioPartida>{ data($Operacion/ns1:Prestamo/ns1:folioPartida) }</ns2:folioPartida>					
                  else ()
                  }
                  {
                  if (exists(data($Operacion/ns1:Prestamo/ns1:idClientePrenda))) then 				
                    if(empty($Operacion/ns1:Prestamo/ns1:idClientePrenda/text())) then ()
                    else <ns2:idClientePrenda>{ data($Operacion/ns1:Prestamo/ns1:idClientePrenda) }</ns2:idClientePrenda>					
                  else ()
                  }                         
                  {
                  if (exists(data($Operacion/ns1:Prestamo/ns1:cveValuador))) then 				
                    if(empty($Operacion/ns1:Prestamo/ns1:cveValuador/text())) then ()
                    else <ns2:cveValuador>{ data($Operacion/ns1:Prestamo/ns1:cveValuador) }</ns2:cveValuador>					
                  else ()
                  }
                  {
                  if (exists(data($Operacion/ns1:Prestamo/ns1:fechaComercializacion))) then 				
                    if(empty($Operacion/ns1:Prestamo/ns1:fechaComercializacion/text())) then () 
                    else <ns2:fechaComercializacion>{ data($Operacion/ns1:Prestamo/ns1:fechaComercializacion) }</ns2:fechaComercializacion>					
                  else ()
                  }
                  {                                                                                      
                  if(exists(data($Operacion/ns1:Prestamo/ns1:ramo))) then
                    if(empty($Operacion/ns1:Prestamo/ns1:ramo/text())) then () 
                    else <ns2:ramo>{ data($Operacion/ns1:Prestamo/ns1:ramo) }</ns2:ramo>
                  else ()
                  }
                  {
                  if(exists(data($Operacion/ns1:Prestamo/ns1:subramo))) then
                    if(empty($Operacion/ns1:Prestamo/ns1:subramo/text())) then () 
                    else <ns2:subramo>{ data($Operacion/ns1:Prestamo/ns1:subramo) }</ns2:subramo>
                  else ()
                  }
                  {
                  if(exists(data($Operacion/ns1:Prestamo/ns1:valorOperacion))) then
                    if(empty($Operacion/ns1:Prestamo/ns1:valorOperacion/text())) then () 
                    else <ns2:valorOperacion>{ data($Operacion/ns1:Prestamo/ns1:valorOperacion) }</ns2:valorOperacion>
                  else ()
                  }
                  {
                  if(exists(data($Operacion/ns1:Prestamo/ns1:tipoOperacion))) then
                    if(empty($Operacion/ns1:Prestamo/ns1:tipoOperacion/text())) then () 
                    else <ns2:tipoOperacion>{ data($Operacion/ns1:Prestamo/ns1:tipoOperacion) }</ns2:tipoOperacion>
                  else ()
                  }
                  {
                  if (exists(data($Operacion/ns1:Prestamo/ns1:existenciaAlMoneda))) then 				
                    if(empty($Operacion/ns1:Prestamo/ns1:existenciaAlMoneda/text())) then () 
                    else <ns2:existenciaAlMoneda>{ data($Operacion/ns1:Prestamo/ns1:existenciaAlMoneda) }</ns2:existenciaAlMoneda>					
                  else ()
                  }
                  {
                  if (exists(data($Operacion/ns1:Prestamo/ns1:montoAvaluo))) then 				
                    if(empty($Operacion/ns1:Prestamo/ns1:montoAvaluo/text())) then () 
                    else <ns2:montoAvaluo>{ data($Operacion/ns1:Prestamo/ns1:montoAvaluo) }</ns2:montoAvaluo>					
                  else ()
                  }                                                  
                  {
                  if (exists(data($Operacion/ns1:Prestamo/ns1:montoPrestamo))) then
                    if(empty($Operacion/ns1:Prestamo/ns1:montoPrestamo/text())) then () 
                    else <ns2:montoPrestamo>{ data($Operacion/ns1:Prestamo/ns1:montoPrestamo) }</ns2:montoPrestamo>
                  else ()
                  }
                  {
                  if (exists(data($Operacion/ns1:Prestamo/ns1:caracteristica1))) then 				
                     if(empty($Operacion/ns1:Prestamo/ns1:caracteristica1/text())) then () 
                     else <ns2:caracteristica1>{ data($Operacion/ns1:Prestamo/ns1:caracteristica1) }</ns2:caracteristica1>					
                  else ()
                  } 
                  {
                  if (exists(data($Operacion/ns1:Prestamo/ns1:caracteristica2))) then 				
                     if(empty($Operacion/ns1:Prestamo/ns1:caracteristica2/text())) then () 
                     else <ns2:caracteristica2>{ data($Operacion/ns1:Prestamo/ns1:caracteristica2) }</ns2:caracteristica2>					
                  else ()
                  } 
                  {
                  if (exists(data($Operacion/ns1:Prestamo/ns1:caracteristica3))) then 				
                     if(empty($Operacion/ns1:Prestamo/ns1:caracteristica3/text())) then () 
                     else <ns2:caracteristica3>{ data($Operacion/ns1:Prestamo/ns1:caracteristica3) }</ns2:caracteristica3>					
                  else ()
                  }  
                  { 
                  if(exists(data($Operacion/ns1:Prestamo/ns1:producto))) then
                    if(empty($Operacion/ns1:Prestamo/ns1:producto/text())) then () 
                    else <ns2:producto>{ data($Operacion/ns1:Prestamo/ns1:producto) }</ns2:producto> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Prestamo/ns1:canalIngreso))) then
                    if(empty($Operacion/ns1:Prestamo/ns1:canalIngreso/text())) then ()
                    else <ns2:canalIngreso>{ data($Operacion/ns1:Prestamo/ns1:canalIngreso) }</ns2:canalIngreso> 
                  else ()
                  }
                  </ns2:Prestamo>
                  <ns2:Contabilidad>
                  {
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:esquemaCobro))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:esquemaCobro/text())) then () 
                          else <ns2:esquemaCobro>{ data($Operacion/ns1:Contabilidad/ns1:esquemaCobro) }</ns2:esquemaCobro> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:idSucursalPartida))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:idSucursalPartida/text())) then () 
                          else <ns2:idSucursalPartida>{ data($Operacion/ns1:Contabilidad/ns1:idSucursalPartida) }</ns2:idSucursalPartida> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:interesAlmoneda))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:interesAlmoneda/text())) then () 
                          else <ns2:interesAlmoneda>{ data($Operacion/ns1:Contabilidad/ns1:interesAlmoneda) }</ns2:interesAlmoneda> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:comisionAlmacenaje))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:comisionAlmacenaje/text())) then () 
                          else <ns2:comisionAlmacenaje>{ data($Operacion/ns1:Contabilidad/ns1:comisionAlmacenaje) }</ns2:comisionAlmacenaje> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:comisionComercializacion))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:comisionComercializacion/text())) then () 
                          else <ns2:comisionComercializacion>{ data($Operacion/ns1:Contabilidad/ns1:comisionComercializacion) }</ns2:comisionComercializacion> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:comisionDesempenioExtemporaneo))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:comisionDesempenioExtemporaneo/text())) then () 
                          else <ns2:comisionDesempenioExtemporaneo>{ data($Operacion/ns1:Contabilidad/ns1:comisionDesempenioExtemporaneo) }</ns2:comisionDesempenioExtemporaneo> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:interesDeposito))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:interesDeposito/text())) then () 
                          else <ns2:interesDeposito>{ data($Operacion/ns1:Contabilidad/ns1:interesDeposito) }</ns2:interesDeposito> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:interesDepositoCancelado))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:interesDepositoCancelado/text())) then () 
                          else <ns2:interesDepositoCancelado>{ data($Operacion/ns1:Contabilidad/ns1:interesDepositoCancelado) }</ns2:interesDepositoCancelado> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:interesDevengadoAnteriorPorPeriodo))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:interesDevengadoAnteriorPorPeriodo/text())) then () 
                          else <ns2:interesDevengadoAnteriorPorPeriodo>{ data($Operacion/ns1:Contabilidad/ns1:interesDevengadoAnteriorPorPeriodo) }</ns2:interesDevengadoAnteriorPorPeriodo> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:interesDevengadoPorPeriodo))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:interesDevengadoPorPeriodo/text())) then () 
                          else <ns2:interesDevengadoPorPeriodo>{ data($Operacion/ns1:Contabilidad/ns1:interesDevengadoPorPeriodo) }</ns2:interesDevengadoPorPeriodo> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:fechaDecremento))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:fechaDecremento/text())) then () 
                          else <ns2:fechaDecremento>{ data($Operacion/ns1:Contabilidad/ns1:fechaDecremento) }</ns2:fechaDecremento> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:iva))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:iva/text())) then () 
                          else <ns2:iva>{ data($Operacion/ns1:Contabilidad/ns1:iva) }</ns2:iva> 
                  else ()
                  }
                  { 
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:saldoInsoluto))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:saldoInsoluto/text())) then () 
                          else <ns2:saldoInsoluto>{ data($Operacion/ns1:Contabilidad/ns1:saldoInsoluto) }</ns2:saldoInsoluto> 
                  else ()
                  }
                  {
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:precioVenta))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:precioVenta/text())) then () 
                          else <ns2:precioVenta>{ data($Operacion/ns1:Contabilidad/ns1:precioVenta) }</ns2:precioVenta> 
                  else ()
                  }
                  {
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:montoAvaluoComercial))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:montoAvaluoComercial/text())) then () 
                          else <ns2:montoAvaluoComercial>{ data($Operacion/ns1:Contabilidad/ns1:montoAvaluoComercial) }</ns2:montoAvaluoComercial> 
                  else ()
                  }
                  {
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:idSucursalIngreso))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:idSucursalIngreso/text())) then () 
                          else <ns2:idSucursalIngreso>{ data($Operacion/ns1:Contabilidad/ns1:idSucursalIngreso) }</ns2:idSucursalIngreso> 
                  else ()
                  }
                  {
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:amortizacion))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:amortizacion/text())) then () 
                          else <ns2:amortizacion>{ data($Operacion/ns1:Contabilidad/ns1:amortizacion) }</ns2:amortizacion> 
                  else ()
                  }
                  {
                  if(exists(data($Operacion/ns1:Contabilidad/ns1:montoDemasia))) then
                          if(empty($Operacion/ns1:Contabilidad/ns1:montoDemasia/text())) then () 
                          else <ns2:montoDemasia>{ data($Operacion/ns1:Contabilidad/ns1:montoDemasia) }</ns2:montoDemasia> 
                  else ()
                  }
                  </ns2:Contabilidad>
                </ns2:Operacion>
                }
              </ns2:ListaOperaciones>
        </ns2:updatePrestamoRequest>
};

declare variable $updatePrestamoRequest as element(ns1:updatePrestamoRequest) external;
declare variable $dvmTipoOperacion as element(*) external;

xf:SeleccionOperacionesSID($updatePrestamoRequest, $dvmTipoOperacion)