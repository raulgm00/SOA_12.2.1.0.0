xquery version "2004-draft";
(:: pragma bea:local-element-parameter parameter="$cabeceraPadron" type="ns3:CabeceraPadronDBAdapterOutputCollection/ns3:CabeceraPadronDBAdapterOutput" location="../XSD/BeneficiariosCabeceraXSD.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$detallePadron" type="ns1:DetallePadronDBAdapterOutputCollection" location="../XSD/BeneficiariosDetalleXSD.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$totalesPadron" type="ns2:TotalesPadronDBAdapterOutputCollection/ns2:TotalesPadronDBAdapterOutput" location="../XSD/BeneficiariosTotalesXSD.xsd" ::)
(:: pragma bea:global-element-return element="ns0:consultaBeneficiarioResponse" location="../XSD/BeneficiarioSvcXSD.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/pcbpel/adapter/db/TotalesPadronDBAdapter";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/DetallePadronDBAdapter";
declare namespace ns3 = "http://xmlns.oracle.com/pcbpel/adapter/db/CabeceraPadronDBAdapter";
declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPBeneficiario";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Beneficiario/Resources/XQ/GetPadronBeneficiariosXQ/";

declare function xf:GetPadronBeneficiariosXQ($cabeceraPadron as element(),
    $detallePadron as element(),
    $totalesPadron as element())
    as element(ns0:consultaBeneficiarioResponse) {
        <ns0:consultaBeneficiarioResponse>
            <ns0:cabecera>
                <ns0:tipoRegistro>{ data($cabeceraPadron/ns3:tip_reg) }</ns0:tipoRegistro>
                <ns0:fechaGeneracion>{ data($cabeceraPadron/ns3:fec_reg) }</ns0:fechaGeneracion>
                <ns0:grupo>{ data($cabeceraPadron/ns3:grupo) }</ns0:grupo>
                <ns0:compania>{ data($cabeceraPadron/ns3:empresa) }</ns0:compania>
            </ns0:cabecera>
            <ns0:detalle>
            {
				for $DetallePadronDBAdapterOutput in $detallePadron/ns1:DetallePadronDBAdapterOutput
                return
                    	<ns0:beneficiario>
                    		{
                    			if (not(empty($DetallePadronDBAdapterOutput/ns1:tip_reg/text()))) then
									<ns0:tipoRegistro>{ data($DetallePadronDBAdapterOutput/ns1:tip_reg) }</ns0:tipoRegistro>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:emp_ben/text()))) then
									<ns0:empleadoBeneficiario>{ data($DetallePadronDBAdapterOutput/ns1:emp_ben) }</ns0:empleadoBeneficiario>
								else ()
							}
							{
								if(not(empty($DetallePadronDBAdapterOutput/ns1:tipo_movto/text()))) then
									<ns0:tipoMotivo>{ data($DetallePadronDBAdapterOutput/ns1:tipo_movto) }</ns0:tipoMotivo>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:plan_medico/text()))) then
	                				<ns0:planMedico>{ data($DetallePadronDBAdapterOutput/ns1:plan_medico) }</ns0:planMedico>
                				else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:plan_dental/text()))) then
									<ns0:planDental>{ data($DetallePadronDBAdapterOutput/ns1:plan_dental) }</ns0:planDental>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:subgrupo/text()))) then
									<ns0:subgrupo>{ data($DetallePadronDBAdapterOutput/ns1:subgrupo) }</ns0:subgrupo>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:clase/text()))) then
									<ns0:clase>{ data($DetallePadronDBAdapterOutput/ns1:clase) }</ns0:clase>
								else ()
							}
							{
								if(not(empty($DetallePadronDBAdapterOutput/ns1:numero_nomina/text()))) then
									<ns0:numeroNomina>{ data($DetallePadronDBAdapterOutput/ns1:numero_nomina) }</ns0:numeroNomina>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:nombre/text()))) then
									<ns0:nombre>{ data($DetallePadronDBAdapterOutput/ns1:nombre) }</ns0:nombre>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:apellido_paterno/text()))) then
									<ns0:apellidoPaterno>{ data($DetallePadronDBAdapterOutput/ns1:apellido_paterno) }</ns0:apellidoPaterno>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:apellido_materno/text()))) then
									<ns0:apellidoMaterno>{ data($DetallePadronDBAdapterOutput/ns1:apellido_materno) }</ns0:apellidoMaterno>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:fecha_contratacion/text()))) then
									<ns0:fechaContratacion>{ data($DetallePadronDBAdapterOutput/ns1:fecha_contratacion) }</ns0:fechaContratacion>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:departamento/text()))) then
									<ns0:numeroDepartamento>{ data($DetallePadronDBAdapterOutput/ns1:departamento) }</ns0:numeroDepartamento>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:status_derechohabiente/text()))) then
									<ns0:statusDerechohabiente>{ data($DetallePadronDBAdapterOutput/ns1:status_derechohabiente) }</ns0:statusDerechohabiente>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:beneficiario/text()))) then
									<ns0:claveBeneficiario>{ data($DetallePadronDBAdapterOutput/ns1:beneficiario) }</ns0:claveBeneficiario>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:fecha_retiro/text()))) then
									<ns0:fechaRetiro>{ data($DetallePadronDBAdapterOutput/ns1:fecha_retiro) }</ns0:fechaRetiro>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:feha_terminacion/text()))) then 
									<ns0:fechaTerminacionLaboral>{ data($DetallePadronDBAdapterOutput/ns1:feha_terminacion) }</ns0:fechaTerminacionLaboral>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:razon_terminacion/text()))) then
									<ns0:razonTerminacionLaboral>{ data($DetallePadronDBAdapterOutput/ns1:razon_terminacion) }</ns0:razonTerminacionLaboral>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:fecha_alte/text()))) then
									<ns0:fechaAltaServicio>{ data($DetallePadronDBAdapterOutput/ns1:fecha_alte) }</ns0:fechaAltaServicio>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:fecha_fin_derechos/text()))) then
									<ns0:fechaFinDerechoServicio>{ data($DetallePadronDBAdapterOutput/ns1:fecha_fin_derechos) }</ns0:fechaFinDerechoServicio>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:parentesco/text()))) then
									<ns0:parentesco>{ data($DetallePadronDBAdapterOutput/ns1:parentesco) }</ns0:parentesco>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:fecha_nacimiento/text()))) then
									<ns0:fechaNacimiento>{ data($DetallePadronDBAdapterOutput/ns1:fecha_nacimiento) }</ns0:fechaNacimiento>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:sexo/text()))) then
									<ns0:sexo>{ data($DetallePadronDBAdapterOutput/ns1:sexo) }</ns0:sexo>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:estado_civil/text()))) then
									<ns0:estadoCivil>{ data($DetallePadronDBAdapterOutput/ns1:estado_civil) }</ns0:estadoCivil>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:rfc/text()))) then
									<ns0:rfc>{ data($DetallePadronDBAdapterOutput/ns1:rfc) }</ns0:rfc>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:imss/text()))) then
									<ns0:imss>{ data($DetallePadronDBAdapterOutput/ns1:imss) }</ns0:imss>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:domicilio1/text()))) then
									<ns0:calle1>{ data($DetallePadronDBAdapterOutput/ns1:domicilio1) }</ns0:calle1>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:domicilio2/text()))) then
									<ns0:colonia>{ data($DetallePadronDBAdapterOutput/ns1:domicilio2) }</ns0:colonia>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:domicilio3/text()))) then
									<ns0:calle2>{ data($DetallePadronDBAdapterOutput/ns1:domicilio3) }</ns0:calle2>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:ciudad/text()))) then
									<ns0:ciudad>{ data($DetallePadronDBAdapterOutput/ns1:ciudad) }</ns0:ciudad>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:delegacion/text()))) then
									<ns0:delegacionMunicipio>{ data($DetallePadronDBAdapterOutput/ns1:delegacion) }</ns0:delegacionMunicipio>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:estado/text()))) then
									<ns0:estado>{ data($DetallePadronDBAdapterOutput/ns1:estado) }</ns0:estado>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:cp/text()))) then
									<ns0:codigoPostal>{ data($DetallePadronDBAdapterOutput/ns1:cp) }</ns0:codigoPostal>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:tel_particular/text()))) then
									<ns0:telefonoParticular>{ data($DetallePadronDBAdapterOutput/ns1:tel_particular) }</ns0:telefonoParticular>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:tel_oficina/text()))) then
									<ns0:telefonoOficina>{ data($DetallePadronDBAdapterOutput/ns1:tel_oficina) }</ns0:telefonoOficina>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:extension/text()))) then
									<ns0:extension>{ data($DetallePadronDBAdapterOutput/ns1:extension) }</ns0:extension>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:cp_pago/text()))) then
									<ns0:codigoPostalPago>{ data($DetallePadronDBAdapterOutput/ns1:cp_pago) }</ns0:codigoPostalPago>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:fecha_estudiante/text()))) then
									<ns0:fechaInicioEstudiante>{ data($DetallePadronDBAdapterOutput/ns1:fecha_estudiante) }</ns0:fechaInicioEstudiante>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:tipo_estudiante/text()))) then
									<ns0:tipoEstudiante>{ data($DetallePadronDBAdapterOutput/ns1:tipo_estudiante) }</ns0:tipoEstudiante>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:nombre_escuela/text()))) then
									<ns0:nombreEscuela>{ data($DetallePadronDBAdapterOutput/ns1:nombre_escuela) }</ns0:nombreEscuela>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:fec_ini_discapacidad/text()))) then
									<ns0:fechaInicioDiscapacidad>{ data($DetallePadronDBAdapterOutput/ns1:fec_ini_discapacidad) }</ns0:fechaInicioDiscapacidad>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:fec_fin_discapacidad/text()))) then
									<ns0:fechaFinDiscapacidad>{ data($DetallePadronDBAdapterOutput/ns1:fec_fin_discapacidad) }</ns0:fechaFinDiscapacidad>
								else ()
							}
							{
								if (not(empty($DetallePadronDBAdapterOutput/ns1:tipo_discapacidad/text()))) then
									<ns0:tipoDiscapacidad>{ data($DetallePadronDBAdapterOutput/ns1:tipo_discapacidad) }</ns0:tipoDiscapacidad>
								else ()
							}
                        </ns0:beneficiario>
            }
            </ns0:detalle>
            <ns0:totales>
                <ns0:tipoRegistro>{ data($totalesPadron/ns2:tipo_reg) }</ns0:tipoRegistro>
                <ns0:totalRegistrosAltas>{ data($totalesPadron/ns2:total_altas) }</ns0:totalRegistrosAltas>
                <ns0:totalRegistrosBajas>{ data($totalesPadron/ns2:total_bajas) }</ns0:totalRegistrosBajas>
                <ns0:totalRegistrosCambios>{ data($totalesPadron/ns2:total_cambios) }</ns0:totalRegistrosCambios>
                <ns0:totalRegistros>{ data($totalesPadron/ns2:total_registros) }</ns0:totalRegistros>
            </ns0:totales>
        </ns0:consultaBeneficiarioResponse>
};

declare variable $cabeceraPadron as element() external;
declare variable $detallePadron as element() external;
declare variable $totalesPadron as element() external;

xf:GetPadronBeneficiariosXQ($cabeceraPadron,
    $detallePadron,
    $totalesPadron)