<availableEndpoints>   
    <route establishment="9" description="Gestion Ordenes Trabajo SAP Conin">
        <operations>
            <operation name="actualizarPendientes">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_reinsercion/330/zlm_ws_reinsercion/zlm_ws_reinsercion</endpointURL>
            </operation>
            <operation name="actualizarGestion">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_movilidad_captura/330/zlm_ws_movilidad_captura/zlm_ws_movilidad_captura</endpointURL>
            </operation>        
        </operations>
    </route>
    <route establishment="SAP" description="Gestion Ordenes Trabajo SAP">
        <operations>
            <operation name="actualizarPendientes">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_reinsercion/300/zlm_ws_reinsercion/zlm_ws_reinsercion</endpointURL>
            </operation>
            <operation name="actualizarGestion">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_movilidad_captura/300/zlm_ws_movilidad_captura/zlm_ws_movilidad_captura</endpointURL>
            </operation>        
        </operations>
    </route>
</availableEndpoints>