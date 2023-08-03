package com.soaint.content.common;

public class ConstantesComunes {
        
    //Invocacion servicios    
    public static final String RESPUESTA_EXITOSA = "0";
    public static final String RESPUESTA_FALLIDA ="-1";    
    public static final String RESPUESTA_FALLIDA_TEMP ="1";    
        
    //Cuentas contables
    public static final String CUENTA_IVA = "1633010030000";
    public static final String CUENTA_RETENCION_IVA = "2605120000000";
    public static final String CUENTA_RETENCION_ISR = "2605030000000";    
        
    //Tipos de solicitud    
    public static final String SOLICITUD_PAGO_SERVICIOS_ID = "1";
    public static final String SOLICITUD_VIATICOS_ID = "2";
    public static final String SOLICITUD_REEMBOLSO_ID = "3";
    
    
    //Sub tipos de documentos
    public static final String CONTANCIA_RESIDENCIA_FISCAL_ID = "PA01";
    public static final String CONTANCIA_RESIDENCIA_FISCAL_TIPO_DOCUMENTO= "QSID";
    public static final String CONTANCIA_RESIDENCIA_FISCAL_NOMBRE = "Constancia de Residencia Fiscal";
    public static final String FACTURA_ELECTRONICA_ID = "LE73";
    public static final String FACTURA_ELECTRONICA_TIPO_DOCUMENTO= "QSFA";
    public static final String FACTURA_ELECTRONICA_NOMBRE = "Factura Electr�nica";
    public static final String CONTRATO_ID = "XP04";
    public static final String CONTRATO_TIPO_DOCUMENTO= "QSLG";
    public static final String CONTRATO_NOMBRE = "Contrato";
    public static final String ANEXO_CONTRATO_ID = "PA02";
    public static final String ANEXO_CONTRATO_TIPO_DOCUMENTO="QSLG";
    public static final String ANEXO_CONTRATO_NOMBRE = "Anexo de contrato";
    public static final String COMPROBANTE_PAGO_ID = "PA03";
    public static final String COMPROBANTE_PAGO_TIPO_DOCUMENTO="QSCM";
    public static final String COMPROBANTE_PAGO_NOMBRE = "Comprobante de Pago";
        
    //Nacionalidad
    public static final String NACIONALIDAD_NACIONAL_ID = "1";
    public static final String NACIONALIDAD_NACIONAL_NOMBRE = "Mexicana";
    public static final String NACIONALIDAD_EXTRANJERA_ID = "2";
    public static final String NACIONALIDAD_EXTRANJERA_NOMBRE = "Extranjera";
    
    //Tipo de servicio
    public static final String TIPO_SERVICIO_SERVICIO_PROYECTO_ID = "3";
    public static final String TIPO_SERVICIO_SERVICIO_PROYECTO_NOMBRE = "GASTO DE SERVICIO POR PROYECTO";
    public static final String TIPO_SERVICIO_OPERACIONES_ID = "2";
    public static final String TIPO_SERVICIO_OPERACIONES_NOMBRE = "OPERACIONES";
    public static final String TIPO_SERVICIO_GASTO_FIJO_ID = "1";
    public static final String TIPO_SERVICIO_GASTO_FIJO_NOMBRE = "GASTOS FIJOS";


    //Condicion de pago
    public static final String CONDICIONES_PAGO_PARCIALIDAD_ID = "2";
    public static final String CONDICIONES_PAGO_PARCIALIDAD_NOMBRE = "Parcialidades";
    public static final String CONDICIONES_PAGO_EXHIBICION_ID = "1";
    public static final String CONDICIONES_PAGO_EXHIBICION_NOMBRE = "Una sola exhibici�n";
        
         //Tipos de moneda
    public static final String DOLARES_ID = "USD";
    public static final String DOLARES_ID_BD = "2";
    public static final String DOLARES_NOMBRE = "D�lares";
    public static final String PESOS_MEXICANOS_ID = "MXN";
    public static final String PESOS_MEXICANOS_ID_BD = "1";
    public static final String PESOS_MEXICANOS_NOMBRE = "Pesos Mexicanos";
    
    // descServList
    public static final String LUZ_ID = "1";
    public static final String LUZ_NOMBRE = "LUZ";
    public static final String AGUA_ID = "2";
    public static final String AGUA_NOMBRE = "AGUA";
    public static final String TELEFONO_ID = "3";
    public static final String TELEFONO_NOMBRE = "TELEFONO";
    public static final String PREDIAL_ID = "4";
    public static final String PREDIAL_NOMBRE = "PREDIAL";
    public static final String RENTA_ID = "5";
    public static final String RENTA_NOMBRE = "RENTA";
    public static final String GAS_ID = "6";
    public static final String GAS_NOMBRE = "GAS";
    public static final String LIMPIEZA_ID = "7";
    public static final String LIMPIEZA_NOMBRE = "LIMPIEZA";
    public static final String MENSAJERIA_ID = "8";
    public static final String MENSAJERIA_NOMBRE = "MENSAJERIA";
    public static final String VIGILANCIA_ID = "9";
    public static final String VIGILANCIA_NOMBRE = "VIGILANCIA";
    
    //solicitud validada
    public static final String VALIDADA_RECHAZAR_ID = "1";
    public static final String VALIDADA_RECHAZAR_NOMBRE = "Rechazar";
    public static final String VALIDADA_AUTORIZAR_ID = "2";
    public static final String VALIDADA_AUTORIZAR_NOMBRE = "Autorizar";
    
    //motivo
    public static final String MOTIVO_INFORMACION_ERRONEA_ID = "1";
    public static final String MOTIVO_INFORMACION_ERRONEA_NOMBRE = "Informaci�n Erronea";
    public static final String MOTIVO_CENTROCOSTOS_ERRONEO_ID = "2";
    public static final String MOTIVO_CENTROCOSTOS_ERRONEO_NOMBRE = "Centro de Costos Erroneo";
    public static final String MOTIVO_DOCUMENTO_INCORRECTO_ID = "3";
    public static final String MOTIVO_DOCUMENTO_INCORRECTO_NOMBRE = "Documento Incorrecto";
    public static final String MOTIVO_IMPORTE_ERRONEO_ID = "4";
    public static final String MOTIVO_IMPORTE_ERRONEO_NOMBRE = "Importe Erroneo";
    
    //estado solicitud
    public static final String ESTADO_NUEVA_SOLICITUD_ID= "1";
    public static final String ESTADO_CANCELADA_POR_USUARIO_ID= "2";
    public static final String ESTADO_PENDIENTE_APROBACION_ID= "3";
    public static final String ESTADO_RECHAZADA_ID= "4";
    public static final String ESTADO_CANCELADA_POR_TIEMPO_ID= "5";
    public static final String ESTADO_EN_VERIFICACION_ID= "6";
    public static final String ESTADO_RECHAZADA_POR_APROBADOR_ID= "7";
    public static final String ESTADO_PENDIENTE_CONTABILIDAD_ID= "8";
    public static final String ESTADO_ASIGNACION_CUENTA_CONTABLE_ID= "9";
    public static final String ESTADO_PENDIENTE_PAGO_ID= "10";
    public static final String ESTADO_CANCELADA_TESORERIA_ID= "11";
    public static final String ESTADO_ORDEN_PAGO_PAGADA_ID= "12";
    
    //estado proyectos
    public static final String ESTADO_PROYECTO_PAGADO_ID= "13";
    public static final String ESTADO_PROYECTO_PAGADO_NOMBRE= "PROYECTO PAGADO";
    public static final String ESTADO_PROYECTO_PAGADO_EN_PARCIALIDADES_ID= "14";
    public static final String ESTADO_PROYECTO_PAGADO_EN_PARCIALIDADES_NOMBRE= "PAGO EN PARCIALIDADES";
    
    //Tipo de Operacion
    public static final Integer TIPO_OPERACION_ACTUALIZAR_ID= 1;
    public static final Integer TIPO_OPERACION_ELIMINAR_ID= 2;
    
    public static final String CLAVE_PROVEEDOR = "claveProveedor";
    public static final String STATUS = "Status";
    public static final String DESC_PROVEEDOR = "descProveedor";
    public static final String RFC = "rfc";
    public static final String CLAVE_ESTADO = "claveEstado";
    public static final String DESC_TIPO_PERSONA = "descTipoPersona";
    public static final String TIPO_PERSONA = "tipoPersona";

    public static final String PARAMETRO_CAMPO_CLAVEPROVEEDOR = "claveProveedor";
    public static final String PARAMETRO_OPERADOR_IGUAL = "=";

    public static final String TIPO_SERVICIO_ID = "GPA010";
    public static final String TIPO_SERVICIO_DESCRIPCION = "Tipo de Servicios";
    public static final String TIPO_SOLICITUDES_ID = "GPA011";
    public static final String TIPO_SOLICITUDES_DESCRIPCION = "Tipo de Solicitudes";
    public static final String DESCRIPCION_SERVICIO_ID = "GPA012";
    public static final String DESCRIPCION_SERVICIO_DESCRIPCION = "Sub Tipo de Servicios";

    public static final Integer ID_ESTADO_SOLICITUD_CANCELADA = 2;
    
    //solicitud validada
    public static final String CUENTA_RECHAZAR_ID = "2";
    public static final String CUENTA_AUTORIZAR_ID = "1";

    public static final Integer SERVICIO_TIMEOUT = 30000;
    public static final Integer UCM_TIMEOUT = 30000;
    
    public static final String PREFIJO_GASTO_FIJO = "GF";
    
    private static final String DATE_FORMAT_DD_MM_YYYY = "dd/MM/yyyy";
    private static final String DATE_FORMAT_DD_MM_YYYY_HH_mm = "dd/MM/yyyy HH:mm";
    private static final String DATE_FORMAT_YYYYMMDD = "YYYYMMDD";
    private static String BundlePath = "qualitas.pagosAdministrativos.bundle.qualitas_bundle_es";
    
    public static String getDATE_FORMAT_DD_MM_YYYY(){
        return DATE_FORMAT_DD_MM_YYYY;
    }
    
    public static String getDATE_FORMAT_DD_MM_YYYY_HH_mm(){
        return DATE_FORMAT_DD_MM_YYYY_HH_mm;
    }
    
    public static String getDATE_FORMAT_YYYYMMDD(){
        return DATE_FORMAT_YYYYMMDD;
    }
    
    public static void setBundlePath(String BundlePath) {
        ConstantesComunes.BundlePath = BundlePath;
    }

    public static String getBundlePath() {
        return BundlePath;
    }
    
    private ConstantesComunes() {
        super();
    }    
}
