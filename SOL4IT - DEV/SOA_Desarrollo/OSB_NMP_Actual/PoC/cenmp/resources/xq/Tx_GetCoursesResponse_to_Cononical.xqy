xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$o" element="o" location="../xsd/wsObtenerOfertaCurso.xsd" ::)
(:: pragma bea:global-element-return element="ns0:GetCoursesResponseIM" location="../xsd/Messages.xsd" ::)

declare namespace ns0 = "http://nmp.com/CommonDataModel/1.0/Common";
declare namespace xf = "http://tempuri.org/cenmp/resources/xq/Tx_GetCoursesResponse_to_Cononical/";

declare function xf:Tx_GetCoursesResponse_to_Cononical($o as element(o))
    as element(ns0:GetCoursesResponseIM) {
        <ns0:GetCoursesResponseIM>
            <ns0:ResultNotification>
                <ns0:Code>
                    {
                        if (fn:boolean(data($o/estatus))) then
                            ('OK')
                        else 
                            'ERROR'
                    }
</ns0:Code>
                <ns0:Description>{ data($o/mensaje) }</ns0:Description>
            </ns0:ResultNotification>
            <ns0:ListOfCourse>
                {
                    for $e in $o/datos/e
                    return
                        <ns0:Course>
                            <ns0:Center>
                                <ns0:ID>{ data($e/centro_id) }</ns0:ID>
                                <ns0:Name>{ data($e/centro) }</ns0:Name>
                            </ns0:Center>
                            <ns0:Group>
                                <ns0:ID>{ data($e/grupo_id) }</ns0:ID>
                                <ns0:Code>{ data($e/clave_grupo) }</ns0:Code>
                            </ns0:Group>
                            <ns0:Course>
                                <ns0:ID>{ data($e/curso_id) }</ns0:ID>
                                <ns0:Code>{ data($e/clave_curso) }</ns0:Code>
                                <ns0:Category>{ data($e/categoria_curso) }</ns0:Category>
                                <ns0:Name>{ data($e/curso) }</ns0:Name>
                                <ns0:Description>{ data($e/descripcion) }</ns0:Description>
                            </ns0:Course>
                            <ns0:Classroom>{ data($e/aula) }</ns0:Classroom>
                            <ns0:MaxQuota>{ data($e/cupo_total) }</ns0:MaxQuota>
                            <ns0:ActualQuota>{ data($e/cupo_actual) }</ns0:ActualQuota>
                            <ns0:TotalDuration>{ data($e/duracion_total_horas) }</ns0:TotalDuration>
                            <ns0:EndDate>{ data($e/fecha_final) }</ns0:EndDate>
                            <ns0:EndDateSubscription>{ data($e/fecha_final_inscripcion) }</ns0:EndDateSubscription>
                            <ns0:StartDate>{ data($e/fecha_inicio) }</ns0:StartDate>
                            <ns0:StartDateSubscription>{ data($e/fecha_inicio_inscripcion) }</ns0:StartDateSubscription>
                            <ns0:CreatedBy>{ data($e/insitucion_creadora) }</ns0:CreatedBy>
                            <ns0:Profile>{ data($e/perfil) }</ns0:Profile>
                            <ns0:Serial>{ data($e/seriado) }</ns0:Serial>
                        </ns0:Course>
                }
            </ns0:ListOfCourse>
        </ns0:GetCoursesResponseIM>
};

declare variable $o as element(o) external;

xf:Tx_GetCoursesResponse_to_Cononical($o)