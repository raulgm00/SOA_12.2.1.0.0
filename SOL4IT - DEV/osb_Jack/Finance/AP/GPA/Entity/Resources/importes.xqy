xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://qualitas.com.mx/Importes/v1/";
(:: import schema at "../../v1/XMLSchema_367129907.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/top/ImporteDB";
(:: import schema at "ImporteDB_table.xsd" ::)

declare namespace imp="http://www.w3.org/2005/xquery-local-functions";

declare variable $importesCollection as element() (:: schema-element(ns1:Gpa002ImportesCollection) ::) external;

declare function imp:importesFunc($importesCollection as element() (:: schema-element(ns1:Gpa002ImportesCollection) ::)) as element() (:: element(Importes, ns2:ImportesOEN) ::) {
    <ns2:ImportesOEN/>
};

imp:importesFunc($importesCollection)