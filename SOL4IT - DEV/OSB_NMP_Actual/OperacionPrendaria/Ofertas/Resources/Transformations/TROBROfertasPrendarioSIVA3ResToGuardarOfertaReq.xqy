xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/Ofertas";
(:: import schema at "../Schemas/NMPOfertasSvcElementosXSD.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/OfertaBase/OfertaBase_DecisionService";
(:: import schema at "../Schemas/OBROfertasBaseDecisionElementosXSD.xsd" ::)

declare namespace pre = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Oferta/Prendario";

declare namespace ofe = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/Ofertas";

declare namespace cli = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Cliente";

declare namespace emp = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Empenio";

declare variable $callFunctionStatefulDecisionResponse as element() (:: schema-element(ns1:callFunctionStatefulDecision) ::) external;

declare variable $GenerarOfertasRequest as element() (:: schema-element(ns2:GenerarOfertasRequest) ::) external;

declare function local:func($callFunctionStatefulDecisionResponse as element() (:: schema-element(ns1:callFunctionStatefulDecision) ::),$GenerarOfertasRequest as element() (:: schema-element(ns2:GenerarOfertasRequest) ::) ) as element() (:: schema-element(ns2:GuardarOfertasRequest) ::) {
    <ns2:GuardarOfertasRequest>
        {
            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:idCliente)
            then <ofe:idCliente>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:idCliente)}</ofe:idCliente>
            else ()
        }
        {
            if ($GenerarOfertasRequest/ofe:InformacionTransaccion)
            then 
                <ofe:InformacionTransaccion>
                    {
                        if ($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idTransaccion)
                        then <ofe:idTransaccion>{fn:data($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idTransaccion)}</ofe:idTransaccion>
                        else ()
                    }
                    {
                        if ($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idSucursal)
                        then <ofe:idSucursal>{fn:data($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idSucursal)}</ofe:idSucursal>
                        else ()
                    }
                    {
                        if ($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idRegion)
                        then <ofe:idRegion>{fn:data($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idRegion)}</ofe:idRegion>
                        else ()
                    }
                </ofe:InformacionTransaccion>
            else ()
        }
        {
            if ($GenerarOfertasRequest/ofe:InformacionEmpenio)
            then 
                <ofe:InformacionEmpenio>
                    {
                        if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:ramo)
                        then <emp:ramo>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:ramo)}</emp:ramo>
                        else ()
                    }
                    {
                        if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:subramo)
                        then <emp:subramo>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:subramo)}</emp:subramo>
                        else ()
                    }
                    {
                        if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:montoPrestamoOriginal)
                        then <emp:montoPrestamoOriginal>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:montoPrestamoOriginal)}</emp:montoPrestamoOriginal>
                        else ()
                    }
                    {
                        if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:montoAvaluo)
                        then <emp:montoAvaluo>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:montoAvaluo)}</emp:montoAvaluo>
                        else ()
                    }
                    {
                        if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda)
                        then 
                            <emp:caracteristicasPrenda>
                                {
                                    if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:factor)
                                    then <emp:factor>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:factor)}</emp:factor>
                                    else ()
                                }
                                {
                                    if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:rango)
                                    then <emp:rango>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:rango)}</emp:rango>
                                    else ()
                                }
                                {
                                    if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:gramaje)
                                    then <emp:gramaje>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:gramaje)}</emp:gramaje>
                                    else ()
                                }
                            </emp:caracteristicasPrenda>
                        else ()
                    }
                </ofe:InformacionEmpenio>
            else ()
        }
        {
            if ($callFunctionStatefulDecisionResponse/ns1:resultList/ofe:GenerarOfertasResponse/ofe:listaOfertas)
            then 
                <ofe:listaOfertas>
                    {
                        for $Oferta in $callFunctionStatefulDecisionResponse/ns1:resultList/ofe:GenerarOfertasResponse/ofe:listaOfertas/pre:Oferta
                        return 
                        <pre:Oferta>
                            {
                                if ($Oferta/pre:idOferta)
                                then <pre:idOferta>{fn:data($Oferta/pre:idOferta)}</pre:idOferta>
                                else ()
                            }
                            {
                                if ($Oferta/pre:tipoOferta)
                                then <pre:tipoOferta>{fn:data($Oferta/pre:tipoOferta)}</pre:tipoOferta>
                                else ()
                            }
                            {
                                if ($Oferta/pre:idContratoAsociado)
                                then <pre:idContratoAsociado>{fn:data($Oferta/pre:idContratoAsociado)}</pre:idContratoAsociado>
                                else ()
                            }
                            {
                                if ($Oferta/pre:tipoProducto)
                                then <pre:tipoProducto>{fn:data($Oferta/pre:tipoProducto)}</pre:tipoProducto>
                                else ()
                            }
                            {
                                if ($Oferta/pre:descripcionOferta)
                                then <pre:descripcionOferta>{fn:data($Oferta/pre:descripcionOferta)}</pre:descripcionOferta>
                                else ()
                            }
                            {
                                if ($Oferta/pre:estadoOferta)
                                then <pre:estadoOferta>{fn:data($Oferta/pre:estadoOferta)}</pre:estadoOferta>
                                else ()
                            }
                            {
                                if ($Oferta/pre:montoPrestamo)
                                then 
                                    <pre:montoPrestamo>
                                        {
                                            if ($Oferta/pre:montoPrestamo/pre:montoMinimo)
                                            then 
                                                <pre:montoMinimo>
                                                    {
                                                        if ($Oferta/pre:montoPrestamo/pre:montoMinimo/@highlight)
                                                        then attribute highlight {fn:data($Oferta/pre:montoPrestamo/pre:montoMinimo/@highlight)}
                                                        else ()
                                                    }
                                                    {
                                                      fn:data($Oferta/pre:montoPrestamo/pre:montoMinimo)
                                                    }
                                                </pre:montoMinimo>
                                            else ()
                                        }
                                        {
                                            if ($Oferta/pre:montoPrestamo/pre:montoMaximo)
                                            then 
                                                <pre:montoMaximo>
                                                    {
                                                        if ($Oferta/pre:montoPrestamo/pre:montoMaximo/@highlight)
                                                        then attribute highlight {fn:data($Oferta/pre:montoPrestamo/pre:montoMaximo/@highlight)}
                                                        else ()
                                                    }
                                                    {
                                                      fn:data($Oferta/pre:montoPrestamo/pre:montoMaximo)
                                                    }
                                                </pre:montoMaximo>
                                            else ()
                                        }
                                    </pre:montoPrestamo>
                                else ()
                            }
                            {
                                if ($Oferta/pre:tasaInteres)
                                then 
                                    <pre:tasaInteres>
                                        {
                                            if ($Oferta/pre:tasaInteres/@highlight)
                                            then attribute highlight {fn:data($Oferta/pre:tasaInteres/@highlight)}
                                            else ()
                                        }
                                        {
                                            fn:data($Oferta/pre:tasaInteres)
                                        }
                                    </pre:tasaInteres>
                                else ()
                            }
                            {
                                if ($Oferta/pre:plazoDesempenio)
                                then 
                                    <pre:plazoDesempenio>
                                        {
                                            if ($Oferta/pre:plazoDesempenio/@highlight)
                                            then attribute highlight {fn:data($Oferta/pre:plazoDesempenio/@highlight)}
                                            else ()
                                        }
                                        {
                                            fn:data($Oferta/pre:plazoDesempenio)
                                        }
                                    </pre:plazoDesempenio>
                                else ()
                            }
                            {
                                if ($Oferta/pre:plazoRefrendo)
                                then <pre:plazoRefrendo>{fn:data($Oferta/pre:plazoRefrendo)}</pre:plazoRefrendo>
                                else ()
                            }
                            {
                                if ($Oferta/pre:numeroRefrendos)
                                then 
                                    <pre:numeroRefrendos>
                                        {
                                            if ($Oferta/pre:numeroRefrendos/@highlight)
                                            then attribute highlight {fn:data($Oferta/pre:numeroRefrendos/@highlight)}
                                            else ()
                                        }
                                        {
                                            fn:data($Oferta/pre:numeroRefrendos)
                                        }
                                    </pre:numeroRefrendos>
                                else ()
                            }
                            {
                                if ($Oferta/pre:tipoPeriodo)
                                then <pre:tipoPeriodo>{fn:data($Oferta/pre:tipoPeriodo)}</pre:tipoPeriodo>
                                else ()
                            }
                            {
                                if ($Oferta/pre:catAnual)
                                then <pre:catAnual>{fn:data($Oferta/pre:catAnual)}</pre:catAnual>
                                else ()
                            }
                            {
                                if ($Oferta/pre:catMensual)
                                then <pre:catMensual>{fn:data($Oferta/pre:catMensual)}</pre:catMensual>
                                else ()
                            }
                            {
                                if ($Oferta/pre:catDiario)
                                then <pre:catDiario>{fn:data($Oferta/pre:catDiario)}</pre:catDiario>
                                else ()
                            }
                            {
                                if ($Oferta/pre:diasMinimosEmpenio)
                                then <pre:diasMinimosEmpenio>{fn:data($Oferta/pre:diasMinimosEmpenio)}</pre:diasMinimosEmpenio>
                                else ()
                            }
                            {
                                if ($Oferta/pre:diasMinimosAbono)
                                then <pre:diasMinimosAbono>{fn:data($Oferta/pre:diasMinimosAbono)}</pre:diasMinimosAbono>
                                else ()
                            }
                            {
                                if ($Oferta/pre:idCampaniaAsociada)
                                then <pre:idCampaniaAsociada>{fn:data($Oferta/pre:idCampaniaAsociada)}</pre:idCampaniaAsociada>
                                else ()
                            }
                        </pre:Oferta>
                    }
                </ofe:listaOfertas>
            else ()
        }
    </ns2:GuardarOfertasRequest>
};

local:func($callFunctionStatefulDecisionResponse, $GenerarOfertasRequest)