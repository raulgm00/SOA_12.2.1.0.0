<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:proc="http://servicios.montedepiedad.com.mx/NMP/Schema/ProcesaMarcados"
    xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
    xmlns:con="http://servicios.montedepiedad.com.mx/NMP/Schema/ConsultaInformacionMidas"    
    version="1.0"  exclude-result-prefixes="proc con xsl xp20">
    <xsl:output indent="yes"/>
    <xsl:param name="operacion"/>
    <xsl:param name="attribute1"/>
    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="$operacion='ConsultaTotalProcesados'">
                <con:ConsultaTotalProcesadosRequest>
                    <con:flagProcesado>
                        <xsl:value-of select="proc:IniciaProcesaMarcadosRequest/proc:flagProcesado"/>
                    </con:flagProcesado>
                    <con:numEtapa>
                        <xsl:value-of select="proc:IniciaProcesaMarcadosRequest/proc:numEtapa"/>
                    </con:numEtapa>
                </con:ConsultaTotalProcesadosRequest>
            </xsl:when>
            <xsl:when test="$operacion='ConsultaBloqueProcesados'">
                <con:ConsultaBloqueProcesadosRequest>
                    <con:InicioBloque/>
                    <con:FinBloque/>
                    <con:flaProcesado>
                        <xsl:value-of select="proc:IniciaProcesaMarcadosRequest/proc:flagProcesado"/>
                    </con:flaProcesado>
                    <con:numEtapa>
                        <xsl:value-of select="proc:IniciaProcesaMarcadosRequest/proc:flagProcesado"/>
                    </con:numEtapa>
                </con:ConsultaBloqueProcesadosRequest>
            </xsl:when>
            <xsl:when test="$operacion='array'">
              <Bloques>
                  <xsl:variable name="IdCorrelation">
                      <xsl:value-of select="xp20:format-dateTime(xp20:current-dateTime(),'[Y0001][M01][D01][H01][m01][s01]')"/>
                  </xsl:variable>
                  <xsl:variable name="SizeBatch">
                      <xsl:value-of select="/proc:IniciaProcesaMarcadosRequest/proc:SizeBatch/text()"/>
                  </xsl:variable>
                   <xsl:choose>
                       <xsl:when test="$attribute1 &lt; $SizeBatch">
                        <Bloque>
                            <batch>
                                <xsl:value-of select="/proc:IniciaProcesaMarcadosRequest/proc:SizeBatch/text()"/>
                            </batch>
                            <idCorrelation>
                                <xsl:value-of select="concat('Bloque',position(),'_',$IdCorrelation)"/>
                            </idCorrelation>
                            <num>
                                <xsl:value-of select="position()"/>
                            </num>                            
                           <inicioBloque>0</inicioBloque>                                            
                           <finBloque>
                                <xsl:value-of select="$attribute1"/>
                            </finBloque>                        
                        </Bloque>                
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="NumFinal">
                            <xsl:value-of select="format-number($attribute1 div $SizeBatch,'###,###,##0')"/>
                        </xsl:variable> 
                        <xsl:variable name="NumMaxUltimo">
                            <xsl:value-of select="$NumFinal * $SizeBatch"/>
                        </xsl:variable>
                        <xsl:for-each select="(//node())[$NumFinal >= position()]">                                        
                            <Bloque>
                                <idCorrelation>
                                    <xsl:value-of select="concat('Bloque',position(),'_',$IdCorrelation)"/>
                                </idCorrelation>
                                <num>
                                    <xsl:value-of select="position()"/>
                                </num>
                                <xsl:choose>
                                    <xsl:when test="position()=1">
                                        <inicioBloque>0</inicioBloque>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <inicioBloque>
                                            <xsl:value-of select="($SizeBatch * (position()-1))"/>
                                        </inicioBloque>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="((position()) * $SizeBatch) > $attribute1">
                                        <finBloque>
                                            <xsl:value-of select="$attribute1 - (position()-1) * $SizeBatch"/>
                                        </finBloque>  
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <finBloque>
                                            <xsl:value-of select="$SizeBatch"/>
                                        </finBloque>   
                                    </xsl:otherwise>
                                </xsl:choose>                                                     
                            </Bloque>                            
                        </xsl:for-each>
                        <xsl:if test="$NumMaxUltimo  &lt; $attribute1 ">
                            <Bloque>
                                <idCorrelation>
                                    <xsl:value-of select="concat('Bloque',position(),'_',$IdCorrelation)"/>
                                </idCorrelation>
                                <num>
                                    <xsl:value-of select="$NumFinal+1"/>
                                </num>                            
                                <inicioBloque>
                                    <xsl:value-of select="$NumMaxUltimo"/>
                                </inicioBloque>                                            
                                <finBloque>
                                    <xsl:value-of select="$attribute1 - $NumMaxUltimo"/>
                                </finBloque>                        
                            </Bloque>              
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
             </Bloques>     
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>