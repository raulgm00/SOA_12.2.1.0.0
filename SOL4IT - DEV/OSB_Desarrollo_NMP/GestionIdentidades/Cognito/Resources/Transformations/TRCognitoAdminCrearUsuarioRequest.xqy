xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace amz="http://servicios.montedepiedad.com.mx/NMP/Schema/AMZCognitoProveedorIdentidad";
(:: import schema at "../Schemas/AMZCognitoProveedorIdentidadNXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)

import module namespace utl="http://servicios.montedepiedad.com.mx/NMP/Transformations/UtilidadesFecha" at "../../../../Common/XQ/UtilidadServiciosAmazonXQ.xqy";

declare namespace loc="http://servicios.montedepiedad.com.mx/NMP/Transformations/AdministradorIdentidades";

declare variable $nmpCrearUsuarioRequest as element() (:: schema-element(nmp:crearUsuarioRequest) ::) external;
declare variable $idPoolUsuario as xs:string external;

declare function loc:estructuraCognitoCrearUsuarioRequest($idPoolUsuario as xs:string, $nmpCrearUsuarioRequest as element() (:: schema-element(nmp:crearUsuarioRequest) ::)) as element() (:: schema-element(amz:adminCreateUserRequest) ::) {
    <amz:adminCreateUserRequest>
        {
          if(fn:exists($nmpCrearUsuarioRequest/nmp:modoNotificacion)) then
            if(fn:count($nmpCrearUsuarioRequest/nmp:modoNotificacion/nmp:medio) > 0) then
              for $medio in $nmpCrearUsuarioRequest/nmp:modoNotificacion/nmp:medio
              return 
              <amz:DesiredDeliveryMediums>{fn:data($nmpCrearUsuarioRequest/nmp:modoNotificacion/nmp:medio)}</amz:DesiredDeliveryMediums>
            else ()
          else ()
        }
        <amz:ForceAliasCreation>{fn:data($nmpCrearUsuarioRequest/nmp:forzarCreacionAlias)}</amz:ForceAliasCreation>
        <amz:MessageAction>{fn:data($nmpCrearUsuarioRequest/nmp:accionNotificacion)}</amz:MessageAction>
        {
            if (fn:exists($nmpCrearUsuarioRequest/nmp:contrasenaTemporal)) then 
              if(fn:empty($nmpCrearUsuarioRequest/nmp:contrasenaTemporal/text())) then ()
              else <amz:TemporaryPassword>{fn:data($nmpCrearUsuarioRequest/nmp:contrasenaTemporal)}</amz:TemporaryPassword>
            else ()
        }
        {
          if(fn:exists($nmpCrearUsuarioRequest/nmp:atributosUsuario)) then
            if(fn:count($nmpCrearUsuarioRequest/nmp:atributosUsuario/nmp:atributo) > 0) then
              for $atributo in $nmpCrearUsuarioRequest/nmp:atributosUsuario/nmp:atributo
              return 
              <amz:UserAttributes>
                  <amz:Name>{fn:data($atributo/nmp:nombre)}</amz:Name>
                  <amz:Value>{fn:data($atributo/nmp:valor)}</amz:Value>
              </amz:UserAttributes>
            else ()
          else ()
        }
        <amz:Username>{fn:data($nmpCrearUsuarioRequest/nmp:usuario)}</amz:Username>
        <amz:UserPoolId>{fn:data($idPoolUsuario)}</amz:UserPoolId>
        {
          if(fn:exists($nmpCrearUsuarioRequest/nmp:DatosValidacion)) then
            if(fn:count($nmpCrearUsuarioRequest/nmp:DatosValidacion/nmp:validar) > 0) then
              for $validar in $nmpCrearUsuarioRequest/nmp:DatosValidacion/nmp:validar
              return 
                <amz:ValidationData>
                  <amz:Name>{fn:data($validar/nmp:nombre)}</amz:Name>
                  <amz:Value>{fn:data($validar/nmp:valor)}</amz:Value>
                </amz:ValidationData>
            else ()
          else ()
        }
    </amz:adminCreateUserRequest>
};

loc:estructuraCognitoCrearUsuarioRequest($idPoolUsuario, $nmpCrearUsuarioRequest)