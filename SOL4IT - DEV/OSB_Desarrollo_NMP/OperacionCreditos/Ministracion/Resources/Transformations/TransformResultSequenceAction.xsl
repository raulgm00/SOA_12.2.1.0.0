<xsl:stylesheet exclude-result-prefixes="xp20" version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:soldb="http://servicios.montedepiedad.com.mx/NMP/Schema/SolicitudesMinistracionDb">
	<xsl:include href="../../../../Common/XSLT/TemplateCommonNMP.xsl"/>
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <soldb:NmpSecuenciasCollection>
            <xsl:choose>
                <xsl:when test="soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=3] and soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=1]">
                    <soldb:NmpSecuencias accion="update" idValido="1">
                        <soldb:prefijo>
                            <xsl:value-of select="soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=3]/soldb:prefijo"/>
                        </soldb:prefijo>
                        <soldb:secuencia>
                            <xsl:attribute name="charSequence">
                                <xsl:call-template name="charSequence">
                                    <xsl:with-param name="idSequence" select="soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=3]/soldb:secuencia +1 "/>
                                </xsl:call-template>
                            </xsl:attribute>
                            <xsl:value-of select="soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=3]/soldb:secuencia +1 "/>
                        </soldb:secuencia>
                    </soldb:NmpSecuencias>
                </xsl:when>
                <xsl:when test="normalize-space(soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=3]/soldb:tipoSecuencia)='' and soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=1]">
                    <soldb:NmpSecuencias accion="insert" idValido="1">
                        <soldb:prefijo>
                            <xsl:value-of select="soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=1]/soldb:prefijoId"/>
                        </soldb:prefijo>
                        <soldb:secuencia>
							<xsl:attribute name="charSequence">
                                <xsl:call-template name="charSequence">
                                    <xsl:with-param name="idSequence" select="0"/>
                                </xsl:call-template>
                            </xsl:attribute>
                            <xsl:value-of select="0"/>
						</soldb:secuencia>
                    </soldb:NmpSecuencias>
                </xsl:when>
                <!--xsl:when test="normalize-space(soldb:getInfoSequenceResponse/*)=''">
                    <soldb:NmpSecuencias accion="insert" idValido="0">
                        <soldb:prefijo>
                            <xsl:value-of select="xp20:format-date(xp20:current-date(),'[Y0001]')"/>
                        </soldb:prefijo>
                        <soldb:secuencia>65</soldb:secuencia>
                    </soldb:NmpSecuencias>
                    <soldb:NmpSecuencias accion="insert" idValido="1">
                        <soldb:prefijo>
                            <xsl:value-of select="concat(xp20:format-date(xp20:current-date(), '[D01][M01]'),'A')"/>
                        </soldb:prefijo>
                        <soldb:secuencia>0</soldb:secuencia>
                    </soldb:NmpSecuencias>
                </xsl:when-->
                <xsl:when test="normalize-space(soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=3]/soldb:tipoSecuencia)='' and soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=2]">
                    <soldb:NmpSecuencias accion="insert" idValido="1">
                        <soldb:prefijo>
                            <xsl:value-of select="soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=2]/soldb:prefijoId"/>
                        </soldb:prefijo>
                        <soldb:secuencia>
							<xsl:attribute name="charSequence">
                                <xsl:call-template name="charSequence">
                                    <xsl:with-param name="idSequence" select="0"/>
                                </xsl:call-template>
                            </xsl:attribute>
                            <xsl:value-of select="0"/>
						</soldb:secuencia>
                    </soldb:NmpSecuencias>
                    <soldb:NmpSecuencias accion="insert" idValido="0">
                        <soldb:prefijo>
                            <xsl:value-of select="soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=2]/soldb:prefijo + 1"/>
                        </soldb:prefijo>
                        <soldb:secuencia>
                            <xsl:choose>
                                <xsl:when test="soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=2]/soldb:secuencia=90">65</xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="soldb:getInfoSequenceResponse/soldb:getInfoSequenceOutput[./soldb:tipoSecuencia=2]/soldb:secuencia + 1"/>
                                </xsl:otherwise>
                            </xsl:choose>                            
                        </soldb:secuencia>
                    </soldb:NmpSecuencias>
                </xsl:when>
            </xsl:choose>
        </soldb:NmpSecuenciasCollection>
    </xsl:template>
</xsl:stylesheet>