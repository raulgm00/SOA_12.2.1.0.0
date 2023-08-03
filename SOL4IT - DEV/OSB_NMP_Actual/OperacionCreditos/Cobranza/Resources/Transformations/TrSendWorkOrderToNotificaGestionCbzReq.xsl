<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ges="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionCobranza"
    xmlns:gm="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilREST"
    xmlns:gmt="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionMovilRESTTipos"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    version="1.0" exclude-result-prefixes="ges soapenv gm gmt">    
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <soapenv:Body>
        <ges:notificaGestionCobranzaRequest>
            <xsl:attribute name="ProductId">
                <xsl:value-of select="gm:Response/@ProductId"/>
            </xsl:attribute>
            <xsl:attribute name="ExternalId">
                <xsl:value-of select="gm:Response/@ExternalId"/>
            </xsl:attribute>
            <xsl:attribute name="ExternalType">
                <xsl:value-of select="gm:Response/@ExternalType"/>
            </xsl:attribute>
            <xsl:attribute name="AssignedTo">
                <xsl:value-of select="gm:Response/@AssignedTo"/>
            </xsl:attribute>
            <xsl:attribute name="InitialDate">
                <xsl:value-of select="gm:Response/@InitialDate"/>
            </xsl:attribute>
            <xsl:attribute name="FinalDate">
                <xsl:value-of select="gm:Response/@FinalDate"/>
            </xsl:attribute>
            <xsl:attribute name="ResponseDate">
                <xsl:value-of select="gm:Response/@ResponseDate"/>
            </xsl:attribute>
            <xsl:attribute name="InitialLatitude">
                <xsl:value-of select="gm:Response/@InitialLatitude"/>
            </xsl:attribute>
            <xsl:attribute name="FinalLatitude">
                <xsl:value-of select="gm:Response/@FinalLatitude"/>
            </xsl:attribute>
            <xsl:attribute name="InitialLongitude">
                <xsl:value-of select="gm:Response/@InitialLongitude"/>
            </xsl:attribute>
            <xsl:attribute name="FinalLongitude">
                <xsl:value-of select="gm:Response/@FinalLongitude"/>
            </xsl:attribute>
            <xsl:attribute name="FormiikResponseSource">
                <xsl:value-of select="gm:Response/@FormiikResponseSource"/>
            </xsl:attribute>
        <ges:Cobranza>            
            <ges:cliente>
                <ges:idCliente>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:CLIENTE_PROSPECT"/>                    
                </ges:idCliente>
                <ges:idContrato>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:CONTRATO_ID"/>                    
                </ges:idContrato>
                <ges:primerNombre>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:PRIMERNOMBRE"/>                    
                </ges:primerNombre>
                <xsl:if test="//gmt:DATOS_CLIENTE/gmt:SEGUNDONOMBRE">
                    <ges:segundoNombre>                    
                        <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:SEGUNDONOMBRE"/>                    
                    </ges:segundoNombre>
                </xsl:if>                
                <ges:apellidoMaterno>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:SEGUNDO_APELLIDO"/>                    
                </ges:apellidoMaterno>
                <ges:apellidoPaterno>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:PRIMERAPELLIDO"/>                    
                </ges:apellidoPaterno>
                <ges:actividad>                   
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:ACTIVIDADSOL"/>                    
                </ges:actividad>
                <ges:sector>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:SECTORSOL"/>                    
                </ges:sector>
                <ges:actividadEconomica>                   
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:ACTECONOMICASOL"/>                    
                </ges:actividadEconomica>
                <ges:genero>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:SEXO"/>                    
                </ges:genero>
                <ges:estadoCivil>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:ESTADO_CIVIL"/>                    
                </ges:estadoCivil>
                <ges:rfc>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:NUMERORFC"/>                    
                </ges:rfc>
                <ges:curp>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:CURPSOL"/>                    
                </ges:curp>
                <ges:riesgoMorosidad>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:RIESGO_MOROSIDAD"/>                    
                </ges:riesgoMorosidad>
                <ges:direcciones>
                    
                    <!-- Direccion de Casa -->
                    <xsl:if test="//gmt:DATOS_CLIENTE/gmt:CALLECD">
                        <ges:direccion>
                            <ges:nombreDelaCalle>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:CALLECD"/>                            
                            </ges:nombreDelaCalle>
                            <ges:numeroExterior>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:NUMERO_EXTERIOR"/>                            
                            </ges:numeroExterior>                        
                            <ges:numeroInterior>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:NUMERO_INTERIOR"/>                            
                            </ges:numeroInterior>                        
                            <ges:entreCalle1>                           
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:ENTRECALLE1DCD"/>                            
                            </ges:entreCalle1>                        
                            <ges:entreCalle2>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:ENTRECALLE2DCD"/>                            
                            </ges:entreCalle2>                        
                            <ges:estado>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:ESTADOCD"/>                            
                            </ges:estado>                        
                            <ges:delegacionMunicipio>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:MUNICIPIOCD"/>                            
                            </ges:delegacionMunicipio>                        
                            <ges:colonia>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:COLONIACD"/>                            
                            </ges:colonia>                        
                            <ges:codigoPostal>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:CODIGO_POSTAL"/>                            
                            </ges:codigoPostal>                        
                            <ges:tipoDomicilio>Casa</ges:tipoDomicilio>
                            <ges:manzana>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:MANZANADCD"/>                            
                            </ges:manzana>                        
                            <ges:lote>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:LOTEDCD"/>                            
                            </ges:lote>                        
                            <ges:localidad>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:LOCALIDADDCD"/>                            
                            </ges:localidad>                                              
                            <ges:gps>                          
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:GPSCLIENTE"/>                            
                            </ges:gps>
                        </ges:direccion>
                    </xsl:if>
                    
                    <!-- Direccion de Negocio -->
                    <xsl:if test="//gmt:DATOS_CLIENTE/gmt:CALLEOE">
                        <ges:direccion>                    
                            <ges:nombreDelaCalle>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:CALLEOE"/>                            
                            </ges:nombreDelaCalle>                    
                            <ges:numeroExterior>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:NOEXTOE"/>                            
                            </ges:numeroExterior>                        
                            <ges:numeroInterior>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:NOINTOE"/>                            
                            </ges:numeroInterior>                        
                            <ges:entreCalle1>                           
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:ENTRECALLE1OE"/>                            
                            </ges:entreCalle1>                        
                            <ges:entreCalle2>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:ENTRECALLE2OE"/>                            
                            </ges:entreCalle2>                        
                            <ges:estado>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:ESTADOOE"/>                            
                            </ges:estado>                        
                            <ges:delegacionMunicipio>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:MUNICIPIOOE"/>                            
                            </ges:delegacionMunicipio>                        
                            <ges:colonia>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:COLONIAOE"/>                            
                            </ges:colonia>                        
                            <ges:codigoPostal>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:CPOE"/>                            
                            </ges:codigoPostal>                        
                            <ges:tipoDomicilio>Negocio</ges:tipoDomicilio>
                            <ges:manzana>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:MANZANAOE"/>                            
                            </ges:manzana>                        
                            <ges:lote>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:LOTEOE"/>                            
                            </ges:lote>                                                                 
                            <ges:gps>                          
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:GPSNEGOCIOEMPLEO"/>                            
                            </ges:gps>
                        </ges:direccion>
                    </xsl:if>
                </ges:direcciones>
                
                <ges:telefonos>
                    <!-- Telefono de Casa -->
                    <xsl:if test="//gmt:DATOS_CLIENTE/gmt:TELEFONO_CASA">
                        <ges:telefono>                   
                            <ges:numeroTelefonico>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:TELEFONO_CASA"/>                            
                            </ges:numeroTelefonico>                                            
                            <ges:tipoTelefono>Casa</ges:tipoTelefono>
                        </ges:telefono>
                    </xsl:if>
                    
                    <!-- Telefono del trabajo -->
                    <xsl:if test="//gmt:DATOS_CLIENTE/gmt:TELEFONO_TRABAJO">
                        <ges:telefono>                             
                            <ges:numeroTelefonico>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:TELEFONO_TRABAJO"/>                            
                            </ges:numeroTelefonico>                        
                            <ges:extension>                           
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:EXTENSION_TRAB"/>                            
                            </ges:extension>                        
                            <ges:tipoTelefono>Trabajo</ges:tipoTelefono>
                        </ges:telefono>
                    </xsl:if>
                    
                    <!-- Telefono celular del cliente -->
                    <xsl:if test="//gmt:DATOS_CLIENTE/gmt:TELEFONO_CELULAR">
                        <ges:telefono>                             
                            <ges:numeroTelefonico>                            
                                <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:TELEFONO_CELULAR"/>                            
                            </ges:numeroTelefonico>                                      
                            <ges:tipoTelefono>Celular</ges:tipoTelefono>
                        </ges:telefono>
                    </xsl:if>                    
                </ges:telefonos>
                <xsl:if test="//gmt:DATOS_CLIENTE/gmt:CORREO_ELECTRONI">
                    <ges:correoElectronico>                    
                        <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:CORREO_ELECTRONI"/>                    
                    </ges:correoElectronico>
                </xsl:if>                                
                <ges:nombreEmpleo>                    
                    <xsl:value-of select="//gmt:DATOS_CLIENTE/gmt:NOMBREEMPLEO"/>                    
                </ges:nombreEmpleo>
            </ges:cliente>   
            
            <ges:referencias>
                <xsl:if test="//gmt:REFERENCIAS/gmt:REF1">
                    <ges:referencia>
                        <ges:idReferencia>                        
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:REF1"/>                        
                        </ges:idReferencia>
                        <ges:parentesco>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:PARENTESCO_REF1"/>
                        </ges:parentesco>
                        <ges:primerNombre>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:NOMBRE_REF1"/>
                        </ges:primerNombre>
                        <ges:segundoNombre>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:SEGUNDONOMBRE_REF1"/>
                        </ges:segundoNombre>
                        <ges:apellidoMaterno>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:SEGUNDOAPELLIDO_REF1"/>
                        </ges:apellidoMaterno>
                        <ges:apellidoPaterno>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:PRIMERAPELLIDO_REF1"/>
                        </ges:apellidoPaterno>
                        <ges:telefonos>
                            <xsl:if test="//gmt:REFERENCIAS/gmt:TELEFONO_REF1">
                                <ges:telefono>                               
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:TELEFONO_REF1"/>
                                    </ges:numeroTelefonico>  
                                    <ges:extension>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:EXTENCION_REF1"/>
                                    </ges:extension>  
                                    <ges:tipoTelefono>Trabajo</ges:tipoTelefono>
                                </ges:telefono>     
                            </xsl:if>
                            <xsl:if test="//gmt:REFERENCIAS/gmt:CELULAR_REF1">
                                <ges:telefono>                               
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:CELULAR_REF1"/>
                                    </ges:numeroTelefonico>                                                          
                                    <ges:tipoTelefono>Celular</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>
                        </ges:telefonos>
                        
                        <ges:direcciones>
                            <xsl:if test="//gmt:REFERENCIAS/gmt:DOMICILIO_REF1">
                                <ges:direccion>
                                    <ges:domicilio>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:DOMICILIO_REF1"/>
                                    </ges:domicilio>
                                    <ges:colonia>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:COLONIA_REF1"/>
                                    </ges:colonia>
                                    <ges:ciudad>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:CD_REF1"/>
                                    </ges:ciudad>
                                    <ges:estado>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:ESTADO_REF1"/>
                                    </ges:estado>
                                </ges:direccion>
                            </xsl:if>                            
                        </ges:direcciones>
                    </ges:referencia>
                </xsl:if>
                <xsl:if test="//gmt:REFERENCIAS/gmt:REF2">
                    <ges:referencia> 
                        <ges:idReferencia>                        
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:REF2"/>                        
                        </ges:idReferencia>
                        <ges:parentesco>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:PARENTESCO_REF2"/>
                        </ges:parentesco>
                        <ges:primerNombre>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:NOMBRE_REF2"/>
                        </ges:primerNombre>
                        <ges:segundoNombre>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:SEGUNDONOMBRE_REF2"/>
                        </ges:segundoNombre>
                        <ges:apellidoMaterno>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:SEGUNDOAPELLIDO_REF2"/>
                        </ges:apellidoMaterno>
                        <ges:apellidoPaterno>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:PRIMERAPELLIDO_REF2"/>
                        </ges:apellidoPaterno>
                        <ges:telefonos>
                            <xsl:if test="//gmt:REFERENCIAS/gmt:TELEFONO_REF2">
                                <ges:telefono>                               
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:TELEFONO_REF2"/>
                                    </ges:numeroTelefonico>  
                                    <ges:extension>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:EXTENCION_REF2"/>
                                    </ges:extension>  
                                    <ges:tipoTelefono>Trabajo</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>
                            <xsl:if test="//gmt:REFERENCIAS/gmt:CELULAR_REF2">
                                <ges:telefono>                               
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:CELULAR_REF2"/>
                                    </ges:numeroTelefonico>                                                          
                                    <ges:tipoTelefono>Celular</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>                          
                        </ges:telefonos>
                        <ges:direcciones>
                            <xsl:if test="//gmt:REFERENCIAS/gmt:DOMICILIO_REF2">
                                <ges:direccion>
                                    <ges:domicilio>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:DOMICILIO_REF2"/>
                                    </ges:domicilio>
                                    <ges:colonia>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:COLONIA_REF2"/>
                                    </ges:colonia>
                                    <ges:ciudad>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:CD_REF2"/>
                                    </ges:ciudad>
                                    <ges:estado>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:ESTADO_REF2"/>
                                    </ges:estado>
                                </ges:direccion>
                            </xsl:if>                            
                        </ges:direcciones>
                    </ges:referencia>
                </xsl:if>
                
                <xsl:if test="//gmt:REFERENCIAS/gmt:REF3">
                    <ges:referencia> 
                        <ges:idReferencia>                        
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:REF3"/>                        
                        </ges:idReferencia>
                        <ges:parentesco>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:PARENTESCO_REF3"/>
                        </ges:parentesco>
                        <ges:primerNombre>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:NOMBRE_REF3"/>
                        </ges:primerNombre>
                        <ges:segundoNombre>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:SEGUNDONOMBRE_REF3"/>
                        </ges:segundoNombre>
                        <ges:apellidoMaterno>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:SEGUNDOAPELLIDO_REF3"/>
                        </ges:apellidoMaterno>
                        <ges:apellidoPaterno>
                            <xsl:value-of select="//gmt:REFERENCIAS/gmt:PRIMERAPELLIDO_REF3"/>
                        </ges:apellidoPaterno>
                        <ges:telefonos>
                            <xsl:if test="//gmt:REFERENCIAS/gmt:TELEFONO_REF3">
                                <ges:telefono>                               
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:TELEFONO_REF3"/>
                                    </ges:numeroTelefonico>  
                                    <ges:extension>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:EXTENCION_REF3"/>
                                    </ges:extension>  
                                    <ges:tipoTelefono>Trabajo</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>
                            <xsl:if test="//gmt:REFERENCIAS/gmt:CELULAR_REF3">
                                <ges:telefono>                               
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:CELULAR_REF3"/>
                                    </ges:numeroTelefonico>                                                          
                                    <ges:tipoTelefono>Celular</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>
                        </ges:telefonos>
                        <ges:direcciones>
                            <xsl:if test="//gmt:REFERENCIAS/gmt:DOMICILIO_REF3">
                                <ges:direccion>
                                    <ges:domicilio>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:DOMICILIO_REF3"/>
                                    </ges:domicilio>
                                    <ges:colonia>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:COLONIA_REF3"/>
                                    </ges:colonia>
                                    <ges:ciudad>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:CD_REF3"/>
                                    </ges:ciudad>
                                    <ges:estado>
                                        <xsl:value-of select="//gmt:REFERENCIAS/gmt:ESTADO_REF3"/>
                                    </ges:estado>
                                </ges:direccion>
                            </xsl:if>                            
                        </ges:direcciones>
                    </ges:referencia>
                </xsl:if>
            </ges:referencias>
            
            <ges:avales>
                <xsl:if test="//gmt:AVALES/gmt:AVAL1">
                    <ges:aval>
                        <ges:idAval>
                            <xsl:value-of select="//gmt:AVALES/gmt:AVAL1"/>
                        </ges:idAval>
                        <ges:parentesco>
                            <xsl:value-of select="//gmt:AVALES/gmt:PARENTESCO_AVAL1"/>
                        </ges:parentesco>
                        <ges:primerNombre>
                            <xsl:value-of select="//gmt:AVALES/gmt:NOMBRE_AVAL1"/>
                        </ges:primerNombre>
                        <ges:segundoNombre>
                            <xsl:value-of select="//gmt:AVALES/gmt:SEGUNDONOMBRE_AVAL1"/>
                        </ges:segundoNombre>
                        <ges:apellidoMaterno>
                            <xsl:value-of select="//gmt:AVALES/gmt:SEGUNDOAPELLIDO_AVAL1"/>
                        </ges:apellidoMaterno>
                        <ges:apellidoPaterno>
                            <xsl:value-of select="//gmt:AVALES/gmt:PRIMERAPELLIDO_AVAL1"/>
                        </ges:apellidoPaterno>
                        <ges:telefonos>
                            <xsl:if test="//gmt:AVALES/gmt:TELEFONO_AVAL1">
                                <ges:telefono>                                
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:AVALES/gmt:TELEFONO_AVAL1"/>
                                    </ges:numeroTelefonico>                            
                                    <ges:extension>
                                        <xsl:value-of select="//gmt:AVALES/gmt:EXTENCION_AVAL1"/>
                                    </ges:extension>                            
                                    <ges:tipoTelefono>Casa</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>
                            <xsl:if test="//gmt:AVALES/gmt:CELULAR_AVAL1">
                                <ges:telefono>                                                                              
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:AVALES/gmt:CELULAR_AVAL1"/>
                                    </ges:numeroTelefonico>                                                                                   
                                    <ges:tipoTelefono>Celular</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>
                            <xsl:if test="//gmt:AVALES/gmt:CELULAR_AVAL1">
                                <ges:telefono>                                                                              
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:AVALES/gmt:CELULAR_AVAL1"/>
                                    </ges:numeroTelefonico>                                                                                   
                                    <ges:tipoTelefono>Celular</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>                            
                        </ges:telefonos>
                        <xsl:if test="//gmt:AVALES/gmt:DOMICILIO_AVAL1">
                            <ges:direccion>
                                <ges:domicilio>
                                    <xsl:value-of select="//gmt:AVALES/gmt:DOMICILIO_AVAL1"/>
                                </ges:domicilio>
                                <ges:colonia>
                                    <xsl:value-of select="//gmt:AVALES/gmt:COLONIA_AVAL1"/>
                                </ges:colonia>
                                <ges:ciudad>
                                    <xsl:value-of select="//gmt:AVALES/gmt:CD_AVAL1"/>
                                </ges:ciudad>
                                <ges:estado>
                                    <xsl:value-of select="//gmt:AVALES/gmt:ESTADO_AVAL1"/>
                                </ges:estado>
                            </ges:direccion>
                        </xsl:if>                        
                    </ges:aval>                    
                </xsl:if>
                <xsl:if test="//gmt:AVALES/gmt:AVAL2">
                    <ges:aval>
                        <ges:idAval>
                            <xsl:value-of select="//gmt:AVALES/gmt:AVAL2"/>
                        </ges:idAval>
                        <ges:parentesco>
                            <xsl:value-of select="//gmt:AVALES/gmt:PARENTESCO_AVAL2"/>
                        </ges:parentesco>
                        <ges:primerNombre>
                            <xsl:value-of select="//gmt:AVALES/gmt:NOMBRE_AVAL2"/>
                        </ges:primerNombre>
                        <ges:segundoNombre>
                            <xsl:value-of select="//gmt:AVALES/gmt:SEGUNDONOMBRE_AVAL2"/>
                        </ges:segundoNombre>
                        <ges:apellidoMaterno>
                            <xsl:value-of select="//gmt:AVALES/gmt:SEGUNDOAPELLIDO_AVAL2"/>
                        </ges:apellidoMaterno>
                        <ges:apellidoPaterno>
                            <xsl:value-of select="//gmt:AVALES/gmt:PRIMERAPELLIDO_AVAL2"/>
                        </ges:apellidoPaterno>
                        <ges:telefonos>
                            <xsl:if test="//gmt:AVALES/gmt:TELEFONO_AVAL2">
                                <ges:telefono>                                
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:AVALES/gmt:TELEFONO_AVAL2"/>
                                    </ges:numeroTelefonico>                            
                                    <ges:extension>
                                        <xsl:value-of select="//gmt:AVALES/gmt:EXTENCION_AVAL2"/>
                                    </ges:extension>                            
                                    <ges:tipoTelefono>Casa</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>
                            <xsl:if test="//gmt:AVALES/gmt:CELULAR_AVAL2">
                                <ges:telefono>                                                                              
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:AVALES/gmt:CELULAR_AVAL2"/>
                                    </ges:numeroTelefonico>                                                                                   
                                    <ges:tipoTelefono>Celular</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>
                            <xsl:if test="//gmt:AVALES/gmt:CELULAR_AVAL2">
                                <ges:telefono>                                                                              
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:AVALES/gmt:CELULAR_AVAL2"/>
                                    </ges:numeroTelefonico>                                                                                   
                                    <ges:tipoTelefono>Celular</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>                            
                        </ges:telefonos>
                        <xsl:if test="//gmt:AVALES/gmt:DOMICILIO_AVAL2">
                            <ges:direccion>
                                <ges:domicilio>
                                    <xsl:value-of select="//gmt:AVALES/gmt:DOMICILIO_AVAL2"/>
                                </ges:domicilio>
                                <ges:colonia>
                                    <xsl:value-of select="//gmt:AVALES/gmt:COLONIA_AVAL2"/>
                                </ges:colonia>
                                <ges:ciudad>
                                    <xsl:value-of select="//gmt:AVALES/gmt:CD_AVAL2"/>
                                </ges:ciudad>
                                <ges:estado>
                                    <xsl:value-of select="//gmt:AVALES/gmt:ESTADO_AVAL2"/>
                                </ges:estado>
                            </ges:direccion>
                        </xsl:if>                        
                    </ges:aval>
                </xsl:if>
                <xsl:if test="//gmt:AVALES/gmt:AVAL3">
                    <ges:aval>
                        <ges:idAval>
                            <xsl:value-of select="//gmt:AVALES/gmt:AVAL3"/>
                        </ges:idAval>
                        <ges:parentesco>
                            <xsl:value-of select="//gmt:AVALES/gmt:PARENTESCO_AVAL3"/>
                        </ges:parentesco>
                        <ges:primerNombre>
                            <xsl:value-of select="//gmt:AVALES/gmt:NOMBRE_AVAL3"/>
                        </ges:primerNombre>
                        <ges:segundoNombre>
                            <xsl:value-of select="//gmt:AVALES/gmt:SEGUNDONOMBRE_AVAL3"/>
                        </ges:segundoNombre>
                        <ges:apellidoMaterno>
                            <xsl:value-of select="//gmt:AVALES/gmt:SEGUNDOAPELLIDO_AVAL3"/>
                        </ges:apellidoMaterno>
                        <ges:apellidoPaterno>
                            <xsl:value-of select="//gmt:AVALES/gmt:PRIMERAPELLIDO_AVAL3"/>
                        </ges:apellidoPaterno>
                        <ges:telefonos>
                            <xsl:if test="//gmt:AVALES/gmt:TELEFONO_AVAL3">
                                <ges:telefono>                                                                              
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:AVALES/gmt:TELEFONO_AVAL3"/>
                                    </ges:numeroTelefonico>                            
                                    <ges:extension>
                                        <xsl:value-of select="//gmt:AVALES/gmt:EXTENCION_AVAL3"/>
                                    </ges:extension>                            
                                    <ges:tipoTelefono>Trabajo</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>
                            <xsl:if test="//gmt:AVALES/gmt:CELULAR_AVAL3">
                                <ges:telefono>                                                                              
                                    <ges:numeroTelefonico>
                                        <xsl:value-of select="//gmt:AVALES/gmt:CELULAR_AVAL3"/>
                                    </ges:numeroTelefonico>                                                                                   
                                    <ges:tipoTelefono>Celular</ges:tipoTelefono>
                                </ges:telefono>
                            </xsl:if>                            
                        </ges:telefonos>
                        <xsl:if test="//gmt:AVALES/gmt:DOMICILIO_AVAL3">
                            <ges:direccion>
                                <ges:domicilio>
                                    <xsl:value-of select="//gmt:AVALES/gmt:DOMICILIO_AVAL3"/>
                                </ges:domicilio>
                                <ges:colonia>
                                    <xsl:value-of select="//gmt:AVALES/gmt:COLONIA_AVAL3"/>
                                </ges:colonia>
                                <ges:ciudad>
                                    <xsl:value-of select="//gmt:AVALES/gmt:CD_AVAL3"/>
                                </ges:ciudad>
                                <ges:estado>
                                    <xsl:value-of select="//gmt:AVALES/gmt:ESTADO_AVAL3"/>
                                </ges:estado>
                            </ges:direccion>
                        </xsl:if>                        
                    </ges:aval>
                </xsl:if>                
            </ges:avales>            
            <ges:datosFinancieros>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:FECHA_ASIGNACION">
                    <ges:fechaAsignacion>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:FECHA_ASIGNACION"/>
                    </ges:fechaAsignacion>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:RANGO_ASIGNACION">
                    <ges:rangoAsignacion>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:RANGO_ASIGNACION"/>
                    </ges:rangoAsignacion>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:CTA_FACTURACION">
                    <ges:ctaFacturacion>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:CTA_FACTURACION"/>
                    </ges:ctaFacturacion>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:CTA_SERVICIO">
                    <ges:ctaServicio>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:CTA_SERVICIO"/>
                    </ges:ctaServicio>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:ESTATUS">
                    <ges:status>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:ESTATUS"/>
                    </ges:status>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:PRODUCTO_ID">
                    <ges:idProducto>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:PRODUCTO_ID"/>
                    </ges:idProducto>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:MERKM">
                    <ges:merkm>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:MERKM"/>
                    </ges:merkm>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SALDO">
                    <ges:saldo>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SALDO"/>
                    </ges:saldo>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:FECHA_PAGO_PROX">
                    <ges:fechaProximoPago>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:FECHA_PAGO_PROX"/>
                    </ges:fechaProximoPago>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:REFER">
                    <ges:refer>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:REFER"/>
                    </ges:refer>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:CAPITAL_VIGENTE">
                    <ges:capitalVigente>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:CAPITAL_VIGENTE"/>
                    </ges:capitalVigente>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:INT_ORDINARIOS">
                    <ges:interesOrdinarios>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:INT_ORDINARIOS"/>
                    </ges:interesOrdinarios>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:INT_MORATORIOS">
                    <ges:intereseMoratorios>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:INT_MORATORIOS"/>
                    </ges:intereseMoratorios>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:CUOTAS_VENCIDAS">
                    <ges:cuotasVencidas>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:CUOTAS_VENCIDAS"/>
                    </ges:cuotasVencidas>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:DIAS_MORA">
                    <ges:diasMora>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:DIAS_MORA"/>
                    </ges:diasMora>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC_VIG">
                    <ges:saldoVigenciaVencido>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC_VIG"/>
                    </ges:saldoVigenciaVencido>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC30">
                    <ges:saldoVencido30>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC30"/>
                    </ges:saldoVencido30>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC60">
                    <ges:saldoVencido60>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC60"/>
                    </ges:saldoVencido60>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC90">
                    <ges:saldoVencido90>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC90"/>
                    </ges:saldoVencido90>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC120">
                    <ges:saldoVencido120>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC120"/>
                    </ges:saldoVencido120>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC150">
                    <ges:saldoVencido150>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC150"/>
                    </ges:saldoVencido150>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC180">
                    <ges:saldoVencido180>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENC180"/>
                    </ges:saldoVencido180>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:PROB_INCUMP_ORIG">
                    <ges:probabilidadIncumpOrig>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:PROB_INCUMP_ORIG"/>
                    </ges:probabilidadIncumpOrig>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:PROB_INCUMP_SEGUI">
                    <ges:probabilidadImcumpSegui>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:PROB_INCUMP_SEGUI"/>
                    </ges:probabilidadImcumpSegui>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:PROB_INCUMP_COB">
                    <ges:probabilidadIncumpCob>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:PROB_INCUMP_COB"/>
                    </ges:probabilidadIncumpCob>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:PROB_INCUMP_COM">
                    <ges:probabilidadIncumpCom>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:PROB_INCUMP_COM"/>
                    </ges:probabilidadIncumpCom>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SEVER_PER_ORIG">
                    <ges:severidadPerOrig>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SEVER_PER_ORIG"/>
                    </ges:severidadPerOrig>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SEVER_PER_SEG">
                    <ges:severidadPerSegui>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SEVER_PER_SEG"/>
                    </ges:severidadPerSegui>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SEVER_PER_COM">
                    <ges:severidadPerCom>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SEVER_PER_COM"/>
                    </ges:severidadPerCom>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:VIDA_CREDITO">
                    <ges:vidaCredito>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:VIDA_CREDITO"/>
                    </ges:vidaCredito>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:FECHA_ULTIMO_PAGO">
                    <ges:fechaUltimoPago>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:FECHA_ULTIMO_PAGO"/>
                    </ges:fechaUltimoPago>
                </xsl:if> 
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:IMPORTE_ULTIMO_PAGO">
                    <ges:importeUltimoPago>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:IMPORTE_ULTIMO_PAGO"/>
                    </ges:importeUltimoPago>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENCIDO">
                    <ges:saldoVencido>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:SALDO_VENCIDO"/>
                    </ges:saldoVencido>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:VIGENCIA_VISITA">
                    <ges:vigenciaVisita>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:VIGENCIA_VISITA"/>
                    </ges:vigenciaVisita> 
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:CUOTA_MENSUAL">
                    <ges:cuotaMensual>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:CUOTA_MENSUAL"/>
                    </ges:cuotaMensual>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:TIPO_TAREA">
                    <ges:tipoTarea>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:TIPO_TAREA"/>
                    </ges:tipoTarea>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:GESTOR_ASIGNADO">
                    <ges:gestorAsignado>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:GESTOR_ASIGNADO"/>
                    </ges:gestorAsignado>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:MONTO_CONDONACION">
                    <ges:montoCondonacion>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:MONTO_CONDONACION"/>
                    </ges:montoCondonacion>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:MONTO_LIQ1">
                    <ges:montoLiquidacion1>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:MONTO_LIQ1"/>
                    </ges:montoLiquidacion1> 
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:MONTO_LIQ3">
                    <ges:montoLiquidacion3>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:MONTO_LIQ3"/>
                    </ges:montoLiquidacion3>
                </xsl:if>
                <xsl:if test="//gmt:DATOS_FINANCIEROS/gmt:MONTO_LIQ6">
                    <ges:montoLiquidacion6>
                        <xsl:value-of select="//gmt:DATOS_FINANCIEROS/gmt:MONTO_LIQ6"/>
                    </ges:montoLiquidacion6>
                </xsl:if>                
            </ges:datosFinancieros>            
            <ges:resultadoGestion>                
                <ges:documentos>
                    <xsl:if test="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_DOMICILIO1/@fileName">
                        <ges:documento>                        
                            <ges:tipo>FTD</ges:tipo>
                            <ges:proceso>Cobranza</ges:proceso>
                            <ges:nombre>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_DOMICILIO1/@fileName"/>
                            </ges:nombre>
                            <ges:contenido>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_DOMICILIO1"/>
                            </ges:contenido>
                            <ges:size>1</ges:size>                                                
                        </ges:documento>
                    </xsl:if>                    
                    <xsl:if test="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_DOMICILIO2/@fileName">
                        <ges:documento>
                            <ges:tipo>FTD</ges:tipo>
                            <ges:proceso>Cobranza</ges:proceso>
                            <ges:nombre>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_DOMICILIO2/@fileName"/>
                            </ges:nombre>
                            <ges:contenido>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_DOMICILIO2"/>
                            </ges:contenido>
                            <ges:size>1</ges:size>
                        </ges:documento>
                    </xsl:if>
                    <xsl:if test="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_COMPROBANTE1/@fileName">
                        <ges:documento>
                            <ges:tipo>FCO</ges:tipo>
                            <ges:proceso>Cobranza</ges:proceso>
                            <ges:nombre>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_COMPROBANTE1/@fileName"/>
                            </ges:nombre>
                            <ges:contenido>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_COMPROBANTE1"/>
                            </ges:contenido>
                            <ges:size>1</ges:size>
                        </ges:documento>
                    </xsl:if>
                    <xsl:if test="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_COMPROBANTE2/@fileName">
                        <ges:documento>
                            <ges:tipo>FCO</ges:tipo>
                            <ges:proceso>Cobranza</ges:proceso>
                            <ges:nombre>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_COMPROBANTE2/@fileName"/>
                            </ges:nombre>
                            <ges:contenido>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:COB_FOTO_COMPROBANTE2"/>
                            </ges:contenido>
                            <ges:size>1</ges:size>
                        </ges:documento>
                    </xsl:if>                    
                </ges:documentos>  
                <ges:gestorGestiono>
                    <xsl:value-of select="gm:Response/@AssignedTo"/>
                </ges:gestorGestiono>
                <ges:accion>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:ACCION"/>
                </ges:accion>
                <ges:gestionCobranza>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:GESTIONCOB"/>
                </ges:gestionCobranza>
                <xsl:if test="//gmt:RESULTADO_GESTION/gmt:CAUSA_NOPAGO">
                    <ges:causaNoPago>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:CAUSA_NOPAGO"/>
                    </ges:causaNoPago>
                </xsl:if>                
                <ges:comentarios>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:COMENTARIOS"/>
                </ges:comentarios>
                <xsl:if test="//gmt:RESULTADO_GESTION/gmt:MONTOPROMESAPAGO">
                    <ges:montoPromesaPago>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:MONTOPROMESAPAGO"/>
                    </ges:montoPromesaPago>
                </xsl:if> 
                <xsl:if test="//gmt:RESULTADO_GESTION/gmt:FECHAPROMESAPAGO">
                    <ges:fechaPromesaPago>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:FECHAPROMESAPAGO"/>
                    </ges:fechaPromesaPago>
                </xsl:if>                
                <ges:correoElectronico>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:EMAIL"/>
                </ges:correoElectronico>
                <ges:direccion>                    
                    <ges:nombreDelaCalle>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:CALLE"/>
                    </ges:nombreDelaCalle>                    
                    <ges:numeroExterior>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:NUMERO_EXT"/>
                    </ges:numeroExterior>                   
                    <ges:numeroInterior>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:NUMERO_INT"/>
                    </ges:numeroInterior>                   
                    <ges:entreCalle1>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:ENTRE_CALLE1"/>
                    </ges:entreCalle1>                   
                    <ges:entreCalle2>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:ENTRE_CALLE2"/>
                    </ges:entreCalle2>                   
                    <ges:estado>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:ESTADO"/>
                    </ges:estado>                   
                    <ges:delegacionMunicipio>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:MUNICIPIO"/>
                    </ges:delegacionMunicipio>                   
                    <ges:colonia>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:COLONIA"/>
                    </ges:colonia>                   
                    <ges:codigoPostal>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:CP"/>
                    </ges:codigoPostal>                   
                    <ges:tipoDomicilio>Casa</ges:tipoDomicilio>                         
                    <ges:manzana>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:MANZANA"/>
                    </ges:manzana>                   
                    <ges:lote>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:LOTE"/>
                    </ges:lote>                   
                    <ges:localidad>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:LOCALIDAD"/>
                    </ges:localidad>                        
                    <ges:gps>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:GPS"/>
                    </ges:gps>
                </ges:direccion>                
                <ges:telefonos>
                    <xsl:if test="//gmt:RESULTADO_GESTION/gmt:TELEFONO_1">
                        <ges:telefono>
                            <ges:codigoArea>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:LADA_TELEFONO1"/>
                            </ges:codigoArea>      
                            <ges:numeroTelefonico>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:TELEFONO_1"/>
                            </ges:numeroTelefonico>
                            <ges:tipoTelefono>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:TIPO_TELEFONO1"/>
                            </ges:tipoTelefono>
                        </ges:telefono>
                    </xsl:if>
                    <xsl:if test="//gmt:RESULTADO_GESTION/gmt:TELEFONO_2">
                        <ges:telefono>
                            <ges:codigoArea>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:LADA_TELEFONO2"/>
                            </ges:codigoArea>     
                            <ges:numeroTelefonico>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:TELEFONO_2"/>
                            </ges:numeroTelefonico>
                            <ges:tipoTelefono>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:TIPO_TELEFONO2"/>
                            </ges:tipoTelefono>
                        </ges:telefono> 
                    </xsl:if>
                    <xsl:if test="//gmt:RESULTADO_GESTION/gmt:TELEFONO_3">
                        <ges:telefono>
                            <ges:codigoArea>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:LADA_TELEFONO3"/>
                            </ges:codigoArea>
                            <ges:numeroTelefonico>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:TELEFONO_3"/>
                            </ges:numeroTelefonico> 
                            <ges:tipoTelefono>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:TIPO_TELEFONO3"/>
                            </ges:tipoTelefono>
                        </ges:telefono>
                    </xsl:if>
                    <xsl:if test="//gmt:RESULTADO_GESTION/gmt:TELEFONO_4">
                        <ges:telefono>
                            <ges:codigoArea>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:LADA_TELEFONO4"/>
                            </ges:codigoArea>
                            <ges:numeroTelefonico>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:TELEFONO_4"/>
                            </ges:numeroTelefonico>
                            <ges:tipoTelefono>
                                <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:TIPO_TELEFONO4"/>
                            </ges:tipoTelefono>
                        </ges:telefono>     
                    </xsl:if>                                   
                </ges:telefonos>
                <ges:tipoNegociacion>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:TIPO_NEGOCIACION"/>
                </ges:tipoNegociacion>
                <ges:periodicidadCondonacion>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:PERIODICIDAD_CONDONACION"/>
                </ges:periodicidadCondonacion>
                <ges:periodicidadLiquidacion>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:PERIODICIDAD_LIQUIDACION"/>
                </ges:periodicidadLiquidacion>
                <xsl:if test="//gmt:RESULTADO_GESTION/gmt:NUM_PAGOS">
                    <ges:numPagos>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:NUM_PAGOS"/>
                    </ges:numPagos> 
                </xsl:if>                
                <xsl:if test="//gmt:RESULTADO_GESTION/gmt:MONTO_NEGOCIACION">
                    <ges:montoNegociacion>
                        <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:MONTO_NEGOCIACION"/>
                    </ges:montoNegociacion>
                </xsl:if>
                <ges:fechaPago>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:FECHA_DE_PAGO"/>
                </ges:fechaPago>
                <ges:pagos>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:PAGOS"/>
                </ges:pagos>
                <ges:periodicidad>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:PERIODICIDAD"/>
                </ges:periodicidad> 
                <ges:gps>
                    <xsl:value-of select="//gmt:RESULTADO_GESTION/gmt:GPS"/>
                </ges:gps>               
            </ges:resultadoGestion>            
            <ges:FormiikResponseSource>
                <xsl:value-of select="gm:Response/@FormiikResponseSource"/>
            </ges:FormiikResponseSource>
        </ges:Cobranza>
        </ges:notificaGestionCobranzaRequest>
        </soapenv:Body>
    </xsl:template>
</xsl:stylesheet>