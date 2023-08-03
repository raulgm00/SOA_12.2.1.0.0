xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/EvaluacionCredito";
(:: import schema at "../Schemas/OSBRenovacionCreditoElementosXSD.xsd" ::)
declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/ReglaRenovacionTopUp";
(:: import schema at "../Schemas/BRMReglaRenovacionTopUpXSD.xsd" ::)
declare namespace ns3="http://tempuri.org/";
(:: import schema at "../../../../FuerzaDeVentas/GestionOrdenesTrabajo/Resources/Schemas/CRMServicioOrdenesElementosXSD.xsd" ::)

declare namespace nmp = "http://schemas.datacontract.org/2004/07/NMP.MRT.BusinessTypes";

declare namespace nmp1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";

declare namespace nmp2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOferta";

declare variable $osbInput as element() (:: schema-element(ns1:processCreditoRequest) ::) external;
declare variable $isRenovacion as element() (:: schema-element(ns2:isRenovacionTopUpMessageResponse) ::) external;

declare function local:func($osbInput as element() (:: schema-element(ns1:processCreditoRequest) ::), 
                            $isRenovacion as element() (:: schema-element(ns2:isRenovacionTopUpMessageResponse) ::)) 
                            as element() (:: schema-element(ns3:RecuperarUltimaLlamada) ::) {
    <ns3:RecuperarUltimaLlamada>
        <ns3:llamada>
            {
                if ($osbInput/ns1:cliente/nmp1:id)
                then <nmp:IdCliente>{fn:data($osbInput/ns1:cliente/nmp1:id)}</nmp:IdCliente>
                else ()
            }
            {
                if ($isRenovacion/ns2:oferta/nmp2:nombreProducto)
                then <nmp:ProcesoActividad>{fn:data($isRenovacion/ns2:oferta/nmp2:nombreProducto)}</nmp:ProcesoActividad>
                else ()
            }
        </ns3:llamada>
    </ns3:RecuperarUltimaLlamada>
};

local:func($osbInput, $isRenovacion)