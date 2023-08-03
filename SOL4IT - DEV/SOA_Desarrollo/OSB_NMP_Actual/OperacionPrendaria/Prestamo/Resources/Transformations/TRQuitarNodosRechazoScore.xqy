xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$updatePrestamoRequest1" element="ns0:updatePrestamoRequest" location="../Schemas/PrestamoSvcXSD.xsd" ::)
(:: pragma element="ns2:updatePrestamoRequest" type="xs:anyType" ::)
(:: pragma bea:global-element-parameter parameter="$dvmTipoOperacion" element="ns1:dvm" location="../Schemas/DVMTipoOperacionXSD.xsd" ::)

declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace ns2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Prestamo/Resources/XSD/RemoverNodosRechazoXQ/";

declare function xf:RemoverNodosRechazoXQ($updatePrestamoRequest1 as element(ns0:updatePrestamoRequest), $dvmTipoOperacion as element(*))
    as element(ns2:updatePrestamoRequest) {
        <ns2:updatePrestamoRequest>
        {
        if (exists(data($updatePrestamoRequest1/ns0:idCliente))) then
          if(empty($updatePrestamoRequest1/ns0:idCliente/text())) then () 
          else <ns2:idCliente>{ data($updatePrestamoRequest1/ns0:idCliente) }</ns2:idCliente>
        else ()
        }
        { 
        if (exists(data($updatePrestamoRequest1/ns0:fechaOperacion))) then 
                if(empty($updatePrestamoRequest1/ns0:fechaOperacion/text())) then () 
                else <ns2:fechaOperacion>{ data($updatePrestamoRequest1/ns0:fechaOperacion) }</ns2:fechaOperacion>
        else ()
        }
        { 
        if (exists(data($updatePrestamoRequest1/ns0:idSucursal))) then 
                if(empty($updatePrestamoRequest1/ns0:idSucursal/text())) then () 
                else <ns2:idSucursal>{ data($updatePrestamoRequest1/ns0:idSucursal) }</ns2:idSucursal>
        else ()
        }
        {
        if (exists(data($updatePrestamoRequest1/ns0:esCancelacion))) then
                if(empty($updatePrestamoRequest1/ns0:esCancelacion/text())) then () 
                else <ns2:esCancelacion>{ data($updatePrestamoRequest1/ns0:esCancelacion) }</ns2:esCancelacion>
        else ()
        }
        <ns2:ListaOperaciones>
        {
        for $Operacion in $updatePrestamoRequest1/ns0:ListaOperaciones/ns0:Operacion
        where $dvmTipoOperacion/*:rows/*:row[*:cell[2]=$Operacion/ns0:Prestamo/ns0:tipoOperacion]/*:cell[4] = "1" 
           or $dvmTipoOperacion/*:rows/*:row[*:cell[2]=$Operacion/ns0:Prestamo/ns0:tipoOperacion]/*:cell[4] = "2"
        return
              <ns2:Operacion>
              {
              if (exists(data($Operacion/ns0:Prestamo/ns0:folioPartida))) then 				
                if(empty($Operacion/ns0:Prestamo/ns0:folioPartida/text())) then () 
                else <ns2:folioPartida>{ data($Operacion/ns0:Prestamo/ns0:folioPartida) }</ns2:folioPartida>					
              else ()
              }
              {
              if (exists(data($Operacion/ns0:Prestamo/ns0:idClientePrenda))) then 				
                if(empty($Operacion/ns0:Prestamo/ns0:idClientePrenda/text())) then () 
                else <ns2:idClientePrenda>{ data($Operacion/ns0:Prestamo/ns0:idClientePrenda) }</ns2:idClientePrenda>					
              else ()
              }                         
              {
              if (exists(data($Operacion/ns0:Prestamo/ns0:cveValuador))) then 				
                if(empty($Operacion/ns0:Prestamo/ns0:cveValuador/text())) then () 
                else <ns2:cveValuador>{ data($Operacion/ns0:Prestamo/ns0:cveValuador) }</ns2:cveValuador>					
              else ()
              }
              {
              if (exists(data($Operacion/ns0:Prestamo/ns0:fechaComercializacion))) then 				
                if(empty($Operacion/ns0:Prestamo/ns0:fechaComercializacion/text())) then () 
                else <ns2:fechaComercializacion>{ data($Operacion/ns0:Prestamo/ns0:fechaComercializacion) }</ns2:fechaComercializacion>					
              else ()
              }                                                                                      
              { 
              if (exists(data($Operacion/ns0:Prestamo/ns0:ramo))) then
                if(empty($Operacion/ns0:Prestamo/ns0:ramo/text())) then () 
                else <ns2:ramo>{ data($Operacion/ns0:Prestamo/ns0:ramo) }</ns2:ramo>
              else ()
              }
              { 
              if (exists(data($Operacion/ns0:Prestamo/ns0:subramo))) then
                if(empty($Operacion/ns0:Prestamo/ns0:subramo/text())) then () 
                else <ns2:subramo>{ data($Operacion/ns0:Prestamo/ns0:subramo) }</ns2:subramo>
              else ()
              }
              { 
              if (exists(data($Operacion/ns0:Prestamo/ns0:valorOperacion))) then
                if(empty($Operacion/ns0:Prestamo/ns0:valorOperacion/text())) then () 
                else <ns2:valorOperacion>{ data($Operacion/ns0:Prestamo/ns0:valorOperacion) }</ns2:valorOperacion>
              else ()
              }
              { 
              if (exists(data($Operacion/ns0:Prestamo/ns0:tipoOperacion))) then
                if(empty($Operacion/ns0:Prestamo/ns0:tipoOperacion/text())) then () 
                else <ns2:tipoOperacion>{ data($Operacion/ns0:Prestamo/ns0:tipoOperacion) }</ns2:tipoOperacion>
              else ()
              }
              {
              if (exists(data($Operacion/ns0:Prestamo/ns0:existenciaAlMoneda))) then 				
                if(empty($Operacion/ns0:Prestamo/ns0:existenciaAlMoneda/text())) then () 
                else <ns2:existenciaAlMoneda>{ data($Operacion/ns0:Prestamo/ns0:existenciaAlMoneda) }</ns2:existenciaAlMoneda>					
              else ()
              }
              {
              if (exists(data($Operacion/ns0:Prestamo/ns0:montoAvaluo))) then 				
                if(empty($Operacion/ns0:Prestamo/ns0:montoAvaluo/text())) then () 
                else <ns2:montoAvaluo>{ data($Operacion/ns0:Prestamo/ns0:montoAvaluo) }</ns2:montoAvaluo>					
              else ()
              }                                                          
              { 
              if (exists(data($Operacion/ns0:Prestamo/ns0:montoPrestamo))) then
                      if(empty($Operacion/ns0:Prestamo/ns0:montoPrestamo/text())) then () 
                      else <ns2:montoPrestamo>{ data($Operacion/ns0:Prestamo/ns0:montoPrestamo) }</ns2:montoPrestamo>
              else ()
              }
              {
              if (exists(data($Operacion/ns0:Prestamo/ns0:caracteristica1))) then 				
                if(empty($Operacion/ns0:Prestamo/ns0:caracteristica1/text())) then () 
                else <ns2:caracteristica1>{ data($Operacion/ns0:Prestamo/ns0:caracteristica1) }</ns2:caracteristica1>					
              else ()
              } 
              {
              if (exists(data($Operacion/ns0:Prestamo/ns0:caracteristica2))) then 				
                if(empty($Operacion/ns0:Prestamo/ns0:caracteristica2/text())) then () 
                else <ns2:caracteristica2>{ data($Operacion/ns0:Prestamo/ns0:caracteristica2) }</ns2:caracteristica2>					
              else ()
              } 
              {
              if (exists(data($Operacion/ns0:Prestamo/ns0:caracteristica3))) then 				
                if(empty($Operacion/ns0:Prestamo/ns0:caracteristica3/text())) then ()
                else <ns2:caracteristica3>{ data($Operacion/ns0:Prestamo/ns0:caracteristica3) }</ns2:caracteristica3>					
              else ()
              }                                                                                    
              </ns2:Operacion>
              }
            </ns2:ListaOperaciones>
        </ns2:updatePrestamoRequest>
};

declare variable $updatePrestamoRequest1 as element(ns0:updatePrestamoRequest) external;
declare variable $dvmTipoOperacion as element(*) external;

xf:RemoverNodosRechazoXQ($updatePrestamoRequest1, $dvmTipoOperacion)