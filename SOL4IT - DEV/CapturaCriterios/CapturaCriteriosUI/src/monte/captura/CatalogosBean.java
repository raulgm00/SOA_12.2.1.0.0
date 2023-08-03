package monte.captura;

import java.io.IOException;
import java.io.Serializable;

import java.net.MalformedURLException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;

import javax.naming.Context;
import javax.naming.InitialContext;

import javax.sql.DataSource;

import monte.ws.catalogos.ConcentradoraCatalogoWS;
import monte.ws.catalogos.ConcentradoraSubCatalogoWS;

import mx.com.montedepiedad.servicios.nmp.schema.nmpcatmidas.ElementoCatalogoType;

import otn.utilitarios.ADFUtil;
import otn.utilitarios.JSFUtils;
//--DB-----
//--------

public class CatalogosBean implements Serializable {


    int tipoP = 0;
    List<SelectItem> listEtapa;
    List<SelectItem> listCatalogoFactor;
    List<SelectItem> listCatalogoFuentes;
    List<SelectItem> listCatalogoRamo;
    List<SelectItem> listCatalogoSubRamo;
    List<SelectItem> listCatalogoCanalIngreso;
    List<SelectItem> listCatalogoRefrendos;
    List<SelectItem> listCatalogoEdoPrenda;
    List<SelectItem> listCatalogoIngresoAlmoneda;
    List<SelectItem> listCatalogoSucursal;
    List<SelectItem> listCatalogoExpendio;
    List<SelectItem> listCatalogoPartida;
    List<SelectItem> listCatalogoCanalVenta;
    


    public CatalogosBean() {
        super();
        iniciarCatalogos();
    }
    
    private void iniciarCatalogos(){
        
        //ADFUtil.setEL("#{bindings.Proyecto.inputValue}",null );
        
        if(ADFUtil.evaluateEL("#{bindings.Proyecto.inputValue}") != null ){
            tipoP = (Integer) ADFUtil.evaluateEL("#{bindings.Proyecto.inputValue}") ;
            //int pageFlow = Integer.parseInt( ADFUtil.evaluateEL("#{pageFlowScope.p_tipoP}").toString() );
           // System.out.println("pageFlow = " + pageFlow );
            //System.out.println("CtalogosBean tipoP = " + tipoP);
            //tipoP = 1;
            cargarCatalogosListas();
            populateEtapa();
            repoblarSubRyExp();
        }else{
            JSFUtils.addErrorMessage("Error al recuperar datos del servicio: Ponte en contacto con tu Administrador");
            //System.out.println("IniciarCatalogos - Error al recuperar datos del servicio: Ponte en contacto con tu Administrador");
        }
        
    }
    
    private void cargarCatalogosListas() {
        //System.out.println("Inicia Cargar CatalogosBean");
        //System.out.println("cargarCatalogosListas  Tipo de proyecto = " + tipoP );
        //inicializar listas
        //System.out.println("Carga de catalogos en proceso");
        ConcentradoraCatalogoWS concentradoraWS = new ConcentradoraCatalogoWS();
        ListIterator iterador;
        boolean ban = true;
        String mensaje = "";

        try {
            //Factor
            listCatalogoFactor = new ArrayList<SelectItem>();
            iterador = concentradoraWS.getCatFactor(tipoP);
            cargarLista(iterador, "listCatalogoFactor");
            //Fuentes
            listCatalogoFuentes = new ArrayList<SelectItem>();
            iterador = concentradoraWS.getCatFuentes(tipoP);
            cargarLista(iterador, "listCatalogoFuentes");
            //Ramo
            listCatalogoRamo = new ArrayList<SelectItem>();
            iterador = concentradoraWS.getCatRamo(tipoP);
            cargarLista(iterador, "listCatalogoRamo");
            //Canal Ingreso
            listCatalogoCanalIngreso = new ArrayList<SelectItem>();
            iterador = concentradoraWS.getCatCanalIngreso(tipoP);
            cargarLista(iterador, "listCatalogoCanalIngreso");
            //Edo Prenda
            listCatalogoEdoPrenda = new ArrayList<SelectItem>();
            
            //Start Defect : Ambos tipo d eproyecto traen el nodo : EdoPrenda
            //if (tipoP != 2) {
            iterador = concentradoraWS.getCatEdoPrenda(tipoP);
            cargarLista(iterador, "listCatalogoEdoPrenda");
            //}
            
            
            //Sucursal
            listCatalogoSucursal = new ArrayList<SelectItem>();
            iterador = concentradoraWS.getCatSucursal(tipoP);
            cargarLista(iterador, "listCatalogoSucursal");
            //Canal de venta
            listCatalogoCanalVenta = new ArrayList<SelectItem>();
            
            //StartDefect : Vamos por el tipo de canal para ambos nodos, siendo que el proyecto Concentradora no gace uso de el
            //if (tipoP != 1) {
                //System.out.println("Carga de catalogos Canal de venta");
                iterador = concentradoraWS.getCatCanalVenta(2);
                cargarLista(iterador, "listCatalogoCanalVenta");
            //}

        } catch (NullPointerException e) {
            JSFUtils.addErrorMessage("Error al recuperar datos del servicio : Ponte en contacto con tu Adminitrador");

        }
        
        
    }

    private void cargarLista (ListIterator iterador , String nombrelista){
        
        //System.out.println("Nombre lista = "+ nombrelista);
        ElementoCatalogoType rowlist = new ElementoCatalogoType();
        rowlist = new ElementoCatalogoType();
        SelectItem itemRegion = null;
        if(iterador != null){
                String clabel=null;    
                while(iterador.hasNext()) 
                {
                    rowlist = (ElementoCatalogoType)iterador.next();  
                    Iterator itElCatItem = rowlist.getDescripcionAndIdAndValor().iterator();                 
                    itemRegion = new SelectItem();
                    
                    while(itElCatItem.hasNext())
                    {
                    javax.xml.bind.JAXBElement jaxbItem = (javax.xml.bind.JAXBElement)itElCatItem.next();
                        //ID valor que se asigna el VO para todos
                        if (jaxbItem.getName().getLocalPart().equals("id")){
                            itemRegion.setValue(jaxbItem.getValue().toString().trim());
                            /*if(nombrelista.equals("listCatalogoCanalVenta"))
                                itemRegion.setValue("1");*/
                         
                        }
                        
                        if(nombrelista.equalsIgnoreCase("listCatalogoFuentes")){
                           if (jaxbItem.getName().getLocalPart().equals("descripcion")){   
                                itemRegion.setLabel(jaxbItem.getValue().toString().trim());
                             }
                           
                        }else{
                            
                            if (jaxbItem.getName().getLocalPart().equals("descripcion")){ 
                                        clabel=jaxbItem.getValue().toString().trim();
                                        /*if(nombrelista.equals("listCatalogoCanalVenta"))
                                             clabel=" HolaMundo ";*/
                               
                            }
                            if (jaxbItem.getName().getLocalPart().equals("valor")){ 
                                        itemRegion.setLabel(jaxbItem.getValue().toString().trim()+" "+clabel);
                                        /*if(nombrelista.equals("listCatalogoCanalVenta"))
                                            itemRegion.setLabel(" Test ");*/
                            }
                        }
                             
                    }
                    
                    
                    if (nombrelista.equalsIgnoreCase("listCatalogoFactor")){
                        this.listCatalogoFactor.add(itemRegion);   
                    }
                    if (nombrelista.equalsIgnoreCase("listCatalogoFuentes")){
                        this.listCatalogoFuentes.add(itemRegion);   
                    }
                    if (nombrelista.equalsIgnoreCase("listCatalogoRamo")){
                        this.listCatalogoRamo.add(itemRegion);   
                    }
                    if (nombrelista.equalsIgnoreCase("listCatalogoCanalIngreso")){
                        this.listCatalogoCanalIngreso.add(itemRegion);   
                    }
                    if (nombrelista.equalsIgnoreCase("listCatalogoRefrendos")){
                        this.listCatalogoRefrendos.add(itemRegion);   
                    }
                    if (nombrelista.equalsIgnoreCase("listCatalogoEdoPrenda")){
                        this.listCatalogoEdoPrenda.add(itemRegion);
                    }
                    if (nombrelista.equalsIgnoreCase("listCatalogoIngresoAlmoneda")){
                        this.listCatalogoIngresoAlmoneda.add(itemRegion);   
                    }
                    if (nombrelista.equalsIgnoreCase("listCatalogoSucursal")){
                        this.listCatalogoSucursal.add(itemRegion);   
                    }
                    /*
                    if (nombrelista.equalsIgnoreCase("listCatalogoExpendio")){
                        this.listCatalogoExpendio.add(itemRegion);   
                    }
                    */
                    if (nombrelista.equalsIgnoreCase("listCatalogoPartida")){
                        this.listCatalogoPartida.add(itemRegion);   
                    }
                    
                    if (nombrelista.equalsIgnoreCase("listCatalogoCanalVenta")){
                        this.listCatalogoCanalVenta.add(itemRegion);   
                    }
                    
                }
         } 
        

        
    }

    public void changeRamo(ValueChangeEvent valueChangeEvent) {
        listCatalogoSubRamo= new ArrayList<SelectItem>();
        String ramoId = null;
        //Sentencia que hace referecnia a los valores del campo a utilizar
        valueChangeEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());
        if(ADFUtil.evaluateEL("#{bindings.Ramo.inputValue}") != null){
           ramoId =(String)ADFUtil.evaluateEL("#{bindings.Ramo.inputValue}");       
        }else{
            System.out.println("El ramo del combo no esta disponible");
        }
        //System.out.println("Change ramoId :" +ramoId+"");        
        ConcentradoraSubCatalogoWS concentradoraWS = new ConcentradoraSubCatalogoWS();
        ArrayList<ItemBean> listItem ;
        SelectItem itemCombo = null;
        if(ramoId!=null){
        try {
            
            listItem= concentradoraWS.getSubCatalogo(ramoId,"subramo",tipoP);
            ItemBean beanItem = new ItemBean();
            Iterator<ItemBean> itemIterator = listItem.iterator();
            while(itemIterator.hasNext()){
                beanItem = (ItemBean)itemIterator.next();
                itemCombo = new SelectItem();
                itemCombo.setLabel(beanItem.getEtiqueta());
                itemCombo.setValue(beanItem.getIndice());
            
                listCatalogoSubRamo.add(itemCombo);
                
            }
        
        } catch (MalformedURLException e) {
            System.out.println("1"+e);
        } catch (IOException e) {
            System.out.println("2 "+e );
        }
        
        }

    }

    public void changeSucursalGenerales(ValueChangeEvent valueChangeEvent) {
        listCatalogoExpendio= new ArrayList<SelectItem>();
        valueChangeEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());
        String sucursalId = null;
        if((String)ADFUtil.evaluateEL("#{bindings.Sucursal.inputValue}") != null){
            sucursalId =(String)ADFUtil.evaluateEL("#{bindings.Sucursal.inputValue}");        
            //System.out.println("sucusarl :" +sucursalId+"");        
        }else{
            System.out.println("No existe una sucursal");
        }
        ConcentradoraSubCatalogoWS concentradoraWS = new ConcentradoraSubCatalogoWS();
        ArrayList<ItemBean> listItem ;
        SelectItem itemCombo = null;
        if(sucursalId!=null){
        try {
            
            listItem= concentradoraWS.getSubCatalogo(sucursalId,"expendio",tipoP);
            ItemBean beanItem = new ItemBean();
            Iterator<ItemBean> itemIterator = listItem.iterator();
            while(itemIterator.hasNext()){
                beanItem = (ItemBean)itemIterator.next();
                itemCombo = new SelectItem();
                itemCombo.setLabel(beanItem.getEtiqueta());
                itemCombo.setValue(beanItem.getIndice());
            
                listCatalogoExpendio.add(itemCombo);
                
            }
        
       
       
        } catch (MalformedURLException e) {
            
            System.out.println("1"+e);
            
            
        } catch (IOException e) {
            System.out.println("2"+e);
        }
        }

    }

    public void changeSucursal(ValueChangeEvent valueChangeEvent) {
        listCatalogoExpendio= new ArrayList<SelectItem>();
        valueChangeEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());
        String sucursalId  = null;
        if(ADFUtil.evaluateEL("#{bindings.sucursalStr1.inputValue}") != null){
            sucursalId =(String)ADFUtil.evaluateEL("#{bindings.sucursalStr1.inputValue}");
            //System.out.println("sucusarl :" +sucursalId+"");        
        }else{
            System.out.println("No existe la sucursalStr1");    
        }
        ConcentradoraSubCatalogoWS concentradoraWS = new ConcentradoraSubCatalogoWS();
        ArrayList<ItemBean> listItem ;
        SelectItem itemCombo = null;
        if(sucursalId != null){
        try {
            
            listItem= concentradoraWS.getSubCatalogo(sucursalId,"expendio",tipoP);
            ItemBean beanItem = new ItemBean();
            Iterator<ItemBean> itemIterator = listItem.iterator();
            while(itemIterator.hasNext()){
                beanItem = (ItemBean)itemIterator.next();
                itemCombo = new SelectItem();
                itemCombo.setLabel(beanItem.getEtiqueta());
                itemCombo.setValue(beanItem.getIndice());
            
                listCatalogoExpendio.add(itemCombo);
                
            }
        
       
       
        } catch (MalformedURLException e) {
            
            System.out.println("1"+e);
            
            
        } catch (IOException e) {
            System.out.println("2"+e);
        }
        }

    }
    
    //----- Consultar etapa de DB-----
    //Insertar los nuevos registros en el label de EtapCbo
        public void populateEtapa(){
              //System.out.println("Conexion a BD etapa/subetapa");              
              Context env = null;
              DataSource pool = null;
              Hashtable ht = new Hashtable( );
              listEtapa= new ArrayList<SelectItem>();
             
              
              ht.put(Context.INITIAL_CONTEXT_FACTORY,"weblogic.jndi.WLInitialContextFactory");        
              Connection conn = null;
              Statement stmtRegion = null;
              
              try
              {
              env = new InitialContext(ht);
              //Lookup this DataSouce at the top level of the WebLogic JNDI tree
              pool = (DataSource) env.lookup ("jdbc/concentradora"); 
              //String sqlRegion = "select REGION_ID,REGION_NAME from regions ";
              StringBuilder sqlRegion = new StringBuilder();
              //System.out.println("Tipo Proyecto Query :" + tipoP);
              sqlRegion.append("SELECT DISTINCT ID_ETAPA FROM CONTROL_ETAPAS WHERE ID_ETAPA != 0 AND ID_PROYECTO = ").append(tipoP).append(" ORDER BY ID_ETAPA");
              //System.out.println(sqlRegion.toString());
                
              ResultSet rsRegion = null;
              ResultSetMetaData rsmRegion = null;       
              conn = pool.getConnection( );
                            
              // CONSULTA DE REGIONES
              stmtRegion = conn.createStatement( );//create a java.sql.Statement
              
              
              rsRegion = stmtRegion.executeQuery(sqlRegion.toString()); 
              rsmRegion = rsRegion.getMetaData( );
              //System.out.println("Query = " + rsRegion );
              SelectItem itemRegion = null;
              
              while( rsRegion.next( )){ 
                  itemRegion = new SelectItem();
                               
                  itemRegion.setValue(rsRegion.getInt("ID_ETAPA"));
                  itemRegion.setLabel(rsRegion.getString("ID_ETAPA"));
                  //System.out.println("Etapa : " + rsRegion.getInt("ID_ETAPA"));
                  
                  this.listEtapa.add(itemRegion);
                             
                  } 
              
              } catch (Exception e) {
                         
                   System.out.println("------" + e);
                         
               } finally {
                         
                   try{
                             
                       stmtRegion.close( );
                       conn.close( );
                             
                   } catch (SQLException sqle){ 
                           System.out.println("------" + sqle);
                       }
                         
               }    
              
              
              /*for( SelectItem ObjItem: listEtapa){
                    System.out.println("ETAPA : " + ObjItem.getLabel() + " Existente ");
              }*/
              
          }

    public void repoblarSubRyExp (){
        if(ADFUtil.evaluateEL("#{bindings.Ramo.inputValue}") != null){
                listCatalogoSubRamo= new ArrayList<SelectItem>();
                String ramoId =(String)ADFUtil.evaluateEL("#{bindings.Ramo.inputValue}");        
                //System.out.println("Repoblar ramoId :" +ramoId);        
                ConcentradoraSubCatalogoWS concentradoraWS = new ConcentradoraSubCatalogoWS();
                ArrayList<ItemBean> listItem ;
                SelectItem itemCombo = null; 
                try { 
                    listItem= concentradoraWS.getSubCatalogo(ramoId,"subramo",tipoP);
                    ItemBean beanItem = new ItemBean();
                    Iterator<ItemBean> itemIterator = listItem.iterator();
                    while(itemIterator.hasNext()){
                        beanItem = (ItemBean)itemIterator.next();
                        itemCombo = new SelectItem();
                        itemCombo.setLabel(beanItem.getEtiqueta());
                        itemCombo.setValue(beanItem.getIndice());
                        listCatalogoSubRamo.add(itemCombo);
                    }
                } catch (MalformedURLException e) {
                    System.out.println("1"+e);
                } catch (IOException e) {
                    System.out.println("2"+e);
                }
        
        }
        
    if(ADFUtil.evaluateEL("#{bindings.Sucursal.inputValue}")!= null || ADFUtil.evaluateEL("#{bindings.sucursalStr1.inputValue}")!= null){
                 listCatalogoExpendio= new ArrayList<SelectItem>();
                    String sucursalId;
                    if(ADFUtil.evaluateEL("#{bindings.Sucursal.inputValue}")!=null){
                        sucursalId =ADFUtil.evaluateEL("#{bindings.Sucursal.inputValue}").toString();
                    }
                    else{
                        sucursalId =ADFUtil.evaluateEL("#{bindings.sucursalStr1.inputValue}").toString();
                    }
                 //System.out.println("sucusarl :" +sucursalId);        
                 ConcentradoraSubCatalogoWS concentradoraWS = new ConcentradoraSubCatalogoWS();
                 ArrayList<ItemBean> listItem ;
                 SelectItem itemCombo = null;
                 try {
                     listItem= concentradoraWS.getSubCatalogo(sucursalId,"expendio",tipoP);
                     ItemBean beanItem = new ItemBean();
                     Iterator<ItemBean> itemIterator = listItem.iterator();
                     while(itemIterator.hasNext()){
                         beanItem = (ItemBean)itemIterator.next();
                         itemCombo = new SelectItem();
                         itemCombo.setLabel(beanItem.getEtiqueta());
                         itemCombo.setValue(beanItem.getIndice());
                         listCatalogoExpendio.add(itemCombo);   
                     }
                 } catch (MalformedURLException e) {
                     
                     System.out.println("1"+e);   
                 } catch (IOException e) {
                     System.out.println("2"+e);
                 }
    }
    
     //-------------
    }
    
    
    public void setListCatalogoCanalVenta(List<SelectItem> listCatalogoCanalVenta) {
        this.listCatalogoCanalVenta = listCatalogoCanalVenta;
    }

    public List<SelectItem> getListCatalogoCanalVenta() {
        return listCatalogoCanalVenta;
    }
    
    public void setListEtapa(List<SelectItem> listEtapa) {
        this.listEtapa = listEtapa;
    }

    public List<SelectItem> getListEtapa() {
        return listEtapa;
    }

    public void setListCatalogoSubRamo(List<SelectItem> listCatalogoSubRamo) {
        this.listCatalogoSubRamo = listCatalogoSubRamo;
    }

    public List<SelectItem> getListCatalogoSubRamo() {
        return listCatalogoSubRamo;
    }
    
    public void setListCatalogoFuentes(List<SelectItem> listCatalogoFuentes) {
        this.listCatalogoFuentes = listCatalogoFuentes;
    }

    public List<SelectItem> getListCatalogoFuentes() {
        return listCatalogoFuentes;
    }

    public void setListCatalogoCanalIngreso(List<SelectItem> listCatalogoCanalIngreso) {
        this.listCatalogoCanalIngreso = listCatalogoCanalIngreso;
    }

    public List<SelectItem> getListCatalogoCanalIngreso() {
        return listCatalogoCanalIngreso;
    }

    public void setListCatalogoEdoPrenda(List<SelectItem> listCatalogoEdoPrenda) {
        this.listCatalogoEdoPrenda = listCatalogoEdoPrenda;
    }

    public List<SelectItem> getListCatalogoEdoPrenda() {
        return listCatalogoEdoPrenda;
    }

    public void setListCatalogoExpendio(List<SelectItem> listCatalogoExpendio) {
        this.listCatalogoExpendio = listCatalogoExpendio;
    }

    public List<SelectItem> getListCatalogoExpendio() {
        return listCatalogoExpendio;
    }

    public void setListCatalogoFactor(List<SelectItem> listCatalogoFactor) {
        this.listCatalogoFactor = listCatalogoFactor;
    }

    public List<SelectItem> getListCatalogoFactor() {
        return listCatalogoFactor;
    }

    public void setListCatalogoIngresoAlmoneda(List<SelectItem> listCatalogoIngresoAlmoneda) {
        this.listCatalogoIngresoAlmoneda = listCatalogoIngresoAlmoneda;
    }

    public List<SelectItem> getListCatalogoIngresoAlmoneda() {
        return listCatalogoIngresoAlmoneda;
    }

    public void setListCatalogoPartida(List<SelectItem> listCatalogoPartida) {
        this.listCatalogoPartida = listCatalogoPartida;
    }

    public List<SelectItem> getListCatalogoPartida() {
        return listCatalogoPartida;
    }

    public void setListCatalogoRamo(List<SelectItem> listCatalogoRamo) {
        this.listCatalogoRamo = listCatalogoRamo;
    }

    public List<SelectItem> getListCatalogoRamo() {
        return listCatalogoRamo;
    }

    public void setListCatalogoRefrendos(List<SelectItem> listCatalogoRefrendos) {
        this.listCatalogoRefrendos = listCatalogoRefrendos;
    }

    public List<SelectItem> getListCatalogoRefrendos() {
        return listCatalogoRefrendos;
    }

    public void setListCatalogoSucursal(List<SelectItem> listCatalogoSucursal) {
        this.listCatalogoSucursal = listCatalogoSucursal;
    }

    public List<SelectItem> getListCatalogoSucursal() {
        return listCatalogoSucursal;
    }


}

