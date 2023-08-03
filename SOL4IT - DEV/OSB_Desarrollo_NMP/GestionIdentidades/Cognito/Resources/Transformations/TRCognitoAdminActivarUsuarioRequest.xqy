xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $idPoolUsuario as xs:string external;
declare variable $nmpActivarUsuarioRequest as element() (:: schema-element(nmp:activarUsuarioRequest) ::) external;

declare function loc:estructuraCognitoActivarUsuarioRequest($idPoolUsuario as xs:string, 
                                                           $nmpActivarUsuarioRequest as element() (:: schema-element(nmp:activarUsuarioRequest) ::)) 
                                                           as element() (:: schema-element(amz:adminEnableUserRequest) ::) {
    <amz:adminEnableUserRequest>
        <amz:Username>{fn:data($nmpActivarUsuarioRequest/nmp:Username)}</amz:Username>
        <amz:UserPoolId>{fn:data($idPoolUsuario)}</amz:UserPoolId>
    </amz:adminEnableUserRequest>
};

loc:estructuraCognitoActivarUsuarioRequest($idPoolUsuario, $nmpActivarUsuarioRequest)