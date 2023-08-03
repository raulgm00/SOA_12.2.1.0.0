xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/EvaluacionCredito";
(:: import schema at "../Schemas/OSBRenovacionCreditoElementosXSD.xsd" ::)
declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/ReglaRenovacionTopUp";
(:: import schema at "../Schemas/BRMReglaRenovacionTopUpXSD.xsd" ::)

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPPersona";

declare namespace nmp1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";

declare namespace nmp2 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCredito";

declare variable $request as element() (:: schema-element(ns1:processCreditoRequest) ::) external;

declare function local:func($request as element() (:: schema-element(ns1:processCreditoRequest) ::)) as element() (:: schema-element(ns2:isRenovacionTopUpMessageRequest) ::) {
    <ns2:isRenovacionTopUpMessageRequest>
        <ns2:cliente>
            {
                if ($request/ns1:cliente/nmp:infoBasica)
                then 
                    <nmp:infoBasica>
                        {
                            if ($request/ns1:cliente/nmp:infoBasica/nmp:genero)
                            then <nmp:genero>{fn:data($request/ns1:cliente/nmp:infoBasica/nmp:genero)}</nmp:genero>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoBasica/nmp:nombre)
                            then <nmp:nombre>{fn:data($request/ns1:cliente/nmp:infoBasica/nmp:nombre)}</nmp:nombre>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoBasica/nmp:apellidoPaterno)
                            then <nmp:apellidoPaterno>{fn:data($request/ns1:cliente/nmp:infoBasica/nmp:apellidoPaterno)}</nmp:apellidoPaterno>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoBasica/nmp:apellidoMaterno)
                            then <nmp:apellidoMaterno>{fn:data($request/ns1:cliente/nmp:infoBasica/nmp:apellidoMaterno)}</nmp:apellidoMaterno>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoBasica/nmp:fechaDeNacimiento)
                            then <nmp:fechaDeNacimiento>{fn:data($request/ns1:cliente/nmp:infoBasica/nmp:fechaDeNacimiento)}</nmp:fechaDeNacimiento>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoBasica/nmp:estadoCivil)
                            then <nmp:estadoCivil>{fn:data($request/ns1:cliente/nmp:infoBasica/nmp:estadoCivil)}</nmp:estadoCivil>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoBasica/nmp:nacionalidad)
                            then <nmp:nacionalidad>{fn:data($request/ns1:cliente/nmp:infoBasica/nmp:nacionalidad)}</nmp:nacionalidad>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoBasica/nmp:RFC)
                            then <nmp:RFC>{fn:data($request/ns1:cliente/nmp:infoBasica/nmp:RFC)}</nmp:RFC>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoBasica/nmp:CURP)
                            then <nmp:CURP>{fn:data($request/ns1:cliente/nmp:infoBasica/nmp:CURP)}</nmp:CURP>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoBasica/nmp:IFE)
                            then <nmp:IFE>{fn:data($request/ns1:cliente/nmp:infoBasica/nmp:IFE)}</nmp:IFE>
                            else ()
                        }
                    </nmp:infoBasica>
                else ()
            }
            {
                if ($request/ns1:cliente/nmp:infoExtendida)
                then 
                    <nmp:infoExtendida>
                        {
                            if ($request/ns1:cliente/nmp:infoExtendida/nmp:numeroDeHijos)
                            then <nmp:numeroDeHijos>{fn:data($request/ns1:cliente/nmp:infoExtendida/nmp:numeroDeHijos)}</nmp:numeroDeHijos>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoExtendida/nmp:numeroDependientes)
                            then <nmp:numeroDependientes>{fn:data($request/ns1:cliente/nmp:infoExtendida/nmp:numeroDependientes)}</nmp:numeroDependientes>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoExtendida/nmp:trabaja)
                            then <nmp:trabaja>{fn:data($request/ns1:cliente/nmp:infoExtendida/nmp:trabaja)}</nmp:trabaja>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoExtendida/nmp:escolaridad)
                            then <nmp:escolaridad>{fn:data($request/ns1:cliente/nmp:infoExtendida/nmp:escolaridad)}</nmp:escolaridad>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoExtendida/nmp:ocupacion)
                            then <nmp:ocupacion>{fn:data($request/ns1:cliente/nmp:infoExtendida/nmp:ocupacion)}</nmp:ocupacion>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoExtendida/nmp:profesion)
                            then <nmp:profesion>{fn:data($request/ns1:cliente/nmp:infoExtendida/nmp:profesion)}</nmp:profesion>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:infoExtendida/nmp:numeroCedulaProfesional)
                            then <nmp:numeroCedulaProfesional>{fn:data($request/ns1:cliente/nmp:infoExtendida/nmp:numeroCedulaProfesional)}</nmp:numeroCedulaProfesional>
                            else ()
                        }
                    </nmp:infoExtendida>
                else ()
            }
            {
                if ($request/ns1:cliente/nmp:Contacto)
                then 
                    <nmp:Contacto>
                        {
                            if ($request/ns1:cliente/nmp:Contacto/nmp:ListaTelefonos)
                            then 
                                <nmp:ListaTelefonos>
                                    {
                                        for $Telefono in $request/ns1:cliente/nmp:Contacto/nmp:ListaTelefonos/nmp:Telefono
                                        return 
                                        <nmp:Telefono>
                                            {
                                                if ($Telefono/nmp:codigoPais)
                                                then <nmp:codigoPais>{fn:data($Telefono/nmp:codigoPais)}</nmp:codigoPais>
                                                else ()
                                            }
                                            {
                                                if ($Telefono/nmp:codigoArea)
                                                then <nmp:codigoArea>{fn:data($Telefono/nmp:codigoArea)}</nmp:codigoArea>
                                                else ()
                                            }
                                            {
                                                if ($Telefono/nmp:numeroTelefonico)
                                                then <nmp:numeroTelefonico>{fn:data($Telefono/nmp:numeroTelefonico)}</nmp:numeroTelefonico>
                                                else ()
                                            }
                                            {
                                                if ($Telefono/nmp:extension)
                                                then <nmp:extension>{fn:data($Telefono/nmp:extension)}</nmp:extension>
                                                else ()
                                            }
                                            {
                                                if ($Telefono/nmp:tipoTelefono)
                                                then <nmp:tipoTelefono>{fn:data($Telefono/nmp:tipoTelefono)}</nmp:tipoTelefono>
                                                else ()
                                            }
                                        </nmp:Telefono>
                                    }
                                </nmp:ListaTelefonos>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:Contacto/nmp:ListaDirecciones)
                            then 
                                <nmp:ListaDirecciones>
                                    {
                                        for $Direccion in $request/ns1:cliente/nmp:Contacto/nmp:ListaDirecciones/nmp:Direccion
                                        return 
                                        <nmp:Direccion>
                                            {
                                                if ($Direccion/nmp:nombreDelaCalle)
                                                then <nmp:nombreDelaCalle>{fn:data($Direccion/nmp:nombreDelaCalle)}</nmp:nombreDelaCalle>
                                                else ()
                                            }
                                            {
                                                if ($Direccion/nmp:numeroExterior)
                                                then <nmp:numeroExterior>{fn:data($Direccion/nmp:numeroExterior)}</nmp:numeroExterior>
                                                else ()
                                            }
                                            {
                                                if ($Direccion/nmp:numeroInterior)
                                                then <nmp:numeroInterior>{fn:data($Direccion/nmp:numeroInterior)}</nmp:numeroInterior>
                                                else ()
                                            }
                                            {
                                                if ($Direccion/nmp:estado)
                                                then <nmp:estado>{fn:data($Direccion/nmp:estado)}</nmp:estado>
                                                else ()
                                            }
                                            {
                                                if ($Direccion/nmp:delegacionMunicipio)
                                                then <nmp:delegacionMunicipio>{fn:data($Direccion/nmp:delegacionMunicipio)}</nmp:delegacionMunicipio>
                                                else ()
                                            }
                                            {
                                                if ($Direccion/nmp:colonia)
                                                then <nmp:colonia>{fn:data($Direccion/nmp:colonia)}</nmp:colonia>
                                                else ()
                                            }
                                            {
                                                if ($Direccion/nmp:codigoPostal)
                                                then <nmp:codigoPostal>{fn:data($Direccion/nmp:codigoPostal)}</nmp:codigoPostal>
                                                else ()
                                            }
                                            {
                                                if ($Direccion/nmp:tipoDomicilio)
                                                then <nmp:tipoDomicilio>{fn:data($Direccion/nmp:tipoDomicilio)}</nmp:tipoDomicilio>
                                                else ()
                                            }
                                            {
                                                if ($Direccion/nmp:ciudadPoblacion)
                                                then <nmp:ciudadPoblacion>{fn:data($Direccion/nmp:ciudadPoblacion)}</nmp:ciudadPoblacion>
                                                else ()
                                            }
                                            {
                                                if ($Direccion/nmp:pais)
                                                then <nmp:pais>{fn:data($Direccion/nmp:pais)}</nmp:pais>
                                                else ()
                                            }
                                        </nmp:Direccion>
                                    }
                                </nmp:ListaDirecciones>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp:Contacto/nmp:ListaCorreos)
                            then 
                                <nmp:ListaCorreos>
                                    {
                                        for $email in $request/ns1:cliente/nmp:Contacto/nmp:ListaCorreos/nmp:email
                                        return 
                                        <nmp:email>{fn:data($request/ns1:cliente/nmp:Contacto/nmp:ListaCorreos/nmp:email)}</nmp:email>
                                    }
                                </nmp:ListaCorreos>
                            else ()
                        }
                    </nmp:Contacto>
                else ()
            }
            {
                if ($request/ns1:cliente/nmp1:id)
                then <nmp1:id>{fn:data($request/ns1:cliente/nmp1:id)}</nmp1:id>
                else ()
            }
            {
                if ($request/ns1:cliente/nmp1:infoBasicaCliente)
                then 
                    <nmp1:infoBasicaCliente>
                        {
                            if ($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:tipoCliente)
                            then <nmp1:tipoCliente>{fn:data($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:tipoCliente)}</nmp1:tipoCliente>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:numeroDeCredencial)
                            then <nmp1:numeroDeCredencial>{fn:data($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:numeroDeCredencial)}</nmp1:numeroDeCredencial>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:nombreDeLaImagen)
                            then <nmp1:nombreDeLaImagen>{fn:data($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:nombreDeLaImagen)}</nmp1:nombreDeLaImagen>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:tipoOperacionCliente)
                            then <nmp1:tipoOperacionCliente>{fn:data($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:tipoOperacionCliente)}</nmp1:tipoOperacionCliente>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:estatusAlmacenamientoImagen)
                            then <nmp1:estatusAlmacenamientoImagen>{fn:data($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:estatusAlmacenamientoImagen)}</nmp1:estatusAlmacenamientoImagen>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:huellaDigital)
                            then <nmp1:huellaDigital>{fn:data($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:huellaDigital)}</nmp1:huellaDigital>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:clienteVIP)
                            then <nmp1:clienteVIP>{fn:data($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:clienteVIP)}</nmp1:clienteVIP>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:mandante)
                            then <nmp1:mandante>{fn:data($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:mandante)}</nmp1:mandante>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:sociedad)
                            then <nmp1:sociedad>{fn:data($request/ns1:cliente/nmp1:infoBasicaCliente/nmp1:sociedad)}</nmp1:sociedad>
                            else ()
                        }
                    </nmp1:infoBasicaCliente>
                else ()
            }
            {
                if ($request/ns1:cliente/nmp1:datosRegistro)
                then 
                    <nmp1:datosRegistro>
                        {
                            if ($request/ns1:cliente/nmp1:datosRegistro/nmp1:fechaDeRegistro)
                            then <nmp1:fechaDeRegistro>{fn:data($request/ns1:cliente/nmp1:datosRegistro/nmp1:fechaDeRegistro)}</nmp1:fechaDeRegistro>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:datosRegistro/nmp1:sucursalDeRegstro)
                            then <nmp1:sucursalDeRegstro>{fn:data($request/ns1:cliente/nmp1:datosRegistro/nmp1:sucursalDeRegstro)}</nmp1:sucursalDeRegstro>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:datosRegistro/nmp1:fechaDeCreacion)
                            then <nmp1:fechaDeCreacion>{fn:data($request/ns1:cliente/nmp1:datosRegistro/nmp1:fechaDeCreacion)}</nmp1:fechaDeCreacion>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:datosRegistro/nmp1:fechadDeUltimaActualizacion)
                            then <nmp1:fechadDeUltimaActualizacion>{fn:data($request/ns1:cliente/nmp1:datosRegistro/nmp1:fechadDeUltimaActualizacion)}</nmp1:fechadDeUltimaActualizacion>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:datosRegistro/nmp1:usuarioCreador)
                            then <nmp1:usuarioCreador>{fn:data($request/ns1:cliente/nmp1:datosRegistro/nmp1:usuarioCreador)}</nmp1:usuarioCreador>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:datosRegistro/nmp1:usuarioUltimaModificacion)
                            then <nmp1:usuarioUltimaModificacion>{fn:data($request/ns1:cliente/nmp1:datosRegistro/nmp1:usuarioUltimaModificacion)}</nmp1:usuarioUltimaModificacion>
                            else ()
                        }
                    </nmp1:datosRegistro>
                else ()
            }
            {
                if ($request/ns1:cliente/nmp1:representanteLegal)
                then <nmp1:representanteLegal>{fn:data($request/ns1:cliente/nmp1:representanteLegal)}</nmp1:representanteLegal>
                else ()
            }
            {
                if ($request/ns1:cliente/nmp1:cotitular)
                then 
                    <nmp1:cotitular>
                        {
                            if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica)
                            then 
                                <nmp:infoBasica>
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:genero)
                                        then <nmp:genero>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:genero)}</nmp:genero>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:nombre)
                                        then <nmp:nombre>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:nombre)}</nmp:nombre>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:apellidoPaterno)
                                        then <nmp:apellidoPaterno>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:apellidoPaterno)}</nmp:apellidoPaterno>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:apellidoMaterno)
                                        then <nmp:apellidoMaterno>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:apellidoMaterno)}</nmp:apellidoMaterno>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:fechaDeNacimiento)
                                        then <nmp:fechaDeNacimiento>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:fechaDeNacimiento)}</nmp:fechaDeNacimiento>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:estadoCivil)
                                        then <nmp:estadoCivil>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:estadoCivil)}</nmp:estadoCivil>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:nacionalidad)
                                        then <nmp:nacionalidad>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:nacionalidad)}</nmp:nacionalidad>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:RFC)
                                        then <nmp:RFC>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:RFC)}</nmp:RFC>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:CURP)
                                        then <nmp:CURP>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:CURP)}</nmp:CURP>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:IFE)
                                        then <nmp:IFE>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoBasica/nmp:IFE)}</nmp:IFE>
                                        else ()
                                    }
                                </nmp:infoBasica>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida)
                            then 
                                <nmp:infoExtendida>
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:numeroDeHijos)
                                        then <nmp:numeroDeHijos>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:numeroDeHijos)}</nmp:numeroDeHijos>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:numeroDependientes)
                                        then <nmp:numeroDependientes>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:numeroDependientes)}</nmp:numeroDependientes>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:trabaja)
                                        then <nmp:trabaja>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:trabaja)}</nmp:trabaja>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:escolaridad)
                                        then <nmp:escolaridad>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:escolaridad)}</nmp:escolaridad>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:ocupacion)
                                        then <nmp:ocupacion>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:ocupacion)}</nmp:ocupacion>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:profesion)
                                        then <nmp:profesion>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:profesion)}</nmp:profesion>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:numeroCedulaProfesional)
                                        then <nmp:numeroCedulaProfesional>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:infoExtendida/nmp:numeroCedulaProfesional)}</nmp:numeroCedulaProfesional>
                                        else ()
                                    }
                                </nmp:infoExtendida>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:cotitular/nmp:Contacto)
                            then 
                                <nmp:Contacto>
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:Contacto/nmp:ListaTelefonos)
                                        then 
                                            <nmp:ListaTelefonos>
                                                {
                                                    for $Telefono in $request/ns1:cliente/nmp1:cotitular/nmp:Contacto/nmp:ListaTelefonos/nmp:Telefono
                                                    return 
                                                    <nmp:Telefono>
                                                        {
                                                            if ($Telefono/nmp:codigoPais)
                                                            then <nmp:codigoPais>{fn:data($Telefono/nmp:codigoPais)}</nmp:codigoPais>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Telefono/nmp:codigoArea)
                                                            then <nmp:codigoArea>{fn:data($Telefono/nmp:codigoArea)}</nmp:codigoArea>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Telefono/nmp:numeroTelefonico)
                                                            then <nmp:numeroTelefonico>{fn:data($Telefono/nmp:numeroTelefonico)}</nmp:numeroTelefonico>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Telefono/nmp:extension)
                                                            then <nmp:extension>{fn:data($Telefono/nmp:extension)}</nmp:extension>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Telefono/nmp:tipoTelefono)
                                                            then <nmp:tipoTelefono>{fn:data($Telefono/nmp:tipoTelefono)}</nmp:tipoTelefono>
                                                            else ()
                                                        }
                                                    </nmp:Telefono>
                                                }
                                            </nmp:ListaTelefonos>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:Contacto/nmp:ListaDirecciones)
                                        then 
                                            <nmp:ListaDirecciones>
                                                {
                                                    for $Direccion in $request/ns1:cliente/nmp1:cotitular/nmp:Contacto/nmp:ListaDirecciones/nmp:Direccion
                                                    return 
                                                    <nmp:Direccion>
                                                        {
                                                            if ($Direccion/nmp:nombreDelaCalle)
                                                            then <nmp:nombreDelaCalle>{fn:data($Direccion/nmp:nombreDelaCalle)}</nmp:nombreDelaCalle>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:numeroExterior)
                                                            then <nmp:numeroExterior>{fn:data($Direccion/nmp:numeroExterior)}</nmp:numeroExterior>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:numeroInterior)
                                                            then <nmp:numeroInterior>{fn:data($Direccion/nmp:numeroInterior)}</nmp:numeroInterior>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:estado)
                                                            then <nmp:estado>{fn:data($Direccion/nmp:estado)}</nmp:estado>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:delegacionMunicipio)
                                                            then <nmp:delegacionMunicipio>{fn:data($Direccion/nmp:delegacionMunicipio)}</nmp:delegacionMunicipio>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:colonia)
                                                            then <nmp:colonia>{fn:data($Direccion/nmp:colonia)}</nmp:colonia>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:codigoPostal)
                                                            then <nmp:codigoPostal>{fn:data($Direccion/nmp:codigoPostal)}</nmp:codigoPostal>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:tipoDomicilio)
                                                            then <nmp:tipoDomicilio>{fn:data($Direccion/nmp:tipoDomicilio)}</nmp:tipoDomicilio>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:ciudadPoblacion)
                                                            then <nmp:ciudadPoblacion>{fn:data($Direccion/nmp:ciudadPoblacion)}</nmp:ciudadPoblacion>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:pais)
                                                            then <nmp:pais>{fn:data($Direccion/nmp:pais)}</nmp:pais>
                                                            else ()
                                                        }
                                                    </nmp:Direccion>
                                                }
                                            </nmp:ListaDirecciones>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:cotitular/nmp:Contacto/nmp:ListaCorreos)
                                        then 
                                            <nmp:ListaCorreos>
                                                {
                                                    for $email in $request/ns1:cliente/nmp1:cotitular/nmp:Contacto/nmp:ListaCorreos/nmp:email
                                                    return 
                                                    <nmp:email>{fn:data($request/ns1:cliente/nmp1:cotitular/nmp:Contacto/nmp:ListaCorreos/nmp:email)}</nmp:email>
                                                }
                                            </nmp:ListaCorreos>
                                        else ()
                                    }
                                </nmp:Contacto>
                            else ()
                        }
                    </nmp1:cotitular>
                else ()
            }
            {
                if ($request/ns1:cliente/nmp1:beneficiario)
                then 
                    <nmp1:beneficiario>
                        {
                            if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica)
                            then 
                                <nmp:infoBasica>
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:genero)
                                        then <nmp:genero>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:genero)}</nmp:genero>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:nombre)
                                        then <nmp:nombre>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:nombre)}</nmp:nombre>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:apellidoPaterno)
                                        then <nmp:apellidoPaterno>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:apellidoPaterno)}</nmp:apellidoPaterno>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:apellidoMaterno)
                                        then <nmp:apellidoMaterno>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:apellidoMaterno)}</nmp:apellidoMaterno>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:fechaDeNacimiento)
                                        then <nmp:fechaDeNacimiento>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:fechaDeNacimiento)}</nmp:fechaDeNacimiento>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:estadoCivil)
                                        then <nmp:estadoCivil>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:estadoCivil)}</nmp:estadoCivil>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:nacionalidad)
                                        then <nmp:nacionalidad>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:nacionalidad)}</nmp:nacionalidad>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:RFC)
                                        then <nmp:RFC>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:RFC)}</nmp:RFC>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:CURP)
                                        then <nmp:CURP>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:CURP)}</nmp:CURP>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:IFE)
                                        then <nmp:IFE>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoBasica/nmp:IFE)}</nmp:IFE>
                                        else ()
                                    }
                                </nmp:infoBasica>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida)
                            then 
                                <nmp:infoExtendida>
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:numeroDeHijos)
                                        then <nmp:numeroDeHijos>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:numeroDeHijos)}</nmp:numeroDeHijos>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:numeroDependientes)
                                        then <nmp:numeroDependientes>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:numeroDependientes)}</nmp:numeroDependientes>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:trabaja)
                                        then <nmp:trabaja>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:trabaja)}</nmp:trabaja>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:escolaridad)
                                        then <nmp:escolaridad>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:escolaridad)}</nmp:escolaridad>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:ocupacion)
                                        then <nmp:ocupacion>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:ocupacion)}</nmp:ocupacion>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:profesion)
                                        then <nmp:profesion>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:profesion)}</nmp:profesion>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:numeroCedulaProfesional)
                                        then <nmp:numeroCedulaProfesional>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:infoExtendida/nmp:numeroCedulaProfesional)}</nmp:numeroCedulaProfesional>
                                        else ()
                                    }
                                </nmp:infoExtendida>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:beneficiario/nmp:Contacto)
                            then 
                                <nmp:Contacto>
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:Contacto/nmp:ListaTelefonos)
                                        then 
                                            <nmp:ListaTelefonos>
                                                {
                                                    for $Telefono in $request/ns1:cliente/nmp1:beneficiario/nmp:Contacto/nmp:ListaTelefonos/nmp:Telefono
                                                    return 
                                                    <nmp:Telefono>
                                                        {
                                                            if ($Telefono/nmp:codigoPais)
                                                            then <nmp:codigoPais>{fn:data($Telefono/nmp:codigoPais)}</nmp:codigoPais>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Telefono/nmp:codigoArea)
                                                            then <nmp:codigoArea>{fn:data($Telefono/nmp:codigoArea)}</nmp:codigoArea>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Telefono/nmp:numeroTelefonico)
                                                            then <nmp:numeroTelefonico>{fn:data($Telefono/nmp:numeroTelefonico)}</nmp:numeroTelefonico>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Telefono/nmp:extension)
                                                            then <nmp:extension>{fn:data($Telefono/nmp:extension)}</nmp:extension>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Telefono/nmp:tipoTelefono)
                                                            then <nmp:tipoTelefono>{fn:data($Telefono/nmp:tipoTelefono)}</nmp:tipoTelefono>
                                                            else ()
                                                        }
                                                    </nmp:Telefono>
                                                }
                                            </nmp:ListaTelefonos>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:Contacto/nmp:ListaDirecciones)
                                        then 
                                            <nmp:ListaDirecciones>
                                                {
                                                    for $Direccion in $request/ns1:cliente/nmp1:beneficiario/nmp:Contacto/nmp:ListaDirecciones/nmp:Direccion
                                                    return 
                                                    <nmp:Direccion>
                                                        {
                                                            if ($Direccion/nmp:nombreDelaCalle)
                                                            then <nmp:nombreDelaCalle>{fn:data($Direccion/nmp:nombreDelaCalle)}</nmp:nombreDelaCalle>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:numeroExterior)
                                                            then <nmp:numeroExterior>{fn:data($Direccion/nmp:numeroExterior)}</nmp:numeroExterior>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:numeroInterior)
                                                            then <nmp:numeroInterior>{fn:data($Direccion/nmp:numeroInterior)}</nmp:numeroInterior>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:estado)
                                                            then <nmp:estado>{fn:data($Direccion/nmp:estado)}</nmp:estado>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:delegacionMunicipio)
                                                            then <nmp:delegacionMunicipio>{fn:data($Direccion/nmp:delegacionMunicipio)}</nmp:delegacionMunicipio>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:colonia)
                                                            then <nmp:colonia>{fn:data($Direccion/nmp:colonia)}</nmp:colonia>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:codigoPostal)
                                                            then <nmp:codigoPostal>{fn:data($Direccion/nmp:codigoPostal)}</nmp:codigoPostal>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:tipoDomicilio)
                                                            then <nmp:tipoDomicilio>{fn:data($Direccion/nmp:tipoDomicilio)}</nmp:tipoDomicilio>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:ciudadPoblacion)
                                                            then <nmp:ciudadPoblacion>{fn:data($Direccion/nmp:ciudadPoblacion)}</nmp:ciudadPoblacion>
                                                            else ()
                                                        }
                                                        {
                                                            if ($Direccion/nmp:pais)
                                                            then <nmp:pais>{fn:data($Direccion/nmp:pais)}</nmp:pais>
                                                            else ()
                                                        }
                                                    </nmp:Direccion>
                                                }
                                            </nmp:ListaDirecciones>
                                        else ()
                                    }
                                    {
                                        if ($request/ns1:cliente/nmp1:beneficiario/nmp:Contacto/nmp:ListaCorreos)
                                        then 
                                            <nmp:ListaCorreos>
                                                {
                                                    for $email in $request/ns1:cliente/nmp1:beneficiario/nmp:Contacto/nmp:ListaCorreos/nmp:email
                                                    return 
                                                    <nmp:email>{fn:data($request/ns1:cliente/nmp1:beneficiario/nmp:Contacto/nmp:ListaCorreos/nmp:email)}</nmp:email>
                                                }
                                            </nmp:ListaCorreos>
                                        else ()
                                    }
                                </nmp:Contacto>
                            else ()
                        }
                    </nmp1:beneficiario>
                else ()
            }
            {
                if ($request/ns1:cliente/nmp1:calificacionCliente)
                then 
                    <nmp1:calificacionCliente>
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:calificacionReal)
                            then <nmp1:calificacionReal>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:calificacionReal)}</nmp1:calificacionReal>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:calificacionMidas)
                            then <nmp1:calificacionMidas>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:calificacionMidas)}</nmp1:calificacionMidas>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:capacidadDePago)
                            then <nmp1:capacidadDePago>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:capacidadDePago)}</nmp1:capacidadDePago>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:probabilidadIncumplimiento)
                            then <nmp1:probabilidadIncumplimiento>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:probabilidadIncumplimiento)}</nmp1:probabilidadIncumplimiento>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:gradoDeConfianza)
                            then <nmp1:gradoDeConfianza>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:gradoDeConfianza)}</nmp1:gradoDeConfianza>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:ultimafechaConsultaBuro)
                            then <nmp1:ultimafechaConsultaBuro>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:ultimafechaConsultaBuro)}</nmp1:ultimafechaConsultaBuro>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:calificacionBuro)
                            then <nmp1:calificacionBuro>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:calificacionBuro)}</nmp1:calificacionBuro>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:calificacionSiva)
                            then <nmp1:calificacionSiva>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:calificacionSiva)}</nmp1:calificacionSiva>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:sobreAforo)
                            then <nmp1:sobreAforo>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:sobreAforo)}</nmp1:sobreAforo>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:porcentajeAforo)
                            then <nmp1:porcentajeAforo>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:porcentajeAforo)}</nmp1:porcentajeAforo>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:indiceRecuperacion)
                            then <nmp1:indiceRecuperacion>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:indiceRecuperacion)}</nmp1:indiceRecuperacion>
                            else ()
                        }
                        {
                            if ($request/ns1:cliente/nmp1:calificacionCliente/nmp1:banderaDeBoletinacion)
                            then <nmp1:banderaDeBoletinacion>{fn:data($request/ns1:cliente/nmp1:calificacionCliente/nmp1:banderaDeBoletinacion)}</nmp1:banderaDeBoletinacion>
                            else ()
                        }
                    </nmp1:calificacionCliente>
                else ()
            }
        </ns2:cliente>
        <ns2:credito>
            {
                if ($request/ns1:credito/nmp2:idCliente)
                then <nmp2:idCliente>{fn:data($request/ns1:credito/nmp2:idCliente)}</nmp2:idCliente>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:contrato)
                then <nmp2:contrato>{fn:data($request/ns1:credito/nmp2:contrato)}</nmp2:contrato>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:moneda)
                then <nmp2:moneda>{fn:data($request/ns1:credito/nmp2:moneda)}</nmp2:moneda>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:productoTipo)
                then <nmp2:productoTipo>{fn:data($request/ns1:credito/nmp2:productoTipo)}</nmp2:productoTipo>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:subProductoTipo)
                then <nmp2:subProductoTipo>{fn:data($request/ns1:credito/nmp2:subProductoTipo)}</nmp2:subProductoTipo>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:estatus)
                then <nmp2:estatus>{fn:data($request/ns1:credito/nmp2:estatus)}</nmp2:estatus>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:codicionesContrato)
                then 
                    <nmp2:codicionesContrato>
                        {
                            if ($request/ns1:credito/nmp2:codicionesContrato/nmp2:moneda)
                            then <nmp2:moneda>{fn:data($request/ns1:credito/nmp2:codicionesContrato/nmp2:moneda)}</nmp2:moneda>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:codicionesContrato/nmp2:productoTipo)
                            then <nmp2:productoTipo>{fn:data($request/ns1:credito/nmp2:codicionesContrato/nmp2:productoTipo)}</nmp2:productoTipo>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:codicionesContrato/nmp2:subProductoTipo)
                            then <nmp2:subProductoTipo>{fn:data($request/ns1:credito/nmp2:codicionesContrato/nmp2:subProductoTipo)}</nmp2:subProductoTipo>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:codicionesContrato/nmp2:plazo)
                            then <nmp2:plazo>{fn:data($request/ns1:credito/nmp2:codicionesContrato/nmp2:plazo)}</nmp2:plazo>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:codicionesContrato/nmp2:frecuencia)
                            then <nmp2:frecuencia>{fn:data($request/ns1:credito/nmp2:codicionesContrato/nmp2:frecuencia)}</nmp2:frecuencia>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:codicionesContrato/nmp2:desembolso)
                            then <nmp2:desembolso>{fn:data($request/ns1:credito/nmp2:codicionesContrato/nmp2:desembolso)}</nmp2:desembolso>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:codicionesContrato/nmp2:montoPagoPeriodico)
                            then <nmp2:montoPagoPeriodico>{fn:data($request/ns1:credito/nmp2:codicionesContrato/nmp2:montoPagoPeriodico)}</nmp2:montoPagoPeriodico>
                            else ()
                        }
                    </nmp2:codicionesContrato>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:saldo)
                then 
                    <nmp2:saldo>
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:producto)
                            then <nmp2:producto>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:producto)}</nmp2:producto>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:desembolso)
                            then <nmp2:desembolso>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:desembolso)}</nmp2:desembolso>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:capitalVigente)
                            then <nmp2:capitalVigente>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:capitalVigente)}</nmp2:capitalVigente>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:capitalVencido)
                            then <nmp2:capitalVencido>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:capitalVencido)}</nmp2:capitalVencido>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:saldoVigente)
                            then <nmp2:saldoVigente>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:saldoVigente)}</nmp2:saldoVigente>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:saldoVencido)
                            then <nmp2:saldoVencido>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:saldoVencido)}</nmp2:saldoVencido>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:saldoCapital)
                            then <nmp2:saldoCapital>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:saldoCapital)}</nmp2:saldoCapital>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:interesVigente)
                            then <nmp2:interesVigente>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:interesVigente)}</nmp2:interesVigente>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:interesVencido)
                            then <nmp2:interesVencido>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:interesVencido)}</nmp2:interesVencido>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:saldoInteres)
                            then <nmp2:saldoInteres>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:saldoInteres)}</nmp2:saldoInteres>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:saldoComision)
                            then <nmp2:saldoComision>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:saldoComision)}</nmp2:saldoComision>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:pagosNoAplicados)
                            then <nmp2:pagosNoAplicados>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:pagosNoAplicados)}</nmp2:pagosNoAplicados>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:cuotasDevengadas)
                            then <nmp2:cuotasDevengadas>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:cuotasDevengadas)}</nmp2:cuotasDevengadas>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:saldoLiquida)
                            then <nmp2:saldoLiquida>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:saldoLiquida)}</nmp2:saldoLiquida>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:porcentajeCapitalPagado)
                            then <nmp2:porcentajeCapitalPagado>{fn:data($request/ns1:credito/nmp2:saldo/nmp2:porcentajeCapitalPagado)}</nmp2:porcentajeCapitalPagado>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:saldo/nmp2:listaCardexPagosVencidos)
                            then 
                                <nmp2:listaCardexPagosVencidos>
                                    {
                                        for $pagoVencido in $request/ns1:credito/nmp2:saldo/nmp2:listaCardexPagosVencidos/nmp2:pagoVencido
                                        return 
                                                if ($pagoVencido/@cardexNum)
                                                 then <nmp2:pagoVencido cardexNum="{fn:data($pagoVencido/@cardexNum)}">{fn:data($pagoVencido)}</nmp2:pagoVencido> 
                                              else <nmp2:pagoVencido>{fn:data($pagoVencido)}</nmp2:pagoVencido> 
                                        
                                    }
                                </nmp2:listaCardexPagosVencidos>
                            else ()
                        }
                    </nmp2:saldo>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:solicitud)
                then 
                    <nmp2:solicitud>
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:cveProducto)
                            then <nmp2:cveProducto>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:cveProducto)}</nmp2:cveProducto>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:estatus)
                            then <nmp2:estatus>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:estatus)}</nmp2:estatus>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:subEstatus)
                            then <nmp2:subEstatus>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:subEstatus)}</nmp2:subEstatus>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:pendiente)
                            then <nmp2:pendiente>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:pendiente)}</nmp2:pendiente>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:motivoPendiente)
                            then <nmp2:motivoPendiente>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:motivoPendiente)}</nmp2:motivoPendiente>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:estatusPago)
                            then <nmp2:estatusPago>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:estatusPago)}</nmp2:estatusPago>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:estatusAnterior)
                            then <nmp2:estatusAnterior>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:estatusAnterior)}</nmp2:estatusAnterior>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:fechaSolicitud)
                            then <nmp2:fechaSolicitud>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:fechaSolicitud)}</nmp2:fechaSolicitud>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:fechaSuscripcion)
                            then <nmp2:fechaSuscripcion>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:fechaSuscripcion)}</nmp2:fechaSuscripcion>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:tiempoAprobacion)
                            then <nmp2:tiempoAprobacion>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:tiempoAprobacion)}</nmp2:tiempoAprobacion>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:fechaAutorizacion)
                            then <nmp2:fechaAutorizacion>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:fechaAutorizacion)}</nmp2:fechaAutorizacion>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:fechaDesembolso)
                            then <nmp2:fechaDesembolso>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:fechaDesembolso)}</nmp2:fechaDesembolso>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:fechaPrimerPago)
                            then <nmp2:fechaPrimerPago>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:fechaPrimerPago)}</nmp2:fechaPrimerPago>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:destino)
                            then <nmp2:destino>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:destino)}</nmp2:destino>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:gerenteSucursal)
                            then <nmp2:gerenteSucursal>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:gerenteSucursal)}</nmp2:gerenteSucursal>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:desembolso)
                            then <nmp2:desembolso>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:desembolso)}</nmp2:desembolso>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:frecuencia)
                            then <nmp2:frecuencia>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:frecuencia)}</nmp2:frecuencia>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:numPagos)
                            then <nmp2:numPagos>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:numPagos)}</nmp2:numPagos>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:solicitud/nmp2:montoPagoPeriodico)
                            then <nmp2:montoPagoPeriodico>{fn:data($request/ns1:credito/nmp2:solicitud/nmp2:montoPagoPeriodico)}</nmp2:montoPagoPeriodico>
                            else ()
                        }
                    </nmp2:solicitud>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:pago)
                then 
                    <nmp2:pago>
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:producto)
                            then <nmp2:producto>{fn:data($request/ns1:credito/nmp2:pago/nmp2:producto)}</nmp2:producto>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:desembolso)
                            then <nmp2:desembolso>{fn:data($request/ns1:credito/nmp2:pago/nmp2:desembolso)}</nmp2:desembolso>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:capitalVigente)
                            then <nmp2:capitalVigente>{fn:data($request/ns1:credito/nmp2:pago/nmp2:capitalVigente)}</nmp2:capitalVigente>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:capitalVencido)
                            then <nmp2:capitalVencido>{fn:data($request/ns1:credito/nmp2:pago/nmp2:capitalVencido)}</nmp2:capitalVencido>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:saldoVigente)
                            then <nmp2:saldoVigente>{fn:data($request/ns1:credito/nmp2:pago/nmp2:saldoVigente)}</nmp2:saldoVigente>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:saldoVencido)
                            then <nmp2:saldoVencido>{fn:data($request/ns1:credito/nmp2:pago/nmp2:saldoVencido)}</nmp2:saldoVencido>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:saldoCapital)
                            then <nmp2:saldoCapital>{fn:data($request/ns1:credito/nmp2:pago/nmp2:saldoCapital)}</nmp2:saldoCapital>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:interesVigente)
                            then <nmp2:interesVigente>{fn:data($request/ns1:credito/nmp2:pago/nmp2:interesVigente)}</nmp2:interesVigente>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:interesVencido)
                            then <nmp2:interesVencido>{fn:data($request/ns1:credito/nmp2:pago/nmp2:interesVencido)}</nmp2:interesVencido>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:saldoInteres)
                            then <nmp2:saldoInteres>{fn:data($request/ns1:credito/nmp2:pago/nmp2:saldoInteres)}</nmp2:saldoInteres>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:saldoComision)
                            then <nmp2:saldoComision>{fn:data($request/ns1:credito/nmp2:pago/nmp2:saldoComision)}</nmp2:saldoComision>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:pagosNoAplicados)
                            then <nmp2:pagosNoAplicados>{fn:data($request/ns1:credito/nmp2:pago/nmp2:pagosNoAplicados)}</nmp2:pagosNoAplicados>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:saldoLiquida)
                            then <nmp2:saldoLiquida>{fn:data($request/ns1:credito/nmp2:pago/nmp2:saldoLiquida)}</nmp2:saldoLiquida>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:porcentajeCapitalPagado)
                            then <nmp2:porcentajeCapitalPagado>{fn:data($request/ns1:credito/nmp2:pago/nmp2:porcentajeCapitalPagado)}</nmp2:porcentajeCapitalPagado>
                            else ()
                        }
                        {
                            if ($request/ns1:credito/nmp2:pago/nmp2:listaCardexPagosVencidos)
                            then 
                                <nmp2:listaCardexPagosVencidos>
                                    {
                                        for $pagoVencido in $request/ns1:credito/nmp2:pago/nmp2:listaCardexPagosVencidos/nmp2:pagoVencido
                                        return 
                                              if ($pagoVencido/@cardexNum)
                                              then <nmp2:pagoVencido cardexNum="{fn:data($pagoVencido/@cardexNum)}">{fn:data($pagoVencido)}</nmp2:pagoVencido> 
                                              else <nmp2:pagoVencido>{fn:data($pagoVencido)}</nmp2:pagoVencido> 
                                    }
                                </nmp2:listaCardexPagosVencidos>
                            else ()
                        }
                    </nmp2:pago>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:tablaAmortizacion)
                then 
                    <nmp2:tablaAmortizacion>
                        {
                            for $Amortizacion in $request/ns1:credito/nmp2:tablaAmortizacion/nmp2:Amortizacion
                            return 
                            <nmp2:Amortizacion>
                                {
                                    if ($Amortizacion/nmp2:numeroPago)
                                    then <nmp2:numeroPago>{fn:data($Amortizacion/nmp2:numeroPago)}</nmp2:numeroPago>
                                    else ()
                                }
                                {
                                    if ($Amortizacion/nmp2:fechaPago)
                                    then <nmp2:fechaPago>{fn:data($Amortizacion/nmp2:fechaPago)}</nmp2:fechaPago>
                                    else ()
                                }
                                {
                                    if ($Amortizacion/nmp2:pagoTotal)
                                    then <nmp2:pagoTotal>{fn:data($Amortizacion/nmp2:pagoTotal)}</nmp2:pagoTotal>
                                    else ()
                                }
                                {
                                    if ($Amortizacion/nmp2:capital)
                                    then <nmp2:capital>{fn:data($Amortizacion/nmp2:capital)}</nmp2:capital>
                                    else ()
                                }
                                {
                                    if ($Amortizacion/nmp2:interes)
                                    then <nmp2:interes>{fn:data($Amortizacion/nmp2:interes)}</nmp2:interes>
                                    else ()
                                }
                                {
                                    if ($Amortizacion/nmp2:IVAInteres)
                                    then <nmp2:IVAInteres>{fn:data($Amortizacion/nmp2:IVAInteres)}</nmp2:IVAInteres>
                                    else ()
                                }
                                {
                                    if ($Amortizacion/nmp2:saldoCapital)
                                    then <nmp2:saldoCapital>{fn:data($Amortizacion/nmp2:saldoCapital)}</nmp2:saldoCapital>
                                    else ()
                                }
                                {
                                    if ($Amortizacion/nmp2:saldoInteres)
                                    then <nmp2:saldoInteres>{fn:data($Amortizacion/nmp2:saldoInteres)}</nmp2:saldoInteres>
                                    else ()
                                }
                            </nmp2:Amortizacion>
                        }
                    </nmp2:tablaAmortizacion>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:proyeccionPagos)
                then 
                    <nmp2:proyeccionPagos>
                        {
                            for $ProyeccionPago in $request/ns1:credito/nmp2:proyeccionPagos/nmp2:ProyeccionPago
                            return 
                            <nmp2:ProyeccionPago>
                                {
                                    if ($ProyeccionPago/nmp2:saldoActual)
                                    then <nmp2:saldoActual>{fn:data($ProyeccionPago/nmp2:saldoActual)}</nmp2:saldoActual>
                                    else ()
                                }
                                {
                                    if ($ProyeccionPago/nmp2:fechaCorte)
                                    then <nmp2:fechaCorte>{fn:data($ProyeccionPago/nmp2:fechaCorte)}</nmp2:fechaCorte>
                                    else ()
                                }
                                {
                                    if ($ProyeccionPago/nmp2:saldoCorte)
                                    then <nmp2:saldoCorte>{fn:data($ProyeccionPago/nmp2:saldoCorte)}</nmp2:saldoCorte>
                                    else ()
                                }
                            </nmp2:ProyeccionPago>
                        }
                    </nmp2:proyeccionPagos>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:proyeccionMoratorios)
                then 
                    <nmp2:proyeccionMoratorios>
                        {
                            for $ProyeccionMoratorios in $request/ns1:credito/nmp2:proyeccionMoratorios/nmp2:ProyeccionMoratorios
                            return 
                            <nmp2:ProyeccionMoratorios>
                                {
                                    if ($ProyeccionMoratorios/nmp2:monto)
                                    then <nmp2:monto>{fn:data($ProyeccionMoratorios/nmp2:monto)}</nmp2:monto>
                                    else ()
                                }
                                {
                                    if ($ProyeccionMoratorios/nmp2:tasa)
                                    then <nmp2:tasa>{fn:data($ProyeccionMoratorios/nmp2:tasa)}</nmp2:tasa>
                                    else ()
                                }
                                {
                                    if ($ProyeccionMoratorios/nmp2:dias)
                                    then <nmp2:dias>{fn:data($ProyeccionMoratorios/nmp2:dias)}</nmp2:dias>
                                    else ()
                                }
                                {
                                    if ($ProyeccionMoratorios/nmp2:importeBase)
                                    then <nmp2:importeBase>{fn:data($ProyeccionMoratorios/nmp2:importeBase)}</nmp2:importeBase>
                                    else ()
                                }
                            </nmp2:ProyeccionMoratorios>
                        }
                    </nmp2:proyeccionMoratorios>
                else ()
            }
            {
                if ($request/ns1:credito/nmp2:vencimientos)
                then 
                    <nmp2:vencimientos>
                        {
                            for $Vencimiento in $request/ns1:credito/nmp2:vencimientos/nmp2:Vencimiento
                            return 
                            <nmp2:Vencimiento>
                                {
                                    if ($Vencimiento/nmp2:fechaVencimiento)
                                    then <nmp2:fechaVencimiento>{fn:data($Vencimiento/nmp2:fechaVencimiento)}</nmp2:fechaVencimiento>
                                    else ()
                                }
                                {
                                    if ($Vencimiento/nmp2:planeado-real)
                                    then <nmp2:planeado-real>{fn:data($Vencimiento/nmp2:planeado-real)}</nmp2:planeado-real>
                                    else ()
                                }
                                {
                                    if ($Vencimiento/nmp2:interes)
                                    then <nmp2:interes>{fn:data($Vencimiento/nmp2:interes)}</nmp2:interes>
                                    else ()
                                }
                                {
                                    if ($Vencimiento/nmp2:IVAInteres)
                                    then <nmp2:IVAInteres>{fn:data($Vencimiento/nmp2:IVAInteres)}</nmp2:IVAInteres>
                                    else ()
                                }
                                {
                                    if ($Vencimiento/nmp2:importe)
                                    then <nmp2:importe>{fn:data($Vencimiento/nmp2:importe)}</nmp2:importe>
                                    else ()
                                }
                                {
                                    if ($Vencimiento/nmp2:concepto)
                                    then <nmp2:concepto>{fn:data($Vencimiento/nmp2:concepto)}</nmp2:concepto>
                                    else ()
                                }
                            </nmp2:Vencimiento>
                        }
                    </nmp2:vencimientos>
                else ()
            }
        </ns2:credito>
    </ns2:isRenovacionTopUpMessageRequest>
};

local:func($request)