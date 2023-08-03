xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $idPoolUsuario as xs:string external;
declare variable $nmpDesactivarUsuarioRequest as element() (:: schema-element(nmp:desactivarUsuarioRequest) ::) external;

declare function loc:estructuraCognitoDesactivarUsuarioRequest($idPoolUsuario as xs:string, 
                                                           $nmpDesactivarUsuarioRequest as element() (:: schema-element(nmp:desactivarUsuarioRequest) ::)) 
                                                           as element() (:: schema-element(amz:adminDisableUserRequest) ::) {
    <amz:adminDisableUserRequest>
        <amz:Username>{fn:data($nmpDesactivarUsuarioRequest/nmp:Username)}</amz:Username>
        <amz:UserPoolId>{fn:data($idPoolUsuario)}</amz:UserPoolId>
    </amz:adminDisableUserRequest>
};

loc:estructuraCognitoDesactivarUsuarioRequest($idPoolUsuario, $nmpDesactivarUsuarioRequest)