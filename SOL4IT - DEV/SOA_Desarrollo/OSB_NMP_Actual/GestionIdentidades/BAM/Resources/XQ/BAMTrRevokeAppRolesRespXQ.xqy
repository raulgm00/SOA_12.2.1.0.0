xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:revokeAppRoleResponse" location="../XSD/manageAppRoles_ELEMENTS.xsd" ::)

declare namespace ns1 = "http://types.montedepiedad.com.mx/Identity/Schemas/util_TYPES";
declare namespace ns0 = "http://types.montedepiedad.com.mx/Identity/Schemas/manageAppRoles_ELEMENTS";
declare namespace xf = "http://tempuri.org/Identity/Resources/XQ/TrRevokeAppRolesResp/";

declare function xf:TrRevokeAppRolesResp()
as element(ns0:revokeAppRoleResponse) {
    <ns0:revokeAppRoleResponse>
        <ns1:code>000</ns1:code>
        <ns1:description>El usuario ha sido eliminado de la aplicación indicada.</ns1:description>
        <ns1:detail>El método ManageAppRoles.revokeAppRoles se ha ejecutado de manera exitosa.</ns1:detail>
    </ns0:revokeAppRoleResponse>
};


xf:TrRevokeAppRolesResp()