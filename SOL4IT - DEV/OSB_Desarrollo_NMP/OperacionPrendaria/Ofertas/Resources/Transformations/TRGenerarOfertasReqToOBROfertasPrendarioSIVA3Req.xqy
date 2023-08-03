xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Elementos/Ofertas";
(:: import schema at "../Schemas/NMPOfertasSvcElementosXSD.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/OfertaBase/OfertaBase_DecisionService";
(:: import schema at "../Schemas/OBROfertasBaseDecisionElementosXSD.xsd" ::)

declare namespace com = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Comun";

declare namespace cli = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Cliente";

declare namespace emp = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Empenio";

declare namespace per = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Persona";

declare namespace cam = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Campania";

declare namespace ofe = "http://servicios.montedepiedad.com.mx/NMP/Servicios/Schema/Tipos/Ofertas";

declare variable $GenerarOfertasRequest as element() (:: schema-element(ns1:GenerarOfertasRequest) ::) external;

declare function local:func($GenerarOfertasRequest as element() (:: schema-element(ns1:GenerarOfertasRequest) ::)) as element() (:: schema-element(ns2:callFunctionStateless) ::) {
    <ns2:callFunctionStateless name="{fn:string('OfertaBase_DecisionService')}">
        <ns2:parameterList>
            <ofe:GenerarOfertasRequest>
                {
                    if ($GenerarOfertasRequest/ofe:InformacionCliente)
                    then 
                        <ofe:InformacionCliente>
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:idCliente)
                                then <cli:idCliente>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:idCliente)}</cli:idCliente>
                                else ()
                            }
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal)
                                then 
                                    <cli:informacionPersonal>
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica)
                                            then 
                                                <per:infoBasica>
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:genero)
                                                        then <per:genero>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:genero)}</per:genero>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:nombre)
                                                        then <per:nombre>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:nombre)}</per:nombre>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:apellidoPaterno)
                                                        then <per:apellidoPaterno>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:apellidoPaterno)}</per:apellidoPaterno>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:apellidoMaterno)
                                                        then <per:apellidoMaterno>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:apellidoMaterno)}</per:apellidoMaterno>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:fechaDeNacimiento)
                                                        then <per:fechaDeNacimiento>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:fechaDeNacimiento)}</per:fechaDeNacimiento>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:estadoCivil)
                                                        then <per:estadoCivil>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:estadoCivil)}</per:estadoCivil>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:nacionalidad)
                                                        then <per:nacionalidad>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:nacionalidad)}</per:nacionalidad>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:rfc)
                                                        then <per:RFC>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:rfc)}</per:RFC>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:curp)
                                                        then <per:CURP>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:curp)}</per:CURP>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:ife)
                                                        then <per:IFE>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoBasica/per:ife)}</per:IFE>
                                                        else ()
                                                    }
                                                </per:infoBasica>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida)
                                            then 
                                                <per:infoExtendida>
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:numeroDeHijos)
                                                        then <per:numeroDeHijos>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:numeroDeHijos)}</per:numeroDeHijos>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:numeroDependientes)
                                                        then <per:numeroDependientes>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:numeroDependientes)}</per:numeroDependientes>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:trabaja)
                                                        then <per:trabaja>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:trabaja)}</per:trabaja>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:escolaridad)
                                                        then <per:escolaridad>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:escolaridad)}</per:escolaridad>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:ocupacion)
                                                        then <per:ocupacion>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:ocupacion)}</per:ocupacion>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:profesion)
                                                        then <per:profesion>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:profesion)}</per:profesion>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:numeroCedulaProfesional)
                                                        then <per:numeroCedulaProfesional>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:infoExtendida/per:numeroCedulaProfesional)}</per:numeroCedulaProfesional>
                                                        else ()
                                                    }
                                                </per:infoExtendida>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:Contacto)
                                            then 
                                                <per:Contacto>
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:Contacto/per:telefonos)
                                                        then 
                                                            <per:telefonos>
                                                                {
                                                                    for $Telefono in $GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:Contacto/per:telefonos/com:Telefono
                                                                    return 
                                                                    <com:Telefono>
                                                                        {
                                                                            if ($Telefono/com:codigoPais)
                                                                            then <com:codigoPais>{fn:data($Telefono/com:codigoPais)}</com:codigoPais>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Telefono/com:codigoArea)
                                                                            then <com:codigoArea>{fn:data($Telefono/com:codigoArea)}</com:codigoArea>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Telefono/com:numeroTelefonico)
                                                                            then <com:numeroTelefonico>{fn:data($Telefono/com:numeroTelefonico)}</com:numeroTelefonico>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Telefono/com:extension)
                                                                            then <com:extension>{fn:data($Telefono/com:extension)}</com:extension>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Telefono/com:tipoTelefono)
                                                                            then <com:tipoTelefono>{fn:data($Telefono/com:tipoTelefono)}</com:tipoTelefono>
                                                                            else ()
                                                                        }
                                                                    </com:Telefono>
                                                                }
                                                            </per:telefonos>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:Contacto/per:direcciones)
                                                        then 
                                                            <per:direcciones>
                                                                {
                                                                    for $Direccion in $GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:Contacto/per:direcciones/com:Direccion
                                                                    return 
                                                                    <com:Direccion>
                                                                        {
                                                                            if ($Direccion/com:nombreDelaCalle)
                                                                            then <com:nombreDelaCalle>{fn:data($Direccion/com:nombreDelaCalle)}</com:nombreDelaCalle>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Direccion/com:numeroExterior)
                                                                            then <com:numeroExterior>{fn:data($Direccion/com:numeroExterior)}</com:numeroExterior>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Direccion/com:numeroInterior)
                                                                            then <com:numeroInterior>{fn:data($Direccion/com:numeroInterior)}</com:numeroInterior>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Direccion/com:estado)
                                                                            then <com:estado>{fn:data($Direccion/com:estado)}</com:estado>
                                                                            else ()
                                                                        }
                                                                        <com:delegacionMunicipio>{fn:data($Direccion/com:delegacionMunicipio)}</com:delegacionMunicipio>
                                                                        {
                                                                            if ($Direccion/com:colonia)
                                                                            then <com:colonia>{fn:data($Direccion/com:colonia)}</com:colonia>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Direccion/com:codigoPostal)
                                                                            then <com:codigoPostal>{fn:data($Direccion/com:codigoPostal)}</com:codigoPostal>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Direccion/com:tipoDomicilio)
                                                                            then <com:tipoDomicilio>{fn:data($Direccion/com:tipoDomicilio)}</com:tipoDomicilio>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Direccion/com:ciudadPoblacion)
                                                                            then <com:ciudadPoblacion>{fn:data($Direccion/com:ciudadPoblacion)}</com:ciudadPoblacion>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($Direccion/com:pais)
                                                                            then <com:pais>{fn:data($Direccion/com:pais)}</com:pais>
                                                                            else ()
                                                                        }
                                                                    </com:Direccion>
                                                                }
                                                            </per:direcciones>
                                                        else ()
                                                    }
                                                    {
                                                        if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:Contacto/per:correos)
                                                        then 
                                                            <per:correos>
                                                                {
                                                                    for $Email in $GenerarOfertasRequest/ofe:InformacionCliente/cli:informacionPersonal/per:Contacto/per:correos/com:Email
                                                                    return 
                                                                    <com:Email>
                                                                        {
                                                                            if ($Email/com:direccionCorreo)
                                                                            then <com:direccionCorreo>{fn:data($Email/com:direccionCorreo)}</com:direccionCorreo>
                                                                            else ()
                                                                        }
                                                                    </com:Email>
                                                                }
                                                            </per:correos>
                                                        else ()
                                                    }
                                                </per:Contacto>
                                            else ()
                                        }
                                    </cli:informacionPersonal>
                                else ()
                            }
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion)
                                then 
                                    <cli:calificacion>
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:calificacionReal)
                                            then <cli:calificacionReal>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:calificacionReal)}</cli:calificacionReal>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:calificacionMidas)
                                            then <cli:calificacionMidas>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:calificacionMidas)}</cli:calificacionMidas>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:capacidadDePago)
                                            then <cli:capacidadDePago>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:capacidadDePago)}</cli:capacidadDePago>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:probabilidadIncumplimiento)
                                            then <cli:probabilidadIncumplimiento>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:probabilidadIncumplimiento)}</cli:probabilidadIncumplimiento>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:gradoDeConfianza)
                                            then <cli:gradoDeConfianza>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:gradoDeConfianza)}</cli:gradoDeConfianza>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:ultimaFechaConsultaBuro)
                                            then <cli:ultimaFechaConsultaBuro>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:ultimaFechaConsultaBuro)}</cli:ultimaFechaConsultaBuro>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:calificacionBuro)
                                            then <cli:calificacionBuro>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:calificacionBuro)}</cli:calificacionBuro>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:calificacionSiva)
                                            then <cli:calificacionSiva>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:calificacionSiva)}</cli:calificacionSiva>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:sobreAforo)
                                            then <cli:sobreAforo>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:sobreAforo)}</cli:sobreAforo>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:porcentajeAforo)
                                            then <cli:porcentajeAforo>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:porcentajeAforo)}</cli:porcentajeAforo>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:indiceRecuperacion)
                                            then <cli:indiceRecuperacion>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:indiceRecuperacion)}</cli:indiceRecuperacion>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:banderaDeBoletinacion)
                                            then <cli:banderaDeBoletinacion>{fn:data($GenerarOfertasRequest/ofe:InformacionCliente/cli:calificacion/cli:banderaDeBoletinacion)}</cli:banderaDeBoletinacion>
                                            else ()
                                        }
                                    </cli:calificacion>
                                else ()
                            }
                        </ofe:InformacionCliente>
                    else ()
                }
                {
                    if ($GenerarOfertasRequest/ofe:InformacionEmpenio)
                    then 
                        <ofe:InformacionEmpenio>
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:idPartida)
                                then <emp:idPartida>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:idPartida)}</emp:idPartida>
                                else ()
                            }
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:ramo)
                                then <emp:ramo>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:ramo)}</emp:ramo>
                                else ()
                            }
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:subramo)
                                then <emp:subramo>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:subramo)}</emp:subramo>
                                else ()
                            }
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:montoPrestamoOriginal)
                                then <emp:montoPrestamoOriginal>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:montoPrestamoOriginal)}</emp:montoPrestamoOriginal>
                                else ()
                            }
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:montoAvaluo)
                                then <emp:montoAvaluo>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:montoAvaluo)}</emp:montoAvaluo>
                                else ()
                            }
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda)
                                then 
                                    <emp:caracteristicasPrenda>
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:factor)
                                            then <emp:factor>{fn:normalize-space(fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:factor))}</emp:factor>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:rango)
                                            then <emp:rango>{fn:normalize-space(fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:rango))}</emp:rango>
                                            else ()
                                        }
                                        {
                                            if ($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:gramaje)
                                            then <emp:gramaje>{fn:data($GenerarOfertasRequest/ofe:InformacionEmpenio/emp:caracteristicasPrenda/emp:gramaje)}</emp:gramaje>
                                            else ()
                                        }
                                    </emp:caracteristicasPrenda>
                                else ()
                            }
                        </ofe:InformacionEmpenio>
                    else ()
                }
                {
                    if ($GenerarOfertasRequest/ofe:InformacionTransaccion)
                    then 
                        <ofe:InformacionTransaccion>
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idTransaccion)
                                then <ofe:idTransaccion>{fn:data($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idTransaccion)}</ofe:idTransaccion>
                                else ()
                            }
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idSucursal)
                                then <ofe:idSucursal>{fn:data($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idSucursal)}</ofe:idSucursal>
                                else ()
                            }
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idRegion)
                                then <ofe:idRegion>{fn:data($GenerarOfertasRequest/ofe:InformacionTransaccion/ofe:idRegion)}</ofe:idRegion>
                                else ()
                            }
                        </ofe:InformacionTransaccion>
                    else ()
                }
                {
                    if ($GenerarOfertasRequest/ofe:InformacionCampania)
                    then 
                        <ofe:InformacionCampania>
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionCampania/ofe:idCampaniaSeleccionada)
                                then <ofe:idCampaniaSeleccionada>{fn:data($GenerarOfertasRequest/ofe:InformacionCampania/ofe:idCampaniaSeleccionada)}</ofe:idCampaniaSeleccionada>
                                else ()
                            }
                            {
                                if ($GenerarOfertasRequest/ofe:InformacionCampania/ofe:listaCampaniasDisponibles)
                                then 
                                    <ofe:listaCampaniasDisponibles>
                                        {
                                            for $Campania in $GenerarOfertasRequest/ofe:InformacionCampania/ofe:listaCampaniasDisponibles/cam:Campania
                                            return 
                                            <cam:Campania>
                                                {
                                                    if ($Campania/cam:idCampania)
                                                    then <cam:idCampania>{fn:data($Campania/cam:idCampania)}</cam:idCampania>
                                                    else ()
                                                }
                                                {
                                                    if ($Campania/cam:nombre)
                                                    then <cam:nombre>{fn:data($Campania/cam:nombre)}</cam:nombre>
                                                    else ()
                                                }
                                                {
                                                    if ($Campania/cam:descripcion)
                                                    then <cam:descripcion>{fn:data($Campania/cam:descripcion)}</cam:descripcion>
                                                    else ()
                                                }
                                                {
                                                    if ($Campania/cam:ramo)
                                                    then <cam:ramo>{fn:data($Campania/cam:ramo)}</cam:ramo>
                                                    else ()
                                                }
                                                {
                                                    if ($Campania/cam:subRamo)
                                                    then <cam:subRamo>{fn:data($Campania/cam:subRamo)}</cam:subRamo>
                                                    else ()
                                                }
                                            </cam:Campania>
                                        }
                                    </ofe:listaCampaniasDisponibles>
                                else ()
                            }
                        </ofe:InformacionCampania>
                    else ()
                }
            </ofe:GenerarOfertasRequest>
        </ns2:parameterList>
    </ns2:callFunctionStateless>
};

local:func($GenerarOfertasRequest)