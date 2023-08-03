xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://servicios.montedepiedad.com.mx/NMP/NSchema/NMPIdentidades";
(:: import schema at "../Schemas/OAMPerfilesRestNXSD.xsd" ::)
declare namespace ns2="http://servicios.montedepiedad.com.mx/NMP/Schema/NMPIdentidades";
(:: import schema at "../Schemas/NMPGestionIdentidades.xsd" ::)

declare variable $getGrantedRolesToUserRes as element() (:: schema-element(ns1:PerfilResponse) ::) external;
declare variable $obtenerRolesAutorizadosReq as element() (:: schema-element(ns2:ObtenerRolesAutorizadosRequest) ::) external;

declare function local:convert($getGrantedRolesToUserRes as element() (:: schema-element(ns1:PerfilResponse) ::), $obtenerRolesAutorizadosReq as element() (:: schema-element(ns2:ObtenerRolesAutorizadosRequest) ::)) as element() (:: schema-element(ns2:ObtenerRolesAutorizadosResponse) ::) {
    <ns2:ObtenerRolesAutorizadosResponse>
        <ns2:roles>
          { for $memberOf in local:generateRoles($getGrantedRolesToUserRes)/ns1:rol
            where $memberOf/ns1:attribute/ns1:name = 'OU' and $memberOf/ns1:attribute/ns1:value = $obtenerRolesAutorizadosReq/ns2:nombreAplicacion
            return
            <ns2:rol>                
             <ns2:nombre> {$memberOf/ns1:attribute[contains(*:name,'CN')]/ns1:value/text()}</ns2:nombre>
              <ns2:descripcion> {$memberOf/ns1:attribute[contains(*:name,'CN')]/ns1:value/text()}</ns2:descripcion>
            </ns2:rol>
            }
        </ns2:roles>
    </ns2:ObtenerRolesAutorizadosResponse>
};

declare function local:generateRoles($getGrantedRolesToUserRes as element() (:: schema-element(ns1:PerfilResponse) ::)) as element() (:: schema-element(ns1:Roles) ::) {
    <ns1:Roles>      
          { for $memeberOf in $getGrantedRolesToUserRes/ns1:memberof
            return
            <ns1:rol>                
                {for $att in tokenize($memeberOf,',')
                return
                <ns1:attribute>     
                  <ns1:name>{tokenize($att,'=')[1]}</ns1:name>
                  <ns1:value>{tokenize($att,'=')[2]}</ns1:value>                  
                </ns1:attribute>
                }   
            </ns1:rol>
            }
    </ns1:Roles>      
};


local:convert($getGrantedRolesToUserRes,$obtenerRolesAutorizadosReq )