<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:nmp="http://example.com/mf"   
    exclude-result-prefixes="xs xsl nmp">
    <xsl:output indent="yes"></xsl:output>    
    <!--Formato Fechas de YYYY-MM-DD HH:MI AM/PM a YYYY-MM-DDTH24:MI:00-->
    <xsl:template name="formatDateTime">        
        <xsl:param name="DateIn"/>
        <xsl:variable name="TimeAM">
            <xsl:value-of select="contains($DateIn,'AM')"></xsl:value-of>
        </xsl:variable>
        <xsl:variable name="Hour">
            <xsl:value-of select="number(substring($DateIn,12,2))"></xsl:value-of>
        </xsl:variable>
        <xsl:variable name="Fecha">
            <xsl:value-of select="concat(substring($DateIn,1,4),'-',substring($DateIn,6,2),'-',substring($DateIn,9,2))"></xsl:value-of>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$TimeAM=true() and $Hour=12">
                <xsl:value-of select="concat($Fecha,'T','00:',substring($DateIn,15,2),':00')"/>
            </xsl:when>
            <xsl:when test="$TimeAM=false() and contains($DateIn,'PM') and $Hour!=12">
                <xsl:variable name="HourPM">
                    <xsl:value-of select="$Hour+12"/>
                </xsl:variable>
                <xsl:value-of select="concat($Fecha,'T',$HourPM,':',substring($DateIn,15,2),':00')"/>
            </xsl:when>      
            <xsl:otherwise>                
                <xsl:value-of select="concat($Fecha,'T',substring($DateIn,12,5),':00')"/>
            </xsl:otherwise>
        </xsl:choose>         
    </xsl:template>
    <!--Template para formato Fechas de YYYY-MM-DD HH:MI AM/PM a YYYY-MM-DDTH24:MI:00-->
    <xsl:template name="formatDate">
        <xsl:param name="DateIn"/>
        <xsl:choose>
            <xsl:when test="$DateIn!=''">
                <xsl:value-of
                    select="concat(substring($DateIn,9,2),'-',substring($DateIn,6,2),'-',substring($DateIn,1,4))"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!--Template obtener el tamaño de un archivo-->
    <!--xsl:template name="getFileSize">
        <xsl:param name="contenido"/>
        <xsl:variable name="countCadena">
            <xsl:value-of select="string-length($contenido)"></xsl:value-of>
        </xsl:variable>
        <xsl:variable name="countIgual">
            <xsl:value-of select="count(tokenize($contenido, '=')[. != ''])"></xsl:value-of>
        </xsl:variable>
        <xsl:value-of select="$countCadena * (3 div 4)- $countIgual"></xsl:value-of>       
    </xsl:template-->
    
    <!--Template para concatenar 0 a la derecha donde 5 es el numero maximo de 0-->
    <xsl:template name="charSequence">
        <xsl:param name="idSequence"/>
        <xsl:variable name="Sequence5">00000</xsl:variable>
        <xsl:variable name="countCadena">
            <xsl:value-of select="5 - string-length($idSequence)"></xsl:value-of>
        </xsl:variable>
        <xsl:value-of select="concat(substring($Sequence5,1,number($countCadena)),$idSequence)"></xsl:value-of>       
    </xsl:template>     
</xsl:stylesheet>