package beans;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import java.util.Properties;

public class PropertiesLoader {
    /* ===============  VARIABLES   =================*/ 
   private Properties properties;
    //     private static String pathProp;
    
    // LINUX: DEV
    
    /*private String pathPropCat="/u01/12c/Middleware/user_projects/domains/soa_domain/config/ADFProperties/ConcentradoraCatalogos.properties";
    private String pathPropEnv="/u01/12c/Middleware/user_projects/domains/soa_domain/config/ADFProperties/ConcentradoraEnvioCriterios.properties";
    */
   
   //LINUX : TEST & DR
   
   /*private String pathPropCat="/u01/oracle/Middleware12c/user_projects/domains/soa_domain/config/ADFProperties/ConcentradoraCatalogos.properties";
   private String pathPropEnv="/u01/oracle/Middleware12c/user_projects/domains/soa_domain/config/ADFProperties/ConcentradoraEnvioCriterios.properties";
   */
   //LINUX : PROD
   /*
   private String pathPropCat="/u01/app/oracle/product/Middleware12c/user_projects/domains/soa_domain/config/ADFProperties/ConcentradoraCatalogos.properties";
   private String pathPropEnv="/u01/app/oracle/product/Middleware12c/user_projects/domains/soa_domain/config/ADFProperties/ConcentradoraEnvioCriterios.properties";
   */
   
    
    // WINDOWS PRUEBAS LOCALES
    
    private String pathPropCat="C:/properties/Concentradora/configConcentradoraCat.properties";
    private String pathPropEnv="C:/properties/Concentradora/configConcentradoraEnvio.properties";
    
    
    private String pathGen = "";
    
    /* ===============  METHODES   =================*/
    public PropertiesLoader() {
        super();
    }
    
    public void loadProperties(String tipo) { 
           //String pathProp="";
           try {
               //if (properties==null){
                 //  pathProp=System.getProperty("telcel.properties")+"configIntranet.properties";
                  // pathProp="c:/properties/configIntranet.properties";
               
               if(tipo.equals("Cat")){
                   System.out.println("Cargando el archivo properties==>"+pathPropCat);
                   pathGen =pathPropCat;
               }else{
                   System.out.println("Cargando el archivo properties==>"+pathPropEnv);
                   pathGen = pathPropEnv;
               }
                   
                   properties = new Properties();
                   InputStream is= new FileInputStream(pathGen);
                   properties.load(is);
               //}
           } catch (FileNotFoundException e) {
               System.out.println("Error FileInputStream - loadProperties=>"+ pathGen +  e.getMessage());
           } catch (Exception ex) {
               System.out.println("Error Exception - loadProperties =>"+ pathGen + ex.getMessage());
           }finally{
                   
           }
       }
       
       /*
        * 
        * 
        */
       public String getValor(String name, String tipo){
           if (properties==null)
               loadProperties(tipo);
           return (String)properties.get(name);
       }

}
