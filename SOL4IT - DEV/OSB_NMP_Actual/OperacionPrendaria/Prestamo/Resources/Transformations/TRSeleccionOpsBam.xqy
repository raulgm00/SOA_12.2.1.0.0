xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$updatePrestamoRequest" element="ns1:updatePrestamoRequest" location="../Schemas/PrestamoSvcXSD.xsd" ::)
(:: pragma parameter="$dvm" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns2:updatePrestamoRequest" location="../Schemas/PrestamoSvc2XSD.xsd" ::)

declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace ns2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Prestamo/Resources/XQ/RemoverOperacionesBAMXQ/";

(:Eliminar este artefacto cuando se de de baja BAM 11g:)
declare function xf:RemoverOperacionesBAMXQ($updatePrestamoRequest as element(ns1:updatePrestamoRequest), $dvm as element(*))
    as element(ns2:updatePrestamoRequest) {
        <ns2:updatePrestamoRequest>
            {
            if (exists(data($updatePrestamoRequest/ns1:idCliente))) then
              if(empty($updatePrestamoRequest/ns1:idCliente/text())) then () 
              else <ns2:idCliente>{ data($updatePrestamoRequest/ns1:idCliente) }</ns2:idCliente>
            else ()
            }
            { 
            if (exists(data($updatePrestamoRequest/ns1:fechaOperacion))) then 
              if(empty($updatePrestamoRequest/ns1:fechaOperacion/text())) then () 
              else <ns2:fechaOperacion>{ data($updatePrestamoRequest/ns1:fechaOperacion) }</ns2:fechaOperacion>
            else ()
            }
            { 
            if (exists(data($updatePrestamoRequest/ns1:idSucursal))) then 
              if(empty($updatePrestamoRequest/ns1:idSucursal/text())) then () 
              else <ns2:idSucursal>{ data($updatePrestamoRequest/ns1:idSucursal) }</ns2:idSucursal>
            else ()
            }
            {
            if (exists(data($updatePrestamoRequest/ns1:esCancelacion))) then
              if(empty($updatePrestamoRequest/ns1:esCancelacion/text())) then () 
              else <ns2:esCancelacion>{ data($updatePrestamoRequest/ns1:esCancelacion) }</ns2:esCancelacion>
            else ()
            }
            <ns2:ListaOperaciones>
            {
            for $Operacion in $updatePrestamoRequest/ns1:ListaOperaciones/ns1:Operacion
            where $dvm/*:rows/*:row[*:cell[2]=$Operacion/ns1:Prestamo/ns1:tipoOperacion]/*:cell[4] = "1" 
               or $dvm/*:rows/*:row[*:cell[2]=$Operacion/ns1:Prestamo/ns1:tipoOperacion]/*:cell[4] = "2"
               (:or ($dvm/*:rows/*:row[*:cell[2]=$Operacion/ns1:tipoOperacion]/*:cell[4] = "4" and $Operacion/ns1:tipoOperacion != "SA"):)
            return
                <ns2:Operacion>
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
                if (exists(data($Operacion/ns1:Prestamo/ns1:ramo))) then
                  if(empty($Operacion/ns1:Prestamo/ns1:ramo/text())) then () 
                  else <ns2:ramo>{ data($Operacion/ns1:Prestamo/ns1:ramo) }</ns2:ramo>
                else ()
                }
                { 
                if (exists(data($Operacion/ns1:Prestamo/ns1:subramo))) then
                  if(empty($Operacion/ns1:Prestamo/ns1:subramo/text())) then () 
                  else <ns2:subramo>{ data($Operacion/ns1:Prestamo/ns1:subramo) }</ns2:subramo>
                else ()
                }
                { 
                if (exists(data($Operacion/ns1:Prestamo/ns1:valorOperacion))) then
                  if(empty($Operacion/ns1:Prestamo/ns1:valorOperacion/text())) then () 
                  else <ns2:valorOperacion>{ data($Operacion/ns1:Prestamo/ns1:valorOperacion) }</ns2:valorOperacion>
                else ()
                }
                { 
                if (exists(data($Operacion/ns1:Prestamo/ns1:tipoOperacion))) then
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
                if (exists(data($Operacion/ns1:Prestamo/ns1:tipoProducto))) then 				
                   if(empty($Operacion/ns1:Prestamo/ns1:tipoProducto/text())) then () 
                   else <ns2:tipoProducto>{ data($Operacion/ns1:Prestamo/ns1:tipoProducto) }</ns2:tipoProducto>					
                else ()
                }	                                              
                {
                if (exists(data($Operacion/ns1:Prestamo/ns1:DatosRechazo)) and exists(data($Operacion/ns1:Prestamo/ns1:DatosRechazo/ns1:idMotivo))) then 
                        <ns2:DatosRechazo>
                          <ns2:idMotivo>{ data($Operacion/ns1:Prestamo/ns1:DatosRechazo/ns1:idMotivo) }</ns2:idMotivo>
                          {
                          if (exists(data($Operacion/ns1:Prestamo/ns1:DatosRechazo/ns1:motivo))) then 				
                            if(empty($Operacion/ns1:Prestamo/ns1:DatosRechazo/ns1:motivo/text())) then () 
                            else <ns2:motivo>{ data($Operacion/ns1:Prestamo/ns1:DatosRechazo/ns1:motivo) }</ns2:motivo>
                          else ()
                          }
                        </ns2:DatosRechazo>
                else ()
                }
              </ns2:Operacion>
             }
            </ns2:ListaOperaciones>
        </ns2:updatePrestamoRequest>
};

declare variable $updatePrestamoRequest as element(ns1:updatePrestamoRequest) external;
declare variable $dvm as element(*) external;

xf:RemoverOperacionesBAMXQ($updatePrestamoRequest, $dvm)