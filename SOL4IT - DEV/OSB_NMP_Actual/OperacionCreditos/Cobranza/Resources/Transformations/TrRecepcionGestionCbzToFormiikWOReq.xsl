<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"  
    xmlns:ges="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionCobranza" version="2.0"
    exclude-result-prefixes="ges xp20">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <Coleccion>
            <NewOrder>
                <xsl:attribute name="id">
                    <xsl:value-of select="ges:recepcionGestionRequest/@idExternal"/>
                </xsl:attribute>
                <xsl:attribute name="type">
                    <xsl:value-of select="ges:recepcionGestionRequest/@externalType"/>
                </xsl:attribute>
                <xsl:attribute name="version">
                    <xsl:value-of select="ges:recepcionGestionRequest/@version"/>
                </xsl:attribute>
                <xsl:attribute name="userName">
                    <xsl:value-of select="ges:recepcionGestionRequest/@assignedTo"/>
                </xsl:attribute>
                <xsl:attribute name="priority">
                    <xsl:value-of select="ges:recepcionGestionRequest/@prioridad"/>
                </xsl:attribute>
                <xsl:if test="ges:recepcionGestionRequest/@fechaAsignacion">
                    <xsl:attribute name="assignDate">
                        <xsl:value-of select="xp20:format-dateTime(ges:recepcionGestionRequest/@fechaAsignacion,'[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]')"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="ges:recepcionGestionRequest/@fechaExpiracion">
                    <xsl:attribute name="expirationDate">
                        <xsl:value-of select="xp20:format-dateTime(ges:recepcionGestionRequest/@fechaExpiracion,'[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]' )"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="ges:recepcionGestionRequest/@fechaCancelacion">
                    <xsl:attribute name="cancellationDate">
                        <xsl:value-of select="xp20:format-dateTime(ges:recepcionGestionRequest/@fechaCancelacion,'[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]')"/>
                    </xsl:attribute>
                </xsl:if>               
                <parametros>
                    <parametro llave="ACTECONOMICASOL">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:actividadEconomica"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ACTIVIDADSOL">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:actividad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="Calle">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:nombreDelaCalle"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CALLECD">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:nombreDelaCalle"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CALLEOE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:nombreDelaCalle"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CAPITAL_VIGENTE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:capitalVigente"/>
                        </xsl:attribute>
                    </parametro>
                    
                    <!-- Avales -->
                    
                    <!-- AVAL 1 -->                  
                    <parametro llave="CD_AVAL1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:direccion/ges:ciudad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CELULAR_AVAL1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Celular']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COLONIA_AVAL1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:direccion/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="direccion_AVAL1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:direccion/ges:domicilio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ESTADO_AVAL1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:direccion/ges:estado"/>
                        </xsl:attribute>
                    </parametro>                    
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico">
                        <parametro llave="TELEFONO_AVAL1">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                        <parametro llave="EXTENCION_AVAL1">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:extension"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico">
                        <parametro llave="TELEFONO_AVAL1">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <parametro llave="NOMBRE_AVAL1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:primerNombre"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PARENTESCO_AVAL1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:parentesco"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PRIMERAPELLIDO_AVAL1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:apellidoPaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDOAPELLIDO_AVAL1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:apellidoMaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDONOMBRE_AVAL1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:segundoNombre"/>
                        </xsl:attribute>
                    </parametro>
                    
                    
                    
                    
                    
                    <parametro llave="CD_AVAL2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:direccion/ges:ciudad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CELULAR_AVAL2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Celular']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COLONIA_AVAL2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:direccion/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="direccion_AVAL2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:direccion/ges:domicilio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ESTADO_AVAL2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:direccion/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico">
                        <parametro llave="EXTENCION_AVAL2">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:extension"/>
                            </xsl:attribute>
                        </parametro>
                        <parametro llave="TELEFONO_AVAL2">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico">                        
                        <parametro llave="TELEFONO_AVAL2">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <parametro llave="NOMBRE_AVAL2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:primerNombre"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PARENTESCO_AVAL2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:parentesco"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PRIMERAPELLIDO_AVAL2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:apellidoPaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDOAPELLIDO_AVAL2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:apellidoMaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDONOMBRE_AVAL2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[2]/ges:segundoNombre"/>
                        </xsl:attribute>
                    </parametro>
                    
                    
                    
                    
                    
                    <parametro llave="CD_AVAL3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:direccion/ges:ciudad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CELULAR_AVAL3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Celular']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COLONIA_AVAL3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:direccion/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="direccion_AVAL3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:direccion/ges:domicilio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ESTADO_AVAL3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:direccion/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico">
                        <parametro llave="EXTENCION_AVAL3">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:extension"/>
                            </xsl:attribute>
                        </parametro>
                        <parametro llave="TELEFONO_AVAL3">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico">                        
                        <parametro llave="TELEFONO_AVAL3">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <parametro llave="NOMBRE_AVAL3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:primerNombre"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PARENTESCO_AVAL3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:parentesco"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PRIMERAPELLIDO_AVAL3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:apellidoPaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDOAPELLIDO_AVAL3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:apellidoMaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDONOMBRE_AVAL3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[3]/ges:segundoNombre"/>
                        </xsl:attribute>
                    </parametro>
                    
                    
                    
                    <!-- Referencias -->
                    
                    <!-- REFERENCIA 1 -->
                    <parametro llave="CD_REF1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:direcciones/ges:direccion/ges:ciudad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CELULAR_REF1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Celular']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COLONIA_REF1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:direcciones/ges:direccion/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="direccion_REF1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:direcciones/ges:direccion/ges:domicilio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ESTADO_REF1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:direcciones/ges:direccion/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico">
                        <parametro llave="EXTENCION_REF1">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:extension"/>
                            </xsl:attribute>
                        </parametro>
                        <parametro llave="TELEFONO_REF1">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico">
                        <parametro llave="TELEFONO_REF1">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <parametro llave="NOMBRE_REF1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:primerNombre"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PARENTESCO_REF1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:parentesco"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PRIMERAPELLIDO_REF1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:apellidoPaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDOAPELLIDO_REF1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:apellidoMaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDONOMBRE_REF1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[1]/ges:segundoNombre"/>
                        </xsl:attribute>
                    </parametro>
                    
                    
                    
                    <!-- REFERENCIA 2 -->
                    <parametro llave="CD_REF2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:direcciones/ges:direccion/ges:ciudad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CELULAR_REF2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Celular']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COLONIA_REF2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:direcciones/ges:direccion/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="direccion_REF2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:direcciones/ges:direccion/ges:domicilio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ESTADO_REF2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:direcciones/ges:direccion/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico">
                        <parametro llave="EXTENCION_REF2">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:extension"/>
                            </xsl:attribute>
                        </parametro>
                        <parametro llave="TELEFONO_REF2">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico">
                        <parametro llave="TELEFONO_REF2">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <parametro llave="NOMBRE_REF2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:primerNombre"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PARENTESCO_REF2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:parentesco"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PRIMERAPELLIDO_REF2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:apellidoPaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDOAPELLIDO_REF2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:apellidoMaterno"/>
                        </xsl:attribute>
                    </parametro>                    
                    <parametro llave="SEGUNDONOMBRE_REF2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[2]/ges:segundoNombre"/>
                        </xsl:attribute>
                    </parametro>
                   
                    
                    
                    
                    <!-- REFERENCIA 3 -->
                    <parametro llave="CD_REF3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:direcciones/ges:direccion/ges:ciudad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CELULAR_REF3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Celular']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COLONIA_REF3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:direcciones/ges:direccion/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="direccion_REF3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:direcciones/ges:direccion/ges:domicilio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ESTADO_REF3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:direcciones/ges:direccion/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico">
                        <parametro llave="EXTENCION_REF3">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:extension"/>
                            </xsl:attribute>
                        </parametro>
                        <parametro llave="TELEFONO_REF3">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico">
                        <parametro llave="TELEFONO_REF3">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <parametro llave="NOMBRE_REF3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:primerNombre"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PARENTESCO_REF3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:parentesco"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PRIMERAPELLIDO_REF3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:apellidoPaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDOAPELLIDO_REF3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:apellidoMaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDONOMBRE_REF3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:referencias/ges:referencia[3]/ges:segundoNombre"/>
                        </xsl:attribute>
                    </parametro>
                    
                    
                   
                    
                    <parametro llave="Ciudad">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:ciudad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CLIENTE_PROSPECT">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:idCliente"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CODIGO_POSTAL">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:codigoPostal"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CodigoPostal">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:codigoPostal"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="Colonia">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    
                    
                    <parametro llave="COLONIACD">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COLONIAOE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CONTRATO_ID">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:idContrato"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CORREO_ELECTRONI">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:correoElectronico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave='CPOE'>
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:cp"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CTA_FACTURACION">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:ctaFacturacion"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CTA_SERVICIO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:ctaServicio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CUOTA_MENSUAL">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:cuotaMensual"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CURPSOL">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:curp"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_Calle">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:nombreDelaCalle"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_Colonia">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_CP">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:codigoPostal"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_Delegacion">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:delegacionMunicipio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_EntreCalle1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:entreCalle1"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_EntreCalle2">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:entreCalle2"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_Estado">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_Localidad">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:localidad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_NoExt">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:numeroExterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DIAS_MORA">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:diasMora"/>
                        </xsl:attribute>
                    </parametro>
                    
                    
                    <parametro llave="ENTRECALLE1DCD">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:entreCalle1"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ENTRECALLE1OE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:entreCalle1"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ENTRECALLE2DCD">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:entreCalle2"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ENTRECALLE2OE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:entreCalle2"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="Estado">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    
                    <parametro llave="ESTADO_CIVIL">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:estadoCivil"/>
                        </xsl:attribute>
                    </parametro>
                    
                    <parametro llave="ESTADOCD">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ESTADOOE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave='ESTATUS'>
                        <xsl:attribute name="valor">
                            <xsl:value-of select="''" />
                        </xsl:attribute>
                    </parametro>
                    <!--parametro llave="EXTENSION_TRAB">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:extension"/>
                        </xsl:attribute>
                    </parametro-->
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:fechaProximoPago">
                        <parametro llave="FECHA_PAGO_PROX">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:fechaProximoPago"/>
                            </xsl:attribute>
                        </parametro> 
                    </xsl:if>
                    <xsl:if test="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:fechaUltimoPago">
                        <parametro llave="FECHA_ULTIMO_PAGO">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:fechaUltimoPago"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>                    
                    <parametro llave="GESTOR_ASIGNADO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:gestorAsignado"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="GESTOR_GESTIONO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:resultadoGestion/ges:gestorGestiono"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="GPSCLIENTE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:gps"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="GPSNEGOCIOEMPLEO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:gps"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="IMPORTE_ULTIMO_PAGO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:importeUltimoPago"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="INT_MORATORIOS">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:intereseMoratorios"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="INT_ORDINARIOS">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:interesOrdinarios"/>
                        </xsl:attribute>
                    </parametro>
                    <!--parametro llave='latitude'>
                    <xsl:attribute name="valor">
                        <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:primerNombre"/>
                    </xsl:attribute>
                </parametro-->
                    <parametro llave="LOCALIDADDCD">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:localidad"
                            />
                        </xsl:attribute>
                    </parametro>
                    <!--parametro llave='longitude'>
                    <xsl:attribute name="valor">
                        <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:avales/ges:aval[1]/ges:primerNombre"/>
                    </xsl:attribute>
                </parametro-->
                    <parametro llave="LOTEDCD">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:lote"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="LOTEOE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:lote"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MANZANADCD">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:manzana"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MANZANAOE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:manzana"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MERKM">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:merkm"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MONTO_CONDONACION">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:montoCondonacion"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MONTO_LIQ1">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:montoLiquidacion1"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MONTO_LIQ3">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:montoLiquidacion3"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MONTO_LIQ6">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:montoLiquidacion6"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="Municipio">
                        <xsl:attribute name="valor">
                            <xsl:value-of  select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion/ges:delegacionMunicipio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MUNICIPIOCD">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:delegacionMunicipio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MUNICIPIOOE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:delegacionMunicipio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NOEXTOE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:numeroExterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NOINTOE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:numeroInterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave='Nombre'>
                    <xsl:attribute name="valor">
                        <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:primerNombre" />
                    </xsl:attribute>
                    </parametro>
                   
                    
                    <parametro llave="NOMBREEMPLEO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:nombreEmpleo"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NUMERO_EXTERIOR">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:numeroExterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NUMERO_INTERIOR">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:numeroInterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NUMERORFC">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:rfc"/>
                        </xsl:attribute>
                    </parametro>
                    
                    
                    <parametro llave="PRIMERAPELLIDO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:apellidoPaterno"/>
                        </xsl:attribute>
                    </parametro>
                    
                    <parametro llave="PRIMERNOMBRE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:primerNombre"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PROB_INCUMP_COB">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:probabilidadIncumpCob"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PROB_INCUMP_COM">
                        <xsl:attribute name="valor">
                            <xsl:value-of  select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:probabilidadIncumpCom"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PROB_INCUMP_ORIG">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:probabilidadIncumpOrig"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PROB_INCUMP_SEGUI">
                        <xsl:attribute name="valor">
                            <xsl:value-of  select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:probabilidadImcumpSegui"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PRODUCTO_ID">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:idProducto"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="RANGO_ASIGNACION">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:rangoAsignacion"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="REFER">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:refer"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="RIESGO_MOROSIDAD">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:riesgoMorosidad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:saldo"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC_VIG">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:saldoVigenciaVencido"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC120">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:saldoVencido120"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC150">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:saldoVencido150"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC180">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:saldoVencido180"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC30">
                        <xsl:attribute name="valor">
                            <xsl:value-of  select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:saldoVencido30"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC60">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:saldoVencido60"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC90">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:saldoVencido90"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENCIDO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:saldoVencido"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SECTORSOL">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:sector"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDO_APELLIDO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:apellidoMaterno"/>
                        </xsl:attribute>
                    </parametro>
                    
                    <parametro llave="SEGUNDONOMBRE">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:segundoNombre"/>
                        </xsl:attribute>
                    </parametro>
                    
                    <parametro llave="SEVER_PER_COM">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:severidadPerCom"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEVER_PER_ORIG">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:severidadPerOrig"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEVER_PER_SEG">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:severidadPerSegui"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEXO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:genero"/>
                        </xsl:attribute>
                    </parametro>
                    
                    <parametro llave="TELEFONO_CASA">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TELEFONO_TRABAJO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="EXTENSION_TRAB">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:extension"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TELEFONO_CELULAR">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:telefonos/ges:telefono[./ges:tipoTelefono='Celular']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TELEFONO_RECADOS">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:cliente/ges:telefonos/ges:telefono[./ges:tipoTelefono='Recado']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>                    
                    <parametro llave="VIDA_CREDITO">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:vidaCredito"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="VIGENCIA_VISITA">
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:recepcionGestionRequest/ges:Cobranza/ges:datosFinancieros/ges:vigenciaVisita"/>
                        </xsl:attribute>
                    </parametro>                   
                    <parametro llave="Documento" valor="">
                    </parametro>
                </parametros>
            </NewOrder>
        </Coleccion>
    </xsl:template>
</xsl:stylesheet>