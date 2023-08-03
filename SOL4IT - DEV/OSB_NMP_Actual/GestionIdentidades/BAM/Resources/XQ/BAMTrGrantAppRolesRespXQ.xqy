xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:grantAppRoleResponse" location="../XSD/manageAppRoles_ELEMENTS.xsd" ::)

declare namespace ns1 = "http://types.montedepiedad.com.mx/Identity/Schemas/util_TYPES";
declare namespace ns0 = "http://types.montedepiedad.com.mx/Identity/Schemas/manageAppRoles_ELEMENTS";
declare namespace xf = "http://tempuri.org/Identity/Resources/XQ/TrGrantAppRolesResp/";

declare function xf:TrGrantAppRolesResp()
as element(ns0:grantAppRoleResponse) {
    <ns0:grantAppRoleResponse>
        <ns1:code>000</ns1:code>
        <ns1:description>El usuario ha sido asociado a la aplicación indicada.</ns1:description>
        <ns1:detail>El método ManageAppRoles.grantAppRoles se ha ejecutado de manera exitosa.</ns1:detail>
    </ns0:grantAppRoleResponse>
};


xf:TrGrantAppRolesResp()