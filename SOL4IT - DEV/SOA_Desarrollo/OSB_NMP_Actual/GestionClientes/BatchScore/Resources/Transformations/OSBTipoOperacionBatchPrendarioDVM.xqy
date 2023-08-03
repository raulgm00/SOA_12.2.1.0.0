xquery version "2004-draft";
<dvm name="tipoOperacion" xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPTipoOperacion">
  <description> DVM que de acuerdo a SelectorMsj: 0 No se envia a ninguno, 1 operaciones para Scoring, 2 operaciones para SID se determina hacia donde será enviado el mensaje</description>
  <columns>
    <column name="Id"/>
    <column name="Abreviatura"/>
    <column name="Descripcion"/>
    <column name="SelectorMsj"/>
  </columns>
  <rows>
    <row>
      <cell>1</cell>
      <cell>PP</cell>
      <cell>PAGO EMPEÑO O AVALÚO</cell>
	  <cell>0</cell>
    </row>
    <row>
      <cell>2</cell>
      <cell>RF</cell>
      <cell>REFRENDO</cell>
	  <cell>0</cell>
    </row>
    <row>
      <cell>3</cell>
      <cell>DS</cell>
      <cell>DESEMPEÑO</cell>
	  <cell>0</cell>
    </row>
    <row>
      <cell>4</cell>
      <cell>PD</cell>
      <cell>DEMASÍA</cell>
	  <cell>0</cell>
    </row>
    <row>
      <cell>5</cell>
      <cell>VB</cell>
      <cell>VENTA CON BILLETE</cell>
	  <cell>0</cell>
    </row>
    <row>
      <cell>6</cell>
      <cell>VP</cell>
      <cell>VENTA AL PÚBLICO</cell>
	  <cell>1</cell>
    </row>
    <row>
      <cell>7</cell>
      <cell>BA</cell>
      <cell>CARGO AL VALUADOR</cell>
	  <cell>0</cell>
    </row>
    <row>
      <cell>8</cell>
      <cell>REP</cell>
      <cell>RECHAZO</cell>
	  <cell>0</cell>
    </row>
	<row>
		<cell>9</cell>
		<cell>AO</cell>
		<cell>EMPEÑO</cell>
		<cell>2</cell>
	</row>
	<row>
		<cell>10</cell>
		<cell>CA</cell>
		<cell>CARGO VALUADOR PRENDARIO</cell>
		<cell>2</cell>
	</row>
	<row>
		<cell>11</cell>
		<cell>APL</cell> 
		<cell>ABONO</cell>	
		<cell>2</cell>
	</row>
	<row>
		<cell>12</cell>
		<cell>IA</cell>
		<cell>PASE ALMONEDA</cell>	
		<cell>2</cell>
	</row>
	<row>
		<cell>13</cell>
		<cell>SE_SD</cell>
		<cell>SEPARACION Y BAJA DEPOSITO</cell>	
		<cell>2</cell>
	</row>
	<row>
		<cell>14</cell>
		<cell>SE_SE</cell>
		<cell>SEPARACION Y BAJA ALMONEDA</cell>	
		<cell>2</cell>
	</row>
	<row>
		<cell>15</cell>
		<cell>DN</cell>
		<cell>DEVOLUCION</cell>	
		<cell>2</cell>
	</row>
  </rows>
</dvm>