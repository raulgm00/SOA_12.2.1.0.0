xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $idPoolUsuario as xs:string external;
declare variable $nmpBorrarUsuarioRequest as element() (:: schema-element(nmp:borrarUsuarioRequest) ::) external;

declare function loc:estructuraCognitoBorrarUsuarioRequest($idPoolUsuario as xs:string, 
                                                           $nmpBorrarUsuarioRequest as element() (:: schema-element(nmp:borrarUsuarioRequest) ::)) 
                                                           as element() (:: schema-element(amz:adminDeleteUserRequest) ::) {
    <amz:adminDeleteUserRequest>
        <amz:Username>{fn:data($nmpBorrarUsuarioRequest/nmp:Username)}</amz:Username>
        <amz:UserPoolId>{fn:data($idPoolUsuario)}</amz:UserPoolId>
    </amz:adminDeleteUserRequest>
};

loc:estructuraCognitoBorrarUsuarioRequest($idPoolUsuario, $nmpBorrarUsuarioRequest)