xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/Ofertas";
(:: import schema at "../Schemas/NMPOfertasSvcElementosXSD.xsd" ::)
declare namespace ns2="http://tempuri.org/";
(:: import schema at "../Schemas/CRMActualizarOfertasElementosXSD.xsd" ::)

declare namespace bus = "http://schemas.datacontract.org/2004/07/BusinessTypes.Request";

declare namespace ofe = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/Ofertas";

declare namespace bus1 = "http://schemas.datacontract.org/2004/07/BusinessTypes.Request.Ofertas";

declare namespace emp = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Empenio";

declare namespace ns3="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader";
(:: import schema at "../../../../Common/XSD/NMPStandardHeader.xsd" ::)

declare namespace bus2 = "http://schemas.datacontract.org/2004/07/BusinessTypes.Modelos";

declare variable $ActualizarOfertasRequest as element() (:: schema-element(ns1:ActualizarOfertasRequest) ::) external;

declare variable $header as element() (:: schema-element(ns3:headerMessage) ::) external;

declare function local:func($ActualizarOfertasRequest as element() (:: schema-element(ns1:ActualizarOfertasRequest) ::), $header as element() (:: schema-element(ns3:headerMessage) ::)) as element() (:: schema-element(ns2:CambiaEstado) ::) {
    <ns2:CambiaEstado>
        <ns2:Ofertas>
            <bus1:FuenteDato>{fn:string('OBR-SIVA3')}</bus1:FuenteDato>
            {
              
              if ($ActualizarOfertasRequest/ofe:InformacionEmpenio/emp:idPartida)
              then <bus1:Partida>{fn:data($ActualizarOfertasRequest/ofe:InformacionEmpenio/emp:idPartida)}</bus1:Partida>
              else ()
               
            }
            {
                if ($header/ns3:nombreUsuario)
                then <bus1:UsuarioValuador>{fn:data($header/ns3:nombreUsuario)}</bus1:UsuarioValuador>
                else ()
            }
            {
                if ($ActualizarOfertasRequest/ofe:InformacionTransaccion)
                then <bus1:DatosTransaccion>
                    {
                        if ($ActualizarOfertasRequest/ofe:InformacionTransaccion/ofe:idTransaccion)
                        then <bus2:IdTransaccion>{fn:data($ActualizarOfertasRequest/ofe:InformacionTransaccion/ofe:idTransaccion)}</bus2:IdTransaccion>
                        else ()
                    }
                    {
                        if ($ActualizarOfertasRequest/ofe:InformacionTransaccion/ofe:idSucursal)
                        then <bus2:Sucursal>{fn:data($ActualizarOfertasRequest/ofe:InformacionTransaccion/ofe:idSucursal)}</bus2:Sucursal>
                        else ()
                    }</bus1:DatosTransaccion>
                else ()
            }
            {
                if ($ActualizarOfertasRequest/ofe:InformacionEmpenio/emp:montoAvaluo)
                then <bus1:MontoAvaluo>{fn:data($ActualizarOfertasRequest/ofe:InformacionEmpenio/emp:montoAvaluo)}</bus1:MontoAvaluo>
                else ()
            }
            {
                if ($ActualizarOfertasRequest/ofe:InformacionEmpenio/emp:montoPrestamoOriginal)
                then <bus1:MontoOriginalPrestamo>{fn:data($ActualizarOfertasRequest/ofe:InformacionEmpenio/emp:montoPrestamoOriginal)}</bus1:MontoOriginalPrestamo>
                else ()
            }
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

local:func($ActualizarOfertasRequest,$header)