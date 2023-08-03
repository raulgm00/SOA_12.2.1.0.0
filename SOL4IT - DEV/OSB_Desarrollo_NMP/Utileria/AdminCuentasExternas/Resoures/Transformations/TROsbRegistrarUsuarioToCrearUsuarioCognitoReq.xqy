xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace nmpc="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPAdministradorIdentidades";
(:: import schema at "../../../../GestionIdentidades/Cognito/Resources/Schemas/NMPAdministradorIdentidadesSvcXSD.xsd" ::)
declare namespace nmp="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPUsuariosExternos";
(:: import schema at "../Schemas/NMPAdminCuentasExternasSvcSXD.xsd" ::)

import module namespace utl="http://servicios.montedepiedad.com.mx/NMP/Transformations/UtilidadesFecha" at "../../../../Common/XQ/UtilidadServiciosAmazonXQ.xqy";

declare namespace lc="http://www.w3.org/2005/xquery-local-functions";

declare variable $crearCuentaUsuarioDonatarioReq as element() (:: schema-element(nmp:registrarCuentaRequest) ::) external;
declare variable $contrasenaTemporal as xs:string external;

declare function lc:crearCuentaUsuarioCognitoReq($contrasenaTemporal as xs:string, $crearCuentaUsuarioDonatarioReq as element() (:: schema-element(nmp:registrarCuentaRequest) ::)) as element() (:: schema-element(nmpc:crearUsuarioRequest) ::) {
    <nmpc:crearUsuarioRequest>
        <nmpc:forzarCreacionAlias>{fn:true()}</nmpc:forzarCreacionAlias>
        <nmpc:accionNotificacion>SUPPRESS</nmpc:accionNotificacion>
        <nmpc:contrasenaTemporal>{fn:data($contrasenaTemporal)}</nmpc:contrasenaTemporal>
        <nmpc:atributosUsuario>
            {
                if (fn:exists($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:nombre) = fn:true()) then
                    if (fn:empty($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:nombre/text()) = fn:true()) then ()
                    else 
                        <nmpc:atributo>
                            <nmpc:nombre>custom:nombre</nmpc:nombre>
                            <nmpc:valor>{fn:data($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:nombre)}</nmpc:valor>
                        </nmpc:atributo>
                else ()
            }
            {
                if (fn:exists($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:apellidoPaterno) = fn:true()) then
                    if (fn:empty($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:apellidoPaterno/text()) = fn:true()) then ()
                    else 
                        <nmpc:atributo>
                           <nmpc:nombre>custom:apellidoPaterno</nmpc:nombre>
                           <nmpc:valor>{fn:data($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:apellidoPaterno)}</nmpc:valor>
                        </nmpc:atributo>
                else ()
            }
            {
                if (fn:exists($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:apellidoMaterno) = fn:true()) then
                    if (fn:empty($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:apellidoMaterno/text()) = fn:true()) then ()
                    else 
                         <nmpc:atributo>
                           <nmpc:nombre>custom:apellidoMaterno</nmpc:nombre>
                           <nmpc:valor>{fn:data($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:apellidoMaterno)}</nmpc:valor>
                        </nmpc:atributo>
                else ()
            }
            {
                if (fn:exists($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:rfc) = fn:true()) then
                    if (fn:empty($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:rfc/text()) = fn:true()) then ()
                    else 
                         <nmpc:atributo>
                           <nmpc:nombre>custom:RFC</nmpc:nombre>
                           <nmpc:valor>{fn:data($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:rfc)}</nmpc:valor>
                        </nmpc:atributo>
                else ()
            }
            {
                if (fn:exists($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:nombreInstitucion) = fn:true()) then
                    if (fn:empty($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:nombreInstitucion/text()) = fn:true()) then ()
                    else 
                         <nmpc:atributo>
                           <nmpc:nombre>custom:nombreInstitucion</nmpc:nombre>
                           <nmpc:valor>{fn:data($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:nombreInstitucion)}</nmpc:valor>
                        </nmpc:atributo>
                else ()
            }
            {
                if (fn:exists($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:figuraJuridica) = fn:true()) then
                    if (fn:empty($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:figuraJuridica/text()) = fn:true()) then ()
                    else 
                         <nmpc:atributo>
                           <nmpc:nombre>custom:figuraJuridica</nmpc:nombre>
                           <nmpc:valor>{fn:data($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:figuraJuridica)}</nmpc:valor>
                        </nmpc:atributo>
                else ()
            }
            {
                if (fn:exists($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:estado) = fn:true()) then
                    if (fn:empty($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:estado/text()) = fn:true()) then ()
                    else 
                         <nmpc:atributo>
                           <nmpc:nombre>custom:estatus</nmpc:nombre>
                           <nmpc:valor>{fn:data($crearCuentaUsuarioDonatarioReq/nmp:usuario/nmp:estado)}</nmpc:valor>
                        </nmpc:atributo>
                else ()
            }
             <nmpc:atributo>
               <nmpc:nombre>email_verified</nmpc:nombre>
               <nmpc:valor>{fn:true()}</nmpc:valor>
            </nmpc:atributo>
             <nmpc:atributo>
               <nmpc:nombre>email</nmpc:nombre>
               <nmpc:valor>{fn:data($crearCuentaUsuarioDonatarioReq/nmp:cuenta/nmp:correo)}</nmpc:valor>
            </nmpc:atributo>
             <nmpc:atributo>
               <nmpc:nombre>updated_at</nmpc:nombre>
               <nmpc:valor>{utl:obtenerTimestampDeFecha(utl:agregarHorasEnFechaHora($crearCuentaUsuarioDonatarioReq/nmp:cuenta/nmp:fechaActualizacion, xs:int('5')))}</nmpc:valor>
            </nmpc:atributo>
        </nmpc:atributosUsuario>
        <nmpc:usuario>{fn:data($crearCuentaUsuarioDonatarioReq/nmp:cuenta/nmp:alias)}</nmpc:usuario>
        <nmpc:DatosValidacion/>
    </nmpc:crearUsuarioRequest>
};

lc:crearCuentaUsuarioCognitoReq($contrasenaTemporal, $crearCuentaUsuarioDonatarioReq)