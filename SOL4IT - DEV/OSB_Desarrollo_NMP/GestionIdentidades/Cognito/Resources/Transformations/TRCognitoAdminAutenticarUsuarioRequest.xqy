xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $idPoolUsuario as xs:string external;
declare variable $idCliente as xs:string external;
declare variable $nmpAutenticarUsuarioRequest as element() (:: schema-element(nmp:autenticarUsuarioRequest) ::) external;

declare function loc:estructuraCognitoAutenticarUsuarioRequest($idPoolUsuario as xs:string, 
                                                               $idCliente as xs:string, 
                                                               $nmpAutenticarUsuarioRequest as element() (:: schema-element(nmp:autenticarUsuarioRequest) ::)) 
                                                               as element() (:: schema-element(amz:adminInitiateAuthRequest) ::) {
    <amz:adminInitiateAuthRequest>
        <amz:AuthFlow>{fn:data($nmpAutenticarUsuarioRequest/nmp:flujoAutenticacion)}</amz:AuthFlow>
        {
          if(fn:count($nmpAutenticarUsuarioRequest/nmp:parametrosAutenticacion/nmp:parametro) > 0) then
            <amz:AuthParameters>
               <amz:USERNAME>
               {
                  for $parametro in $nmpAutenticarUsuarioRequest/nmp:parametrosAutenticacion/nmp:parametro
                  where $parametro/nmp:nombre = 'USERNAME'
                  return fn:data($parametro/nmp:valor)
               }
               </amz:USERNAME>
               <amz:PASSWORD>
               {
                  for $parametro in $nmpAutenticarUsuarioRequest/nmp:parametrosAutenticacion/nmp:parametro
                  where $parametro/nmp:nombre = 'PASSWORD'
                  return fn:data($parametro/nmp:valor)
                }
               </amz:PASSWORD>
            </amz:AuthParameters>
          else ()
        }
        <amz:ClientId>{fn:data($idCliente)}</amz:ClientId>
        <amz:UserPoolId>{fn:data($idPoolUsuario)}</amz:UserPoolId>
    </amz:adminInitiateAuthRequest>
};

loc:estructuraCognitoAutenticarUsuarioRequest($idPoolUsuario, $idCliente, $nmpAutenticarUsuarioRequest)