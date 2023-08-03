xquery version "1.0" encoding "utf-8";
    
    (:: OracleAnnotationVersion "1.0" ::)
    
    declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/Flujo";
    (:: import schema at "../Schemas/NMPFlujoVehiculosSinResguardoSvcXSD.xsd" ::)
    declare namespace ns2="http://xmlns.oracle.com/bpm/bpmobject/Data/IniciarGestionBO";
    (:: import schema at "../Schemas/IniciarGestionBO.xsd" ::)
    
    declare namespace ns0="http://xmlns.oracle.com/bpmn/bpmnProcess/GestionCreditoVSR";
    (:: import schema at "../WSDLs/GestionCreditoVSR.wsdl" ::)
    
    declare namespace fol = "http://xmlns.oracle.com/bpm/bpmobject/Data/FolioBO";
    
    declare namespace cli = "http://xmlns.oracle.com/bpm/bpmobject/Data/ClienteBO";
    
    declare namespace flu = "http://servicios.montedepiedad.com.mx/NMP/Schema/VehiculoSinResguardo/FlujoBPM";
    
    declare namespace cot = "http://servicios.montedepiedad.com.mx/NMP/Schema/CotizadorBPM";
    
    declare namespace cot1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/Cotizador";
    
    declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculoBPM";
    
    declare namespace veh = "http://xmlns.oracle.com/bpm/bpmobject/Data/VehiculoBO";
    
    declare namespace nmp1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPVehiculo";
    
    declare namespace ope = "http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvc";
    
    declare namespace doc = "http://xmlns.oracle.com/bpm/bpmobject/Data/DocumentosBO";
    
    declare namespace ope1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/OpenTextSvcBPM";

declare namespace ns3="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardHeader";
(:: import schema at "../../../../Common/XSD/NMPStandardHeader.xsd" ::)
    
    declare variable $inciarFlujo as element() (:: schema-element(ns1:iniciarFlujoVehiculoSinResguardoRequest) ::) external;
    declare variable $header as element() (:: schema-element(ns3:headerMessage) ::) external;
    
    declare function local:convert($inciarFlujo as element() (:: schema-element(ns1:iniciarFlujoVehiculoSinResguardoRequest) ::), $ns3:header as element() (:: schema-element(ns3:headerMessage) ::)) as element() (:: schema-element(ns0:start) ::) {
        <ns0:start>
        <ns2:IniciarGestionBO>
            <ns2:folio>
                <fol:folio>{fn:data($inciarFlujo/ns1:folio)}</fol:folio>
            </ns2:folio>
            <ns2:cliente>
                <flu:cliente>
                    <flu:numeroCliente>{fn:data($inciarFlujo/ns1:cliente/ns1:numeroCliente)}</flu:numeroCliente>
                    <flu:numeroCredencial>{fn:data($inciarFlujo/ns1:cliente/ns1:numeroCliente)}</flu:numeroCredencial>
                </flu:cliente>
            </ns2:cliente>
            <ns2:estadoFlujoBPM>
                <flu:estadoFlujoBpm>{fn:data($inciarFlujo/ns1:estadoFlujoBpm)}</flu:estadoFlujoBpm>
            </ns2:estadoFlujoBPM>
            <ns2:estadoSolicitud>
                <flu:estadoSolicitud>{fn:data($inciarFlujo/ns1:estadoSolicitud)}</flu:estadoSolicitud>
            </ns2:estadoSolicitud>
             {if ($inciarFlujo/ns1:cotizacion)
             then(
               <ns2:cotizacion>
                    <flu:cotizacion>
                    {if ($inciarFlujo/ns1:cotizacion/cot1:montoAvaluo)
                     then(<cot:montoAvaluo>{fn:data($inciarFlujo/ns1:cotizacion/cot1:montoAvaluo)}</cot:montoAvaluo>)
                     else()}
                        {if ($inciarFlujo/ns1:cotizacion/cot1:montoMaximoPrestamo)
                     then(<cot:montoMaximoPrestamo>{fn:data($inciarFlujo/ns1:cotizacion/cot1:montoMaximoPrestamo)}</cot:montoMaximoPrestamo>)
                     else()}
                     {if ($inciarFlujo/ns1:cotizacion/cot1:montoPrestamoSolicitado)
                     then(
                        <cot:montoPrestamoSolicitado>{fn:data($inciarFlujo/ns1:cotizacion/cot1:montoPrestamoSolicitado)}</cot:montoPrestamoSolicitado>)
                        else()}
                        {if ($inciarFlujo/ns1:cotizacion/cot1:montoCastigo)
                     then(
                        <flu:montoCastigo>{fn:data($inciarFlujo/ns1:cotizacion/cot1:montoCastigo)}</flu:montoCastigo>)
                        else()}
                        </flu:cotizacion>
                </ns2:cotizacion>)
              else()
            }
            {if ($inciarFlujo/ns1:vehiculo)
             then(<ns2:vehiculo>
                    <veh:datosVehiculo>
                     {if ($inciarFlujo/ns1:vehiculo/nmp1:tipoVehiculo)
                     then(
                            <nmp:tipoVehiculo>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:tipoVehiculo)}</nmp:tipoVehiculo>
                            )
                     else()}
                     {if ($inciarFlujo/ns1:vehiculo/nmp1:vin)
                     then(
                            <nmp:vin>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:vin)}</nmp:vin>
                       )
                        else()}
                    {if ($inciarFlujo/ns1:vehiculo/nmp1:serieMotor)
                     then(
                            <nmp:serieMotor>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:serieMotor)}</nmp:serieMotor>
                            )
                    else()}
                   {if ($inciarFlujo/ns1:vehiculo/nmp1:placas)
                    then(
                         <nmp:placas>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:placas)}</nmp:placas>
                        )
                    else()}
                    {if ($inciarFlujo/ns1:vehiculo/nmp1:marca)
                     then(
                        <nmp:marca>
                            <nmp:idMarca>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:marca/nmp1:idMarca)}</nmp:idMarca>
                            {
                                if ($inciarFlujo/ns1:vehiculo/nmp1:marca/nmp1:descripcion)
                                then <nmp:descripcion>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:marca/nmp1:descripcion)}</nmp:descripcion>
                                else ()
                            }</nmp:marca>
                          )
                    else()}
                     {if ($inciarFlujo/ns1:vehiculo/nmp1:submarca)
                     then(
                            <nmp:submarca>
                                <nmp:idSubMarca>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:submarca/nmp1:idSubMarca)}</nmp:idSubMarca>
                                {
                                    if ($inciarFlujo/ns1:vehiculo/nmp1:submarca/nmp1:descripcion)
                                    then <nmp:descripcion>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:submarca/nmp1:descripcion)}</nmp:descripcion>
                                    else ()
                                }</nmp:submarca>                  
                             )
                    else()}
                     {if ($inciarFlujo/ns1:vehiculo/nmp1:modelo)
                     then(  <nmp:modelo>
                                <nmp:idModelo>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:modelo/nmp1:idModelo)}</nmp:idModelo>
                                {
                                    if ($inciarFlujo/ns1:vehiculo/nmp1:modelo/nmp1:descripcion)
                                    then <nmp:descripcion>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:modelo/nmp1:descripcion)}</nmp:descripcion>
                                    else ()
                                }</nmp:modelo>
                                     )
                                else()}
                     {if ($inciarFlujo/ns1:vehiculo/nmp1:version)
                     then( <nmp:version>
                                <nmp:idVersion>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:version/nmp1:idVersion)}</nmp:idVersion>
                                {
                                    if ($inciarFlujo/ns1:vehiculo/nmp1:version/nmp1:descripcion)
                                    then <nmp:descripcion>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:version/nmp1:descripcion)}</nmp:descripcion>
                                    else ()
                                }</nmp:version>
                                     )
                                else()}
                      {if ($inciarFlujo/ns1:vehiculo/nmp1:kilometraje)
                     then( <nmp:kilometraje>
                                <nmp:idKilometraje>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:kilometraje/nmp1:idKilometraje)}</nmp:idKilometraje>
                                {
                                    if ($inciarFlujo/ns1:vehiculo/nmp1:kilometraje/nmp1:descripcion)
                                    then <nmp:descripcion>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:kilometraje/nmp1:descripcion)}</nmp:descripcion>
                                    else ()
                                }</nmp:kilometraje>
                                     )
                                else()}
                   {if ($inciarFlujo/ns1:vehiculo/nmp1:complementos)
                     then(<nmp:complementos>
                        {
                            for $complemento in $inciarFlujo/ns1:vehiculo/nmp1:complementos/nmp1:complemento
                            return 
                            <nmp:complemento>
                                <nmp:idComplemento>{fn:data($complemento/nmp1:idComplemento)}</nmp:idComplemento>
                                {
                                    if ($complemento/nmp1:descripcion)
                                    then <nmp:descripcion>{fn:data($complemento/nmp1:descripcion)}</nmp:descripcion>
                                    else ()
                                }</nmp:complemento>
                        }</nmp:complementos>
                          )
                        else()}
                          {if ($inciarFlujo/ns1:vehiculo/nmp1:color)
             then(<nmp:color>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:color)}</nmp:color>
                               )
                        else()}
                         {if ($inciarFlujo/ns1:vehiculo/nmp1:serieChasis)
             then(<nmp:serieChasis>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:serieChasis)}</nmp:serieChasis>
                              )
                        else()}
                         {if ($inciarFlujo/ns1:vehiculo/nmp1:numeroTarjetaCirculacion)
             then( <nmp:numeroTarjetaCirculacion>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:numeroTarjetaCirculacion)}</nmp:numeroTarjetaCirculacion>
                               )
                        else()}
                         {if ($inciarFlujo/ns1:vehiculo/nmp1:numeroFactura)
             then(<nmp:numeroFactura>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:numeroFactura)}</nmp:numeroFactura>
                             )
                        else()}
                          {if ($inciarFlujo/ns1:vehiculo/nmp1:rfcEmisor)
             then( <nmp:rfcEmisor>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:rfcEmisor)}</nmp:rfcEmisor>
                            )
                        else()}
                           {if ($inciarFlujo/ns1:vehiculo/nmp1:agenciaOrigen)
             then( <nmp:agenciaOrigen>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:agenciaOrigen)}</nmp:agenciaOrigen>
                             )
                        else()}
                          {if ($inciarFlujo/ns1:vehiculo/nmp1:comentarios)
             then( <nmp:comentarios>{fn:data($inciarFlujo/ns1:vehiculo/nmp1:comentarios)}</nmp:comentarios>
                        )
                        else()}
                      </veh:datosVehiculo>  
            </ns2:vehiculo>)
            else()
            }        
            {
                for $documentos in $inciarFlujo/ns1:listaDocumentos/ope:documentos
                return 
                <ns2:listaDocumentos>
                    <doc:listaDocumentos>
                        <ope1:nombreDocumento>{fn:data($documentos/ope:nombreDocumento)}</ope1:nombreDocumento>
                        {
                            if ($documentos/ope:tipoDocumento)
                            then <ope1:tipoDocumento>{fn:data($documentos/ope:tipoDocumento)}</ope1:tipoDocumento>
                            else ()
                        }
                        {
                            if ($documentos/ope:documentoURL)
                            then <ope1:url>{fn:data($documentos/ope:documentoURL)}</ope1:url>
                            else ()
                        }
                        <ope1:creadoPor></ope1:creadoPor>
                        {
                            if ($documentos/ope:fechaCreacion)
                            then <ope1:fechaCreacion>{fn:data($documentos/ope:fechaCreacion)}</ope1:fechaCreacion>
                            else ()
                        }
                        <ope1:actualizadoPor></ope1:actualizadoPor>
                        <ope1:fechaActualizacion></ope1:fechaActualizacion>
                        <ope1:idDocumento>{fn:data($documentos/ope:documentoID)}</ope1:idDocumento>
                    </doc:listaDocumentos>
                </ns2:listaDocumentos>
            }
            <ns2:producto>
                <flu:idProducto>{fn:data($inciarFlujo/ns1:idProducto)}</flu:idProducto>
                <flu:idSubProducto>{fn:data($inciarFlujo/ns1:idSubProducto)}</flu:idSubProducto>
                <flu:nombreProducto>{fn:data($inciarFlujo/ns1:nombreProducto)}</flu:nombreProducto>
            </ns2:producto>
            <ns2:usuario>{fn:data($ns3:header/ns3:usuario)}</ns2:usuario>
        </ns2:IniciarGestionBO>
        </ns0:start>
    };

    
    local:convert($inciarFlujo,$header)