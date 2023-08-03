xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ser="http://services.montepiedad.tpmex.com/";
(:: import schema at "../../../../Utileria/MensajeriaUtil/Resources/XSD/InsertaMensajesXSD.xsd" ::)
declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/AppMonte";
(:: import schema at "../Schemas/NMPAppMonteSvcElementosXSD.xsd" ::)

declare namespace app = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/AppMonte";

declare variable $registrarClienteAppRequest as element() (:: schema-element(ns1:registrarClienteAppRequest) ::) external;

declare function local:func($registrarClienteAppRequest as element() (:: schema-element(ns1:registrarClienteAppRequest) ::)) as element() (:: schema-element(ser:insertaMensajesALL) ::) {
    <ser:insertaMensajesALL>
        <smsCellNumbers>{fn:data($registrarClienteAppRequest/app:noTelefono)}</smsCellNumbers>
        <smsMessage>{'Bienvenido a la App de Nacional Monte de Piedad, para consultar nuestro aviso ingresa a: https://goo.gl/TAS4hn'}</smsMessage>
        
    </ser:insertaMensajesALL>
};

local:func($registrarClienteAppRequest)