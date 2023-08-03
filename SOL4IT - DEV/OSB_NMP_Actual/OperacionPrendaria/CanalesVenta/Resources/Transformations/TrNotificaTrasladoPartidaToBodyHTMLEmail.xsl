<?xml version="1.0" encoding="UTF-8"?>
<!--Genera una salida en formato HTML para el cuerpo del correo de las partidas para canales de venta-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:not="http://servicios.montedepiedad.com.mx/NMP/Schema/NotificacionPartidas"
    version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <h3>Estimad@ Gerente: </h3>
                <span class="byline">Le informamos que las prendas de compra cumplido de su sucursal, ya le fue asignado un canal de venta y/o bodega para su traslado, le agradeceremos accesar a la pantalla correspondiente para tomar las acciones pertinentes.  El resumen de la informacion es:</span>
                <style type="text/css">



body {
 background: #fafafa url(http://jackrugile.com/images/misc/noise-diagonal.png);
 color: #444;
 font: 100%/30px 'Helvetica Neue', helvetica, arial, sans-serif;
 text-shadow: 0 1px 0 #fff;
}
table {
 background: #f5f5f5;
 border-collapse: separate;
 box-shadow: inset 0 1px 0 #fff;
 font-size: 12px;
 line-height: 24px;
 margin: 10px auto;
 text-align: left;
 width: 400px;  
} 
 .section-text {
    text-align: center;
    padding: 0 25%;
}
th {
 background-color: #eee;
    font-weight: bold;
 position: relative;
 
}

th:after {
 content: '';
 display: block;
 height: 25%;
 left: 0;
 margin: 1px 0 0 0;
 position: absolute;
 top: 25%;
 width: 100%;
}

td {
 border-right: 1px solid #fff;
 border-left: 1px solid #e8e8e8;
 border-top: 1px solid #fff;
 border-bottom: 1px solid #e8e8e8;
 padding: 1px 1px;
 position: relative;
 transition: all 300ms;
}
					


</style>
            </head>
            
            <body>
                <div class="table-container">
                    <table width="700px">
                        <tr>
                            <th> Sucursal</th>
                            <xsl:for-each select="/not:partida/not:canalVenta">
                                <th>
                                    <xsl:value-of select="not:nombre"/>
                                </th>
                            </xsl:for-each>                            
                            <th> TOTAL</th>
                            
                        </tr>
                        <tr class="even">
                            <td>
                                <xsl:value-of select="/not:partida/not:numeroSucursal"/>
                            </td>
                            <xsl:for-each select="/not:partida/not:canalVenta">
                                <td>
                                    <xsl:value-of select="not:numeroPrendas"/>
                                </td>
                            </xsl:for-each>
                            <td>
                                <xsl:value-of select="/not:partida/not:totalPrendas"/>
                            </td>
                        </tr>
                        
                    </table>
                </div>
                
                <p class="section-text"> Atentamente </p>
                <p class="section-text">Estrategia Comercial </p>
            </body> 
        </html>
           
    </xsl:template>
    
</xsl:stylesheet>