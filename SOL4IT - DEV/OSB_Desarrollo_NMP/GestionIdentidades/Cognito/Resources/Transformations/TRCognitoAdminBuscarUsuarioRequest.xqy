xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $idPoolUsuario as xs:string external;
declare variable $nmpBuscarUsuarioRequest as element() (:: schema-element(nmp:buscarUsuarioRequest) ::) external;

declare function loc:estructuraCognitoBuscarUsuarioRequest($idPoolUsuario as xs:string, 
                                                           $nmpDesactivarUsuarioRequest as element() (:: schema-element(nmp:buscarUsuarioRequest) ::)) 
                                                           as element() (:: schema-element(amz:adminGetUserRequest) ::) {
    <amz:adminGetUserRequest>
        <amz:Username>{fn:data($nmpBuscarUsuarioRequest/nmp:Username)}</amz:Username>
        <amz:UserPoolId>{fn:data($idPoolUsuario)}</amz:UserPoolId>
    </amz:adminGetUserRequest>
};

loc:estructuraCognitoBuscarUsuarioRequest($idPoolUsuario, $nmpBuscarUsuarioRequest)