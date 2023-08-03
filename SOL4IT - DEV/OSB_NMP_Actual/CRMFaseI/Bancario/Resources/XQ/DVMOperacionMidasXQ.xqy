xquery version "2004-draft";
<dvm name="OperacionMidas" 
	xmlns="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPBancario">
  <horario>
    <description>Definición de horarios para operación en el servicio bancario de MIDAS. Nota: Se considera el desfase en cambio de horario de Quintana Roo</description>
    <columns>
      <column name="descripcion"/>
      <column name="horaIncio"/>
      <column name="horaFin"/>
    </columns>
    <rows>
      <row>
        <cell>Operacion</cell>
        <cell>07:00:00</cell>
        <cell>20:00:00</cell>
      </row>
    </rows>
  </horario>
  <operaciones>
    <description>Operaciones que el servicio de MIDAS-BANAMEX enviará por el BUS</description>
    <columns>
      <column name="establecimiento"/>
      <column name="identificador"/>
      <column name="abreviatura" />
      <column name="descripcion"/>
    </columns>
    <rows>
	  <row>
        <cell>3444</cell>
        <cell>8</cell>
        <cell>RF</cell>
        <cell>COBRO REFRENDO</cell>
      </row>
      <row>
        <cell>3443</cell>
        <cell>129</cell>
        <cell>DSB</cell>
        <cell>COBRO DESEMPEÑO BANCARIO</cell>
      </row>
    </rows>
  </operaciones>
</dvm>