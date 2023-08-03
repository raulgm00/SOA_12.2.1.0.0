xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

import module namespace utl="http://servicios.montedepiedad.com.mx/NMP/Transformations/UtilidadesFecha" at "../../../../Common/XQ/UtilidadServiciosAmazonXQ.xqy";

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $amzAdminRespondToAuthChallengeResponse as element() (:: schema-element(amz:adminRespondToAuthChallengeResponse) ::) external;

declare function loc:estructuraNmpCambiosParamAutResponse($amzAdminRespondToAuthChallengeResponse as element() (:: schema-element(amz:adminRespondToAuthChallengeResponse) ::)) as element() (:: schema-element(nmp:actualizarParamAutenticacionResponse) ::) {
    <nmp:actualizarParamAutenticacionResponse>
        <nmp:resultadoAutenticacion>
            {
                if(fn:exists($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:AccessToken)) then
                    if (fn:empty($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:AccessToken/text())) then ()
                    else <nmp:tokenAcceso>{fn:data($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:AccessToken)}</nmp:tokenAcceso>
                else ()
            }
            {
                if(fn:exists($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:ExpiresIn)) then
                    if (fn:empty($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:ExpiresIn/text())) then ()
                    else <nmp:periodoExpiracion>{utl:obtenerIntegerDeNumExp($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:ExpiresIn/text())}</nmp:periodoExpiracion>
                else ()
            }
            {
                if(fn:exists($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:IdToken)) then
                    if (fn:empty($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:IdToken/text())) then ()
                    else <nmp:idToken>{fn:data($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:IdToken)}</nmp:idToken>
                else ()
            }
            {
                if (fn:exists($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:NewDeviceMetadata)) then
                    <nmp:nuevoDatoDispositivo>
                    {
                        if ($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:NewDeviceMetadata/amz:DeviceGroupKey)
                        then <nmp:claveGrupoDispositivo>{fn:data($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:NewDeviceMetadata/amz:DeviceGroupKey)}</nmp:claveGrupoDispositivo>
                        else ()
                    }
                    {
                        if ($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:NewDeviceMetadata/amz:DeviceKey)
                        then <nmp:claveDispositivo>{fn:data($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:NewDeviceMetadata/amz:DeviceKey)}</nmp:claveDispositivo>
                        else ()
                    }</nmp:nuevoDatoDispositivo>
                else ()
            }
            {
                if(fn:exists($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:RefreshToken)) then
                    if (fn:empty($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:RefreshToken/text())) then ()
                    else <nmp:tokenActualizado>{fn:data($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:RefreshToken)}</nmp:tokenActualizado>
                else ()
            }
            {
                if(fn:exists($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:TokenType)) then
                    if (fn:empty($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:TokenType/text())) then ()
                    else <nmp:tipoToken>{fn:data($amzAdminRespondToAuthChallengeResponse/amz:AuthenticationResult/amz:TokenType)}</nmp:tipoToken>
                else ()
            }
        </nmp:resultadoAutenticacion>
        <nmp:informacionCambio>
            <nmp:nombreCambio>{fn:data($amzAdminRespondToAuthChallengeResponse/amz:ChallengeName)}</nmp:nombreCambio>
            <nmp:parametrosCambio>
                <nmp:parametro>
                    <nmp:nombre/>
                    <nmp:valor/>
                </nmp:parametro>
            </nmp:parametrosCambio>
            <nmp:sesion>{fn:data($amzAdminRespondToAuthChallengeResponse/amz:Session)}</nmp:sesion>
        </nmp:informacionCambio>
    </nmp:actualizarParamAutenticacionResponse>
};

loc:estructuraNmpCambiosParamAutResponse($amzAdminRespondToAuthChallengeResponse)