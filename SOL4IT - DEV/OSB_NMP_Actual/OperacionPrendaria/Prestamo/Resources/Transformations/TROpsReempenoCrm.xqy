xquery version "2004-draft";
(:: pragma bea:local-element-parameter parameter="$reempeno" type="ns0:updatePrestamoRequest/ns0:ListaOperaciones/ns0:Operacion" location="../Schemas/PrestamoSvcXSD.xsd" ::)
(:: pragma bea:local-element-return type="ns0:updatePrestamoRequest/ns0:ListaOperaciones/ns0:Operacion" location="../Schemas/PrestamoSvcXSD.xsd" ::)

declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Prestamo/Resources/XQ/TransformarOperacionReempenoXQ/";

declare function xf:TransformarOperacionReempenoXQ($reempeno as element())
    as element() {
        <ns0:Operacion>
          <ns0:Prestamo>
          {
          for $folioPartida in $reempeno/ns0:Prestamo/ns0:folioPartida
          return
              <ns0:folioPartida>{ data($folioPartida) }</ns0:folioPartida>
          }
          {
          for $idClientePrenda in $reempeno/ns0:Prestamo/ns0:idClientePrenda
          return
              <ns0:idClientePrenda>{ data($idClientePrenda) }</ns0:idClientePrenda>
          }
          {
          for $cveValuador in $reempeno/ns0:Prestamo/ns0:cveValuador
          return
              <ns0:cveValuador>{ data($cveValuador) }</ns0:cveValuador>
          }
          {
          for $fechaComercializacion in $reempeno/ns0:Prestamo/ns0:fechaComercializacion
          return
              <ns0:fechaComercializacion>{ data($fechaComercializacion) }</ns0:fechaComercializacion>
          }
          <ns0:ramo>{ data($reempeno/ns0:Prestamo/ns0:ramo) }</ns0:ramo>
          <ns0:subramo>{ data($reempeno/ns0:Prestamo/ns0:subramo) }</ns0:subramo>
          <ns0:valorOperacion>{ data($reempeno/ns0:Prestamo/ns0:valorOperacion) }</ns0:valorOperacion>
          (::tipoOperacion == DS -> DSR::)
          (::tipoOperacion == VB -> VBR::)
          (::tipoOperacion == AO -> RE::)
          (::tipoOperacion == PP -> RE::)
          (::tipoOperacion == PP -> RE::)
          (::tipoOperacion == PSF -> PSF::)
          {
          if($reempeno/ns0:Prestamo/ns0:tipoOperacion = "DS") then
            <ns0:tipoOperacion>DSR</ns0:tipoOperacion>
          else 
            if($reempeno/ns0:Prestamo/ns0:tipoOperacion = "VB") then
                    <ns0:tipoOperacion>VBR</ns0:tipoOperacion>
            else 
                    if($reempeno/ns0:Prestamo/ns0:tipoOperacion = "AO" or $reempeno/ns0:Prestamo/ns0:tipoOperacion = "PP") then
                      <ns0:tipoOperacion>RE</ns0:tipoOperacion>
                    else 
                      <ns0:tipoOperacion>{ data($reempeno/ns0:Prestamo/ns0:tipoOperacion) }</ns0:tipoOperacion>
          }
          {
          for $existenciaAlMoneda in $reempeno/ns0:Prestamo/ns0:existenciaAlMoneda
          return
              <ns0:existenciaAlMoneda>{ data($existenciaAlMoneda) }</ns0:existenciaAlMoneda>
          }
          {
          for $montoAvaluo in $reempeno/ns0:Prestamo/ns0:montoAvaluo
          return
              <ns0:montoAvaluo>{ data($montoAvaluo) }</ns0:montoAvaluo>
          }
          <ns0:montoPrestamo>{ data($reempeno/ns0:Prestamo/ns0:montoPrestamo) }</ns0:montoPrestamo>
          {
          for $caracteristica1 in $reempeno/ns0:Prestamo/ns0:caracteristica1
          return
              <ns0:caracteristica1>{ data($caracteristica1) }</ns0:caracteristica1>
          }
          {
          for $caracteristica2 in $reempeno/ns0:Prestamo/ns0:caracteristica2
          return
              <ns0:caracteristica2>{ data($caracteristica2) }</ns0:caracteristica2>
          }
          {
          for $caracteristica3 in $reempeno/ns0:Prestamo/ns0:caracteristica3
          return
              <ns0:caracteristica3>{ data($caracteristica3) }</ns0:caracteristica3>
          }
          {
          for $tipoProducto in $reempeno/ns0:Prestamo/ns0:tipoProducto
          return
              <ns0:tipoProducto>{ data($tipoProducto) }</ns0:tipoProducto>
          }
          {
          for $producto in $reempeno/ns0:Prestamo/ns0:producto
          return
              <ns0:producto>{ data($producto) }</ns0:producto>
          }
          {
          for $DatosRechazo in $reempeno/ns0:Prestamo/ns0:DatosRechazo
          return
              <ns0:DatosRechazo>{ $DatosRechazo/@* , $DatosRechazo/node() }</ns0:DatosRechazo>
          }
          </ns0:Prestamo>
          <ns0:Contabilidad>
          {
          for $esquemaCobro in $reempeno/ns0:Contabilidad/ns0:esquemaCobro
          return
              <ns0:esquemaCobro>{ data($esquemaCobro) }</ns0:esquemaCobro>
          }
          {
          for $idSucursalPartida in $reempeno/ns0:Contabilidad/ns0:idSucursalPartida
          return
              <ns0:idSucursalPartida>{ data($idSucursalPartida) }</ns0:idSucursalPartida>
          }
          {
          for $interesAlmoneda in $reempeno/ns0:Contabilidad/ns0:interesAlmoneda
          return
              <ns0:interesAlmoneda>{ data($interesAlmoneda) }</ns0:interesAlmoneda>
          }
          {
          for $comisionAlmacenaje in $reempeno/ns0:Contabilidad/ns0:comisionAlmacenaje
          return
              <ns0:comisionAlmacenaje>{ data($comisionAlmacenaje) }</ns0:comisionAlmacenaje>
          }
          {
          for $comisionComercializacion in $reempeno/ns0:Contabilidad/ns0:comisionComercializacion
          return
              <ns0:comisionComercializacion>{ data($comisionComercializacion) }</ns0:comisionComercializacion>
          }
          {
          for $comisionDesempenioExtemporaneo in $reempeno/ns0:Contabilidad/ns0:comisionDesempenioExtemporaneo
          return
              <ns0:comisionDesempenioExtemporaneo>{ data($comisionDesempenioExtemporaneo) }</ns0:comisionDesempenioExtemporaneo>
          }
          {
          for $interesDeposito in $reempeno/ns0:Contabilidad/ns0:interesDeposito
          return
              <ns0:interesDeposito>{ data($interesDeposito) }</ns0:interesDeposito>
          }
          {
          for $interesDepositoCancelado in $reempeno/ns0:Contabilidad/ns0:interesDepositoCancelado
          return
              <ns0:interesDepositoCancelado>{ data($interesDepositoCancelado) }</ns0:interesDepositoCancelado>
          }
          {
          for $interesDevengadoAnteriorPorPeriodo in $reempeno/ns0:Contabilidad/ns0:interesDevengadoAnteriorPorPeriodo
          return
              <ns0:interesDevengadoAnteriorPorPeriodo>{ data($interesDevengadoAnteriorPorPeriodo) }</ns0:interesDevengadoAnteriorPorPeriodo>
          }
          {
          for $interesDevengadoPorPeriodo in $reempeno/ns0:Contabilidad/ns0:interesDevengadoPorPeriodo
          return
              <ns0:interesDevengadoPorPeriodo>{ data($interesDevengadoPorPeriodo) }</ns0:interesDevengadoPorPeriodo>
            }
          {
          for $fechaDecremento in $reempeno/ns0:Contabilidad/ns0:fechaDecremento
          return
              <ns0:fechaDecremento>{ data($fechaDecremento) }</ns0:fechaDecremento>
          }
          {
          for $saldoFavor in $reempeno/ns0:Contabilidad/ns0:saldoFavor
          return
              <ns0:saldoFavor>{ data($saldoFavor) }</ns0:saldoFavor>
          }
          </ns0:Contabilidad>
        </ns0:Operacion>
};

declare variable $reempeno as element() external;

xf:TransformarOperacionReempenoXQ($reempeno)