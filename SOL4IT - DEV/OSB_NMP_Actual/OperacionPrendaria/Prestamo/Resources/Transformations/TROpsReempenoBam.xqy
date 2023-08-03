xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$reempeno" element="ns0:updatePrestamoRequest" location="../Schemas/PrestamoSvcXSD.xsd" ::)
(:: pragma bea:global-element-return element="ns0:updatePrestamoRequest" location="../Schemas/PrestamoSvcXSD.xsd" ::)

declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Prestamo/Resources/XQ/ConvertirOpReempenoBAMXQ/";

(:Eliminar este artefacto cuando se de de baja BAM 11g:)
declare function xf:ConvertirOpReempenoBAMXQ($reempeno as element(ns0:updatePrestamoRequest))
    as element(ns0:updatePrestamoRequest) {
        <ns0:updatePrestamoRequest>
            <ns0:idCliente>{ data($reempeno/ns0:idCliente) }</ns0:idCliente>
            <ns0:fechaOperacion>{ data($reempeno/ns0:fechaOperacion) }</ns0:fechaOperacion>
            <ns0:idSucursal>{ data($reempeno/ns0:idSucursal) }</ns0:idSucursal>
            {
                for $esCancelacion in $reempeno/ns0:esCancelacion
                return
                    <ns0:esCancelacion>{ data($esCancelacion) }</ns0:esCancelacion>
            }
            {
                for $esReempeno in $reempeno/ns0:esReempeno
                return
                    <ns0:esReempeno>{ data($esReempeno) }</ns0:esReempeno>
            }
            <ns0:ListaOperaciones>
                {
                    for $Operacion in $reempeno/ns0:ListaOperaciones/ns0:Operacion
                    return
                        <ns0:Operacion>
                          <ns0:Prestamo>
                            {
                                for $folioPartida in $Operacion/ns0:Prestamo/ns0:folioPartida
                                return
                                    <ns0:folioPartida>{ data($folioPartida) }</ns0:folioPartida>
                            }
                            {
                                for $idClientePrenda in $Operacion/ns0:Prestamo/ns0:idClientePrenda
                                return
                                    <ns0:idClientePrenda>{ data($idClientePrenda) }</ns0:idClientePrenda>
                            }
                            {
                                for $cveValuador in $Operacion/ns0:Prestamo/ns0:cveValuador
                                return
                                    <ns0:cveValuador>{ data($cveValuador) }</ns0:cveValuador>
                            }
                            {
                                for $fechaComercializacion in $Operacion/ns0:Prestamo/ns0:fechaComercializacion
                                return
                                    <ns0:fechaComercializacion>{ data($fechaComercializacion) }</ns0:fechaComercializacion>
                            }
                            <ns0:ramo>{ data($Operacion/ns0:Prestamo/ns0:ramo) }</ns0:ramo>
                            <ns0:subramo>{ data($Operacion/ns0:Prestamo/ns0:subramo) }</ns0:subramo>
                            <ns0:valorOperacion>{ data($Operacion/ns0:Prestamo/ns0:valorOperacion) }</ns0:valorOperacion>                            
                            (::tipoOperacion == DS -> DSR::)
                            (::tipoOperacion == VB -> VBR::)
                            (::tipoOperacion == AO -> RE::)
                            (::tipoOperacion == PP -> RE::)
                            (::tipoOperacion == PP -> RE::)
                            (::tipoOperacion == PSF -> PSF::)
                            {
                            	if($Operacion/ns0:Prestamo/ns0:tipoOperacion = "DS") then
                            		<ns0:tipoOperacion>DSR</ns0:tipoOperacion>
                            	else if($Operacion/ns0:Prestamo/ns0:tipoOperacion = "VB") then
                            		<ns0:tipoOperacion>VBR</ns0:tipoOperacion>
                            	else if($Operacion/ns0:Prestamo/ns0:tipoOperacion = "AO" or $Operacion/ns0:Prestamo/ns0:tipoOperacion = "PP") then
                            		<ns0:tipoOperacion>RE</ns0:tipoOperacion>
                            	else <ns0:tipoOperacion>{ data($Operacion/ns0:Prestamo/ns0:tipoOperacion) }</ns0:tipoOperacion>
                            }
                            {
                                for $existenciaAlMoneda in $Operacion/ns0:Prestamo/ns0:existenciaAlMoneda
                                return
                                    <ns0:existenciaAlMoneda>{ data($existenciaAlMoneda) }</ns0:existenciaAlMoneda>
                            }
                            {
                                for $montoAvaluo in $Operacion/ns0:Prestamo/ns0:montoAvaluo
                                return
                                    <ns0:montoAvaluo>{ data($montoAvaluo) }</ns0:montoAvaluo>
                            }
                            <ns0:montoPrestamo>{ data($Operacion/ns0:Prestamo/ns0:montoPrestamo) }</ns0:montoPrestamo>
                            {
                                for $caracteristica1 in $Operacion/ns0:Prestamo/ns0:caracteristica1
                                return
                                    <ns0:caracteristica1>{ data($caracteristica1) }</ns0:caracteristica1>
                            }
                            {
                                for $caracteristica2 in $Operacion/ns0:Prestamo/ns0:caracteristica2
                                return
                                    <ns0:caracteristica2>{ data($caracteristica2) }</ns0:caracteristica2>
                            }
                            {
                                for $caracteristica3 in $Operacion/ns0:Prestamo/ns0:caracteristica3
                                return
                                    <ns0:caracteristica3>{ data($caracteristica3) }</ns0:caracteristica3>
                            }
                            {
                                for $tipoProducto in $Operacion/ns0:Prestamo/ns0:tipoProducto
                                return
                                    <ns0:tipoProducto>{ data($tipoProducto) }</ns0:tipoProducto>
                            }
                            {
                                for $DatosRechazo in $Operacion/ns0:Prestamo/ns0:DatosRechazo
                                return
                                    <ns0:DatosRechazo>{ $DatosRechazo/@* , $DatosRechazo/node() }</ns0:DatosRechazo>
                            }
                            </ns0:Prestamo>
                        </ns0:Operacion>
                }
            </ns0:ListaOperaciones>
        </ns0:updatePrestamoRequest>
};

declare variable $reempeno as element(ns0:updatePrestamoRequest) external;

xf:ConvertirOpReempenoBAMXQ($reempeno)