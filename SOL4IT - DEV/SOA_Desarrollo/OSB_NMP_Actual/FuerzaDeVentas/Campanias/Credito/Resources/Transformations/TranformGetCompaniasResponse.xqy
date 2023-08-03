xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasCredito";
(:: import schema at "../Schemas/NMPCampaniasCreditoSvcElementos.xsd" ::)
declare namespace ns1="http://tempuri.org/";
(:: import schema at "../../../../../GestionCatalogos/Sepomex/Resources/Schemas/CRMCatalogosEntityXSD.xsd" ::)

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPLlamada";

declare namespace nmp2 = "http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.Modelos";

declare namespace nmp1 = "http://schemas.datacontract.org/2004/07/Nmp.Crm.BusinessEntity.DataContract";

declare namespace nmp3 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPOferta";

declare variable $getCampaniasRes as element() (:: schema-element(ns1:ConsultaListaCampañasClienteResponse) ::) external;

declare function local:func($getCampaniasRes as element() (:: schema-element(ns1:ConsultaListaCampañasClienteResponse) ::)) as element() (:: schema-element(ns2:getCampaniasClienteResponse) ::) {
    <ns2:getCampaniasClienteResponse>
        <nmp:guidCliente>{fn:data($getCampaniasRes/ns1:ConsultaListaCampañasClienteResult/nmp1:DetalleRespuesta/nmp2:Ofrecimiento[1]/nmp2:GuidCliente)}</nmp:guidCliente>
        <nmp:idLlamada>{fn:data($getCampaniasRes/ns1:ConsultaListaCampañasClienteResult/nmp1:DetalleRespuesta/nmp2:Ofrecimiento[1]/nmp2:GuidLlamada)}</nmp:idLlamada>
        <nmp:oferta>
        {        
        if ($getCampaniasRes/ns1:ConsultaListaCampañasClienteResult/nmp1:DetalleRespuesta)
        then 
            <nmp3:listaOpcionesPlazo>
            {
               for $opcionesPlazo in $getCampaniasRes/ns1:ConsultaListaCampañasClienteResult/nmp1:DetalleRespuesta/nmp2:Ofrecimiento
               return
                <nmp3:opcionesPlazo>
                    {
                        if($opcionesPlazo/nmp2:IdOfrecimiento)
                        then attribute id {fn:data($opcionesPlazo/nmp2:IdOfrecimiento)}
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp2:GuidOfrecimiento)
                        then <nmp3:idOfrecimiento>{fn:data($opcionesPlazo/nmp2:GuidOfrecimiento)}</nmp3:idOfrecimiento>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp2:Tasa)
                        then <nmp3:tasa>{fn:data($opcionesPlazo/nmp2:Tasa)}</nmp3:tasa>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp2:Plazo)
                        then <nmp3:plazo>{fn:data($opcionesPlazo/nmp2:Plazo)}</nmp3:plazo>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp2:PagoMensual)
                        then <nmp3:pago>{fn:data($opcionesPlazo/nmp2:PagoMensual)}</nmp3:pago>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp2:Frecuencia)
                        then <nmp3:frecuencia>{fn:data($opcionesPlazo/nmp2:Frecuencia)}</nmp3:frecuencia>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp2:Monto)
                        then <nmp3:monto>{fn:data($opcionesPlazo/nmp2:Monto)}</nmp3:monto>
                        else ()
                    }
                    {
                        if ($opcionesPlazo/nmp2:EstadoOfrecimiento)
                        then <nmp3:isInteresado>{fn:data($opcionesPlazo/nmp2:EstadoOfrecimiento)}</nmp3:isInteresado>
                        else ()
                    }
                                    
                </nmp3:opcionesPlazo>
              }  
            </nmp3:listaOpcionesPlazo>
          else ()
          }
        </nmp:oferta>      
    </ns2:getCampaniasClienteResponse>
};

local:func($getCampaniasRes)