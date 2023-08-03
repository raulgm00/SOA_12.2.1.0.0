xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/Ofertas";
(:: import schema at "../Schemas/NMPOfertasSvcElementosXSD.xsd" ::)

declare namespace cli = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Cliente";

declare namespace ofe = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/Ofertas";

declare namespace emp = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Empenio";

declare namespace pre = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Oferta/Prendario";

declare variable $GenerarOfertaRes as element() (:: schema-element(ns1:GenerarOfertasResponse) ::) external;
declare variable $GenerarOfertasReq as element() (:: schema-element(ns1:GenerarOfertasRequest) ::) external;

declare function local:trans($GenerarOfertaRes as element() (:: schema-element(ns1:GenerarOfertasResponse) ::), 
                             $GenerarOfertasReq as element() (:: schema-element(ns1:GenerarOfertasRequest) ::)) 
                             as element() (:: schema-element(ns1:GuardarOfertasRequest) ::) {
    <ns1:GuardarOfertasRequest>
        <ofe:idCliente>{fn:data($GenerarOfertasReq/ofe:InformacionCliente/cli:idCliente)}</ofe:idCliente>
        {
            if ($GenerarOfertasReq/ofe:InformacionTransaccion)
            then 
                <ofe:InformacionTransaccion>
                  {$GenerarOfertasReq/ofe:InformacionTransaccion/*}
                </ofe:InformacionTransaccion>
            else ()
        }
        <ofe:InformacionEmpenio>
            {$GenerarOfertasReq/ofe:InformacionEmpenio/*}
        </ofe:InformacionEmpenio>
        <ofe:listaOfertas>
            {$GenerarOfertaRes/ofe:listaOfertas/*}               
        </ofe:listaOfertas>
    </ns1:GuardarOfertasRequest>
};

local:trans($GenerarOfertaRes, $GenerarOfertasReq)