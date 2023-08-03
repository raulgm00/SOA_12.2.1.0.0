xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/Ofertas";
(:: import schema at "../Schemas/NMPOfertasSvcElementosXSD.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/OfertaBase/OfertaBase_DecisionService";
(:: import schema at "../Schemas/OBROfertasBaseDecisionElementosXSD.xsd" ::)
declare namespace nmpsh="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader";
(:: import schema at "../../../../Common/XSD/NMPStandardHeader.xsd" ::)


declare namespace pre = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Oferta/Prendario";

declare namespace ofe = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/Ofertas";

declare variable $CallFunctionStatelessDecision as element() (:: schema-element(ns1:callFunctionStatelessDecision) ::) external;
declare variable $Header as element() (:: schema-element(nmpsh:headerMessage) ::) external;


declare function local:func($CallFunctionStatelessDecision as element() (:: schema-element(ns1:callFunctionStatelessDecision) ::), $Header as element() (:: schema-element(nmpsh:headerMessage) ::) ) as element() (:: schema-element(ns2:GenerarOfertasResponse) ::) {
    <ns2:GenerarOfertasResponse>
        <ofe:generarOfertasBase>{xs:boolean(dvmtr:lookupValue("OperacionPrendaria/Ofertas/Resources/DVMs/GenerarOfertaBaseApp","Consumidor",$Header/nmpsh:idConsumidor ,"Flag1","false",""))}</ofe:generarOfertasBase>
        {
            if ($CallFunctionStatelessDecision/ns1:resultList/ofe:GenerarOfertasResponse/ofe:listaOfertas)
            then 
                <ofe:listaOfertas>
                    {
                        for $Oferta in $CallFunctionStatelessDecision/ns1:resultList/ofe:GenerarOfertasResponse/ofe:listaOfertas/pre:Oferta
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
    </ns2:GenerarOfertasResponse>
};

local:func($CallFunctionStatelessDecision,$Header)