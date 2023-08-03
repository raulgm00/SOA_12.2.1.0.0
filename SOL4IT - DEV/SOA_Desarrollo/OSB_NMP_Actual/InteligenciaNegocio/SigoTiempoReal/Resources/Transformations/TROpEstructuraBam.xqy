xquery version "1.0" encoding "utf-8";
(:: OracleAnnotationVersion "1.0" ::)

declare namespace trg="http://servicios.montedepiedad.com.mx/NMP/Schema/CanonicalModel";
(:: import schema at "../Schemas/OSBSigoTiempoRealSvcXSD.xsd" ::)
declare namespace src="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPrestamo";
(:: import schema at "../../../../OperacionPrendaria/Prestamo/Resources/Schemas/PrestamoSvcXSD.xsd" ::)

declare namespace xq="http://www.w3.org/2005/xquery-local-functions";

declare variable $src:loanStatusOp as element(src:Operacion) external;
declare variable $idSucursal as xs:int external;
declare variable $fechaOperacion as xs:dateTime external;
declare variable $esCancelacion as xs:boolean external;
declare variable $esReempeno as xs:boolean external;

declare function xq:SIGOOperacionTransformXQ($src:loanStatusOp as element(src:Operacion), $idSucursal as xs:int, $fechaOperacion as xs:dateTime, $esCancelacion as xs:boolean, $esReempeno as xs:boolean) as element(trg:SetOperacionCliente) {
    <trg:SetOperacionCliente>
       <trg:loan>
        	<trg:Caracteristica>{
            		if (fn:exists($src:loanStatusOp/src:Prestamo/src:caracteristica1)) then
                          if(fn:empty($src:loanStatusOp/src:Prestamo/src:caracteristica1/text())) then ()
                          else fn:data($src:loanStatusOp/src:Prestamo/src:caracteristica1)
                	else ()
                }</trg:Caracteristica>
                <trg:Caracteristica2>{ 
                	if (fn:exists($src:loanStatusOp/src:Prestamo/src:caracteristica2)) then
                          if(fn:empty($src:loanStatusOp/src:Prestamo/src:caracteristica2/text())) then ()
                          else fn:data($src:loanStatusOp/src:Prestamo/src:caracteristica2) 
                	else ()
                }</trg:Caracteristica2>
                <trg:Caracteristica3>{ 
                	if (fn:exists($src:loanStatusOp/src:Prestamo/src:caracteristica3)) then
                          if(fn:empty($src:loanStatusOp/src:Prestamo/src:caracteristica3/text())) then ()
                          else fn:data($src:loanStatusOp/src:Prestamo/src:caracteristica3) 
                	else ()
                }</trg:Caracteristica3>
                <trg:Fecha>{
                  if(fn:empty(fn:string($fechaOperacion))) then ()
                  else fn-bea:remove-timezone-from-dateTime(fn:data($fechaOperacion))
                }</trg:Fecha>
                <trg:FechaVencimiento>{
                  if (fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:fechaComercializacion))) then 	
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:fechaComercializacion/text())) then ()
                    else xs:dateTime(concat(fn:substring($src:loanStatusOp/src:Prestamo/src:fechaComercializacion,1,10),'T',fn-bea:remove-timezone-from-time(fn:current-time())))
                  else ()
                }</trg:FechaVencimiento>
                <trg:IdCliente>{
                  if(fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:idClientePrenda))) then
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:idClientePrenda/text())) then ()
                    else fn:data($src:loanStatusOp/src:Prestamo/src:idClientePrenda)
                  else ()
                }</trg:IdCliente>
                <trg:IdSucursal>{
                  if (fn:empty(fn:string($idSucursal))) then ()
                  else fn:data($idSucursal)
                }</trg:IdSucursal>
                <trg:ImportePrestamoRechazado>{
                  if (fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:valorOperacion))) then
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:valorOperacion/text())) then ()
                    else fn:data($src:loanStatusOp/src:Prestamo/src:valorOperacion)
                  else ()
                }</trg:ImportePrestamoRechazado>
                <trg:MontoAvaluo>{
                  if (fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:montoAvaluo))) then
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:montoAvaluo/text())) then ()
                    else fn:data($src:loanStatusOp/src:Prestamo/src:montoAvaluo)
                  else ()
                }</trg:MontoAvaluo>
                <trg:Partida>{
                  if (fn:exists($src:loanStatusOp/src:Prestamo/src:folioPartida)) then
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:folioPartida/text())) then ()
                    else xs:integer($src:loanStatusOp/src:Prestamo/src:folioPartida)
                  else ()
                }</trg:Partida>
                <trg:Ramo>{
                  if (fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:ramo))) then 
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:ramo/text())) then ()
                    else fn:data($src:loanStatusOp/src:Prestamo/src:ramo)
                  else ()
                }</trg:Ramo>
                <trg:SubRamo>{
                  if (fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:subramo))) then
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:subramo/text())) then ()
                    else fn:data($src:loanStatusOp/src:Prestamo/src:subramo)
                  else ()
                }</trg:SubRamo>
                <trg:TipoOperacion>{
                  if(xs:boolean($esReempeno) = fn:true()) then
                    if($src:loanStatusOp/src:Prestamo/src:tipoOperacion = 3) then 17
                    else if($src:loanStatusOp/src:Prestamo/src:tipoOperacion = 5) then 18
                    else if($src:loanStatusOp/src:Prestamo/src:tipoOperacion = 9 or $src:loanStatusOp/src:Prestamo/src:tipoOperacion = 1) then 16
                    else fn:data($src:loanStatusOp/src:Prestamo/src:tipoOperacion)
                  else fn:data($src:loanStatusOp/src:Prestamo/src:tipoOperacion)
                }</trg:TipoOperacion>
                <trg:ValorOperacion>{
                  if (fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:valorOperacion))) then
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:valorOperacion/text())) then 0
                    else fn:data($src:loanStatusOp/src:Prestamo/src:valorOperacion)
                  else 0
                }</trg:ValorOperacion>
                <trg:Valuador>{
                  if (fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:cveValuador))) then
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:cveValuador/text())) then ()
                    else fn:data($src:loanStatusOp/src:Prestamo/src:cveValuador)
                  else ()
                }</trg:Valuador>
                <trg:esCancelacion>{ fn:data($esCancelacion) }</trg:esCancelacion>
                <trg:IdRazonRechazo>{
                  if (fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:DatosRechazo/src:idMotivo))) then 
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:DatosRechazo/src:idMotivo/text())) then ()
                    else fn:data($src:loanStatusOp/src:Prestamo/src:DatosRechazo/src:idMotivo)
                  else ()
                }</trg:IdRazonRechazo>
                <trg:OtraRazonRechazo>{
                    if(fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:DatosRechazo/src:motivo))) then
                      if(fn:empty($src:loanStatusOp/src:Prestamo/src:DatosRechazo/src:motivo/text())) then ()
                      else fn:data($src:loanStatusOp/src:Prestamo/src:DatosRechazo/src:motivo)
                    else ()
                }</trg:OtraRazonRechazo>
                <trg:tipoProducto>{ 
                  if(fn:exists(fn:data($src:loanStatusOp/src:Prestamo/src:tipoProducto))) then
                    if(fn:empty($src:loanStatusOp/src:Prestamo/src:tipoProducto/text())) then "1"
                    else fn:data($src:loanStatusOp/src:Prestamo/src:tipoProducto)
                  else "1"
                }</trg:tipoProducto>
                <trg:SaldoFavor>{
                  if((fn:data($esReempeno)) = true()) then
                    if (fn:exists(fn:data($src:loanStatusOp/src:Contabilidad/src:saldoFavor))) then fn:data($src:loanStatusOp/src:Contabilidad/src:saldoFavor)
                    else ()
                  else ()
                }</trg:SaldoFavor>
      </trg:loan>
    </trg:SetOperacionCliente>
};

xq:SIGOOperacionTransformXQ($src:loanStatusOp, $idSucursal, $fechaOperacion, $esCancelacion, $esReempeno)