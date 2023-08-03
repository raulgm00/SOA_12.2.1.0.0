xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$updatePrestamoRequest" element="ns1:updatePrestamoRequest" location="../Schemas/PrestamoSvcXSD.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$operacion" type="ns1:updatePrestamoRequest/ns1:ListaOperaciones/ns1:Operacion" location="../Schemas/PrestamoSvcXSD.xsd" ::)
(:: pragma bea:global-element-return element="ns0:SetOperacionCliente" location="../Schemas/OSBPrestamoCRM0XSD.xsd" ::)

declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/CanonicalModel";
declare namespace xf = "http://servicios.montedepiedad.com.mx/NMP/Integracion/Prestamo/Resources/XQ/EachOperationCRMXQ/";

declare function xf:EachOperationCRMXQ($updatePrestamoRequest as element(ns1:updatePrestamoRequest),
    $operacion as element())
    as element(ns0:SetOperacionCliente) {
        <ns0:SetOperacionCliente>
            <ns0:loan>
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:caracteristica1))) then
                    <ns0:Caracteristica>{ data($operacion/ns1:Prestamo/ns1:caracteristica1) }</ns0:Caracteristica>
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:caracteristica2))) then
                    <ns0:Caracteristica2>{ data($operacion/ns1:Prestamo/ns1:caracteristica2) }</ns0:Caracteristica2>
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:caracteristica3))) then
                    <ns0:Caracteristica3>{ data($operacion/ns1:Prestamo/ns1:caracteristica3) }</ns0:Caracteristica3>
            else ()
            }
            {
            if (exists(data($updatePrestamoRequest/ns1:fechaOperacion))) then
                    <ns0:Fecha>{ fn-bea:remove-timezone-from-dateTime(data($updatePrestamoRequest/ns1:fechaOperacion)) }</ns0:Fecha>
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:fechaComercializacion))) then 				
                    <ns0:FechaVencimiento>{ xs:dateTime(concat(fn:substring($operacion/ns1:Prestamo/ns1:fechaComercializacion,1,10),'T',fn-bea:remove-timezone-from-time(fn:current-time()))) }</ns0:FechaVencimiento>					
            else ()
            }
            <ns0:Hash></ns0:Hash>
            {
            if (exists(data($updatePrestamoRequest/ns1:guidCampania))) then
                    <ns0:IdCampana>{ data($updatePrestamoRequest/ns1:guidCampania) }</ns0:IdCampana>
            else ()
            }
            {
            if (exists(data($updatePrestamoRequest/ns1:guidCanalOrigen))) then
                    <ns0:IdCanalNMP>{ data($updatePrestamoRequest/ns1:guidCanalOrigen) }</ns0:IdCanalNMP>
            else ()
            }
            {
            if(exists(data($operacion/ns1:Prestamo/ns1:idClientePrenda))) then
                    <ns0:IdCliente>{ data($operacion/ns1:Prestamo/ns1:idClientePrenda) }</ns0:IdCliente>
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:DatosRechazo/ns1:idMotivo))) then 
                    <ns0:IdRazonRechazo>{ data($operacion/ns1:Prestamo/ns1:DatosRechazo/ns1:idMotivo) }</ns0:IdRazonRechazo>
            else ()
            }
            {
            if (exists(data($updatePrestamoRequest/ns1:idSucursal))) then
                    <ns0:IdSucursal>{ data($updatePrestamoRequest/ns1:idSucursal) }</ns0:IdSucursal>
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:valorOperacion))) then
                    <ns0:ImportePrestamoRechazado>{ data($operacion/ns1:Prestamo/ns1:valorOperacion) }</ns0:ImportePrestamoRechazado>
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:montoAvaluo))) then
                <ns0:MontoAvaluo>{ data($operacion/ns1:Prestamo/ns1:montoAvaluo) }</ns0:MontoAvaluo>
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:DatosRechazo/ns1:idMotivo))) then
                    <ns0:OtraRazonRechazo>{ data($operacion/ns1:Prestamo/ns1:DatosRechazo/ns1:motivo) }</ns0:OtraRazonRechazo>
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:folioPartida))) then
                    <ns0:Partida>{ data($operacion/ns1:Prestamo/ns1:folioPartida) }</ns0:Partida>
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:ramo))) then 
                    <ns0:Ramo>{ data($operacion/ns1:Prestamo/ns1:ramo) }</ns0:Ramo>
            else ()
            }
            {
            if((exists($updatePrestamoRequest/ns1:esReempeno) = true()) and ((data($updatePrestamoRequest/ns1:esReempeno)) = true())) then
                    if (exists(data($operacion/ns1:Contabilidad/ns1:saldoFavor))) then 
                            <ns0:SaldoFavor>{ data($operacion/ns1:Contabilidad/ns1:saldoFavor) }</ns0:SaldoFavor>
                    else ()
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:subramo))) then
                    <ns0:SubRamo>{ data($operacion/ns1:Prestamo/ns1:subramo) }</ns0:SubRamo>
            else ()
            }
            <ns0:TipoOperacion>0</ns0:TipoOperacion>
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:valorOperacion))) then
                    <ns0:ValorOperacion>{ data($operacion/ns1:Prestamo/ns1:valorOperacion) }</ns0:ValorOperacion>
            else ()
            }
            {
            if (exists(data($operacion/ns1:Prestamo/ns1:cveValuador))) then
                <ns0:Valuador>{ data($operacion/ns1:Prestamo/ns1:cveValuador) }</ns0:Valuador>
            else ()
            }
            {
            if (exists(data($updatePrestamoRequest/ns1:esCancelacion))) then
                <ns0:esCancelacion>{ data($updatePrestamoRequest/ns1:esCancelacion) }</ns0:esCancelacion>
            else ()
            }
            </ns0:loan>
        </ns0:SetOperacionCliente>
};

declare variable $updatePrestamoRequest as element(ns1:updatePrestamoRequest) external;
declare variable $operacion as element() external;

xf:EachOperationCRMXQ($updatePrestamoRequest, $operacion)