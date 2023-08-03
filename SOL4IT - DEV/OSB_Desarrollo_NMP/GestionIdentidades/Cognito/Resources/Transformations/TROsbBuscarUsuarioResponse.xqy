xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

import module namespace utl="http://servicios.montedepiedad.com.mx/NMP/Transformations/UtilidadesFecha" at "../../../../Common/XQ/UtilidadServiciosAmazonXQ.xqy";

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $amzAdminGetUserResponse as element() (:: schema-element(amz:adminGetUserResponse) ::) external;
declare variable $amzDiferenciaHorario as xs:int external;

declare function loc:estructuraNmpCrearUsuarioResponse($amzDiferenciaHorario as xs:int, $amzAdminGetUserResponse as element() (:: schema-element(amz:adminGetUserResponse) ::)) as element() (:: schema-element(nmp:buscarUsuarioResponse) ::) {
    <nmp:buscarUsuarioResponse>
        <nmp:informacionUsuario>
          {
            if(fn:count($amzAdminGetUserResponse/amz:UserAttributes) > 0) then
              <nmp:atributos>
              {
                for $Attributes in $amzAdminGetUserResponse/amz:UserAttributes
                return 
                  <nmp:atributo>
                      <nmp:nombre>{fn:data($Attributes/amz:Name)}</nmp:nombre>
                      <nmp:valor>{fn:data($Attributes/amz:Value)}</nmp:valor>
                  </nmp:atributo>
              }
              </nmp:atributos>
            else ()
          }
          {
            if (fn:exists($amzAdminGetUserResponse/amz:Enabled)) then
              <nmp:esActivado>{fn:data($amzAdminGetUserResponse/amz:Enabled)}</nmp:esActivado>
            else ()
          }
          {
            if(fn:count($amzAdminGetUserResponse/amz:MFAOptions) > 0) then
              <nmp:MFAOpciones>
              {
                for $MFAOptions in $amzAdminGetUserResponse/amz:MFAOptions
                return 
                  <nmp:opcion>
                      <nmp:atributo>{fn:data($MFAOptions/amz:AttributeName)}</nmp:atributo>
                      <nmp:modoNotificacion>{fn:data($MFAOptions/amz:DeliveryMedium)}</nmp:modoNotificacion>
                  </nmp:opcion>
              }
              </nmp:MFAOpciones>
            else ()
          }
          {
            if(fn:exists($amzAdminGetUserResponse/amz:UserCreateDate)) then
              if(fn:empty($amzAdminGetUserResponse/amz:UserCreateDate/text())) then ()
              else <nmp:fechaCreacion>{utl:restarHorasEnFechaHora(utl:obtenerFechaDeTimestamp(utl:obtenerIntegerDeNumExp($amzAdminGetUserResponse/amz:UserCreateDate)), $amzDiferenciaHorario)}</nmp:fechaCreacion> 
            else ()
          }
          {
            if(fn:exists($amzAdminGetUserResponse/amz:UserLastModifiedDate)) then
              if(fn:empty($amzAdminGetUserResponse/amz:UserLastModifiedDate/text())) then ()
              else <nmp:fechaUltimaModificacion>{utl:restarHorasEnFechaHora(utl:obtenerFechaDeTimestamp(utl:obtenerIntegerDeNumExp($amzAdminGetUserResponse/amz:UserLastModifiedDate)), $amzDiferenciaHorario)}</nmp:fechaUltimaModificacion>
            else ()
          }
          {
            if(fn:exists($amzAdminGetUserResponse/amz:Username)) then
              if(fn:empty($amzAdminGetUserResponse/amz:Username/text())) then ()
              else <nmp:usuario>{fn:data($amzAdminGetUserResponse/amz:Username)}</nmp:usuario>
            else ()
          }
          {
            if(fn:exists($amzAdminGetUserResponse/amz:UserStatus)) then
              if(fn:empty($amzAdminGetUserResponse/amz:UserStatus/text())) then ()
              else <nmp:estadoUsuario>{fn:data($amzAdminGetUserResponse/amz:UserStatus)}</nmp:estadoUsuario>
            else ()
          }
        </nmp:informacionUsuario>
    </nmp:buscarUsuarioResponse>
};

loc:estructuraNmpCrearUsuarioResponse($amzDiferenciaHorario, $amzAdminGetUserResponse)