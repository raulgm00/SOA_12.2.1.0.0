<availableEndpoints>   
    <route establishment="9" description="Consulta Cobranza SAP Conin">
        <operations>
            <operation name="consultarCobranzaCliente">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_cobranza_cliente/330/zlm_ws_cobranza_cliente/zlm_ws_cobranza_cliente</endpointURL>
            </operation>
            <operation name="consultarEstatusCobranza">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_estatus_cobranza/330/zlm_ws_estatus_cobranza/zlm_ws_estatus_cobranza</endpointURL>
            </operation>         
        </operations>
    </route>
    <route establishment="SAP" description="Consulta Cobranza SAP">
       <operations>
            <operation name="consultarCobranzaCliente">
                <endpointURL>http://DCPIMSPIC1N1.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_cobranza_cliente/300/zlm_ws_cobranza_cliente/zlm_ws_cobranza_cliente</endpointURL>
            </operation>
            <operation name="consultarEstatusCobranza">
                <endpointURL>http://DCPIMSPIC1N1.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_estatus_cobranza/300/zlm_ws_estatus_cobranza/zlm_ws_estatus_cobranza</endpointURL>
            </operation>         
        </operations>
    </route>
</availableEndpoints>