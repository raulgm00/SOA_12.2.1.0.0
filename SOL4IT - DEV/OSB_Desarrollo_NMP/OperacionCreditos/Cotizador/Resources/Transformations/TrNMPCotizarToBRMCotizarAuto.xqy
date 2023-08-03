xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador";
(:: import schema at "../Schemas/NMPCotizadorSvcXSD.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/BRMCotizarAuto/BRMCotizarAuto_DecisionService";
(:: import schema at "../Schemas/BRMCotizarAutoDecisionServiceSrvXSD.xsd" ::)

declare variable $nmpCotizador as element() (:: schema-element(ns1:cotizarVehiculoRequest) ::) external;

declare function local:func($nmpCotizador as element() (:: schema-element(ns1:cotizarVehiculoRequest) ::)) as element() (:: schema-element(ns2:callFunctionStateless) ::) {
    <ns2:callFunctionStateless name="BRMCotizarAuto_DecisionService">
        
        
        <ns2:parameterList>
            <ns1:cotizarVehiculoRequest>
               {$nmpCotizador/*}
            </ns1:cotizarVehiculoRequest>
        </ns2:parameterList>
    </ns2:callFunctionStateless>
};

local:func($nmpCotizador)