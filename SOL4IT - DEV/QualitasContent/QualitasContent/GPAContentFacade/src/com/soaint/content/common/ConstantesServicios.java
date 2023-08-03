package com.soaint.content.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import java.util.Properties;
import java.util.ResourceBundle;
import java.util.logging.Logger;

public class ConstantesServicios {
    
    private static final Logger LOGGER = Logger.getLogger(ConstantesServicios.class.getName());    
    private static final String END_POINT = "config/qualitas/constantes.properties";
    private static final boolean GET_LOCAL_FILE = true;
    
    // end point serviciol
    public static final String PRESTADOR_END_POINT_KEY = "prestador.endpoint";
    public static final String OFICINA_END_POINT_KEY = "oficina.endpoint";
    public static final String EMPLEADO_END_POINT_KEY = "empleado.endpoint";
    public static final String SERVICIO_END_POINT_KEY = "servicio.endpoint";
    public static final String ACTUALIZAR_SERVICIO_END_POINT_KEY = "actualizarServicio.endpoint";
    public static final String CENTRO_COSTO_END_POINT_KEY = "centrocosto.endpoint";
    public static final String CENTROS_COSTOS_END_POINT_KEY = "centroscostos.endpoint";
    public static final String CREAR_SOLICITUD_END_POINT_KEY = "solicitud.endpoint";
    public static final String CANCELAR_SOLICITUD_END_POINT_KEY = "cancelarSolicitud.endpoint";
    public static final String GUARDAR_SOLICITUD_END_POINT_KEY = "guardarSolicitud.endpoint";
    public static final String GENERICO_END_POINT_KEY = "generico.endpoint";
    public static final String VALIDAR_NACIONALIDAD_END_POINT_KEY = "validar.nacionalidad.endpoint";
    public static final String DETALLE_SOLICITUD_END_POINT_KEY = "detalleSolicitud.endpoint";
    public static final String SERVICIOS_PRESTADOR_END_POINT_KEY  = "serviciosPrestador.endpoint";
    public static final String VALIDAR_OFICINAS_END_POINT_KEY  = "validarOficinas.endpoint";
    public static final String PRORRATEO_END_POINT_KEY  = "prorrateo.endpoint";
    
    public static final String RECEPCION_CFDI_SERVICE_END_POINT_KEY = "recepcionCFDI.endpoint";
    public static final String UCM_CHECKIN_SERVICE_END_POINT_KEY = "ucm_checkIn.endpoint";
    public static final String UCM_SEARCH_SERVICE_END_POINT_KEY = "ucm_search.endpoint";
    public static final String UCM_GETFILE_SERVICE_END_POINT_KEY = "ucm_getFile.endpoint";
    public static final String UCM_DELETEFILE_SERVICE_END_POINT_KEY = "ucm_deleteFile.endpoint";
    public static final String ASIGNAR_CUENTAS_CONTABLES_END_POINT_KEY = "asignarCuentasContables.endpoint";
    
    /**
     * 
     */
    private  ConstantesServicios() {
        super();
    }

    /**
     *
     * @param key
     * @return
     * @throws ConstantKeyNotFoundException
     */
    public static String getConstanteByName(String key)  throws Exception{

        Properties prop = new Properties();
        InputStream input = null;
        String value = "";

        try {
            if(GET_LOCAL_FILE){
                ResourceBundle inputProp = ResourceBundle.getBundle("constantes");
                value = inputProp.getString(key);
            }else{
                input = new FileInputStream(END_POINT);
                prop.load(input);
                value = prop.getProperty(key);
            }
            
          //  if(CommonJava.isEmpty(value))
            //    throw new ConstantKeyNotFoundException(key, new Exception("Key not found !!!"));
            
            return value;
        } 
        catch (FileNotFoundException enf)
        {
         //   LOGGER.severe(enf);
         enf.printStackTrace();
            new File(END_POINT);
            
            throw new Exception("Key not found !!!");
        }
        catch (IOException ex) {
        //    LOGGER.severe(ex);
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                 //   LOGGER.severe(e);
                }
            }
        }

        return "";
    }
}
