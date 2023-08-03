<availableEndpoints> 
     <route establishment="9" destino="VPN" description="Buro Credito Conin">
        <operations>
            <operation name="getConsultaBC">
                <endpointURL>https://128.9.55.102:9444/WSConsultaBCC/WSConsultaService</endpointURL>
            </operation>            
        </operations>
    </route>
    <route establishment="9" destino="SAPConin" description="Buro Credito Conin">
        <operations>            
            <operation name="getConsultaVigenteBC">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_consulta_vigente/330/zlm_ws_consulta_vigente/zlm_ws_consulta_vigente</endpointURL>
            </operation>
            <operation name="getConsultaBC">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_recibe_buro/330/zlm_ws_recibe_buro/zlm_ws_recibe_buro</endpointURL>
            </operation>
            <operation name="getConsultaAutografaBC">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_movilidad_consulta_buro/330/zlm_ws_movilidad_consulta_buro/zlm_ws_movilidad_consulta_buro</endpointURL>
            </operation>        
        </operations>
    </route>
    <route establishment="15" destino="VPN" description="Buro Credito Conin">
        <operations>
            <operation name="getConsultaBC">
                <endpointURL>https://128.9.55.102:9444/WSConsultaBCC/WSConsultaService</endpointURL>
            </operation>            
        </operations>
    </route>
    <route establishment="15" destino="SAPConin" description="Buro Credito Conin">
        <operations>            
            <operation name="getConsultaVigenteBC">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_consulta_vigente/330/zlm_ws_consulta_vigente/zlm_ws_consulta_vigente</endpointURL>
            </operation>
            <operation name="getConsultaBC">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_recibe_buro/330/zlm_ws_recibe_buro/zlm_ws_recibe_buro</endpointURL>
            </operation>
            <operation name="getConsultaAutografaBC">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_movilidad_consulta_buro/330/zlm_ws_movilidad_consulta_buro/zlm_ws_movilidad_consulta_buro</endpointURL>
            </operation>        
        </operations>
    </route>
    <route establishment="SAP" description="Buro Credito NMP">
        <operations>             
            <operation name="getConsultaVigenteBC">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_consulta_vigente/300/zlm_ws_consulta_vigente/zlm_ws_consulta_vigente</endpointURL>
            </operation>
            <operation name="getConsultaBC">
                <endpointURL>http://dcpimsdsap01.nmp.com.mx:8000/sap/bc/srt/rfc/sap/zlm_ws_recibe_buro/300/zlm_ws_recibe_buro/zlm_ws_recibe_buro</endpointURL>
            </operation>
            <operation name="getConsultaAutografaBC">
                <endpointURL>http://dcpimsdsapq01.nmp.com.mx:8010/sap/bc/srt/rfc/sap/zlm_ws_movilidad_consulta_buro/300/zlm_ws_movilidad_consulta_buro/zlm_ws_movilidad_consulta_buro</endpointURL>
            </operation>        
        </operations>
    </route>
    <route establishment="VPN" description="Buro Credito NMP">
        <operations>
             <operation name="getConsultaBC">
                <endpointURL>https://128.9.55.102:9443/WSConsultaBCC/WSConsultaService</endpointURL>
            </operation>           
        </operations>
    </route>
</availableEndpoints>