xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://schemas.xmlsoap.org/soap/envelope/";
(:: import schema at "../../../../../Common/XSD/NMPStandardFault.xsd.xsd" ::)

declare namespace nmp = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPStandardMessage";

declare namespace f1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasCredito";

declare variable $FaultCode as xs:string external;
declare variable $FaultString as xs:string external;
declare variable $CodigoError as xs:string external;
declare variable $DescripcionError as xs:string external;
declare variable $TipoError as xs:string external;
declare variable $Severidad as xs:string external;

declare function local:func($FaultCode as xs:string, $FaultString as xs:string, $CodigoError as xs:string, $DescripcionError as xs:string, $TipoError as xs:string, $Severidad as xs:string )  as element() (:: schema-element(ns2:Fault) ::) {

      <ns2:Fault xmlns:f1="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCampaniasCredito">
           <faultcode>{fn:string(fn:concat('f1:',$FaultCode))}</faultcode>
          <faultstring> {fn:string($FaultString)}</faultstring>        
          <detail>
            <nmp:messageError>
                <nmp:codigoError>{fn:string($CodigoError)}</nmp:codigoError>
                <nmp:descripcionError>{fn:string($DescripcionError)}</nmp:descripcionError>
                <nmp:tipoError>{fn:string($TipoError)}</nmp:tipoError>
                <nmp:severidad>{fn:string($Severidad)}</nmp:severidad>
            </nmp:messageError>
          </detail>
      </ns2:Fault>
    
};

local:func($FaultCode,$FaultString,$CodigoError,$DescripcionError,$TipoError,$Severidad)