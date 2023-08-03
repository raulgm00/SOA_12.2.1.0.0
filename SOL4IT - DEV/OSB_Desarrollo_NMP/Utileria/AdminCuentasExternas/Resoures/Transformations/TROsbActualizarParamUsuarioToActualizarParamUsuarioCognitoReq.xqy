xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmpc="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../../../../GestionIdentidades/Cognito/Resources/Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

declare namespace lc="http://www.w3.org/2005/xquery-local-functions";

declare variable $aliasUsuario as xs:string external;
declare variable $contrasenaFinal as xs:string external;
declare variable $autenticarUsuarioCognitoResponse as element() (:: schema-element(nmpc:autenticarUsuarioResponse) ::) external;

declare function lc:actualizarParamUsuarioCognitoReq($aliasUsuario as xs:string, 
                                                     $contrasenaFinal as xs:string, 
                                                     $autenticarUsuarioCognitoResponse as element() (:: schema-element(nmpc:autenticarUsuarioResponse) ::)) 
                                                     as element() (:: schema-element(nmpc:actualizarParamAutenticacionRequest) ::) {
    <nmpc:actualizarParamAutenticacionRequest>
        <nmpc:nombreCambio>{fn:data($autenticarUsuarioCognitoResponse/nmpc:informacionCambio/nmpc:nombreCambio)}</nmpc:nombreCambio>
        <nmpc:respuestaCambios>
            <nmpc:parametro>
                <nmpc:nombre>USERNAME</nmpc:nombre>
                <nmpc:valor>{fn:data($aliasUsuario)}</nmpc:valor>
            </nmpc:parametro>
             <nmpc:parametro>
                <nmpc:nombre>NEW_PASSWORD</nmpc:nombre>
                <nmpc:valor>{fn:data($contrasenaFinal)}</nmpc:valor>
            </nmpc:parametro>
        </nmpc:respuestaCambios>
        <nmpc:Sesion>{fn:data($autenticarUsuarioCognitoResponse/nmpc:informacionCambio/nmpc:sesion)}</nmpc:Sesion>
    </nmpc:actualizarParamAutenticacionRequest>
};

lc:actualizarParamUsuarioCognitoReq($aliasUsuario, $contrasenaFinal, $autenticarUsuarioCognitoResponse)