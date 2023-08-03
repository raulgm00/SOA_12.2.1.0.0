xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/Ofertas";
(:: import schema at "../Schemas/NMPOfertasSvcElementosXSD.xsd" ::)
declare namespace ns2="http://tempuri.org/";
(:: import schema at "../Schemas/CRMActualizarOfertasElementosXSD.xsd" ::)

declare namespace bus = "http://schemas.datacontract.org/2004/07/BusinessTypes.Request";

declare namespace ofe = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/Ofertas";

declare namespace bus1 = "http://schemas.datacontract.org/2004/07/BusinessTypes.Request.Ofertas";

declare variable $ActualizarOfertasRequest as element() (:: schema-element(ns1:ActualizarOfertasRequest) ::) external;

declare function local:func($ActualizarOfertasRequest as element() (:: schema-element(ns1:ActualizarOfertasRequest) ::)) as element() (:: schema-element(ns2:CambiaEstado) ::) {
    <ns2:CambiaEstado>
        <ns2:Ofertas>
            <bus1:FuenteDato>{fn:string('OBR-SIVA3')}</bus1:FuenteDato>
            <bus1:Ofertas>
                {
                    for $EstadoOferta in $ActualizarOfertasRequest/ofe:listaEstadoOfertas/ofe:EstadoOferta
                    return 
                    <bus1:EstadoOferta>
                        {
                            if ($EstadoOferta/ofe:idOferta)
                            then <bus1:Identificador>{fn:data($EstadoOferta/ofe:idOferta)}</bus1:Identificador>
                            else ()
                        }
                        {
                            if ($EstadoOferta/ofe:estado)
                            then <bus1:EstadoAceptacion>{fn:data(fn:string($EstadoOferta/ofe:estado))}</bus1:EstadoAceptacion>
                            else ()
                        }</bus1:EstadoOferta>
                }
            </bus1:Ofertas>
        </ns2:Ofertas>
    </ns2:CambiaEstado>
};

local:func($ActualizarOfertasRequest)