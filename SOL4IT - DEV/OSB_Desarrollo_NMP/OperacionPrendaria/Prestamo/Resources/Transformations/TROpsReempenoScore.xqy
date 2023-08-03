xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$reempeno" element="ns0:updatePrestamoRequest" location="../Schemas/PrestamoSvcXSD.xsd" ::)
(:: pragma bea:global-element-return element="ns1:updatePrestamoRequest" location="../Schemas/PrestamoSvc2XSD.xsd" ::)

declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Prestamo/Resources/XQ/ConvertirOpReempenoScoringXQ/";

declare function xf:ConvertirOpReempenoScoringXQ($reempeno as element(ns0:updatePrestamoRequest))
    as element(ns1:updatePrestamoRequest) {
        <ns1:updatePrestamoRequest>
            <ns1:idCliente>{ data($reempeno/ns0:idCliente) }</ns1:idCliente>
            <ns1:fechaOperacion>{ data($reempeno/ns0:fechaOperacion) }</ns1:fechaOperacion>
            <ns1:idSucursal>{ data($reempeno/ns0:idSucursal) }</ns1:idSucursal>
            {
                for $esCancelacion in $reempeno/ns0:esCancelacion
                return
                    <ns1:esCancelacion>{ data($esCancelacion) }</ns1:esCancelacion>
            }
            <ns1:ListaOperaciones>
                {
                    for $Operacion in $reempeno/ns0:ListaOperaciones/ns0:Operacion
                    where ($reempeno/ns0:esReempeno = true() and $Operacion/ns0:Prestamo/ns0:tipoOperacion = "PP" and $Operacion/ns0:Contabilidad/ns0:saldoFavor > 0) = false()
                    return
                        <ns1:Operacion>
                            {
                                for $folioPartida in $Operacion/ns0:Prestamo/ns0:folioPartida
                                return
                                    <ns1:folioPartida>{ data($folioPartida) }</ns1:folioPartida>
                            }
                            {
                                for $idClientePrenda in $Operacion/ns0:Prestamo/ns0:idClientePrenda
                                return
                                    <ns1:idClientePrenda>{ data($idClientePrenda) }</ns1:idClientePrenda>
                            }
                            {
                                for $cveValuador in $Operacion/ns0:Prestamo/ns0:cveValuador
                                return
                                    <ns1:cveValuador>{ data($cveValuador) }</ns1:cveValuador>
                            }
                            {
                                for $fechaComercializacion in $Operacion/ns0:Prestamo/ns0:fechaComercializacion
                                return
                                    <ns1:fechaComercializacion>{ data($fechaComercializacion) }</ns1:fechaComercializacion>
                            }
                            <ns1:ramo>{ data($Operacion/ns0:Prestamo/ns0:ramo) }</ns1:ramo>
                            <ns1:subramo>{ data($Operacion/ns0:Prestamo/ns0:subramo) }</ns1:subramo>
                            <ns1:valorOperacion>{ data($Operacion/ns0:Prestamo/ns0:valorOperacion) }</ns1:valorOperacion>
                            
                            (::tipoOperacion == DS -> DS::)
                            (::tipoOperacion == VB -> VB::)
                            (::tipoOperacion == AO && esReempeno == true -> PP::)
                            (::tipoOperacion == PP && esReempeno == true -> PP::)
                            {
                            	if($Operacion/ns0:Prestamo/ns0:tipoOperacion = "AO" or $Operacion/ns0:Prestamo/ns0:tipoOperacion = "PP") then
                            		<ns1:tipoOperacion>PP</ns1:tipoOperacion>
                            	else <ns1:tipoOperacion>{ data($Operacion/ns0:Prestamo/ns0:tipoOperacion) }</ns1:tipoOperacion>
                            }
                            {
                                for $existenciaAlMoneda in $Operacion/ns0:Prestamo/ns0:existenciaAlMoneda
                                return
                                    <ns1:existenciaAlMoneda>{ data($existenciaAlMoneda) }</ns1:existenciaAlMoneda>
                            }
                            {
                                for $montoAvaluo in $Operacion/ns0:Prestamo/ns0:montoAvaluo
                                return
                                    <ns1:montoAvaluo>{ data($montoAvaluo) }</ns1:montoAvaluo>
                            }
                            <ns1:montoPrestamo>{ data($Operacion/ns0:Prestamo/ns0:montoPrestamo) }</ns1:montoPrestamo>
                            {
                                for $caracteristica1 in $Operacion/ns0:Prestamo/ns0:caracteristica1
                                return
                                    <ns1:caracteristica1>{ data($caracteristica1) }</ns1:caracteristica1>
                            }
                            {
                                for $caracteristica2 in $Operacion/ns0:Prestamo/ns0:caracteristica2
                                return
                                    <ns1:caracteristica2>{ data($caracteristica2) }</ns1:caracteristica2>
                            }
                            {
                                for $caracteristica3 in $Operacion/ns0:Prestamo/ns0:caracteristica3
                                return
                                    <ns1:caracteristica3>{ data($caracteristica3) }</ns1:caracteristica3>
                            }
                        </ns1:Operacion>
                }
            </ns1:ListaOperaciones>
        </ns1:updatePrestamoRequest>
};

declare variable $reempeno as element(ns0:updatePrestamoRequest) external;

xf:ConvertirOpReempenoScoringXQ($reempeno)