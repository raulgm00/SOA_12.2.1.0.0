xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmpc="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../../../../GestionIdentidades/Cognito/Resources/Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPUsuariosExternos";
(:: import schema at "../Schemas/NMPAdminCuentasExternasSvcSXD.xsd" ::)

declare namespace lc="http://www.w3.org/2005/xquery-local-functions";

declare variable $crearCuentaUsuarioDonatarioReq as element() (:: schema-element(nmp:registrarCuentaRequest) ::) external;
declare variable $contrasenaTemporal as xs:string external;

declare function lc:autenticacionInicialUsuarioCognitoReq($contrasenaTemporal as xs:string, $crearCuentaUsuarioDonatarioReq as element() (:: schema-element(nmp:registrarCuentaRequest) ::)) as element() (:: schema-element(nmpc:autenticarUsuarioRequest) ::) {
    <nmpc:autenticarUsuarioRequest>
        <nmpc:flujoAutenticacion>ADMIN_NO_SRP_AUTH</nmpc:flujoAutenticacion>
        <nmpc:parametrosAutenticacion>
            <nmpc:parametro>
                <nmpc:nombre>USERNAME</nmpc:nombre>
                <nmpc:valor>{fn:data($crearCuentaUsuarioDonatarioReq/nmp:cuenta/nmp:alias)}</nmpc:valor>
            </nmpc:parametro>
            <nmpc:parametro>
                <nmpc:nombre>PASSWORD</nmpc:nombre>
                <nmpc:valor>{fn:data($contrasenaTemporal)}</nmpc:valor>
            </nmpc:parametro>
        </nmpc:parametrosAutenticacion>
    </nmpc:autenticarUsuarioRequest>
};

lc:autenticacionInicialUsuarioCognitoReq($contrasenaTemporal, $crearCuentaUsuarioDonatarioReq)