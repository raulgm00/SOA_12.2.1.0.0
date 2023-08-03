xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace src="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCliente";
(:: import schema at "../XSD/BuroCreditoSvcXSD.xsd" ::)
declare namespace trg="urn:sap-com:document:sap:rfc:functions";
(:: import schema at "../WSDL/ConsultaBuroCreditoMovilSapWSDL.wsdl" ::)

declare variable $consultaAutografa as element() (:: schema-element(src:consultaAutografaBCRequest) ::) external;

declare function local:TransformarConsultaAutografaXQ($consultaAutografa as element() (:: schema-element(src:consultaAutografaBCRequest) ::)) as element() (:: schema-element(trg:ZLM_RFC_CONSULTABURO) ::) {
    <trg:ZLM_RFC_CONSULTABURO>
        <I_BURO_INFO>
            <NOMBRE1>{fn:upper-case(fn:data($consultaAutografa/src:InputFields/src:Nombre1))}</NOMBRE1>
            <NOMBRE2>{fn:upper-case(fn:data($consultaAutografa/src:InputFields/src:Nombre2))}</NOMBRE2>
            <APELLIDOP>{fn:upper-case(fn:data($consultaAutografa/src:InputFields/src:Apellido_Paterno))}</APELLIDOP>
            <APELLIDOM>{fn:upper-case(fn:data($consultaAutografa/src:InputFields/src:Apellido_Materno))}</APELLIDOM>
            <OCUPACION/>
            <ACT_ECO/>
            <SEXO/>            
            <FECHANAC>{fn:data($consultaAutografa/src:InputFields/src:FechadeNacimientoCB)}</FECHANAC>
            <RFC>{fn:upper-case(fn:data($consultaAutografa/src:InputFields/src:RFCCB))}</RFC>
            <CALLE>{fn:upper-case(fn:data($consultaAutografa/src:InputFields/src:CalleCB))}</CALLE>
            <NUM_EXT>{fn:upper-case(fn:data($consultaAutografa/src:InputFields/src:NoExtCB))}</NUM_EXT>
            <ESTADO>{fn:upper-case(fn:data($consultaAutografa/src:InputFields/src:EstadoCB))}</ESTADO>
            <MUNICIPIO>{fn:upper-case(fn:data($consultaAutografa/src:InputFields/src:DelegacionCB))}</MUNICIPIO>
            <CP>{fn:data($consultaAutografa/src:InputFields/src:CPCB)}</CP>
            <COLONIA/>
            <LOCALIDAD/>
            <CALLE_EXT1/>
            <CALLE_EXT2/>
            <USERNAME>{fn:upper-case(fn:data($consultaAutografa/src:Username))}</USERNAME>
            <BP>{fn:data($consultaAutografa/src:InputFields/src:Num_Cliente)}</BP>
            <EXTERNAL_ID>{fn:data($consultaAutografa/src:ExternalId)}</EXTERNAL_ID>
            <SIVA>{fn:data($consultaAutografa/src:InputFields/src:Siva)}</SIVA>
            <PI>{fn:data($consultaAutografa/src:InputFields/src:ProbabilidadIncumplimiento)}</PI>
        </I_BURO_INFO>
    </trg:ZLM_RFC_CONSULTABURO>
};

local:TransformarConsultaAutografaXQ($consultaAutografa)