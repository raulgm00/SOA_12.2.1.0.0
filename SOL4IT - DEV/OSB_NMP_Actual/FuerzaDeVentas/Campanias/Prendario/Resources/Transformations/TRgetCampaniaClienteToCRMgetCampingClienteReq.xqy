xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasPrendario";
(:: import schema at "../Schemas/NMPCampaniasPrendarioSvcElementosXSD.xsd" ::)
declare namespace ns2="http://tempuri.org/";
(:: import schema at "../Schemas/CRMCampaniasClienteElementosXSD.xsd" ::)

declare namespace bus = "http://schemas.datacontract.org/2004/07/BusinessTypes.Request.Campaigns";

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasPrendarioT";

declare variable $getCampaniaClienteRequest as element() (:: schema-element(ns1:getCampaniasClienteRequest) ::) external;

declare function local:func($getCampaniaClienteRequest as element() (:: schema-element(ns1:getCampaniasClienteRequest) ::)) as element() (:: schema-element(ns2:GetCampaignsCliente) ::) {
    <ns2:GetCampaignsCliente>
        <ns2:Request>
             <bus:FuenteDato>{fn:string('OBR-SIVA3')}</bus:FuenteDato>
               {
                if ($getCampaniaClienteRequest/nmp:idCliente) then
                <bus:IdCliente>{fn:data($getCampaniaClienteRequest/nmp:idCliente)}</bus:IdCliente>
                  else
                  ()
             }
              {
                if ($getCampaniaClienteRequest/nmp:numCredencial) then
                  <bus:CredencialNMP>{fn:data($getCampaniaClienteRequest/nmp:numCredencial)}</bus:CredencialNMP>
                  else
                  ()
            }
        </ns2:Request>
    </ns2:GetCampaignsCliente>
};

local:func($getCampaniaClienteRequest)