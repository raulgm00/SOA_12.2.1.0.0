package monte.ws.catalogos;

import catalogomidaswsdl.CatalogoMidasBindingQSService;
import catalogomidaswsdl.GetCatalogoFault;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;

import javax.xml.ws.WebServiceFeature;

import mx.com.montedepiedad.servicios.nmp.schema.nmpcatmidas.ElementoCatalogoType;
import mx.com.montedepiedad.servicios.nmp.schema.nmpcatmidassvc.GetCatalogosRequestType;
import mx.com.montedepiedad.servicios.nmp.schema.nmpcatmidassvc.GetCatalogosResponseType;

public class ConcentradoraCatalogoWS {
    
    private static GetCatalogosRequestType crt;
    private static CatalogoMidasBindingQSService var;
    private static GetCatalogosResponseType respuestacatalogo;
    
    
    public ConcentradoraCatalogoWS() {
        super();
        var = new CatalogoMidasBindingQSService();
        crt = new GetCatalogosRequestType();
        respuestacatalogo = new GetCatalogosResponseType();
    }
    
    //----------------Catalo Factores-------------------------------------------------------------------------------------
    public ListIterator getCatFactor (long tipoP){
        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        //System.out.println("+----------------------Seccion Catalogo Factor----------------------+");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) { 
            System.out.println("E:"+e+"");
        }
        //System.out.println("res= "+respuestacatalogo+""); 
        //imprimeCatalogo("Factor");
        // catalogo fuentes
        return respuestacatalogo.getCatFactor().getElementoCatalogo().listIterator();
    }
    //---------Catalogo Fuentes---------------------------------------------------------------------------------------------
    public ListIterator getCatFuentes (long tipoP){

        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        ListIterator res ;
        //System.out.println("+----------------------Seccion Catalogos Fuentes----------------------+");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) {
          System.out.println("E:"+e+"");  
        }
            //System.out.println("res= "+respuestacatalogo+"");
            //imprimeCatalogo("Fuente");
            return respuestacatalogo.getCatFuente().getElementoCatalogo().listIterator();  
        
    }
    //-------Catalogo Ramo----------------------------------------------------------------------------------------------
    public ListIterator getCatRamo(long tipoP){
        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        //System.out.println("+----------------------Seccion Catalogo Ramo----------------------+");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) {  
            System.out.println("E:"+e+""); 
        }
        //System.out.println("res= "+respuestacatalogo+""); 
        //imprimeCatalogo("Ramo");
        // catalogo fuentes
        return respuestacatalogo.getCatRamo().getElementoCatalogo().listIterator();
    }
    //--------Catalogo CanalIngreso------------------------------------------------------------------------------------
    public ListIterator getCatCanalIngreso (long tipoP){

        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        //System.out.println("+----------------------Seccion Catalogo Canal Ingreso----------------------+");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) {
            System.out.println("E:"+e+"");              
        }
        
        //System.out.println("res= "+respuestacatalogo+""); 
        //imprimeCatalogo("CanalIngreso");
        // catalogo fuentes
        return respuestacatalogo.getCatCanalIngreso().getElementoCatalogo().listIterator();
        
    }
    //--------Catalogo Refrendos----------------------------------------------------------------------------------------
    public ListIterator getCatRefrendos(long tipoP){
        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        //System.out.println("+----------------------Seccion Catalogo Refrendos----------------------+");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) {   
            System.out.println("E:"+e+""); 
        }
        //System.out.println("res= "+respuestacatalogo+""); 
        //imprimeCatalogo("Refrendo");
        // catalogo fuentes
        return respuestacatalogo.getCatRefrendos().getElementoCatalogo().listIterator();
    }
    //------Catalogo EdoPrenda----------------------------------------
    public ListIterator getCatEdoPrenda (long tipoP){

        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        //System.out.println("+----------------------Seccion Catalogo EdoPrenda----------------------+");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) {
            System.out.println("E:"+e+"");  
        }
        
        //System.out.println("res= "+respuestacatalogo+"");
        //imprimeCatalogo("EdoPrenda");
        // catalogo fuentes
        return respuestacatalogo.getCatEdoPrenda().getElementoCatalogo().listIterator();
        
    }
    //--------Catalogo IngresoAlmoneda---------------------------------------------------------------------------------
    public ListIterator getCatIngresoAlmoneda (long tipoP){
        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        //System.out.println("+----------------------Seccion Catalogo Ingeso Almoneda----------------------+");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) { 
            System.out.println("E:"+e+"");
        }
        //System.out.println("res= "+respuestacatalogo+"");
        //imprimeCatalogo("IngresoAlmoneda");
        // catalogo fuentes
        return respuestacatalogo.getCatIngresoAlmoneda().getElementoCatalogo().listIterator();
    }
    //----Catalogo Sucursal--------------------------------------------------------------------------------------------
    public ListIterator getCatSucursal(long tipoP){
        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        //System.out.println("+----------------------Seccion Catalogo Sucursal----------------------+");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) {   
            System.out.println("E:"+e+""); 
        }
        //System.out.println("res= "+respuestacatalogo+""); 
        //imprimeCatalogo("Sucursal");
        // catalogo fuentes
        return respuestacatalogo.getCatSucursal().getElementoCatalogo().listIterator();
    }
    //-------catalogo Partida------------------------------------------------------------------------------------------
    public ListIterator getCatPartida (long tipoP){
        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        //System.out.println("+----------------------Seccion Catalogo Partida----------------------+");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) {   
            System.out.println("E:"+e+"");
        }
        //System.out.println("res= "+respuestacatalogo+""); 
        //imprimeCatalogo("NoPartida");
        // catalogo fuentes
        return respuestacatalogo.getCatPartida().getElementoCatalogo().listIterator();
    }
    //----Catalogo Canal de Venta --------------------------------------------------------------------------------------
    public ListIterator getCatCanalVenta(long tipoP){
        //System.out.println("Tipo de proyecto : "  + tipoP);
        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        //System.out.println("+----------------------Seccion Catalogo Canal de Venta----------------------+");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) { 
            System.out.println("E:"+e+""); 
        }
        //System.out.println("res= "+respuestacatalogo+""); 
        //imprimeCatalogo("CanalVenta");
        // catalogo fuentes
        //Modificar por el de canal de Venta
        return respuestacatalogo.getCatCanalVenta().getElementoCatalogo().listIterator();
    }
    
       
    //-----------------Ctalogo Expendio---------------------------------------------------------------------------------
    /*
        public ListIterator getCatExpendio (long tipoP){

        crt = new GetCatalogosRequestType();
        crt.setIdProyecto(tipoP);
        System.out.println("Seccion Catalogo Expendio");
        WebServiceFeature[] wfs = new WebServiceFeature[] {};
        respuestacatalogo = new GetCatalogosResponseType();
        var = new CatalogoMidasBindingQSService();
        try {
            respuestacatalogo = var.getCatalogoMidasBindingQSPort(wfs).getCatalogos(crt);
            
        } catch (GetCatalogoFault e) {
            System.out.println("E:"+e+"");    
        }
        
        System.out.println("res= "+respuestacatalogo+""); 
        // catalogo fuentes
        return respuestacatalogo.getCatExpendio().getElementoCatalogo().listIterator();
        
    }
    */
    public void imprimeCatalogo(String catalogo){
     
        System.out.println();
        ListIterator iterador = null;
        boolean elemento= false;
        
        if(catalogo.equals("Factor")){
            iterador = respuestacatalogo.getCatFactor().getElementoCatalogo().listIterator();
        }else if(catalogo.equals("Fuente")){
            iterador = respuestacatalogo.getCatFuente().getElementoCatalogo().listIterator();
        }else if(catalogo.equals("Ramo")){
            iterador = respuestacatalogo.getCatRamo().getElementoCatalogo().listIterator();
        }else if(catalogo.equals("CanalIngreso")){
            iterador = respuestacatalogo.getCatCanalIngreso().getElementoCatalogo().listIterator();
        }else if(catalogo.equals("Refrendo")){
            iterador = respuestacatalogo.getCatRefrendos().getElementoCatalogo().listIterator();
        }else if(catalogo.equals("EdoPrenda")){
            iterador = respuestacatalogo.getCatEdoPrenda().getElementoCatalogo().listIterator();
        }else if(catalogo.equals("IngresoAlmoneda")){
            iterador = respuestacatalogo.getCatIngresoAlmoneda().getElementoCatalogo().listIterator();
        }else if(catalogo.equals("Sucursal")){
            iterador =  respuestacatalogo.getCatSucursal().getElementoCatalogo().listIterator();
        }else if(catalogo.equals("NoPartida")){
            iterador = respuestacatalogo.getCatPartida().getElementoCatalogo().listIterator();
        }else if(catalogo.equals("CanalVenta")){
            iterador = respuestacatalogo.getCatCanalVenta().getElementoCatalogo().listIterator();
            //System.out.println("EWL iterador tiene valores = " + iterador.hasNext() );
            
            
        }
            
            ElementoCatalogoType rowlist = new ElementoCatalogoType();
            
            //iterador.nextIndex();
            System.out.println("Valores :");
            while(iterador.hasNext()) {
                      rowlist = (ElementoCatalogoType)iterador.next();  
                      Iterator itElCatItem = rowlist.getDescripcionAndIdAndValor().iterator();  
                      System.out.println(  "Item>>" + itElCatItem.getClass() + "--"+ itElCatItem );
                while(itElCatItem.hasNext()){
                    javax.xml.bind.JAXBElement jaxbItem = (javax.xml.bind.JAXBElement)itElCatItem.next();
                    System.out.println("Interm <"+ jaxbItem.getName().getLocalPart()  + "><" + jaxbItem.getValue()+">" );
                    }
                elemento = true;
                }
            
            if(!elemento){ System.out.println("El "+ catalogo + " esta vacio");}
            
        }

}

