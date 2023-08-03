xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../Schemas/NMPBuroCreditoSvcXSD.xsd" ::)
declare namespace sap="urn:sap-com:document:sap:soap:functions:mc-style";
(:: import schema at "../WSDLs/SAPConsultaVigenteConinWSDL.wsdl" ::)

declare namespace loc="http://www.w3.org/2005/xquery-local-functions";

declare variable $nmp:peticion as element() (:: schema-element(nmp:consultaVigenteBCRequest) ::) external;

declare function loc:peticionConsultaVigenteSAPConin($nmp:peticion as element() (:: schema-element(nmp:consultaVigenteBCRequest) ::)) as element() (:: schema-element(sap:ZlmRfcConsultaVigente) ::) {
    <sap:ZlmRfcConsultaVigente>
        <Cliente>{fn:data($nmp:peticion/nmp:idCliente)}</Cliente>
        {
            if(fn:exists($nmp:peticion/nmp:ofertaCredito/nmp:producto)) then 
              if(fn:empty($nmp:peticion/nmp:ofertaCredito/nmp:producto/text())) then ()
              else <Producto>{fn:data($nmp:peticion/nmp:ofertaCredito/nmp:producto)}</Producto>
            else ()
        }
        {
          if(fn:exists($nmp:peticion/nmp:ofertaCredito/nmp:subProducto)) then 
            if(fn:empty($nmp:peticion/nmp:ofertaCredito/nmp:subProducto/text())) then ()
            else <Subproducto>{fn:data($nmp:peticion/nmp:ofertaCredito/nmp:subProducto)}</Subproducto>
          else ()
        }
    </sap:ZlmRfcConsultaVigente>
};

loc:peticionConsultaVigenteSAPConin($nmp:peticion)