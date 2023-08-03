xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador";
(:: import schema at "../Schemas/NMPCotizadorSvcXSD.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/BRMCotizarAuto/BRMCotizarAuto_DecisionService";
(:: import schema at "../Schemas/BRMCotizarAutoDecisionServiceSrvXSD.xsd" ::)

declare variable $brmCotizarAuto as element() (:: schema-element(ns1:callFunctionStatelessDecision) ::) external;

declare function local:func($brmCotizarAuto as element() (:: schema-element(ns1:callFunctionStatelessDecision) ::)) as element() (:: schema-element(ns2:cotizarVehiculoResponse) ::) {
    <ns2:cotizarVehiculoResponse>
        <ns2:montoMinimoPrestamo>{fn:data($brmCotizarAuto/ns1:resultList/ns2:cotizarVehiculoResponse/ns2:montoMinimoPrestamo)}</ns2:montoMinimoPrestamo>
        <ns2:montoMaximoPrestamo>{fn:data($brmCotizarAuto/ns1:resultList/ns2:cotizarVehiculoResponse/ns2:montoMaximoPrestamo)}</ns2:montoMaximoPrestamo>
        <ns2:montoAvaluo>{fn:data($brmCotizarAuto/ns1:resultList/ns2:cotizarVehiculoResponse/ns2:montoAvaluo)}</ns2:montoAvaluo>
    </ns2:cotizarVehiculoResponse>
};

local:func($brmCotizarAuto)