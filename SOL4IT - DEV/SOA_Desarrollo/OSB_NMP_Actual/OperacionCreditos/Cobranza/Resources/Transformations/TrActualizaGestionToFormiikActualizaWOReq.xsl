<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
    xmlns:ext="http://exslt.org/common"
    xmlns:ges="http://servicios.montedepiedad.com.mx/NMP/Schema/GestionCobranza" version="2.0"
    exclude-result-prefixes="ges xp20">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="valor"/>    
    
    
    <xsl:template match="/">
        <Coleccion>
            <NewOrder>
                <xsl:attribute name="id">
                    <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/@idExternal"/>
                </xsl:attribute>
                <xsl:attribute name="type">
                    <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/@externalType"/>
                </xsl:attribute>
                <xsl:attribute name="version">
                    <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/@version"/>
                </xsl:attribute>
                <xsl:attribute name="userName">
                    <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/@assignedTo"/>
                </xsl:attribute>
                <xsl:attribute name="priority">
                    <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/@prioridad"/>
                </xsl:attribute>
               <!-- <xsl:if test="ges:actualizarGestionRequest/ges:gestion/@fechaAsignacion">
                    <xsl:attribute name="assignDate">
                        <xsl:value-of select="xp20:format-dateTime(ges:actualizarGestionRequest/ges:gestion/@fechaAsignacion,'[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]')"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="ges:actualizarGestionRequest/ges:gestion/@fechaExpiracion">
                    <xsl:attribute name="expirationDate">
                        <xsl:value-of select="xp20:format-dateTime(ges:actualizarGestionRequest/ges:gestion/@fechaExpiracion,'[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]' )"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="ges:actualizarGestionRequest/ges:gestion/@fechaCancelacion">
                    <xsl:attribute name="cancellationDate">
                        <xsl:value-of select="xp20:format-dateTime(ges:actualizarGestionRequest/ges:gestion/@fechaCancelacion,'[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]')"/>
                    </xsl:attribute>
                </xsl:if>   -->
                
                <!-- DATOS DEL CLIENTE -->
                <parametros>
                    <parametro llave="CLIENTE_PROSPECT">   <!-- 4 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:idCliente"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CONTRATO_ID"> <!-- 5 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:idContrato"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PRIMERNOMBRE"> <!-- 6 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:primerNombre"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SEGUNDONOMBRE"> <!-- 7 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:segundoNombre"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PRIMERAPELLIDO"> <!-- 8 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:apellidoPaterno"/>
                        </xsl:attribute>
                    </parametro> 
                    <parametro llave="SEGUNDO_APELLIDO"> <!-- 9 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:apellidoMaterno"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CALLECD"> <!-- 10 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:nombreDelaCalle"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NUMERO_EXTERIOR"> <!-- 11 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:numeroExterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NUMERO_INTERIOR"> <!-- 12 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:numeroInterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MANZANADCD"> <!-- 13 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:manzana"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="LOTEDCD">  <!-- 14 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:lote"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COLONIACD"> <!-- 15 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MUNICIPIOCD"> <!-- 16 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:delegacionMunicipio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ESTADOCD"> <!-- 17 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ENTRECALLE1DCD"> <!-- 18 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:entreCalle1"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ENTRECALLE2DCD"> <!-- 19 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:entreCalle2"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CODIGO_POSTAL"> <!-- 20 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:codigoPostal"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="GPSCLIENTE"> <!-- 21 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Casa']/ges:gps"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TELEFONO_CASA"> <!-- 22 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:telefonos/ges:telefono[./ges:tipoTelefono='Casa']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CORREO_ELECTRONI"> <!-- 23 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:correoElectronico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_Calle"> <!-- 24 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:nombreDelaCalle"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_NoExt"> <!-- 25 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:numeroExterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_Estado"> <!-- 26 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_Delegacion"> <!-- 27 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:delegacionMunicipio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_CP"> <!-- 28 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:codigoPostal"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_Colonia"> <!-- 29 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_EntreCalle1"> <!-- 30 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:entreCalle1"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DEMP_EntreCalle2"> <!-- 31 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:entreCalle2"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NOMBREEMPLEO"> <!-- 32 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:nombreEmpleo"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TELEFONO_TRABAJO"> <!-- 33 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="EXTENSION_TRAB"> <!-- 34 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:telefonos/ges:telefono[./ges:tipoTelefono='Trabajo']/ges:extension"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TELEFONO_CELULAR"> <!-- 35 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:telefonos/ges:telefono[./ges:tipoTelefono='Celular']/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CALLEOE"> <!-- 36 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:nombreDelaCalle"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NOEXTOE"> <!-- 37 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:numeroExterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NOINTOE"> <!-- 38 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:numeroInterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MANZANAOE"> <!-- 39 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:manzana"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="LOTEOE"> <!-- 40 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:lote"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COLONIAOE"> <!-- 41 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MUNICIPIOOE"> <!-- 42 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:delegacionMunicipio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ESTADOOE"> <!-- 43 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ENTRECALLE1OE"> <!-- 44 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:entreCalle1"/>
                        </xsl:attribute>
                    </parametro>                    
                    <parametro llave="ENTRECALLE2OE"> <!-- 45 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:entreCalle2"/>
                        </xsl:attribute>
                    </parametro>                    
                    <parametro llave='CPOE'> <!-- 46 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:cp"/>
                        </xsl:attribute>
                    </parametro>  
                    <parametro llave="GPSNEGOCIOEMPLEO"> <!-- 47 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:cliente/ges:direcciones/ges:direccion[./ges:tipoDomicilio='Trabajo']/ges:gps"/>
                        </xsl:attribute>
                    </parametro>
                    
                    
                    <!-- DATOS FINANCIEROS -->
                    
                    <parametro llave="FECHA_ASIGNACION"> <!-- 49 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:fechaAsignacion"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO"> <!-- 50 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:saldo"/>
                        </xsl:attribute>
                    </parametro>
                    <xsl:if test="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:fechaProximoPago">
                        <parametro llave="FECHA_PAGO_PROX"> <!-- 51 -->
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:fechaProximoPago"/>
                            </xsl:attribute>
                        </parametro> 
                    </xsl:if>
                    <parametro llave="REFER"> <!-- 52 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:refer"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="INT_MORATORIOS"> <!-- 53 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:intereseMoratorios"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="DIAS_MORA"> <!-- 54 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:diasMora"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC_VIG"> <!-- 55 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:saldoVigenciaVencido"/>
                        </xsl:attribute>
                    </parametro>  
                    <parametro llave="SALDO_VENC30"> <!-- 56 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of  select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:saldoVencido30"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC60"> <!-- 57 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:saldoVencido60"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC90"> <!-- 58 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:saldoVencido90"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC120"> <!-- 59 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:saldoVencido120"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC150"> <!-- 60 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:saldoVencido150"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENC180"> <!-- 61 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:saldoVencido180"/>
                        </xsl:attribute>
                    </parametro>
                    <xsl:if test="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:fechaUltimoPago">
                        <parametro llave="FECHA_ULTIMO_PAGO"> <!-- 62 -->
                            <xsl:attribute name="valor">
                                <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:fechaUltimoPago"/>
                            </xsl:attribute>
                        </parametro>
                    </xsl:if>
                    <parametro llave="IMPORTE_ULTIMO_PAGO"> <!-- 63 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:importeUltimoPago"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="SALDO_VENCIDO"> <!-- 64 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:saldoVencido"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CUOTA_MENSUAL"> <!-- 65 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:cuotaMensual"/>
                        </xsl:attribute>
                    </parametro>                    
                    <parametro llave="MONTO_CONDONACION"> <!-- 66 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:montoCondonacion"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MONTO_LIQ1"> <!-- 67 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:montoLiquidacion1"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MONTO_LIQ3"> <!-- 68 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:montoLiquidacion3"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MONTO_LIQ6"> <!-- 69 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:datosFinancieros/ges:montoLiquidacion6"/>
                        </xsl:attribute>
                    </parametro>
                    
                    
                    <!-- RESULTADO GESTION -->
                    
                    <parametro llave="GPS"> <!-- 71 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:gps"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COB_FOTO_DOMICILIO1"> <!-- 72 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:documentos/ges:documentoEnlace[./tipo='FTD'][1]/ges:url"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COB_FOTO_DOMICILIO2"> <!-- 73 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:documentos/ges:documentoEnlace[./tipo='FTD'][2]/ges:url"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COB_FOTO_COMPROBANTE1"> <!-- 74 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:documentos/ges:documentoEnlace[./tipo='FCO'][1]/ges:url"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COB_FOTO_COMPROBANTE2"> <!-- 75 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:documentos/ges:documentoEnlace[./tipo='FCO'][2]/ges:url"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ACCION"> <!-- 76 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:accion"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="GESTIONCOB"> <!-- 77 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:gestionCobranza"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CAUSA_NOPAGO"> <!-- 78 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:causaNoPago"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COMENTARIOS"> <!-- 79 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:comentarios"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MONTOPROMESAPAGO"> <!-- 80 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:montoPromesaPago"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="FECHAPROMESAPAGO"> <!-- 81 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:fechaPromesaPago"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="EMAIL"> <!-- 82 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:correoElectronico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CALLE"> <!-- 83 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:nombreDelaCalle"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NUMERO_EXT"> <!-- 84 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:numeroExterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="NUMERO_INT"> <!-- 85 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:numeroInterior"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MANZANA"> <!-- 86 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:manzana"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="LOTE"> <!-- 87 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:lote"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="COLONIA"> <!-- 88 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ESTADO"> <!-- 89 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:estado"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="MUNICIPIO"> <!-- 90 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:delegacionMunicipio"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="LOCALIDAD"> <!-- 91 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:colonia"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ENTRE_CALLE1"> <!-- 92 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:entreCalle1"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="ENTRE_CALLE2"> <!-- 93 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:entreCalle2"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="CP"> <!-- 94 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:direccion/ges:codigoPostal"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TIPO_TELEFONO1"> <!-- 95 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[1]/ges:tipoTelefono"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="LADA_TELEFONO1"> <!-- 96 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[1]/ges:codigoArea"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TELEFONO_1"> <!-- 97 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[1]/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TIPO_TELEFONO2"> <!-- 98 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[2]/ges:tipoTelefono"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="LADA_TELEFONO2"> <!-- 99 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[2]/ges:codigoArea"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TELEFONO_2"> <!-- 100 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[2]/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TIPO_TELEFONO3"> <!-- 101 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[3]/ges:tipoTelefono"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="LADA_TELEFONO3"> <!-- 102 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[3]/ges:codigoArea"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TELEFONO_3"> <!-- 103 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[3]/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TIPO_TELEFONO4"> <!-- 104 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[4]/ges:tipoTelefono"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="LADA_TELEFONO4"> <!-- 105 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[4]/ges:codigoArea"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TELEFONO_4"> <!-- 106 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:telefonos/ges:telefono[4]/ges:numeroTelefonico"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="TIPO_NEGOCIACION"> <!-- 107 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:tipoNegociacion"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PERIODICIDAD"> <!-- 108 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:periodicidad"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="PAGOS"> <!-- 109 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:pagos"/>
                        </xsl:attribute>
                    </parametro>
                    <!--parametro llave="DIA_DE_PAGO"> <110 >
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:fechaPago"/>
                        </xsl:attribute>
                    </parametro-->
                    <parametro llave="MONTO_NEGOCIACION"> <!-- 111 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:montoNegociacion"/>
                        </xsl:attribute>
                    </parametro>
                    <parametro llave="FECHA_DE_PAGO"> <!-- 112 -->
                        <xsl:attribute name="valor">
                            <xsl:value-of select="ges:actualizarGestionRequest/ges:gestion/ges:resultadoGestion/ges:fechaPago"/>
                        </xsl:attribute>
                    </parametro>
                </parametros>
            </NewOrder>
        </Coleccion>  
    </xsl:template>
    
</xsl:stylesheet>