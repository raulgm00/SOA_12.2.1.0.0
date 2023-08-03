xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../Schemas/NMPClientesSvcElementosXSD.xsd" ::)
declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasPrendario";
(:: import schema at "../../../../FuerzaDeVentas/Campanias/Prendario/Resources/Schemas/NMPCampaniasPrendarioSvcElementosXSD.xsd" ::)

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasPrendarioT";

declare namespace cam = "http://servicios.montedepiedad.com.mx/NMP/Schema/Tipos/Campania";

declare variable $getClienteByIdRes as element() (:: element(*, ns1:getClientesResponseType) ::) external;
declare variable $getClienteCampaniasRes as element() (:: schema-element(ns2:getCampaniasClienteResponse) ::) external;

declare function local:func($getClienteByIdRes as element() (:: element(*, ns1:getClientesResponseType) ::),$getClienteCampaniasRes as element() (:: schema-element(ns2:getCampaniasClienteResponse) ::)) as element() (:: schema-element(ns1:getClienteCampaniasByIdResponse) ::) {
    <ns1:getClienteCampaniasByIdResponse>
        <ns1:Cliente>
            
            <ns1:idCliente>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:idCliente)}</ns1:idCliente>
            <ns1:genero>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:genero)}</ns1:genero>
            <ns1:nombre>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:nombre)}</ns1:nombre>
            <ns1:apellidoPaterno>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:apellidoPaterno)}</ns1:apellidoPaterno>
            <ns1:apellidoMaterno>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:apellidoMaterno)}</ns1:apellidoMaterno>
            <ns1:fechaDeNacimiento>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:fechaDeNacimiento)}</ns1:fechaDeNacimiento>
            
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:fechaIngreso[1])
                then <ns1:fechaIngreso>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:fechaIngreso)}</ns1:fechaIngreso>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:ocupacion[1])
                then <ns1:ocupacion>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:ocupacion)}</ns1:ocupacion>
                else ()
            }
            
            <ns1:trabaja>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:trabaja)}</ns1:trabaja>
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:URLVision360[1])
                then <ns1:URLVision360>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:URLVision360)}</ns1:URLVision360>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:banderaDeBoletinacion[1])
                then <ns1:banderaDeBoletinacion>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:banderaDeBoletinacion)}</ns1:banderaDeBoletinacion>
                else ()
            }
            
            <ns1:numeroDeCredencial>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:numeroDeCredencial)}</ns1:numeroDeCredencial>
            <ns1:Cotitular>
                <ns1:nombre>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:Cotitular/ns1:nombre)}</ns1:nombre>
                <ns1:apellidoPaterno>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:Cotitular/ns1:apellidoPaterno)}</ns1:apellidoPaterno>
                <ns1:apellidoMaterno>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:Cotitular/ns1:apellidoMaterno)}</ns1:apellidoMaterno>
                {
                    if ($getClienteByIdRes/ns1:Cliente/ns1:Cotitular/ns1:ListaTelefonos[1])
                    then 
                        <ns1:ListaTelefonos>
                            {
                                for $Telefono in $getClienteByIdRes/ns1:Cliente/ns1:Cotitular/ns1:ListaTelefonos/ns1:Telefono
                                return 
                                <ns1:Telefono>
                                    {
                                        if ($Telefono/ns1:codigoPais[1])
                                        then <ns1:codigoPais>{fn:data($Telefono/ns1:codigoPais)}</ns1:codigoPais>
                                        else ()
                                    }
                                    {
                                        if ($Telefono/ns1:codigoArea[1])
                                        then <ns1:codigoArea>{fn:data($Telefono/ns1:codigoArea)}</ns1:codigoArea>
                                        else ()
                                    }
                                    {
                                        if ($Telefono/ns1:numeroTelefonico[1])
                                        then <ns1:numeroTelefonico>{fn:data($Telefono/ns1:numeroTelefonico)}</ns1:numeroTelefonico>
                                        else ()
                                    }
                                    {
                                        if ($Telefono/ns1:extension[1])
                                        then <ns1:extension>{fn:data($Telefono/ns1:extension)}</ns1:extension>
                                        else ()
                                    }
                                    {
                                        if ($Telefono/ns1:tipoTelefono[1])
                                        then <ns1:tipoTelefono>{fn:data($Telefono/ns1:tipoTelefono)}</ns1:tipoTelefono>
                                        else ()
                                    }
                                </ns1:Telefono>
                            }
                        </ns1:ListaTelefonos>
                    else ()
                }
            </ns1:Cotitular>
            {
                
                if ($getClienteByIdRes/ns1:Cliente/ns1:Beneficiarios[1])
                then 
                    <ns1:Beneficiarios>
                        {
                            for $Beneficiario in $getClienteByIdRes/ns1:Cliente/ns1:Beneficiarios/ns1:Beneficiario
                            return 
                            <ns1:Beneficiario>
                                <ns1:nombre>{fn:data($Beneficiario/ns1:nombre)}</ns1:nombre>
                                <ns1:apellidoPaterno>{fn:data($Beneficiario/ns1:apellidoPaterno)}</ns1:apellidoPaterno>
                                <ns1:apellidoMaterno>{fn:data($Beneficiario/ns1:apellidoMaterno)}</ns1:apellidoMaterno>
                            </ns1:Beneficiario>
                        }
                    </ns1:Beneficiarios>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:email[1])
                then <ns1:email>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:email)}</ns1:email>
                else ()
            }
            {
            
                if ($getClienteByIdRes/ns1:Cliente/ns1:CorreosElectronicos[1])
                then 
                    <ns1:CorreosElectronicos>
                        {
                            for $CorreoElectronico in $getClienteByIdRes/ns1:Cliente/ns1:CorreosElectronicos/ns1:CorreoElectronico
                            return 
                            <ns1:CorreoElectronico>
                                <ns1:email>{fn:data($CorreoElectronico/ns1:email)}</ns1:email>
                                <ns1:tipoEmail>{fn:data($CorreoElectronico/ns1:tipoEmail)}</ns1:tipoEmail>
                                {
                                    if ($CorreoElectronico/ns1:fuenteDato[1])
                                    then <ns1:fuenteDato>{fn:data($CorreoElectronico/ns1:fuenteDato)}</ns1:fuenteDato>
                                    else ()
                                }
                                {
                                    if ($CorreoElectronico/ns1:origenDato[1])
                                    then <ns1:origenDato>{fn:data($CorreoElectronico/ns1:origenDato)}</ns1:origenDato>
                                    else ()
                                }
                            </ns1:CorreoElectronico>
                        }
                    </ns1:CorreosElectronicos>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:porcentajeAforo[1])
                then <ns1:porcentajeAforo>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:porcentajeAforo)}</ns1:porcentajeAforo>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:sobreAforo[1])
                then <ns1:sobreAforo>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:sobreAforo)}</ns1:sobreAforo>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:calificacionAjustada[1])
                then <ns1:calificacionAjustada>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:calificacionAjustada)}</ns1:calificacionAjustada>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:calificacionSIVA2[1])
                then <ns1:calificacionSIVA2>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:calificacionSIVA2)}</ns1:calificacionSIVA2>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:sobreaforoAjustado[1])
                then <ns1:sobreaforoAjustado>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:sobreaforoAjustado)}</ns1:sobreaforoAjustado>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:sobreaforoSIVA2[1])
                then <ns1:sobreaforoSIVA2>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:sobreaforoSIVA2)}</ns1:sobreaforoSIVA2>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:calificacionReal[1])
                then <ns1:calificacionReal>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:calificacionReal)}</ns1:calificacionReal>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:calificacionMidas[1])
                then <ns1:calificacionMidas>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:calificacionMidas)}</ns1:calificacionMidas>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:capacidadDePago[1])
                then <ns1:capacidadDePago>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:capacidadDePago)}</ns1:capacidadDePago>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:probabilidadIncumplimiento[1])
                then <ns1:probabilidadIncumplimiento>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:probabilidadIncumplimiento)}</ns1:probabilidadIncumplimiento>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:indiceRecuperacion[1])
                then <ns1:indiceRecuperacion>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:indiceRecuperacion)}</ns1:indiceRecuperacion>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:gradoDeConfianza[1])
                then <ns1:gradoDeConfianza>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:gradoDeConfianza)}</ns1:gradoDeConfianza>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:estatusAlmacenamientoImagen[1])
                then <ns1:estatusAlmacenamientoImagen>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:estatusAlmacenamientoImagen)}</ns1:estatusAlmacenamientoImagen>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:nombreDeLaImagen[1])
                then <ns1:nombreDeLaImagen>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:nombreDeLaImagen)}</ns1:nombreDeLaImagen>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:tipoIdentificacion[1])
                then <ns1:tipoIdentificacion>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:tipoIdentificacion)}</ns1:tipoIdentificacion>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:numeroIdentificacion[1])
                then <ns1:numeroIdentificacion>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:numeroIdentificacion)}</ns1:numeroIdentificacion>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:existCamp[1])
                then <ns1:existCamp>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:existCamp)}</ns1:existCamp>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:escolaridad[1])
                then <ns1:escolaridad>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:escolaridad)}</ns1:escolaridad>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:deseaSerContactado[1])
                then <ns1:deseaSerContactado>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:deseaSerContactado)}</ns1:deseaSerContactado>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:alertaMIDAS[1])
                then <ns1:alertaMIDAS>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:alertaMIDAS)}</ns1:alertaMIDAS>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:Contacto[1])
                then 
                    <ns1:Contacto>
                        <ns1:ListaTelefonos>
                            {
                                for $Telefono in $getClienteByIdRes/ns1:Cliente/ns1:Contacto/ns1:ListaTelefonos/ns1:Telefono
                                return 
                                <ns1:Telefono>
                                    {
                                        if ($Telefono/ns1:codigoPais[1])
                                        then <ns1:codigoPais>{fn:data($Telefono/ns1:codigoPais)}</ns1:codigoPais>
                                        else ()
                                    }
                                    {
                                        if ($Telefono/ns1:codigoArea[1])
                                        then <ns1:codigoArea>{fn:data($Telefono/ns1:codigoArea)}</ns1:codigoArea>
                                        else ()
                                    }
                                    {
                                        if ($Telefono/ns1:numeroTelefonico[1])
                                        then <ns1:numeroTelefonico>{fn:data($Telefono/ns1:numeroTelefonico)}</ns1:numeroTelefonico>
                                        else ()
                                    }
                                    {
                                        if ($Telefono/ns1:extension[1])
                                        then <ns1:extension>{fn:data($Telefono/ns1:extension)}</ns1:extension>
                                        else ()
                                    }
                                    {
                                        if ($Telefono/ns1:tipoTelefono[1])
                                        then <ns1:tipoTelefono>{fn:data($Telefono/ns1:tipoTelefono)}</ns1:tipoTelefono>
                                        else ()
                                    }
                                </ns1:Telefono>
                            }
                        </ns1:ListaTelefonos>
                        <ns1:ListaDirecciones>
                            {
                                for $Direccion in $getClienteByIdRes/ns1:Cliente/ns1:Contacto/ns1:ListaDirecciones/ns1:Direccion
                                return 
                                <ns1:Direccion>
                                    {
                                        if ($Direccion/ns1:nombreDelaCalle[1])
                                        then <ns1:nombreDelaCalle>{fn:data($Direccion/ns1:nombreDelaCalle)}</ns1:nombreDelaCalle>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:numeroExterior[1])
                                        then <ns1:numeroExterior>{fn:data($Direccion/ns1:numeroExterior)}</ns1:numeroExterior>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:numeroInterior[1])
                                        then <ns1:numeroInterior>{fn:data($Direccion/ns1:numeroInterior)}</ns1:numeroInterior>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:entreCalle1[1])
                                        then <ns1:entreCalle1>{fn:data($Direccion/ns1:entreCalle1)}</ns1:entreCalle1>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:entreCalle2[1])
                                        then <ns1:entreCalle2>{fn:data($Direccion/ns1:entreCalle2)}</ns1:entreCalle2>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:estado[1])
                                        then <ns1:estado>{fn:data($Direccion/ns1:estado)}</ns1:estado>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:idEstado[1])
                                        then <ns1:idEstado>{fn:data($Direccion/ns1:idEstado)}</ns1:idEstado>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:delegacionMunicipio[1])
                                        then <ns1:delegacionMunicipio>{fn:data($Direccion/ns1:delegacionMunicipio)}</ns1:delegacionMunicipio>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:idDelegacionMunicipio[1])
                                        then <ns1:idDelegacionMunicipio>{fn:data($Direccion/ns1:idDelegacionMunicipio)}</ns1:idDelegacionMunicipio>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:colonia[1])
                                        then <ns1:colonia>{fn:data($Direccion/ns1:colonia)}</ns1:colonia>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:idColonia[1])
                                        then <ns1:idColonia>{fn:data($Direccion/ns1:idColonia)}</ns1:idColonia>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:codigoPostal[1])
                                        then <ns1:codigoPostal>{fn:data($Direccion/ns1:codigoPostal)}</ns1:codigoPostal>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:idCodigoPostal[1])
                                        then <ns1:idCodigoPostal>{fn:data($Direccion/ns1:idCodigoPostal)}</ns1:idCodigoPostal>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:tipoDomicilio[1])
                                        then <ns1:tipoDomicilio>{fn:data($Direccion/ns1:tipoDomicilio)}</ns1:tipoDomicilio>
                                        else ()
                                    }
                                    {
                                        if ($Direccion/ns1:ciudadPoblacion[1])
                                        then <ns1:ciudadPoblacion>{fn:data($Direccion/ns1:ciudadPoblacion)}</ns1:ciudadPoblacion>
                                        else ()
                                    }
                                </ns1:Direccion>
                            }
                        </ns1:ListaDirecciones>
                    </ns1:Contacto>
                else ()
            }
            {
                if ($getClienteByIdRes/ns1:Cliente/ns1:tipoCliente[1])
                then <ns1:tipoCliente>{fn:data($getClienteByIdRes/ns1:Cliente/ns1:tipoCliente)}</ns1:tipoCliente>
                else ()
            }
            {
            
            if($getClienteByIdRes/ns1:Cliente/ns1:listaAlertas/ns1:alerta[1])
            then <ns1:listaAlertas>
                    {
                        for $alerta in $getClienteByIdRes/ns1:Cliente/ns1:listaAlertas/ns1:alerta
                        return 
                        <ns1:alerta>
                            {
                                if ($alerta/ns1:nombreAlerta[1])
                                then <ns1:nombreAlerta>{fn:data($alerta/ns1:nombreAlerta)}</ns1:nombreAlerta>
                                else ()
                            }
                            {
                                if ($alerta/ns1:descripcion[1])
                                then <ns1:descripcion>{fn:data($alerta/ns1:descripcion)}</ns1:descripcion>
                                else ()
                            }
                        </ns1:alerta>
                    }
                 </ns1:listaAlertas>
            else()
            }
            
        </ns1:Cliente>
        <ns1:listaCampanias>
            {
                for $Campania in $getClienteCampaniasRes/nmp:listaCampania/cam:Campania
                return 
                <cam:Campania>
                    {
                        if ($Campania/cam:idCampania[1])
                        then <cam:idCampania>{fn:data($Campania/cam:idCampania)}</cam:idCampania>
                        else ()
                    }
                    {
                        if ($Campania/cam:nombre[1])
                        then <cam:nombre>{fn:data($Campania/cam:nombre)}</cam:nombre>
                        else ()
                    }
                    {
                        if ($Campania/cam:descripcion[1])
                        then <cam:descripcion>{fn:data($Campania/cam:descripcion)}</cam:descripcion>
                        else ()
                    }
                    {
                        if ($Campania/cam:ramo[1])
                        then <cam:ramo>{fn:data($Campania/cam:ramo)}</cam:ramo>
                        else ()
                    }
                    {
                        if ($Campania/cam:subRamo[1])
                        then <cam:subRamo>{fn:data($Campania/cam:subRamo)}</cam:subRamo>
                        else ()
                    }
                </cam:Campania>
            }
        </ns1:listaCampanias>
    </ns1:getClienteCampaniasByIdResponse>
};

local:func($getClienteByIdRes,$getClienteCampaniasRes)