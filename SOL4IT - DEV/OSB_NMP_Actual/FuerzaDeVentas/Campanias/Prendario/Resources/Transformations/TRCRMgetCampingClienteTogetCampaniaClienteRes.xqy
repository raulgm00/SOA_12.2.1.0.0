xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasPrendario";
(:: import schema at "../Schemas/NMPCampaniasPrendarioSvcElementosXSD.xsd" ::)
declare namespace ns2="http://tempuri.org/";
(:: import schema at "../Schemas/CRMCampaniasClienteElementosXSD.xsd" ::)

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasPrendarioT";

declare namespace cam = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Campania";

declare namespace bus = "http://schemas.datacontract.org/2004/07/BusinessTypes";

declare namespace bus1 = "http://schemas.datacontract.org/2004/07/BusinessTypes.Response.Campaigns";

declare variable $GetCampaignsClienteResponse as element() (:: schema-element(ns2:GetCampaignsClienteResponse) ::) external;

declare function local:func($GetCampaignsClienteResponse as element() (:: schema-element(ns2:GetCampaignsClienteResponse) ::)) as element() (:: schema-element(ns1:getCampaniasClienteResponse) ::) {
    <ns1:getCampaniasClienteResponse>
        <nmp:listaCampania>
            {
                for $campaign in $GetCampaignsClienteResponse/ns2:GetCampaignsClienteResult/bus:DetalleRespuesta/bus1:Campanias/bus1:campaign
                return 
                <cam:Campania>
                    {
                        if ($campaign/bus1:IdCampania)
                        then <cam:idCampania>{fn:data($campaign/bus1:IdCampania)}</cam:idCampania>
                        else ()
                    }
                    {
                        if ($campaign/bus1:NombreCampania)
                        then <cam:nombre>{fn:data($campaign/bus1:NombreCampania)}</cam:nombre>
                        else ()
                    }
                    {
                        if ($campaign/bus1:Descripcion)
                        then <cam:descripcion>{fn:data($campaign/bus1:Descripcion)}</cam:descripcion>
                        else ()
                    }</cam:Campania>
            }
        </nmp:listaCampania>
    </ns1:getCampaniasClienteResponse>
};

local:func($GetCampaignsClienteResponse)