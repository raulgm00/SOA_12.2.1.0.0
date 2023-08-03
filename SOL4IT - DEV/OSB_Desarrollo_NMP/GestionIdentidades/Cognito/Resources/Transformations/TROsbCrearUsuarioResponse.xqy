xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

import module namespace utl="http://servicios.montedepiedad.com.mx/NMP/Transformations/UtilidadesFecha" at "../../../../Common/XQ/UtilidadServiciosAmazonXQ.xqy";

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $amzAdminCreateUserResponse as element() (:: schema-element(amz:adminCreateUserResponse) ::) external;
declare variable $amzDiferenciaHorario as xs:int external;

declare function loc:estructuraNmpCrearUsuarioResponse($amzDiferenciaHorario as xs:int, $amzAdminCreateUserResponse as element() (:: schema-element(amz:adminCreateUserResponse) ::)) as element() (:: schema-element(nmp:crearUsuarioResponse) ::) {
    <nmp:crearUsuarioResponse>
        <nmp:informacionUsuario>
          {
            if(fn:count($amzAdminCreateUserResponse/amz:User/amz:Attributes) > 0) then
              <nmp:atributos>
              {
                for $Attributes in $amzAdminCreateUserResponse/amz:User/amz:Attributes
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
            if (fn:exists($amzAdminCreateUserResponse/amz:User/amz:Enabled)) then
              <nmp:esActivado>{fn:data($amzAdminCreateUserResponse/amz:User/amz:Enabled)}</nmp:esActivado>
            else ()
          }
          {
            if(fn:count($amzAdminCreateUserResponse/amz:User/amz:MFAOptions) > 0) then
              <nmp:MFAOpciones>
              {
                for $MFAOptions in $amzAdminCreateUserResponse/amz:User/amz:MFAOptions
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
            if(fn:exists($amzAdminCreateUserResponse/amz:User/amz:UserCreateDate)) then
              if(fn:empty($amzAdminCreateUserResponse/amz:User/amz:UserCreateDate/text())) then ()
              else <nmp:fechaCreacion>{utl:restarHorasEnFechaHora(utl:obtenerFechaDeTimestamp(utl:obtenerIntegerDeNumExp($amzAdminCreateUserResponse/amz:User/amz:UserCreateDate)), $amzDiferenciaHorario)}</nmp:fechaCreacion> 
            else ()
          }
          {
            if(fn:exists($amzAdminCreateUserResponse/amz:User/amz:UserLastModifiedDate)) then
              if(fn:empty($amzAdminCreateUserResponse/amz:User/amz:UserLastModifiedDate/text())) then ()
              else <nmp:fechaUltimaModificacion>{utl:restarHorasEnFechaHora(utl:obtenerFechaDeTimestamp(utl:obtenerIntegerDeNumExp($amzAdminCreateUserResponse/amz:User/amz:UserLastModifiedDate)), $amzDiferenciaHorario)}</nmp:fechaUltimaModificacion>
            else ()
          }
          {
            if(fn:exists($amzAdminCreateUserResponse/amz:User/amz:Username)) then
              if(fn:empty($amzAdminCreateUserResponse/amz:User/amz:Username/text())) then ()
              else <nmp:usuario>{fn:data($amzAdminCreateUserResponse/amz:User/amz:Username)}</nmp:usuario>
            else ()
          }
          {
            if(fn:exists($amzAdminCreateUserResponse/amz:User/amz:UserStatus)) then
              if(fn:empty($amzAdminCreateUserResponse/amz:User/amz:UserStatus/text())) then ()
              else <nmp:estadoUsuario>{fn:data($amzAdminCreateUserResponse/amz:User/amz:UserStatus)}</nmp:estadoUsuario>
            else ()
          }
        </nmp:informacionUsuario>
    </nmp:crearUsuarioResponse>
};

loc:estructuraNmpCrearUsuarioResponse($amzDiferenciaHorario, $amzAdminCreateUserResponse)