<xsl:stylesheet version="2.0" exclude-result-prefixes="urn xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:urn="urn:mx.com.nmp.midas" xmlns:exsl="http://exslt.org/common" xmlns:nmp="http://nmprecepcionregla.schema.nmp.servicios.montedepiedad.com.mx">
    <xsl:include href="../../../../Common/XSLT/TemplateCommonNMP.xsl"/>
    <xsl:output indent="yes"/>
   <xsl:template match="/">
        <urn:registrarReglaMarcado>
            <xsl:variable name="Subcriterios">
                <xsl:copy-of select="/EnvioCriteriosRequest/criterios"/>
            </xsl:variable>
            <urn:regla>
                <nmp:etapa>
                    <xsl:value-of select="/EnvioCriteriosRequest/etapa/text()"/>
                </nmp:etapa>
                <nmp:fechaEjecucion>
                    <xsl:call-template name="formatDateTime">
                        <xsl:with-param name="DateIn" select="/EnvioCriteriosRequest/fechaEjecucion"/>
                    </xsl:call-template>                    
                </nmp:fechaEjecucion>
                <nmp:fechaSolicitud>
                    <xsl:call-template name="formatDateTime">
                        <xsl:with-param name="DateIn" select="/EnvioCriteriosRequest/fechaSolicitud"/>
                    </xsl:call-template> 
                </nmp:fechaSolicitud>
                <nmp:idSolicitud>
                    <xsl:value-of select="/EnvioCriteriosRequest/idSolicitud"/>
                </nmp:idSolicitud>
                <nmp:proyecto>
                    <xsl:value-of select="/EnvioCriteriosRequest/proyecto"/>
                </nmp:proyecto>
                <nmp:subetapa>
                    <xsl:value-of select="/EnvioCriteriosRequest/subetapa"/>
                </nmp:subetapa>
                <nmp:criterios>
                    <xsl:for-each-group select="/EnvioCriteriosRequest/criterios/criterio" group-by="concat(nombre,valor)">                        
                        <xsl:variable name="nombreCriterio">
                            <xsl:value-of select="distinct-values(current-group()/nombre)"/>
                        </xsl:variable>
                        <xsl:variable name="valorCriterio">
                            <xsl:value-of select="distinct-values(current-group()/valor)"/>
                        </xsl:variable>
                        <nmp:criterio>
                            <nmp:nombre>
                                <xsl:value-of select="$nombreCriterio"/>
                            </nmp:nombre>
                            <xsl:choose>
                                <xsl:when test="$nombreCriterio='ingresoalmo'">
                                    <xsl:variable name="fecha1">
                                        <xsl:call-template name="formatDate">
                                            <xsl:with-param name="DateIn" select=" substring-before($valorCriterio,',')"/>
                                        </xsl:call-template> 
                                    </xsl:variable>
                                    <xsl:variable name="fecha2">
                                        <xsl:call-template name="formatDate">
                                            <xsl:with-param name="DateIn" select=" substring-after($valorCriterio,',')"/>
                                        </xsl:call-template> 
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$fecha2=''">
                                            <nmp:valor>
                                                <xsl:call-template name="formatDate">
                                                    <xsl:with-param name="DateIn" select="$valorCriterio"/>
                                                </xsl:call-template> 
                                            </nmp:valor>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <nmp:valor>
                                                <xsl:value-of select="concat($fecha1,',',$fecha2)"/>
                                            </nmp:valor>
                                        </xsl:otherwise>
                                    </xsl:choose>                                    
                                </xsl:when>
                                <xsl:otherwise>
                                    <nmp:valor>
                                        <xsl:value-of select="$valorCriterio"/>
                                    </nmp:valor>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="$Subcriterios/criterios/criterio[./nombre=$nombreCriterio and ./valor=$valorCriterio]/subCriterios/subcriterio">
                                <nmp:subcriterios>
                                    <xsl:for-each select="$Subcriterios/criterios/criterio[./nombre=$nombreCriterio and ./valor=$valorCriterio]/subCriterios/subcriterio">                                
                                        <xsl:if test="normalize-space(nombre)!=''">                                        
                                            <nmp:Subcriterio>
                                                <nmp:nombre>
                                                    <xsl:value-of select="nombre"/>
                                                </nmp:nombre>
                                                <nmp:valor>
                                                    <xsl:value-of select="valor"/>
                                                </nmp:valor>
                                            </nmp:Subcriterio>                                                                      
                                        </xsl:if>                                
                                    </xsl:for-each>     
                                </nmp:subcriterios>
                            </xsl:if>   
                        </nmp:criterio>
                    </xsl:for-each-group>
                </nmp:criterios>               
            </urn:regla>
        </urn:registrarReglaMarcado>
    </xsl:template>
</xsl:stylesheet>