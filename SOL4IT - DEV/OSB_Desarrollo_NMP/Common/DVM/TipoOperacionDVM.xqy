xquery version "2004-draft";
<dvm name="tipoOperacion" xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPTipoOperacion">
	<description> 1 operaciones para CRM y Scoring. 2 operaciones para CRM, Scoring y SID. 3 operaciones para SID. 4 operaciones para CRM. 5 operaciones para SID y CRM</description>
	<columns>
		<column name="Id"/>
		<column name="Abreviatura"/>
		<column name="Descripcion"/>
		<column name="DestinoMsj"/>
                <column name="MonitorBam"/>
	</columns>
	<rows>
		<row>
			<cell>1</cell>
			<cell>PP</cell>
			<cell>PAGO EMPEÑO O AVALÚO</cell>
			<cell>2</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>2</cell>
			<cell>RF</cell>
			<cell>REFRENDO</cell>
			<cell>2</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>3</cell>
			<cell>DS</cell>
			<cell>DESEMPEÑO</cell>
			<cell>2</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>4</cell>
			<cell>PD</cell>
			<cell>DEMASÍA</cell>
			<cell>1</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>5</cell>
			<cell>VB</cell>
			<cell>VENTA CON BILLETE</cell>
			<cell>2</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>6</cell>
			<cell>VP</cell>
			<cell>VENTA AL PÚBLICO</cell>
			<cell>2</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>7</cell>
			<cell>BA</cell>
			<cell>CARGO AL VALUADOR</cell>
			<cell>1</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>8</cell>
			<cell>REP</cell>
			<cell>RECHAZO</cell>
			<cell>1</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>9</cell>
			<cell>AO</cell>
			<cell>EMPEÑO</cell>
			<cell>5</cell>
                        <cell>no</cell>
		</row>
		<row>
			<cell>10</cell>
			<cell>CA</cell>
			<cell>CARGO VALUADOR PRENDARIO</cell>
			<cell>3</cell>
                        <cell>no</cell>
		</row>
		<row>
			<cell>11</cell>
			<cell>APL</cell> 
			<cell>ABONO</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
		<row>
			<cell>12</cell>
			<cell>IA</cell>
			<cell>PASE ALMONEDA</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
		<row>
			<cell>13</cell>
			<cell>SE_SD</cell>
			<cell>SEPARACION Y BAJA DEPOSITO</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
		<row>
			<cell>14</cell>
			<cell>SE_SE</cell>
			<cell>SEPARACION Y BAJA ALMONEDA</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
		<row>
			<cell>15</cell>
			<cell>DN</cell>
			<cell>DEVOLUCION</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
		<row>
			<cell>16</cell>
			<cell>RE</cell>
			<cell>RE-EMPEÑO</cell>	
			<cell>4</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>17</cell>
			<cell>DSR</cell>
			<cell>DESEMPEÑO PARA RE-EMPEÑO</cell>	
			<cell>4</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>18</cell>
			<cell>VBR</cell>
			<cell>VENTA CON BILLETE PARA RE-EMPEÑO</cell>	
			<cell>4</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>19</cell>
			<cell>PSF</cell>
			<cell>PAGO DE SALDO A FAVOR</cell>	
			<cell>4</cell>
                        <cell>si</cell>
		</row>
		<row>
			<cell>20</cell>
			<cell>SA</cell>
			<cell>SOLICITUD AVALÚO</cell>	
			<cell>4</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>21</cell>
			<cell>IT</cell>
			<cell>INGRESAR POR TRASPASO</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>22</cell>
			<cell>SO</cell>
			<cell>SALIDA POR TRASPASO</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>23</cell>
			<cell>CRC</cell>
			<cell>COBRO REIMPRESIÓN CARÁTULA</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>24</cell>
			<cell>BME_EMB_BED</cell>
			<cell>BAJA DE MERCANCÍA EMBARGO DEPÓSITO</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>25</cell>
			<cell>BME_NDC_BED</cell>
			<cell>BAJA DE MERCANCÍA NOTA DE CARGO DEPÓSITO</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>26</cell>
			<cell>BME_SNT_BED</cell>
			<cell>BAJA DE MERCANCÍA SINIESTRO DEPÓSITO</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>27</cell>
			<cell>BME_RQJ_BED</cell>
			<cell>BAJA DE MERCANCÍA JURIDICO DEPÓSITO</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>28</cell>
			<cell>BME_EMB_BEA</cell>
			<cell>BAJA DE MERCANCÍA EMBARGO ALMONEDA</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>29</cell>
			<cell>BME_NDC_BEA</cell>
			<cell>BAJA DE MERCANCÍA NOTA DE CARGO ALMONEDA</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>30</cell>
			<cell>BME_SNT_BEA</cell>
			<cell>BAJA DE MERCANCÍA SINIESTRO ALMONEDA</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
                <row>
			<cell>31</cell>
			<cell>BME_RQJ_BEA</cell>
			<cell>BAJA DE MERCANCÍA JURÍDICO ALMONEDA</cell>	
			<cell>3</cell>
                        <cell>no</cell>
		</row>
	</rows>
</dvm>