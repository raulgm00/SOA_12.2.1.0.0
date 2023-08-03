xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$updateScoreRequest" element="ns1:updateScoreRequest" location="../Schemas/NMPScoreSvcXSD.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Scoring" location="../Schemas/OSBScoreCrm0XSD.xsd" ::)

declare namespace ns2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/CanonicalModel";
declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSucursal";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Score/Resources/XSLT/ScoreToCrmTransformXQ/";

declare function xf:ScoreToCrmTransformXQ($updateScoreRequest as element(ns1:updateScoreRequest))
    as element(ns0:Scoring) {
        <ns0:Scoring>
            <ns0:scoreRequest xmlns:can="http://servicios.montedepiedad.com.mx/NMP/Schema/CanonicalModel">                
                {
            	if (not(empty($updateScoreRequest/ns1:CalificacionAjustada/text()))) then 
                	<ns2:CalificacionAjustada>{ data($updateScoreRequest/ns1:CalificacionAjustada) }</ns2:CalificacionAjustada>
                else ""
                }
            	{
            	if (not(empty($updateScoreRequest/ns1:CalificacionDegradada/text()))) then 
                	<ns2:CalificacionDegradada>{ data($updateScoreRequest/ns1:CalificacionDegradada) }</ns2:CalificacionDegradada>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:calificacionMidas/text()))) then                 	
                	<ns2:CalificacionMidas>{ data($updateScoreRequest/ns1:calificacionMidas) }</ns2:CalificacionMidas>
                else ""
                }                 
                {
            	if (not(empty($updateScoreRequest/ns1:calificacionReal/text()))) then                 	                	
                	<ns2:CalificacionReal>{ data($updateScoreRequest/ns1:calificacionReal) }</ns2:CalificacionReal>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:CalificacionSIVA2/text()))) then                 	                	                	
                	<ns2:CalificacionSIVA2>{ data($updateScoreRequest/ns1:CalificacionSIVA2) }</ns2:CalificacionSIVA2>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:capacidadPago/text()))) then                 	                	                	                	
                	<ns2:CapacidadPago>{ data($updateScoreRequest/ns1:capacidadPago) }</ns2:CapacidadPago>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:fechaIngreso/text()))) then                 	                	                	                	                	
                	<ns2:FechaIngreso>{ data($updateScoreRequest/ns1:fechaIngreso) }</ns2:FechaIngreso>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:gradoDeConfianza/text()))) then                 	                	                	                	                	                	
                	<ns2:GradoConfianza>{ data($updateScoreRequest/ns1:gradoDeConfianza) }</ns2:GradoConfianza>
                else ""
                }
                <ns2:Hash></ns2:Hash>
                {
            	if (not(empty($updateScoreRequest/ns1:idCliente/text()))) then                 	                	                	                	                	                	                	
                	<ns2:IdCliente>{ data($updateScoreRequest/ns1:idCliente) }</ns2:IdCliente>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:indiceRecuperacion/text()))) then                 	                	                	                	                	                	                	                	
                	<ns2:IndiceRecuperacion>{ data($updateScoreRequest/ns1:indiceRecuperacion) }</ns2:IndiceRecuperacion>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:pagosNMP/text()))) then                 	                	                	                	                	                	                	                	                	
                	<ns2:Pagos>{data($updateScoreRequest/ns1:pagosNMP)}</ns2:Pagos>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:porcentajeDesempeno/text()))) then                 	                	                	                	                	                	                	                	                	                	
                	<ns2:PorcentajeDesempeño>{data($updateScoreRequest/ns1:porcentajeDesempeno)}</ns2:PorcentajeDesempeño>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:promedioPrestamoValuacion/text()))) then                 	                	                	                	                	                	                	                	                	                	                	
                	<ns2:PorcentajePrestamoValuacion>{data($updateScoreRequest/ns1:promedioPrestamoValuacion)}</ns2:PorcentajePrestamoValuacion>
                else ""
                }
				{
            	if (not(empty($updateScoreRequest/ns1:prestamoPromedio/text()))) then                 	                	                	                	                	                	                	                	                	                	                	
                	<ns2:PrestamoPromedio>{data($updateScoreRequest/ns1:prestamoPromedio)}</ns2:PrestamoPromedio>
                else ""
                }
				{
            	if (not(empty($updateScoreRequest/ns1:prestamosNMP/text()))) then                 	                	                	                	                	                	                	                	                	                	                	
                	<ns2:Prestamos>{data($updateScoreRequest/ns1:prestamosNMP)}</ns2:Prestamos>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:probabilidadIncumplimiento/text()))) then                 	                	                	                	                	                	                	                	                	                	                	
                	<ns2:ProbabilidadIncumplimiento>{ data($updateScoreRequest/ns1:probabilidadIncumplimiento) }</ns2:ProbabilidadIncumplimiento>
                else ""
                }				
				{
            	if (not(empty($updateScoreRequest/ns1:sobreAforo/text()))) then                 	                	                	                	                	                	                	                	                	                	                	
                	<ns2:SobreAforo>{ data($updateScoreRequest/ns1:sobreAforo) }</ns2:SobreAforo>
                else ""
                }
                {
            	if (not(empty($updateScoreRequest/ns1:SobreAforoAjustado/text()))) then                 	                	                	                	                	                	                	                	                	                	                	
                	<ns2:SobreAforoAjustado>{ data($updateScoreRequest/ns1:SobreAforoAjustado) }</ns2:SobreAforoAjustado>
                else ""
                }                
                {
            	if (not(empty($updateScoreRequest/ns1:SobreAforoSIVA2/text()))) then                 	                	                	                	                	                	                	                	                	                	                	
                	<ns2:SobreAforoSIVA2>{ data($updateScoreRequest/ns1:SobreAforoSIVA2) }</ns2:SobreAforoSIVA2>
                else ""
                }                
            </ns0:scoreRequest>
        </ns0:Scoring>
};

declare variable $updateScoreRequest as element(ns1:updateScoreRequest) external;

xf:ScoreToCrmTransformXQ($updateScoreRequest)