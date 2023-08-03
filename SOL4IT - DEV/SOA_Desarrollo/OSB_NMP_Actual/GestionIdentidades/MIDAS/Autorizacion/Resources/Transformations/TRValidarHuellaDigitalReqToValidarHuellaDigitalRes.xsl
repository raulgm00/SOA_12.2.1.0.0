<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:ns0="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSucursal" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NMPAutorizacionElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="validarHuellaDigitalRequest" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSucursal"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/NMPAutorizacionElementosXSD.xsd"/>
        <oracle-xsl-mapper:rootElement name="validarHuellaDigitalResponse" namespace="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPSucursal"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.0.0(XSLT Build 151013.0700.0085) AT [TUE JUL 26 18:44:04 CDT 2016].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <ns0:validarHuellaDigitalResponse>
      <xsl:choose>
        <xsl:when test="/ns0:validarHuellaDigitalRequest/ns0:idSucursal = 73">
          <ns0:huella>AQAAABQAAAD0AAAAAQASAAEAZAAAAAAA7AAAAKcpXSKFP7otQE5a/yI31wGFNIU1baO8ssJziSakVqtvRQ2PGaXZYxsRTZYwbHJmR75lt3U7wwDVNKKrM/bA*Bx7OsVr1VFfjjw0c*CZclJZ1QeDh8WouxS3oTcLjDkvbcHqPsQzzFdEiXweiCPv2cSrIxz3D3il/MWFIe7zRX64/vB6xxksSq4iEp4hxp7puqDxO3IcAc4AUcwnyVnDZDFvTotmkZ9zX*MrhvCBOs3EEM79RpDKRGHtocmjd96qfVCu0Jdwu2EeX8fBOf4ZLQJj5N9V0QtaB38faLAHnSU25XSgDcSV1qp8Df871JLWSQ</ns0:huella>
        </xsl:when>
        <xsl:when test="/ns0:validarHuellaDigitalRequest/ns0:idSucursal = 24">
          <ns0:huella>AQAAABQAAADUAAAAAQASAAEARgAAAAAAyAAAAIjk6R7ATVjxGJHgqDvDCQZ0YeUe0*o9bP8jcPtSGqMN/vfARmt/rcPyh6nKPBNVLWR3YTCt8A/ApDqXAgY9jp1PIwFbo9JrxEifAi80JkwvFs7MMkukDWY4ge*6Sny5AmgUdRDDCMVr/dpLnxUwtSD0x29Wek/s2omYsk/5eDUffVnzi37YJF9UO11sgXAicPMqZ7HzxO1PFF7np4NFR9IRg1Twd/IVLPfpQv4MfHxwdlWk*O*ht4rZSmlPGjJr1TvpW5a6czMbDk7qrkCHqNE</ns0:huella>
        </xsl:when>
        <xsl:when test="/ns0:validarHuellaDigitalRequest/ns0:idSucursal = 112">
          <ns0:huella>AQAAABQAAADkAAAAAQASAAEAZAAAAAAA4AAAAJYykUvzaXVDY1SyX3w9mg3ZxAxM2cvuSABBTOozuHTJbUnysJsK86S1JRWB4kkZ15X0sdmlhOjpq1VYiqkiBoS1nd9xa*PY/QkLC5Wfq*Ap2W3vvMoFFxgJoirD1LJoPHhzP88lVnWgdPOBGnJhd8EOP0R6mM9NMFqpWnC/59B2JBltHYMsGAttJlgCIdO3aHI0rpMyZWry55z5x6SuilEDy/OhjSvelkzph9sqtrxgiH9wZwkabx9Bdrwm2CpUjmwm6IFFGBxN2OszpLUaG45EELDkGJHBjCU8zEOBxDcB</ns0:huella>
        </xsl:when>
        <xsl:otherwise>
          <ns0:huella/>
        </xsl:otherwise>
      </xsl:choose>
    </ns0:validarHuellaDigitalResponse>
  </xsl:template>
</xsl:stylesheet>