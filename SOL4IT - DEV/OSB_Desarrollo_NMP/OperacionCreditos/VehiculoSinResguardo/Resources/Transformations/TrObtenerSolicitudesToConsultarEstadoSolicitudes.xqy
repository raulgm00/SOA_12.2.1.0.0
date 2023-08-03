xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesVSR";
(:: import schema at "../../../SolicitudesVSR/Resources/Schemas/NMPSolicitudesVSRXSD.xsd" ::)
declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculosSinResguardo";
(:: import schema at "../Schemas/NMPVehiculosSinResguardoXSD.xsd" ::)

declare namespace flu = "http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/Flujo";

declare variable $obtenerSolicitudes as element() (:: schema-element(ns1:obtenerSolicitudesRequest) ::) external;

declare function local:convert($obtenerSolicitudes as element() (:: schema-element(ns1:obtenerSolicitudesRequest) ::)) as element() (:: schema-element(ns2:consultarEstadoSolicitudRequest) ::) {
    <ns2:consultarEstadoSolicitudRequest>
        <ns2:numCliente>{fn:data($obtenerSolicitudes/flu:numeroCliente)}</ns2:numCliente>
        {
            if ($obtenerSolicitudes/ns1:fechainicio)
            then <ns2:fechaInicial>{fn:data($obtenerSolicitudes/ns1:fechainicio)}</ns2:fechaInicial>
            else ()
        }
        {
            if ($obtenerSolicitudes/ns1:fechafin)
            then <ns2:fechaFinal>{fn:data($obtenerSolicitudes/ns1:fechafin)}</ns2:fechaFinal>
            else ()
        }
    </ns2:consultarEstadoSolicitudRequest>
};

local:convert($obtenerSolicitudes)