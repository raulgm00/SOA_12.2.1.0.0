xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

import module namespace utl="http://servicios.montedepiedad.com.mx/NMP/Transformations/UtilidadesFecha" at "../../../../Common/XQ/UtilidadServiciosAmazonXQ.xqy";

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $amzAdminInitiateAuthResponse as element() (:: schema-element(amz:adminInitiateAuthResponse) ::) external;

declare function loc:estructuraNmpAutenticarUsuarioResponse($amzAdminInitiateAuthResponse as element() (:: schema-element(amz:adminInitiateAuthResponse) ::)) as element() (:: schema-element(nmp:autenticarUsuarioResponse) ::) {
    <nmp:autenticarUsuarioResponse>
        <nmp:resultadoAutenticacion>
            {
              if (fn:exists($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:AccessToken)) then  
                if(fn:empty($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:AccessToken/text())) then ()
                else <nmp:tokenAcceso>{fn:data($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:AccessToken)}</nmp:tokenAcceso>
              else ()
            }
            {
              if (fn:exists($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:ExpiresIn)) then
                if ($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:ExpiresIn/text()) then ()
                else <nmp:periodoExpiracion>{utl:obtenerIntegerDeNumExp($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:ExpiresIn/text())}</nmp:periodoExpiracion>
              else ()
            }
            {
              if (fn:exists($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:IdToken)) then
                if (fn:empty($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:IdToken/text())) then ()
                else <nmp:idToken>{fn:data($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:IdToken)}</nmp:idToken>
              else ()
            }
            {
              if (fn:exists($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:NewDeviceMetadata)) then
                <nmp:nuevoDatoDispositivo>
                {
                  if (fn:exists($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:NewDeviceMetadata/amz:DeviceGroupKey)) then 
                    if (fn:empty($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:NewDeviceMetadata/amz:DeviceGroupKey/text())) then ()
                    else <nmp:claveGrupoDispositivo>{fn:data($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:NewDeviceMetadata/amz:DeviceGroupKey)}</nmp:claveGrupoDispositivo>
                  else ()
                }
                {
                  if (fn:exists($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:NewDeviceMetadata/amz:DeviceKey)) then
                    if (fn:empty($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:NewDeviceMetadata/amz:DeviceKey/text())) then ()
                    else <nmp:claveDispositivo>{fn:data($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:NewDeviceMetadata/amz:DeviceKey)}</nmp:claveDispositivo>
                  else ()
                }
                </nmp:nuevoDatoDispositivo>
                else ()
            }
            {
              if (fn:exists($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:RefreshToken)) then
                if (fn:empty($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:RefreshToken/text())) then ()
                else <nmp:tokenActualizado>{fn:data($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:RefreshToken)}</nmp:tokenActualizado>
              else ()
            }
            {
              if (fn:exists($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:TokenType)) then
                if (fn:empty($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:TokenType/text())) then ()
                else <nmp:tipoToken>{fn:data($amzAdminInitiateAuthResponse/amz:AuthenticationResult/amz:TokenType)}</nmp:tipoToken>
              else ()
            }
        </nmp:resultadoAutenticacion>
        <nmp:informacionCambio>
            <nmp:nombreCambio>{fn:data($amzAdminInitiateAuthResponse/amz:ChallengeName)}</nmp:nombreCambio>
            <nmp:parametrosCambio>
                <nmp:parametro>
                    <nmp:nombre>{fn:node-name($amzAdminInitiateAuthResponse/amz:ChallengeParameters/amz:USER_ID_FOR_SRP)}</nmp:nombre>
                    <nmp:valor>{fn:data($amzAdminInitiateAuthResponse/amz:ChallengeParameters/amz:USER_ID_FOR_SRP)}</nmp:valor>
                    <nmp:atributosUsuario>
                    {
                      let $atributos := fn:replace(fn:replace(fn:replace($amzAdminInitiateAuthResponse/amz:ChallengeParameters/amz:userAttributes, '\{', ''), '\"', ''), '\}', '')
                      for $atributo in  tokenize($atributos, ',')
                      return
                        <nmp:atributo>
                            <nmp:nombre>{fn:substring-before($atributo, ':')}</nmp:nombre>
                            <nmp:valor>{fn:substring-after($atributo, ':')}</nmp:valor>
                        </nmp:atributo>
                    }
                    </nmp:atributosUsuario>
                </nmp:parametro>
            </nmp:parametrosCambio>
            <nmp:sesion>{fn:data($amzAdminInitiateAuthResponse/amz:Session)}</nmp:sesion>
        </nmp:informacionCambio>
    </nmp:autenticarUsuarioResponse>
};

loc:estructuraNmpAutenticarUsuarioResponse($amzAdminInitiateAuthResponse)