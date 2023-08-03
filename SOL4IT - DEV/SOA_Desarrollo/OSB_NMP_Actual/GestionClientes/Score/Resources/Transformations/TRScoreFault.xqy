xquery version "2004-draft" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$fault" element="ns0:fault" location="../Schemas/OSBMessageContextXSD.xsd" ::)
(:: pragma  type="xs:anyType" ::)

declare namespace soap-env = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace xf = "http://tempuri.org/NMP/Integracion/Score/Resources/XSLT/test/";
declare namespace ns0 = "http://www.bea.com/wli/sb/context";
declare namespace ns2 = "http://www.bea.com/wli/sb/stages/transform/config";
declare namespace ns3 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage";

declare function xf:test($fault as element(ns0:fault))
    as element(*) {
        <soap-env:Fault>
        {
        	if($fault/ns0:errorCode="OSB-380001") (: NMP-001 :)
				then <faultcode>NMP-001</faultcode>
			else if($fault/ns0:errorCode="OSB-380002") (: NMP-002 :)
				then <faultcode>NMP-002</faultcode>
			else if($fault/ns0:errorCode="OSB-380000") (: NMP-003 :)
				then <faultcode>NMP-003</faultcode>
			else if($fault/ns0:errorCode="OSB-380001") (: NMP-005 :)
				then <faultcode>NMP-005</faultcode>
			else if($fault/ns0:errorCode="OSB-382500") (: NMP-006 :)
				then <faultcode>NMP-006</faultcode>
			else if($fault/ns0:errorCode="OSB-OSB-") (: NMP-008:)
				then <faultcode>NMP-008</faultcode>    
			else <faultcode>{$fault/ns0:errorCode/text()}</faultcode>
	    }
	    {
			if($fault/ns0:errorCode="OSB-380001") (: NMP-001 :)
				then <faultstring>{$fault/ns0:reason/text()}</faultstring>
			else if($fault/ns0:errorCode="OSB-380002") (: NMP-002 :)
				then <faultstring>Error conectividad 2 - {$fault/ns0:reason/text()}</faultstring>
			else if($fault/ns0:errorCode="OSB-380000") (: NMP-003 :)
				then <faultstring>Error conectividad 3: {$fault/ns0:reason/text()}</faultstring>
			else if($fault/ns0:errorCode="OSB-380001") (: NMP-005 :)
				then <faultstring>{$fault/ns0:reason/text()}</faultstring>
			else if($fault/ns0:errorCode="OSB-382500") (: NMP-006 :)
				then <faultstring>{$fault/ns0:reason/text()}</faultstring>
			else if($fault/ns0:errorCode="OSB-OSB-") (: NMP-008 :)
				then <faultstring>Error aplicación: {$fault/ns0:reason/text()}, Detalle: {$fault/ns0:details/ns2:ValidationFailureDetail/ns2:message/text()}</faultstring>    
			else <faultstring>{$fault/ns0:reason/text()}</faultstring>
		}
		<detail>
		    	<ns3:messageError xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		    	{
					if($fault/ns0:errorCode="OSB-380001") (: NMP-001 :)
		        		then <codigoError>NMP-001</codigoError>
		        	else if($fault/ns0:errorCode="OSB-380002") (: NMP-002 :)
		        		then <codigoError>NMP-002</codigoError>
		        	else if($fault/ns0:errorCode="OSB-380000") (: NMP-003 :)
		        		then <codigoError>NMP-003</codigoError>
		        	else if($fault/ns0:errorCode="OSB-380001") (: NMP-005 :)
		        		then <codigoError>NMP-005</codigoError>
		        	else if($fault/ns0:errorCode="OSB-382500") (: NMP-006 :)
		        		then <codigoError>NMP-006</codigoError>
		        	else if($fault/ns0:errorCode="OSB-OSB-") (: NMP-008:)
		        		then <codigoError>NMP-008</codigoError>    
		        	else <codigoError>{$fault/ns0:errorCode/text()}</codigoError>
		        	}
		        	{
		        	if($fault/ns0:errorCode="OSB-380001") (: NMP-001 :)
		        		then <descripcionError>{$fault/ns0:reason/text()}</descripcionError>
		        	else if($fault/ns0:errorCode="OSB-380002") (: NMP-002 :)
		        		then <descripcionError>Error conectividad 2 - {$fault/ns0:reason/text()}</descripcionError>
		        	else if($fault/ns0:errorCode="OSB-380000") (: NMP-003 :)
		        		then <descripcionError>Error conectividad 3: {$fault/ns0:reason/text()}</descripcionError>
		        	else if($fault/ns0:errorCode="OSB-380001") (: NMP-005 :)
		        		then <descripcionError>{$fault/ns0:reason/text()}</descripcionError>
		        	else if($fault/ns0:errorCode="OSB-382500") (: NMP-006 :)
		        		then <descripcionError>{$fault/ns0:reason/text()}</descripcionError>
		        	else if($fault/ns0:errorCode="OSB-OSB-") (: NMP-008 :)
		        		then <descripcionError>Error aplicación: {$fault/ns0:reason/text()}, Detalle: {$fault/ns0:details/ns2:ValidationFailureDetail/ns2:message/text()}</descripcionError>    
		        	else <descripcionError>{$fault/ns0:reason/text()}</descripcionError>
		        	}
		        	{
		        	if($fault/ns0:errorCode="OSB-380001") (: NMP-001 :)
		        		then <tipoError>Técnico</tipoError>
		        	else if($fault/ns0:errorCode="OSB-380002") (: NMP-002 :)
		        		then <tipoError>Técnico</tipoError>
		        	else if($fault/ns0:errorCode="OSB-380000") (: NMP-003 :)
		        		then <tipoError>Técnico</tipoError>
		        	else if($fault/ns0:errorCode="OSB-380001") (: NMP-005 :)
		        		then <tipoError>Técnico</tipoError>
		        	else if($fault/ns0:errorCode="OSB-382500") (: NMP-006 :)
		        		then <tipoError>Técnico</tipoError>
		        	else if($fault/ns0:errorCode="OSB-OSB-") (: NMP-008 :)
		        		then <tipoError>Técnico</tipoError>    
		        	else <tipoError>Técnico</tipoError>
		        	}
		        	{
		        	if($fault/ns0:errorCode="OSB-380001") (: NMP-001 :)
		        		then <severidad>1</severidad>
		        	else if($fault/ns0:errorCode="OSB-380002") (: NMP-002 :)
		        		then <severidad>2</severidad>
					else if($fault/ns0:errorCode="OSB-380000") (: NMP-003 :)
		        		then <severidad>2</severidad>
		        	else if($fault/ns0:errorCode="OSB-380001") (: NMP-005 :)
		        		then <severidad>2</severidad>
		        	else if($fault/ns0:errorCode="OSB-382500") (: NMP-006 :)
		        		then <severidad>1</severidad>
		        	else if($fault/ns0:errorCode="OSB-OSB-") (: NMP-008 :)
		        		then <severidad>2</severidad>    
		        	else <severidad>1</severidad>
		        	}	
		 		</ns3:messageError>
		</detail>
        </soap-env:Fault>
};

declare variable $fault as element(ns0:fault) external;

xf:test($fault)