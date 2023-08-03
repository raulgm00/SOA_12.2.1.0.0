xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $idPoolUsuario as xs:string external;
declare variable $idCliente as xs:string external;
declare variable $nmpCambiosAutenticacionRequest as element() (:: schema-element(nmp:actualizarParamAutenticacionRequest) ::) external;

declare function loc:estructuraCognitoCambiosAutenticacionRequest($idPoolUsuario as xs:string, 
                                                                  $idCliente as xs:string, 
                                                                  $nmpCambiosAutenticacionRequest as element() (:: schema-element(nmp:actualizarParamAutenticacionRequest) ::)) 
                                                                  as element() (:: schema-element(amz:adminRespondToAuthChallengeRequest) ::) {
    <amz:adminRespondToAuthChallengeRequest>
        <amz:ChallengeName>{fn:data($nmpCambiosAutenticacionRequest/nmp:nombreCambio)}</amz:ChallengeName>
        <amz:ChallengeResponses>
            <amz:USERNAME>
            {              
              for $parametro in $nmpCambiosAutenticacionRequest/nmp:respuestaCambios/nmp:parametro
              where $parametro/nmp:nombre = 'USERNAME'
              return fn:data($parametro/nmp:valor)
            }
            </amz:USERNAME>
            <amz:NEW_PASSWORD>
            {
              for $parametro in $nmpCambiosAutenticacionRequest/nmp:respuestaCambios/nmp:parametro
              where $parametro/nmp:nombre = 'NEW_PASSWORD'
              return fn:data($parametro/nmp:valor)
            }
            </amz:NEW_PASSWORD>
        </amz:ChallengeResponses>
        <amz:ClientId>{fn:data($idCliente)}</amz:ClientId>
        {
            if (fn:exists($nmpCambiosAutenticacionRequest/nmp:Sesion)) then
                if (fn:empty($nmpCambiosAutenticacionRequest/nmp:Sesion/text())) then ()
                else <amz:Session>{fn:data($nmpCambiosAutenticacionRequest/nmp:Sesion)}</amz:Session>
            else ()
        }
        <amz:UserPoolId>{fn:data($idPoolUsuario)}</amz:UserPoolId>
    </amz:adminRespondToAuthChallengeRequest>
};

loc:estructuraCognitoCambiosAutenticacionRequest($idPoolUsuario, $idCliente, $nmpCambiosAutenticacionRequest)