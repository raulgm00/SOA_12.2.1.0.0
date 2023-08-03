xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="urn:mx.com.nmp.midas";
(:: import schema at "../../../MIDAS/Resources/WSDL/MidasUsuarioPerfilSvcWSDL.wsdl" ::)
declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPIdentidades";
(:: import schema at "../Schemas/NMPGestionIdentidades.xsd" ::)
declare namespace ns3="http://nmpremotelogin.schema.nmp.servicios.montedepiedad.com.mx";
(:: import schema at "../../../MIDAS/Resources/WSDL/MidasUsuarioPerfilSvcWSDL.wsdl" ::)

declare variable $responseLogin as element() (:: schema-element(ns1:loginResponse) ::) external;

declare function local:func($responseLogin as element() (:: schema-element(ns1:loginResponse) ::)) as element() (:: schema-element(ns2:ObtenerPerfilUsuarioResponse) ::) {
    <ns2:ObtenerPerfilUsuarioResponse>
        {
            if ($responseLogin/ns1:return/ns3:expendios)
            then <ns2:expendios>
                {
                    for $ExpendioType in $responseLogin/ns1:return/ns3:expendios/ns3:ExpendioType
                    return 
                    <ns2:expendio>
                        {
                            if ($ExpendioType/ns3:description)
                            then <ns2:description>{fn:data($ExpendioType/ns3:description)}</ns2:description>
                            else ()
                        }
                        {
                            if ($ExpendioType/ns3:id)
                            then <ns2:id>{fn:data($ExpendioType/ns3:id)}</ns2:id>
                            else ()
                        }
                        {
                            if ($ExpendioType/ns3:numero)
                            then <ns2:numero>{fn:data($ExpendioType/ns3:numero)}</ns2:numero>
                            else ()
                        }</ns2:expendio>
                }</ns2:expendios>
            else ()
        }
        {
            if ($responseLogin/ns1:return/ns3:perfiles)
            then <ns2:perfiles>
                {
                    for $PerfilType in $responseLogin/ns1:return/ns3:perfiles/ns3:PerfilType
                    return 
                    <ns2:perfill>
                        {
                            if ($PerfilType/ns3:description)
                            then <ns2:description>{fn:data($PerfilType/ns3:description)}</ns2:description>
                            else ()
                        }
                        {
                            if ($PerfilType/ns3:id)
                            then <ns2:id>{fn:data($PerfilType/ns3:id)}</ns2:id>
                            else ()
                        }</ns2:perfill>
                }</ns2:perfiles>
            else ()
        }
        {
            if ($responseLogin/ns1:return/ns3:sucursal)
            then <ns2:sucursal>
                {
                    if ($responseLogin/ns1:return/ns3:sucursal/ns3:description)
                    then <ns2:description>{fn:data($responseLogin/ns1:return/ns3:sucursal/ns3:description)}</ns2:description>
                    else ()
                }
                {
                    if ($responseLogin/ns1:return/ns3:sucursal/ns3:id)
                    then <ns2:id>{fn:data($responseLogin/ns1:return/ns3:sucursal/ns3:id)}</ns2:id>
                    else ()
                }</ns2:sucursal>
            else ()
        }
        {
            if ($responseLogin/ns1:return/ns3:usuario)
            then <ns2:usuario>
                {
                    if ($responseLogin/ns1:return/ns3:usuario/ns3:id)
                    then <ns2:id>{fn:data($responseLogin/ns1:return/ns3:usuario/ns3:id)}</ns2:id>
                    else ()
                }
                {
                    if ($responseLogin/ns1:return/ns3:usuario/ns3:name)
                    then <ns2:name>{fn:data($responseLogin/ns1:return/ns3:usuario/ns3:name)}</ns2:name>
                    else ()
                }</ns2:usuario>
            else ()
        }
    </ns2:ObtenerPerfilUsuarioResponse>
};

local:func($responseLogin)