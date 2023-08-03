xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasCredito";
(:: import schema at "../Schemas/NMPCampaniasCreditoSvcElementos.xsd" ::)
declare namespace ns1="http://tempuri.org/";
(:: import schema at "../../../../GestionOrdenesTrabajo/Resources/Schemas/CRMServicioOrdenesTipos02XSD.xsd" ::)

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasCreditoTypes";

declare namespace nmp1 = "http://schemas.datacontract.org/2004/07/Nmp.Crm.Servicios.DataContracts";

declare variable $confirmaCampaniaRes as element() (:: schema-element(ns1:ConfirmaInteresCampañaResponse) ::) external;

declare function local:func($confirmaCampaniaRes as element() (:: schema-element(ns1:ConfirmaInteresCampañaResponse) ::)) as element() (:: schema-element(ns2:confirmarCampaniaClienteResponse) ::) {
    <ns2:confirmarCampaniaClienteResponse>
        <nmp:respuesta>{fn:data($confirmaCampaniaRes//nmp1:Mensaje)}</nmp:respuesta>
    </ns2:confirmarCampaniaClienteResponse>
};

local:func($confirmaCampaniaRes)