package monte.captura;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import java.util.StringTokenizer;


import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;
import javax.faces.component.UIViewRoot;
import javax.faces.application.ViewHandler;

import javax.faces.component.UIComponent;

import oracle.adf.model.BindingContext;
import oracle.adf.view.rich.component.rich.RichPopup;
import oracle.adf.view.rich.component.rich.data.RichTable;
import oracle.adf.view.rich.component.rich.input.RichInputDate;
import oracle.adf.view.rich.component.rich.input.RichInputFile;
import oracle.adf.view.rich.component.rich.input.RichInputText;
import oracle.adf.view.rich.component.rich.input.RichSelectManyChoice;
import oracle.adf.view.rich.component.rich.input.RichSelectManyShuttle;
import oracle.adf.view.rich.component.rich.input.RichSelectOneChoice;
import oracle.adf.view.rich.component.rich.input.RichSelectOneRadio;
import oracle.adf.view.rich.component.rich.layout.RichPanelAccordion;
import oracle.adf.view.rich.component.rich.layout.RichPanelFormLayout;
import oracle.adf.view.rich.component.rich.layout.RichPanelGroupLayout;
import oracle.adf.view.rich.component.rich.layout.RichShowDetailItem;
import oracle.adf.view.rich.component.rich.nav.RichButton;
import oracle.adf.view.rich.component.rich.output.RichOutputFormatted;
import oracle.adf.view.rich.component.rich.output.RichOutputText;
import oracle.adf.view.rich.context.AdfFacesContext;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;

import org.apache.myfaces.trinidad.event.DisclosureEvent;
import org.apache.myfaces.trinidad.model.UploadedFile;
import org.apache.myfaces.trinidad.render.ExtendedRenderKitService;
import org.apache.myfaces.trinidad.util.Service;

import otn.utilitarios.ADFUtil;
import otn.utilitarios.JSFUtils;



public class CapturaCriterioBean {

    private RichShowDetailItem tapDesmarcado;
    private RichButton btnSimulaMarcado;
    private RichPanelGroupLayout panelGroupLayoutBotonesFinales;
    private RichShowDetailItem showDetailItemProyectoEtapa;
    private RichOutputFormatted outPutFormattedParametrosObli;
    private RichPanelAccordion panelAcordionProyectoEtapa;
    private RichInputFile cargaFileDesmarcado;
    private RichButton btnEnvioCriterios;
    private RichButton btnDesmarcar;
    private RichTable tablaNumPart;
    private RichPanelGroupLayout panelGroupLayoutNumeroPartidas;
    private RichPanelAccordion panelAcordionPestañas;


    public CapturaCriterioBean() {
        super();
        
        //adfContext = AdfFacesContext.getCurrentInstance(); 
        //if (!adfContext.isPostback()) {
        //    inicializarComponentes();
        //}
    
    }
    
    private RichSelectOneChoice operadorFechaAlmoChoiseList;
    private RichSelectOneChoice canalIngresoChoiseList;
    private RichInputDate compFechaAlmonedaFin;
    private RichSelectOneChoice selectEdoPrenda;
    private RichInputText inputRefres2;
    private AdfFacesContext adfContext;
    private int panel = 0;
    
    //Varible de componentes RadioGroup (op tildada)
    private RichSelectOneRadio selectedRadioGroupEsNuevaEtapa;
    private RichSelectOneChoice selectOneChoiseEtapa;


    //Variables de camponentes Date
    private RichInputDate compFechaSolicitud;
    private RichInputDate compFechaEjecucion;
    private RichInputDate compFechaAlmoneda;

    //Variables de camponentes imputText
    private RichInputText inputTextEtapa;
    private RichInputText inputTextSubEtapa;
    private RichInputText inputTextNumeroPartida;

    //Campos Obligatorios
    private RichShowDetailItem crgenerales;
    private RichShowDetailItem sucexp;
    private RichShowDetailItem numpartida;


    String mensajeError;
    private RichButton addNumeroPartida;
    private RichInputFile cagarFile;
    private RichPanelFormLayout panelPE;
    private RichOutputText etapaNext;
    private RichSelectManyShuttle shuttleSucursales;
    // private RichPanelHeader panelShuttle;
    private RichSelectOneChoice selectExpendio;
    private RichSelectOneChoice selectSucursal;
    private RichSelectManyChoice gExpendios;
    private RichSelectManyChoice gsubRamo;
    private RichPanelAccordion panelSucUni;
    private RichPanelAccordion panelSucMulti;
    private RichSelectOneRadio rgSucursales;
    
    private RichSelectOneChoice ramoC;
    private RichPanelGroupLayout panelVRamoSub;
    private RichSelectOneChoice selected;
    private RichSelectOneChoice selectecCanalVenta;
    private RichSelectOneChoice selectecFactor;
    private RichSelectOneChoice selectecFuente;
    private RichInputText inputRefrendo;
    private RichSelectOneRadio radioButtonSucursales;
    private RichSelectManyChoice selectecFactorCon;
    String bandera;
    
    //Popu´s
    private transient RichPopup popupConfirmaPartidasDescartar;
    private transient RichPopup popupLoading;
    private transient RichPopup fechasPopup;
    private transient RichPopup popupConfirmar;
    private transient RichPopup popupEtapa;
    private transient RichPopup popupMensajes;
    private transient RichPopup errorPopup;
    

   
    /**Bean de la pantalla */
    public void changeOption(ValueChangeEvent valueChangeEvent) {
        //System.out.println("Radio Buton Activo");

        /**Opcion Si*/
        if (selectedRadioGroupEsNuevaEtapa.getValue().equals("0")) 
        {
            int tipoP = 0;
            if (JSFUtils.resolveExpression("#{bindings.Proyecto.inputValue}") != null) {
                //Baja variable
                tipoP = (Integer) JSFUtils.resolveExpression("#{bindings.Proyecto.inputValue}");
            }
            //Ocultamos los componente choiseList e inputText de opcion 2
            selectOneChoiseEtapa.setVisible(false);
            inputTextSubEtapa.setVisible(false);
            System.out.println("Tipo P e/s op1 =" + tipoP);
            //Obtenemos el Metodo que esta relacionado con el ConcentradoraVO dentro del atributo: etapa (consulta SQL)
            BindingContainer bindings = getBindings();
            OperationBinding operationBinding = bindings.getOperationBinding("asignarEtapaOp1");
            operationBinding.getParamsMap().put("tp", tipoP);
            Object result = operationBinding.execute();

            //Activamos y lo hacemos de solo lectura etiqueta Etapa
            inputTextEtapa.setVisible(true);
            inputTextEtapa.setReadOnly(true);
            AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextEtapa);
            AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextSubEtapa);
            AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextSubEtapa);
            inputTextSubEtapa.setVisible(true);
            //System.out.println("inputTextEtapa =" + inputTextEtapa.isVisible());
            /**Opcion No*/
        }
        else
        {
            /** Descrioción: Despliega una choiseList con todas las etapas existentes para ese proyecto
                   *               de modo que se asigna la ultima subetapa que tiene asignada la etapa 'tildada por el usuario'
                   *  Operación:   Etapa: Lista desplegable (etapas correspondinete a ese proyecto)
                   *               Subetapa: ultima subetapa + 1
                   * */
            //Ocultamos los imputText de la opcion 1
            inputTextEtapa.setVisible(false);
            inputTextSubEtapa.setVisible(false);
            selectOneChoiseEtapa.setValue(null);
            selectOneChoiseEtapa.setVisible(true);
            inputTextSubEtapa.setReadOnly(true);
            AdfFacesContext.getCurrentInstance().addPartialTarget(selectOneChoiseEtapa);
            AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextSubEtapa);


        }
        //System.out.println("inputTextEtapa =" + inputTextEtapa.isVisible());
    }

    /**Se habilita la lista de etapa a elejir */
    public void selectOneChoiseEtapa(ValueChangeEvent valueChangeEvent) {
        valueChangeEvent.getComponent().processUpdates(FacesContext.getCurrentInstance());
        /*
           JSFUtils Obj = new JSFUtils();
           System.out.println("res = "+ Obj.resolveExpression("#{bindings.Etapa.inputValue}")+"");
           */
        int tipoP = 0;
        if (JSFUtils.resolveExpression("#{bindings.Proyecto.inputValue}") != null) {
            tipoP = (Integer) JSFUtils.resolveExpression("#{bindings.Proyecto.inputValue}");
            //System.out.println("Tipo de proyecto : changeOption :"  + tipoP) ;
        }

        /*if( ADFUtil.evaluateEL("#{bindings.EtapaCbo.inputValue}") != null){
                System.out.println("evaluateEL...."+ ADFUtil.evaluateEL("#{bindings.EtapaCbo.inputValue}"));

           }else{
               System.out.println("La validacion del EtapaCbo no tiene valor");
           }*/

        //System.out.println("select choice :"+ selectOneChoiseEtapa.getValue());
        if (ADFUtil.evaluateEL("#{bindings.EtapaCbo.inputValue}") != null) {
            Integer etapa = (Integer) ADFUtil.evaluateEL("#{bindings.EtapaCbo.inputValue}");
            BindingContainer bindings = getBindings();
            OperationBinding operationBinding = bindings.getOperationBinding("asignarEtapaOp2");
            operationBinding.getParamsMap().put("tp", tipoP);
            operationBinding.getParamsMap().put("etapa", etapa);
            Object result = operationBinding.execute();
            inputTextSubEtapa.setVisible(true);
            AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextSubEtapa);

        } else {
            System.out.println("El combo de etapas no tiene valor");
        }

    }

    public boolean validacionObligatoria(){
        boolean cumple = true;
        //START VALIDACIONES OBLIGATORIOAS
        if (JSFUtils.resolveExpression("#{bindings.EtapaCbo.inputValue}") == null &&
            JSFUtils.resolveExpression("#{bindings.Etapa1.inputValue}") == null) {
            JSFUtils.addErrorMessage("Advertencia debe seleccionar una etapa\n");
            //System.out.println("Advertencia debe seleccionar una etapa");
            cumple = false;
        }

        if (JSFUtils.resolveExpression("#{bindings.FechaEjecucion.inputValue}") == null) {
            //JSFUtils.addErrorMessage("Advertencia debe seleccionar una fecha de ejecución\n");
            ADFUtil.setEL("#{pageFlowScope.msgError}", "Advertencia debe ingresar una Fecha de Ejecución valida");
            openPopup(fechasPopup);
            cumple = false;
        }

        /*Start: Cambio de campo Obligatorio: 05/01/2015 Autor: Raul G.*/
        if (JSFUtils.resolveExpression("#{bindings.ProyectoPantalla.inputValue}").equals("Compra Cumplido")) {

            if (JSFUtils.resolveExpression("#{bindings.CanalVenta.inputValue}") == null) {
                JSFUtils.addErrorMessage("Advertencia debe ingresar el canal de venta");
                cumple =  false;
                }
            }
        /*End Defect*/


        DateFormat formatter = null;
        Date convertedDatefs = null;
        Date convertedDatefe = null;
        String fe = JSFUtils.resolveExpression("#{bindings.FechaEjecucion.inputValue}").toString();
        String fs = JSFUtils.resolveExpression("#{bindings.FechaSolicitud.inputValue}").toString();
        String fa1 = null;
        String fa2 = null;
        formatter = new SimpleDateFormat("dd/MM/yyyy ");

        try {
            convertedDatefs = (Date) formatter.parse(fs);
            convertedDatefe = (Date) formatter.parse(fe);
        } catch (ParseException e) {
            System.out.println(e);
        }
        //System.out.println("Date from FS String in Java : " + convertedDatefs);
        //System.out.println("Date from FE String in Java : " + convertedDatefe);
        Date actual = new Date();
        if (convertedDatefs.after(convertedDatefe) ||
            convertedDatefs.equals(convertedDatefe)) {
            //JSFUtils.addErrorMessage("La fecha de ejecución debe ser mayor a la fecha de solicitud");
            ADFUtil.setEL("#{pageFlowScope.msgError}",
                          "La Fecha de Ejecución debe ser mayor a un día respecto a la Fecha de Solicitud");
            openPopup(fechasPopup);
            ADFUtil.setEL("#{bindings.FechaEjecucion.inputValue}", null);
            //System.out.println("La fecha de ejecución debe ser mayor a la fecha de solicitud");
            cumple = false;
        }
        //END VALIDACIONES OBLIGATORIOAS
        
        
        return cumple;
    
    }
    
     /** Boton de Submit para Task (que se conectara al WS)*/
         public String guardar() 
         {
                 ADFUtil util = new ADFUtil();
                 panel = ubicacionPanel();
                 boolean cumple = validacionObligatoria();
                 
                 if(cumple){
                     String fe = JSFUtils.resolveExpression("#{bindings.FechaEjecucion.inputValue}").toString();
                     String fa1 = null;
                     String fa2 = null;
                     Date convertedDatefe = null;
                     Date convertedDatefa1 = null;
                     Date convertedDatefa2 = null;
                     
                     //Sección Citerios Generales
                     if (panel == 1) 
                     {
                         
                                         // COMPRA CUMPLIDO 
                                         if (JSFUtils.resolveExpression("#{bindings.ProyectoPantalla.inputValue}").equals("Compra Cumplido")) 
                                         {
                                             
                                             //Fechas Inicio-Fin Obligatorios Compra Cumplido
                                             if (JSFUtils.resolveExpression("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}") == null ||
                                                 JSFUtils.resolveExpression("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}") == "")
                                                 {
                                                     JSFUtils.addErrorMessage("Debes elegir una Fecha de Ingreso Almoneda, éste campo es obligatorio para 'Compra Cumplido'");
                                                                 return null;
                                                 } 
                                                 else
                                                 {
    
                                                                     String value = (String) JSFUtils.resolveExpression("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}");
                                                                     if (value.equals("6")) 
                                                                     {
                                                                         if ((JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmoneda.inputValue}") == null ||
                                                                              JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmonedaFin.inputValue}") ==
                                                                              null)) 
                                                                         {
                                                                             JSFUtils.addErrorMessage("Debes elegir una Fecha Inicio-Fin Almoneda");
                                                                             return null;
                                                                         }
                                                                     } 
                                                                     else
                                                                     {
    
                                                                         if (JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmoneda.inputValue}") == null) 
                                                                         {
                                                                             JSFUtils.addErrorMessage("Debes elegir una Fecha Inicio Almoneda");
                                                                             return null;
                                                                         }
                                                                     
                                                                     } 
                                                  }
                                              //End Fecha
                                             
                                             if (JSFUtils.resolveExpression("#{bindings.Fuente.inputValue}") == null &&
                                                 JSFUtils.resolveExpression("#{bindings.Ramo.inputValue}") == null &&
                                                 JSFUtils.resolveExpression("#{bindings.Refrendos.inputValue}") == null &&
                                                 JSFUtils.resolveExpression("#{bindings.Sucursal.inputValue}") == null)
                                             {
                                                 JSFUtils.addErrorMessage("Debes elegir al menos un campo de los Criterios Generales: Fuente, Ramo-Sub Ramo, Refrendo, Sucursal-Expendio");
                                                 return null;
                                             }
                                             
                                             
                                         } 
                                         else
                                         {
                                             // CONCENTRADORA 
                                             if( (JSFUtils.resolveExpression("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}") == null ||
                                                 JSFUtils.resolveExpression("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}") == "" ) &&
                                                 JSFUtils.resolveExpression("#{bindings.Fuente.inputValue}") == null &&
                                                 JSFUtils.resolveExpression("#{bindings.Ramo.inputValue}") == null &&
                                                 JSFUtils.resolveExpression("#{bindings.Factor.inputValue}") == null &&
                                                 JSFUtils.resolveExpression("#{bindings.CanalIngreso.inputValue}") == null &&
                                                 JSFUtils.resolveExpression("#{bindings.Refrendos.inputValue}") == null &&
                                                 JSFUtils.resolveExpression("#{bindings.EdoPrenda.inputValue}") == null &&
                                                 JSFUtils.resolveExpression("#{bindings.Sucursal.inputValue}") == null)
                                             {
                                                 JSFUtils.addErrorMessage("Debes elegir al menos un campo de los Criterios Generales: Fecha Almo-Operador Almo, Fuente, Ramo-Sub Ramo, Factor, Canal Ingreso, Refrendo, Edo. Prenda, Sucursal-Expendio");
                                                 return null;
                                             }
                                             
                                             //Fechas para Concentradora
                                             
                                                 if (JSFUtils.resolveExpression("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}") != "" ) 
                                                 {
                                                     //System.out.println("valor =" + JSFUtils.resolveExpression("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}").toString()+"=");
                                                     //JSFUtils.addErrorMessage("Debes elegir una Fecha Almoneda");
                                                     //return null;
                                                 /*}
                                                 else
                                                 {*/
                                                     String value = (String) JSFUtils.resolveExpression("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}");
                                                     if (value.equals("6")) 
                                                     {
                                                         
                                                         if ((JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmoneda.inputValue}") == null || JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmonedaFin.inputValue}") == null)) 
                                                         {
                                                             JSFUtils.addErrorMessage("Debes elegir una Fecha Inicio-Fin Almoneda");
                                                             return null;
                                                         }
                                                     }
                                                     else
                                                     {
                                                         if (JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmoneda.inputValue}") == null)
                                                         {
                                                             JSFUtils.addErrorMessage("Debes elegir una Fecha Ingreso Almoneda");
                                                             return null;
                                                         }
                                                     }
                                                 }
                                              //End Fecha
                                         
                                         }
                             //End Eleccion
    
                                                 DateFormat formatter2 = new SimpleDateFormat("dd/MM/yyyy");
                                                 try { convertedDatefe = (Date) formatter2.parse(fe); } catch (ParseException e) { System.out.println(e); }
                                                 
                                                 if (JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmoneda.inputValue}") != null)
                                                 {
                                                     fa1 = JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmoneda.inputValue}").toString();
                                                     try { convertedDatefa1 = (Date) formatter2.parse(fa1); } catch (ParseException e) { System.out.println(e); }
                                                     
                                                     if (convertedDatefa1.after(convertedDatefe))
                                                     {
                                                         JSFUtils.addErrorMessage("La fecha de ingreso almoneda debe ser menor a la fecha de ejecución");
                                                         return null;
                                                     }
                                     
                                                 }
                                                 
                                                 if (JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmonedaFin.inputValue}") != null && JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmoneda.inputValue}") != null)
                                                 {
                                                     fa2 = JSFUtils.resolveExpression("#{bindings.FechaIngresoAlmonedaFin.inputValue}").toString();
                                                     
                                                     formatter2 = new SimpleDateFormat("yyyy-MM-dd");
                                                     
                                                     try { convertedDatefa2 = (Date) formatter2.parse(fa2); } catch (ParseException e) { System.out.println(e); }
                                                     
                                                     //System.out.println("convertedDatefa2.after(convertedDatefe)= "+convertedDatefa2.after(convertedDatefe)+"");
                                                     //System.out.println("convertedDatefa2.before(convertedDatefa1)= "+convertedDatefa2.before(convertedDatefa1)+"");
                                                     if (convertedDatefa2.after(convertedDatefe) || convertedDatefa2.before(convertedDatefa1))
                                                     {
                                                         JSFUtils.addErrorMessage("La fecha de ingreso almoneda final debe ser menor a la fecha de ejecución y mayor a la fecha de inicio");
                                                         ADFUtil.setEL("#{bindings.FechaIngresoAlmonedaFin.inputValue}", null);
                                                         return null;
                                                     }
                                                 }
                                                 
                                                 if (JSFUtils.resolveExpression("#{bindings.Ramo.inputValue}") != null)
                                                 {
                                                     if (JSFUtils.resolveExpression("#{bindings.Subramo.inputValue}") == null)
                                                     {
                                                         JSFUtils.addErrorMessage("Debes elegir un Sub Ramo, de lo contrario se omitirá el Ramo seleccionado");
                                                         return null;
                                                     }
                                                 }
                                                 
                                     
                                                 if (JSFUtils.resolveExpression("#{bindings.Sucursal.inputValue}") != null && shuttleSucursales.getValue() == null)
                                                 {
                                                     if (JSFUtils.resolveExpression("#{bindings.Expendio.inputValue}") == null)
                                                     {
                                                         JSFUtils.addErrorMessage("Debes elegir un Expendio, de lo contrario se omitirá la Sucursal seleccionada");
                                                         return null;
                                                     }
                                                 }
                                     
                                                 //--Ingresar Lista de sucursales
                                                 if (shuttleSucursales.getValue() != null)
                                                 {
                                                     ArrayList listSuc = (ArrayList) shuttleSucursales.getValue();
                                                     //System.out.println("arg.length:"+listSuc.size()+"");
                                                     String concatSuc = "";
                                                     for (int h = 0; h < listSuc.size(); h++)
                                                     {
                                                         //System.out.println(listSuc.get(h));
                                                         concatSuc = concatSuc + listSuc.get(h) + ",";
                                                     }
                                                     String nueva = concatSuc.substring(0, concatSuc.length() - 1);
                                                     //--agregar el valor de las sucursales
                                                     ADFUtil.setEL("#{bindings.Sucursal.inputValue}", nueva);
                                                     //--remover expendio si se selcciono anteriormente
                                                     ADFUtil.setEL("#{bindings.Expendio.inputValue}", null);
                                                 }
                     }
                     else if (panel == 2) 
                     {
                         //Sección Citerios Suc - Exp
    
                         //validar que el VO Tabla Sucursal-Expendio no este vacio
                         List listaTabSucExp = util.attributeListForIterator("TabSucExpVO1Iterator", "Expendio");
                         //System.out.println("tam lista 1= "+listaTabSucExp.size()+"");
                         if (listaTabSucExp.size() == 0)
                         {
                             JSFUtils.addErrorMessage("Debe ingresar al menos una Sucursal y Expendio a marcar");
                             return null;
                         }
                     }
                     else 
                     {
                         //Sección Citerios Num Partidas
                         //validar que el VO Tabla Numerp-Partida no este vacio
                         List listaTabNumPart = util.attributeListForIterator("TabNumPartVO1Iterator", "NumPartida");
                         //System.out.println("tam lista 2= "+listaTabNumPart.size()+"");
                         if (listaTabNumPart.size() == 0)
                         {
                             JSFUtils.addErrorMessage("Debe ingresar al menos un Número de Partida");
                             return null;
                         }
                     }
                     mostrarAfPopup(popupConfirmar);
                     //ADFUtil.showPopup(popupConfirmar, true); //mostrar
                 }
                 //openPopup(popupConfirmar);
                 return null;
             }
   
    public String botonConfirmar() {
        
        RichPopup.PopupHints ph = new RichPopup.PopupHints();
        
        //Ejecucion de App Module "enviaCriterios"
        panel = ubicacionPanel();
        
        //Se lanza el popup de espera de confirmacion
        popupConfirmar.hide();
        AdfFacesContext.getCurrentInstance ().addPartialTarget (popupConfirmar);
        //closePopUpLoading( popupConfirmar );
        
        //openPopup(popupLoading);
        popupLoading.show(ph);
         
        invocarAM();
        
        return null;
    }
    
    public void invocarAM(){
        
        
        BindingContainer bindings = getBindings();
        OperationBinding op = bindings.getOperationBinding("enviarCriterios");
        op.getParamsMap().put("pestania", panel);
        //DEV
        op.getParamsMap().put("url", generarURL("Env", "Dev"));
        //TEST
        //op.getParamsMap().put("url",generarURL("Env","Test"));
        //DR
        //op.getParamsMap().put("url",generarURL("Env","Dr"));
        //PROD
        //op.getParamsMap().put("url",generarURL("Env","Prod"));
        String resultado = (String) op.execute();
        popupLoading.hide();
        AdfFacesContext.getCurrentInstance ().addPartialTarget (popupLoading);
        //closePopUpLoading(popupLoading);
        
        if(resultado != null ){
            
            
            System.out.println(" Resultado BtnConfirmar = " + resultado);
            if (resultado != null && resultado.equalsIgnoreCase("EE")) { //resultado== null || resultado.equals("")){
                int etapa = Integer.parseInt(JSFUtils.resolveExpression("#{bindings.Etapa1.inputValue}").toString());
                etapa = etapa + 1;
                etapaNext.setValue(etapa);
                openPopup(popupEtapa);
                
            }
            
            StringTokenizer st2 = new StringTokenizer(resultado, "|");
            String codigoResultado = (String) st2.nextElement();
            String mensajeResultado = (String) st2.nextElement();
            //System.out.println("codigoResultado :" +codigoResultado);
            //System.out.println("mensaje :" +mensajeResultado);
            ADFUtil.setEL("#{pageFlowScope.msgSucess}", mensajeResultado);
            if (codigoResultado.equals("Error") || codigoResultado.equals("") || codigoResultado == null) {
                JSFUtils.addErrorMessage("Error durante el envío, por favor contacte al administrador");
                
            }
            
            
            if (codigoResultado.equals("0")) {
                // limpio formulario
                openPopup(popupMensajes);
                limpiarFormulario();
            } else {
        
                ADFUtil.setEL("#{pageFlowScope.msgError}", mensajeResultado);
                openPopup(errorPopup);
                //JSFUtils.addErrorMessage(mensajeResultado);
            }
        }else{
            popupLoading.hide();
            System.out.println("El resultado del envio de criterios fallo");
            
        }    
        
    }
    //StartDefect : Se incrustan la funionalidad de abrir y cerrar popups de espera Author: Raul G. 29/02/2016
    
    public static void mostrarAfPopup(RichPopup popup) {
      FacesContext ctx = FacesContext.getCurrentInstance();
      String popupId = popup.getClientId(ctx);
      ExtendedRenderKitService erkService = Service.getService(ctx.getRenderKit(),ExtendedRenderKitService.class);
      erkService.addScript(ctx,"var hints = {autodismissNever:true}; " + "AdfPage.PAGE.findComponent('" + popupId +  "').show(hints);");
    }
    
    public static void ocultarAfPopup(RichPopup popup) {
    FacesContext ctx = FacesContext.getCurrentInstance();
    String popupId = popup.getClientId(ctx);
    ExtendedRenderKitService erkService = Service.getService(ctx.getRenderKit(),ExtendedRenderKitService.class);
    erkService.addScript(ctx,"var hints = {autodismissNever:true}; " + "AdfPage.PAGE.findComponent('" + popupId + "').hide();");
    }
    
    public void openPopup(RichPopup popup) {
        FacesContext context = FacesContext.getCurrentInstance();
        StringBuilder toSend = new StringBuilder();
        toSend.append("var popup = AdfPage.PAGE.findComponent('"). // NOTRANS
        append(popup.getClientId(context)).append("'); "). // NOTRANS
        append("if (!popup.isPopupVisible()) { "). // NOTRANS
        append("var hints = {}; "). // NOTRANS
        append("popup.show(hints);}"); // NOTRANS
        ExtendedRenderKitService erks = Service.getService(context.getRenderKit(), ExtendedRenderKitService.class);
        erks.addScript(context, toSend.toString());
    }
    
    public void closePopUpLoading( RichPopup popup){
          
        FacesContext facesContext = FacesContext.getCurrentInstance();
        ExtendedRenderKitService service =
        Service.getRenderKitService(facesContext, ExtendedRenderKitService.class);
        //service.addScript(facesContext,"AdfPage.PAGE.findComponentByAbsoluteId('" + popup.getId()  + "').hide();");
        service.addScript(facesContext,"AdfPage.PAGE.findComponent('" + popup.getId()  + "').hide();");
        AdfFacesContext.getCurrentInstance ().addPartialTarget (popup);
    }
    
    public void cerrarPopup(RichPopup popup){
        
        FacesContext facesContext = FacesContext.getCurrentInstance();
        StringBuilder toSend = new StringBuilder();
        toSend.append("var popup = AdfPage.PAGE.findComponent('"). // NOTRANS
        append(popup.getClientId(facesContext)).append("'); "). // NOTRANS
        append("if (popup.isPopupVisible()) { "). // NOTRANS
        append("popup.hide();}"); // NOTRANS
        ExtendedRenderKitService service = Service.getRenderKitService(facesContext, ExtendedRenderKitService.class); 
        service.addScript(facesContext, toSend.toString() );   
        AdfFacesContext.getCurrentInstance ().addPartialTarget (popup); 
            
  }

    public String btnCerrarPopups() {
        // Add event code here...
        FacesContext ctx = FacesContext.getCurrentInstance();
        ExtendedRenderKitService erkService = Service.getService(ctx.getRenderKit(),ExtendedRenderKitService.class);
        erkService.addScript(ctx,"AdfPage.PAGE.findComponent('d6').hide();");
        
        popupMensajes.hide();
        
        limpiarFormulario();
        return null;
    }
    
    public String btnCerrarPopupsFail() {
        // Este metodo funciona en caso  de tener un error durante el envio y no limpia la pantalla dejando los paramtros de envio de criterios
        FacesContext ctx = FacesContext.getCurrentInstance();
        ExtendedRenderKitService erkService = Service.getService(ctx.getRenderKit(),ExtendedRenderKitService.class);
        erkService.addScript(ctx,"AdfPage.PAGE.findComponent('d6').hide();");
        
        return null;
    }
    //End Defect: Popup´s
    
    public String guardarPartidasDesmarcar() {
        
        List listaTabNumPart = ADFUtil.attributeListForIterator("TabNumPartDesVO1Iterator", "NumPartDes");
        
        if (listaTabNumPart.size() == 0)
        {
            JSFUtils.addErrorMessage("Debe ingresar al menos un Número de Partida");
            return null;
        }
        else
        {
            //true : muestra
            //false : oculta
            ADFUtil.showPopup(popupConfirmaPartidasDescartar, true); //mostrar

            //mostrarAfPopup(popupConfirmaPartidasDescartar);    
        }
        
        
            
        return null;
    }
    
    public String btnConfirmarPartiDes() {
        //Logica de Envio de partidas a desmarcar
        //Logica de popups : ocultar y mostrar
        
        try {
            ADFUtil.showPopup(popupLoading, true); //mos
            System.out.println("Manda allamar al servicio de Desmarcado");
             //Servicio
             invocarAM();
        } catch (Exception e) {
        // Mensaje en caso de que falle
        }
        
        
        
        return null;
    }
    
    
    public String btnSimular() {
        int panel = ubicacionPanel();
        if(panel >1 && panel < 3){
            
            System.out.println("Validacion de componentes");
            
            
        }
        
        return null;
    }


    public String confirmaNuevaEtapa() {
        int etapa = Integer.parseInt(JSFUtils.resolveExpression("#{bindings.Etapa1.inputValue}").toString());
        etapa = etapa + 1;
        ADFUtil.setEL("#{bindings.Etapa1.inputValue}", etapa);
        botonConfirmar();
        return null;
    }
    
  
    public void limpiarFormulario() {

        BindingContainer bindings = getBindings();
        //--Criterios Genrerales
        
        //RadioGrop : proyecto y etapa deshabilitado
            ADFUtil.setEL("#{bindings.NuevaEtapa.inputValue}", null);
            //selectedRadioGroupEsNuevaEtapa.setDisabled(false);
            //AdfFacesContext.getCurrentInstance().addPartialTarget(selectedRadioGroupEsNuevaEtapa);
            
        //Fecha ejecucion :
            ADFUtil.setEL("#{bindings.FechaEjecucion.inputValue}", null);
            //compFechaEjecucion.setDisabled(false);
            //AdfFacesContext.getCurrentInstance().addPartialTarget(compFechaEjecucion);
            
            ADFUtil.setEL("#{bindings.CanalVenta.inputValue}", null);
        //--Componentes Internos Etapa etiqueta y Etapa Combo    
            ADFUtil.setEL("#{bindings.EtapaCbo.inputValue}", null);
            ADFUtil.setEL("#{bindings.Etapa1.inputValue}", null);
            inputTextEtapa.setVisible(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextEtapa);
            inputTextSubEtapa.setVisible(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextSubEtapa);
        
        
        //Btn Simular habilitado
            /*btnSimulaMarcado.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(btnSimulaMarcado);*/
        //Btn Enviar Criterios
            /*btnEnvioCriterios.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(btnEnvioCriterios);  */  
            
        //Leyenda : proyecto y etapa deshabilitado
            /*outPutFormattedParametrosObli.setValue("Los campos marcados con (*) son de carácter obligatorio");
            AdfFacesContext.getCurrentInstance().addPartialTarget(outPutFormattedParametrosObli);*/
            
            
        //}
        //--Limpiar shuttleSucursales
            shuttleSucursales.setValue(null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(shuttleSucursales);
        //--limpiar comos multiseleccion de expendios y subramo
            gExpendios.setValue(null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(gExpendios);
            gsubRamo.setValue(null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(gsubRamo);
            
            
        //--Operador Almoneda
            ADFUtil.setEL("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}", null);
        //--Fecha Inicio-Fin
            ADFUtil.setEL("#{bindings.FechaIngresoAlmoneda.inputValue}", null);
            ADFUtil.setEL("#{bindings.FechaIngresoAlmonedaFin.inputValue}", null);
        //--Fuente
            ADFUtil.setEL("#{bindings.Fuente.inputValue}", null);
            //selectecFuente.setValue(null);
            //AdfFacesContext.getCurrentInstance().addPartialTarget(selectecFuente);
        //--Ramo -Subramo
            //ramoC.setValue(null);
            //AdfFacesContext.getCurrentInstance().addPartialTarget(ramoC);
            //gsubRamo.setValue(null);
            //AdfFacesContext.getCurrentInstance().addPartialTarget(gsubRamo);
            ADFUtil.setEL("#{bindings.Ramo.inputValue}", null);
            ADFUtil.setEL("#{bindings.Sucursal.inputValue}", null);
        //--Canal de Venta
            //selectecCanalVenta.setValue(null);
            //AdfFacesContext.getCurrentInstance().addPartialTarget(selectecCanalVenta);
            ADFUtil.setEL("#{bindings.CanalVenta.inputValue}", null);
        //-- Factor
            ADFUtil.setEL("#{bindings.Factor.inputValue}", null);
        //--Canal de Ingresos
            ADFUtil.setEL("#{bindings.CanalIngreso.inputValue}", null);
        //Refrendos Compra Cumplido
            //inputRefrendo.setValue(null);
            //AdfFacesContext.getCurrentInstance().addPartialTarget(inputRefrendo);
            ADFUtil.setEL("#{bindings.Refrendos.inputValue}", null);
        //Refrendo 2 Concentradora
            /*inputRefres2.setValue(null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(inputRefres2);*/

            radioButtonSucursales.setValue(null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(radioButtonSucursales);
            selectecFactor.setValue(null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(selectecFactor);
            //selectecFactorCon.setValue(null);
            panelSucUni.setVisible(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(panelSucUni);
            panelSucMulti.setVisible(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(panelSucMulti);
        //Operador Fecha Almoneda
            operadorFechaAlmoChoiseList.setValue(null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(operadorFechaAlmoChoiseList);
        //Canal de Venta
            canalIngresoChoiseList.setValue(null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(canalIngresoChoiseList);
        // Fecha Ini (Almoneda)
            compFechaAlmoneda.setValue(null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(compFechaAlmoneda);
        // Fecha Fin (Almoneda)
            compFechaAlmonedaFin.setValue(null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(compFechaAlmonedaFin);
        // Edo. Prenda
            //selectEdoPrenda.setValue(null);
            //AdfFacesContext.getCurrentInstance().addPartialTarget(selectEdoPrenda);
            ADFUtil.setEL("#{bindings.EdoPrenda.inputValue}", null);
        //-- Criterios Suc-Exp
            OperationBinding opLimpiarTabSubExp = bindings.getOperationBinding("cleanTabSucExp");
            opLimpiarTabSubExp.execute();
            ADFUtil.setEL("#{bindings.expendioStr1.inputValue}", null);
            
        //-- Limpiar campos de las pestañas 2 y 3
            ADFUtil.setEL("#{bindings.sucursalStr1.inputValue}", null);

        //-- Criterio Numero de Partida
            inputTextNumeroPartida.setValue(null);
            OperationBinding opLimpiarTabNumPart = bindings.getOperationBinding("cleanTabNumPart");
            opLimpiarTabNumPart.execute();
            ADFUtil.setEL("#{bindings.numPartida.inputValue}", "");
        //-- Limpiar lista de archivos
            OperationBinding opLimpiarFileList = bindings.getOperationBinding("cleanListaArchivos");
            opLimpiarFileList.execute();
        
        //--Limpieza pestaña 4 : Desmarcar partidas
        //Tabla contenedora
            OperationBinding opLimpiarTabNumPartDesc = bindings.getOperationBinding("cleanTabNumPartDescartar");
            opLimpiarTabNumPartDesc.execute();
        //Lista de Archivos
            OperationBinding opLimListArchNumPartDesc = bindings.getOperationBinding("cleanListaArchivosNumPartDescartar");
            opLimListArchNumPartDesc.execute();
        
        //-- Pestañas
            sucexp.setDisclosed(sucexp.isDisclosed());
            AdfFacesContext.getCurrentInstance().addPartialTarget(sucexp);
            numpartida.setDisclosed(numpartida.isDisclosed());
            AdfFacesContext.getCurrentInstance().addPartialTarget(numpartida);
            crgenerales.setDisclosed(crgenerales.isDisclosed());
            AdfFacesContext.getCurrentInstance().addPartialTarget(crgenerales);
        
        
        //-- Limpieza General
        //Refresca toda la apantalla
        AdfFacesContext.getCurrentInstance().addPartialTarget(panelPE);
        AdfFacesContext.getCurrentInstance().addPartialTarget(panelAcordionPestañas);
        //Limpia toda la pagina
        //refreshPage();
        


    }
    
    public static void refreshPage(){
       FacesContext fc = FacesContext.getCurrentInstance();
       String refreshpage = fc.getViewRoot().getViewId();
        ViewHandler ViewH = fc.getApplication().getViewHandler();
        UIViewRoot UIV = ViewH.createView(fc, refreshpage);
        UIV.setViewId(refreshpage);
        fc.setViewRoot(UIV);
    }
    
    /** Método que nos dice donde estamos parados*/
    public int ubicacionPanel() {
        int p = 0;
        if (crgenerales.isDisclosed()) {
            //System.out.println("Generales: " + crgenerales.isDisclosed());
            p = 1;
        } else if (sucexp.isDisclosed()) {
            //System.out.println("Suc - Exp : " + sucexp.isDisclosed());
            p = 2;
            //CatalogosBean cB = new CatalogosBean();

        } else if(numpartida.isDisclosed()){
            //System.out.println("Numero de Partida : " + numpartida.isDisclosed());
            p = 3;
        }else{
            p = 4;    
        }
        return p;

    }

    /*public void addJavascript(String cmd) {
        FacesContext ctx = FacesContext.getCurrentInstance();
        ExtendedRenderKitService erks = null;
        erks = org.apache.myfaces.trinidad.util.Service.getRenderKitService(ctx, ExtendedRenderKitService.class);
        erks.addScript(ctx, cmd);
    }*/
    
    public String addSucursalExpendio() {
        // validar sucursal
        String expendio = null;
        if (JSFUtils.resolveExpression("#{bindings.sucursalStr1.inputValue}") == null &&
            JSFUtils.resolveExpression("#{bindings.expendioStr1.inputValue}") == null) {
            JSFUtils.addErrorMessage("Ingrese una Sucursal-Expendio valido");
        } else if (JSFUtils.resolveExpression("#{bindings.sucursalStr1.inputValue}") == null ||
                   JSFUtils.resolveExpression("#{bindings.expendioStr1.inputValue}") == null) {
            JSFUtils.addErrorMessage("Ingrese un Expendio valido");
        } else {

            //System.out.println("sucursalStr1 =" + JSFUtils.resolveExpression("#{bindings.sucursalStr1.inputValue}"));

            if (ADFUtil.evaluateEL("#{bindings.expendioStr1.inputValue}") != null) {
                expendio = (String) ADFUtil.evaluateEL("#{bindings.expendioStr1.inputValue}");
            } else {
                System.out.println("El expendioStr1 no tiene valor");
            }

            //System.out.println("expendioStr1 =" + expendio);

            String numeroExpendio = "";

            if (expendio.equals("Todos")) {
                numeroExpendio = "Todos";
            } else {
                List<SelectItem> listaExpendio = null;
                if (ADFUtil.evaluateEL("#{backingBeanScope.CatalogosBean.listCatalogoExpendio}") != null) {
                    listaExpendio =
                        (List<SelectItem>) ADFUtil.evaluateEL("#{backingBeanScope.CatalogosBean.listCatalogoExpendio}");
                } else {

                    System.out.println("No existe una lista de expendios");
                }
                int i = 0;
                while (i < listaExpendio.size()) {
                    SelectItem itemCbo = listaExpendio.get(i);
                    if (expendio.equals(itemCbo.getValue().toString())) {
                        numeroExpendio =
                            itemCbo.getLabel().toString().substring(0, itemCbo.getLabel().toString().indexOf(" "));
                        //System.out.println("encontrado :"+numeroExpendio );
                        break;
                    }
                    i++;
                }
            }


            //ejecutar metodo
            BindingContainer bindings = getBindings();
            OperationBinding operationBinding = bindings.getOperationBinding("ingresarTabSucExp");
            operationBinding.getParamsMap().put("numeroExpendio", numeroExpendio);

            String op = (String) operationBinding.execute();
            if (op.equalsIgnoreCase("Fail")) {
                JSFUtils.addErrorMessage("No se permiten registros duplicados en esta tabla");
            }

        }
        return null;
    }

    public String addNumeroPartida() {
        if (inputTextNumeroPartida.getValue() == null || inputTextNumeroPartida.getValue().equals("")) {
            JSFUtils.addErrorMessage("Ingrese un número de partida valido");
        } else {
            
            String cadena = inputTextNumeroPartida.getValue().toString();
            
            if (esNumero(cadena) == true)
            {
                String numPartida = inputTextNumeroPartida.getValue().toString();
                //System.out.println("Num part text = "+numPartida+"");
                ADFUtil util = new ADFUtil();
                List listaTabNumPart = util.attributeListForIterator("TabNumPartVO1Iterator", "NumPartida");
                //System.out.println("tam lista Partidas= "+listaTabNumPart.size()+"");
                //Valida duplicados
                for (int a = 0; a < listaTabNumPart.size(); a++) {
                    //System.out.println("RowTabSucExp: "+listaTabNumPart.get(a)+"");
                    if (listaTabNumPart.get(a).toString().equals(numPartida)) {
                        JSFUtils.addErrorMessage("No se permiten registros duplicados en esta tabla");
                        return null;
                    }
                }
                //Ingresa a tabla
                BindingContainer bindings = getBindings();
                OperationBinding operationBinding = bindings.getOperationBinding("ingresarTabNumPart");
                operationBinding.getParamsMap().put("numPartida", numPartida);
                operationBinding.getParamsMap().put("tipo", "simple");
                
                String op = (String) operationBinding.execute();
                if (op.equalsIgnoreCase("Fail")) {
                    JSFUtils.addErrorMessage("Error en el número de partida, favor de ingresar un folio valido entre 7-9 dígitos");
                }
                inputTextNumeroPartida.setValue("");
                AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextNumeroPartida);

            }
            else
            {
                System.out.println ("Entrada no válida, no introdujo un número"); 
                JSFUtils.addErrorMessage("Error en el número de partida, favor de ingresar un folio valido entre 7-9 dígitos");
                inputTextNumeroPartida.setValue(null);
                AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextNumeroPartida);
            }
          
        }

        return null;
    }
    
    //-------llenar tabla de partidas con un txt o un csv
    public void fileVCL(ValueChangeEvent valueChangeEvent) {
        
        System.out.println("Iniciar cargar archivo");
        ADFUtil util = new ADFUtil();
        List<UploadedFile> file = (List<UploadedFile>) valueChangeEvent.getNewValue();
        UploadedFile UnicoFile = file.get(0);
        
        //System.out.println("File: "+file+"");
        BindingContainer bindings = getBindings();
        //--solo archivos CSV o TXT
        Boolean banderaFile = true;
        Boolean banderaTipo = false;
        String msg = "";
        if (UnicoFile.getFilename().toString().endsWith(".csv") || UnicoFile.getFilename().toString().endsWith(".txt")) {
            banderaTipo = true;
            System.out.println("Archivo valido");
        } else {
            msg = "Los tipos de archivos compatibles son .csv y .txt";
        }

        //recuperar lista de Archivos
        List listaNA = util.attributeListForIterator("ListaArchivosVO1Iterator", "Nombre");
        //System.out.println("listaNA.size: "+listaNA.size()+"");
        for (int k = 0; k < listaNA.size(); k++) {
            if (listaNA.get(k).equals(UnicoFile.getFilename().toString())) {
                banderaFile = false;
                msg = "El archivo " + UnicoFile.getFilename().toString() + " ya fue ingresado ";
            }
        }
        //-------------------------
        if (file != null && banderaFile && banderaTipo) {
            try {
                //System.out.println("inputStream: " + file.getInputStream().toString()+ "");

                //------leer Archivo--
                InputStream in = (InputStream) UnicoFile.getInputStream();
                BufferedReader reader = new BufferedReader(new InputStreamReader(in));
                String line;
                String[] arr;

                while ((line = reader.readLine()) != null) {

                    //System.out.println(line+"\n");
                    if (line.indexOf(",") != -1) {
                        arr = line.split(",");
                        for (int x = 0; x < arr.length; x++) {
                            if (arr[x].length() > 1) {
                                OperationBinding operationBinding = bindings.getOperationBinding("ingresarTabNumPart");
                                operationBinding.getParamsMap().put("numPartida", arr[x]);
                                operationBinding.getParamsMap().put("tipo", "file");
                                System.out.print("VCL Partida : " + arr[x]  + " ");
                                operationBinding.execute();
                            }
                        }


                    } else {

                        OperationBinding operationBinding = bindings.getOperationBinding("ingresarTabNumPart");
                        operationBinding.getParamsMap().put("numPartida", line);
                        operationBinding.getParamsMap().put("tipo", "file");
                        System.out.print("VCL Partida : " + line +" ");
                        operationBinding.execute();
                    }

                }
                reader.close();
                //Agregar Nombre del archivo a la lista
                OperationBinding op = bindings.getOperationBinding("addFileName");
                op.getParamsMap().put("nombre", UnicoFile.getFilename().toString());
                op.execute();
                //----refrescar pagina
                cagarFile.setValue(null);
                //Refrescar el componente de la tabla:
                AdfFacesContext.getCurrentInstance().addPartialTarget(tablaNumPart);
                AdfFacesContext.getCurrentInstance().addPartialTarget(panelGroupLayoutNumeroPartidas);
            } catch (IOException e) {
                System.out.println("E: " + e + "");
            }
        } else {
            JSFUtils.addErrorMessage(msg);
            cagarFile.setValue(null);
        }

    }

    public String limpiarTalbSucExpButton() {
        // Add event code here...
        BindingContainer bindings = getBindings();
        OperationBinding operationBinding = bindings.getOperationBinding("cleanTabNumPart");
        operationBinding.execute();
        OperationBinding opLimpiarFileList = bindings.getOperationBinding("cleanListaArchivos");
        opLimpiarFileList.execute();
        //Obtener el componente t2 y refrescarlo
        AdfFacesContext.getCurrentInstance().addPartialTarget(tablaNumPart);
        return null;
    }
        
    public String limpiarTabDescartarNumPart() {
        // Add event code here...
        BindingContainer bindings = getBindings();
        OperationBinding operationBinding = bindings.getOperationBinding("cleanTabNumPartDescartar");
        operationBinding.execute();
        OperationBinding opLimpiarFileList = bindings.getOperationBinding("cleanListaArchivosNumPartDescartar");
        opLimpiarFileList.execute();
        //Btn Desmarcar
        /*btnDesmarcar.setVisible(false);*/
        //AdfFacesContext.getCurrentInstance().addPartialTarget(btnDesmarcar);
        //Limpiar por codigo addJavascript("refreshEmployeeHomePage();");
        return null;
    }

    public void vclExpendioGenerales(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        //System.out.println("smcExpendios: "+gExpendios.getValue()+"");
        if (gExpendios.getValue() != null) {
            ArrayList listExp = (ArrayList) gExpendios.getValue();
            //System.out.println("arg.length:"+listExp.size()+"");
            String concatExp = "";
            for (int h = 0; h < listExp.size(); h++) {
                //System.out.println(listExp.get(h));
                concatExp = concatExp + listExp.get(h) + ",";
            }
            String exp = concatExp.substring(0, concatExp.length() - 1);
            //--agregar el valor de los expendios
            ADFUtil.setEL("#{bindings.Expendio.inputValue}", exp);
        }

    }

    public void vclSubRamo(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        //System.out.println("gsubRamo: "+gsubRamo.getValue()+"");
        if (gsubRamo.getValue() != null) {
            ArrayList listSR = (ArrayList) gsubRamo.getValue();
            //System.out.println("arg.length:"+listSR.size()+"");
            String concatSR = "";
            for (int h = 0; h < listSR.size(); h++) {
                //System.out.println(listSR.get(h));
                concatSR = concatSR + listSR.get(h) + ",";
            }
            String sr = concatSR.substring(0, concatSR.length() - 1);
            //--agregar el valor de las sucursales
            ADFUtil.setEL("#{bindings.Subramo.inputValue}", sr);
        }
    }

    public void vclTipoSucGral(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        if (valueChangeEvent.getNewValue().equals("1")) {
            /*Unica*/
            panelSucUni.setVisible(true);
            panelSucMulti.setVisible(false);
            shuttleSucursales.setValue(null);
        }
        if (valueChangeEvent.getNewValue().equals("2")) {
            /*Multiple*/
            panelSucMulti.setVisible(true);
            panelSucUni.setVisible(false);
            ADFUtil.setEL("#{bindings.Sucursal.inputValue}", null);
        }
    }

  public String generarURL(String tipo, String ser) {
        
        try{
        ResourceBundle rb = null;
        StringBuilder url = new StringBuilder();
        
        if(tipo.equals("Cat")){
            rb = ResourceBundle.getBundle("otn.utilitarios.ConcentradoraCatalogos");    
        }else{
            rb = ResourceBundle.getBundle("otn.utilitarios.ConcentradoraEnvioCriterios");
        }
        
        if(ser.equals("Dev")){
            url.append(rb.getString("url.dev.host"));
            url.append(rb.getString("url.dev.port"));
            url.append(rb.getString("url.dev.prefijo"));
            
        }else if(ser.equals("Test")){
            url.append(rb.getString("url.test.host"));
            url.append(rb.getString("url.test.port"));
            url.append(rb.getString("url.test.prefijo"));
            
        }else if(ser.equals("Dr")){
            url.append(rb.getString("url.dr.host"));
            url.append(rb.getString("url.dr.port"));
            url.append(rb.getString("url.dr.prefijo"));
        }else{
            url.append(rb.getString("url.prod.host"));
            url.append(rb.getString("url.prod.port"));
            url.append(rb.getString("url.prod.prefijo"));
            
        }
            
        System.out.println("=========== URL: "+ser+ " " + url);
        return url.toString();
            
        }catch(Exception e){
            System.out.println("Error en la conexion del host, favor de verificar el archivo de Popiedades");
            
        }
        
        
    return null;  
        
    }

    // Start - Defect : Bug al mandar Fecha Almoneda vacia Author: Raul G. Date: 21/12/2015
    public void vclOperadorFechaAlmo(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        String OpF = null;
        if (ADFUtil.evaluateEL("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}") != null) {
            OpF = (String) ADFUtil.evaluateEL("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}");
        } else {
            OpF = "-Ninguno-";
        }

        if (!OpF.equals("-Ninguno-")) {
            ADFUtil.setEL("#{bindings.FechaIngresoAlmonedaFin.inputValue}", null);
            ADFUtil.setEL("#{bindings.FechaIngresoAlmoneda.inputValue}", null);
            ADFUtil.setEL("#{bindings.OperadorFechaIngresoAlmoneda.inputValue}", null);
            AdfFacesContext.getCurrentInstance().addPartialTarget(compFechaAlmoneda);
        }


    }
    // End - Defect : Se implemente el metodo con la finalidad limpar los componetes referentes a Fecha Almoneda y evitar el bug de envio de Fechas Almmoneda Author : Raul G. Date: 21/12/2013

//    public void vclRefrendos(ValueChangeEvent valueChangeEvent) {
//        // Add event code here...
//        //String cadena = (String) object.toString();
//        String cadena = valueChangeEvent.getNewValue().toString();
//        int index = cadena.indexOf(",,");
//        //System.out.println(index);
//        if (index == -1) {
//            if (!cadena.equals(null)) {
//
//                //Pattern pat = Pattern.compile("^[0-9]+[\\,[0-9]]+\\d$");
//                Pattern pat = Pattern.compile("^[0-9]+(\\,[0-9]+)*");
//                Matcher mat = pat.matcher(cadena);
//
//                if (mat.matches()) {
//                    //System.out.println("Cadena valida = " + cadena);
//                    ADFUtil.setEL("#{bindings.Refrendos.inputValue}", cadena.toString());
//                } else {
//                    //System.out.println("Los Refrendos deben seguir el siguiente patron1 : #,#,...,#");
//                    JSFUtils.addErrorMessage("Los Refrendos deben seguir el siguiente patron : #,#,...,#");
//                    /*inputRefres2.setValue(null);
//                    AdfFacesContext.getCurrentInstance().addPartialTarget(inputRefres2);*/                
//                }
//
//            }
//        } 
//        else {
//            //System.out.println("Los Refrendos deben seguir el siguiente patron2 : #,#,...,#");
//            JSFUtils.addErrorMessage("Los Refrendos deben seguir el siguiente patron : #,#,...,#");
//            /*inputRefres2.setValue(null);
//            AdfFacesContext.getCurrentInstance().addPartialTarget(inputRefres2);*/
//        }
//
//    }

//    public void vclFactor(ValueChangeEvent valueChangeEvent) {
//        // Add event code here...
//        //System.out.println("selectecFactorCon: "+selectecFactorCon.getValue()+"");
//        if (selectecFactorCon.getValue() != null) {
//            ArrayList listFactor = (ArrayList) selectecFactorCon.getValue();
//            //System.out.println("arg.length:"+listFactor.size()+"");
//            String concatFactor = "";
//            for (int h = 0; h < listFactor.size(); h++) {
//                //System.out.println(listFactor.get(h));
//                concatFactor = concatFactor + listFactor.get(h) + ",";
//            }
//            String sr = concatFactor.substring(0, concatFactor.length() - 1);
//
//            ADFUtil.setEL("#{bindings.Factor.inputValue}", sr);
//            //System.out.println("Factores: "+sr);
//        }
//    }
    
    public void disclosListenerDesmarcar(DisclosureEvent disclosureEvent) {
        //Btn Simular deshabilitado
            /*btnSimulaMarcado.setDisabled(true);
            AdfFacesContext.getCurrentInstance().addPartialTarget(btnSimulaMarcado);*/
        //Btn Enviar Criterios
            /*btnEnvioCriterios.setDisabled(true);
            AdfFacesContext.getCurrentInstance().addPartialTarget(btnEnvioCriterios);*/
        //RadioGrop : proyecto y etapa deshabilitado
            selectedRadioGroupEsNuevaEtapa.setDisabled(true);
            AdfFacesContext.getCurrentInstance().addPartialTarget(selectedRadioGroupEsNuevaEtapa);
        //Fecha ejecucion :
            compFechaEjecucion.setDisabled(true);
            AdfFacesContext.getCurrentInstance().addPartialTarget(compFechaEjecucion);
        //Leyenda : proyecto y etapa deshabilitado
        //outPutFormattedParametrosObli.setVisible(false);
            /*outPutFormattedParametrosObli.setValue("Los campos marcados con (*) serán omitidos para esta opción");
            AdfFacesContext.getCurrentInstance().addPartialTarget(outPutFormattedParametrosObli);*/
        //Limpiar componentes Proyecto y Etapa
        //RadioButton
            ADFUtil.setEL("#{bindings.NuevaEtapa.inputValue}", null);
        //Combo : Etapa
            ADFUtil.setEL("#{bindings.EtapaCbo.inputValue}", null);
            selectOneChoiseEtapa.setVisible(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(selectOneChoiseEtapa);
        //Etiqueta : Etapa
            ADFUtil.setEL("#{bindings.Etapa1.inputValue}", null);
            inputTextEtapa.setVisible(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextEtapa);
         //Etiqueta: Sub Etapa
            ADFUtil.setEL("#{bindings.SubEtapa.inputValue}", null);
            inputTextSubEtapa.setVisible(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(inputTextSubEtapa);
            System.out.println("Componentes Desactivados");
        
    }

    public void disclosListenerCritGen(DisclosureEvent disclosureEvent) {
        
        //Btn Simular deshabilitado
            /*btnSimulaMarcado.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(btnSimulaMarcado);*/
        //Btn Enviar Criterios
            /*btnEnvioCriterios.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(btnEnvioCriterios);   */ 
        //RadioGrop : proyecto y etapa deshabilitado
            selectedRadioGroupEsNuevaEtapa.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(selectedRadioGroupEsNuevaEtapa);
        //Fecha ejecucion :
            compFechaEjecucion.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(compFechaEjecucion);
        //Leyenda : proyecto y etapa deshabilitado
            /*outPutFormattedParametrosObli.setValue("Los campos marcados con (*) son de carácter obligatorio");
            AdfFacesContext.getCurrentInstance().addPartialTarget(outPutFormattedParametrosObli);*/
        
        
    }

    public void disclosListenerSucExp(DisclosureEvent disclosureEvent) {
        
        //Btn Simular deshabilitado
            /*btnSimulaMarcado.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(btnSimulaMarcado);*/
        //Btn Enviar Criterios
            /*btnEnvioCriterios.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(btnEnvioCriterios);*/    
        //RadioGrop : proyecto y etapa deshabilitado
            selectedRadioGroupEsNuevaEtapa.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(selectedRadioGroupEsNuevaEtapa);
        //Fecha ejecucion :
            compFechaEjecucion.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(compFechaEjecucion);
        //Leyenda : proyecto y etapa deshabilitado
            /*outPutFormattedParametrosObli.setValue("Los campos marcados con (*) son de carácter obligatorio");
            AdfFacesContext.getCurrentInstance().addPartialTarget(outPutFormattedParametrosObli);*/
        
        
    }

    public void disclosListenerNumPart(DisclosureEvent disclosureEvent) {
        
        //Btn Simular habilitado
            /*btnSimulaMarcado.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(btnSimulaMarcado);*/
        //Btn Enviar Criterios
            /*btnEnvioCriterios.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(btnEnvioCriterios);*/    
        //RadioGrop : proyecto y etapa deshabilitado
            selectedRadioGroupEsNuevaEtapa.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(selectedRadioGroupEsNuevaEtapa);
        //Fecha ejecucion :
            compFechaEjecucion.setDisabled(false);
            AdfFacesContext.getCurrentInstance().addPartialTarget(compFechaEjecucion);
        //Leyenda : proyecto y etapa deshabilitado
            /*outPutFormattedParametrosObli.setValue("Los campos marcados con (*) son de carácter obligatorio");
            AdfFacesContext.getCurrentInstance().addPartialTarget(outPutFormattedParametrosObli);*/
            
            
        
    }
    
    public void loadFileVCLDesmarcado(ValueChangeEvent valueChangeEvent) {

        ADFUtil util = new ADFUtil();
        UploadedFile file = (UploadedFile) valueChangeEvent.getNewValue();
        System.out.println("File: " + file.getFilename());
        BindingContainer bindings = getBindings();
        //--solo archivos CSV o TXT
        Boolean banderaFile = true;
        Boolean banderaTipo = false;
        String msg = "";
        if (file.getFilename().toString().endsWith(".csv") || file.getFilename().toString().endsWith(".txt")) {
            banderaTipo = true;
        } else {
            msg = "Los tipos de archivos compatibles son .csv y .txt";
        }

        //recuperar lista de Archivos
        List listaNA = util.attributeListForIterator("ListaArchiDescartarVO1Iterator", "Nombre");
        //System.out.println("listaNA.size: "+listaNA.size()+"");
        for (int k = 0; k < listaNA.size(); k++) {
            if (listaNA.get(k).equals(file.getFilename().toString())) {
                banderaFile = false;
                msg = "El archivo " + file.getFilename().toString() + " ya fue ingresado ";
            }
        }
        //-------------------------
        if (file != null && banderaFile && banderaTipo) {
            try {
                //System.out.println("inputStream: " + file.getInputStream().toString()+ "");

                //------leer Archivo--
                InputStream in = (InputStream) file.getInputStream();
                BufferedReader reader = new BufferedReader(new InputStreamReader(in));
                String line;
                String[] arr;

                while ((line = reader.readLine()) != null) {

                    //System.out.println(line+"\n");
                    if (line.indexOf(",") != -1) {
                        arr = line.split(",");
                        for (int x = 0; x < arr.length; x++) {
                            if (arr[x].length() > 1) {
                                OperationBinding operationBinding = bindings.getOperationBinding("ingresarTabPartDesc");
                                operationBinding.getParamsMap().put("numPartidaDesmarcar", arr[x]);
                                operationBinding.execute();
                            }
                        }


                    } else {

                        OperationBinding operationBinding = bindings.getOperationBinding("ingresarTabPartDesc");
                        operationBinding.getParamsMap().put("numPartidaDesmarcar", line);
                        operationBinding.execute();
                    }

                }
                reader.close();
                //Agregar Nombre del archivo a la lista
                OperationBinding op = bindings.getOperationBinding("addFileNameNumPartDescartar");
                op.getParamsMap().put("nombre", file.getFilename().toString());
                op.execute();
                //----refrescar pagina
                /*cargaFileDesmarcado.setValue(null);*/
                
                /*btnDesmarcar.setVisible(true);*/
                //AdfFacesContext.getCurrentInstance().addPartialTarget(btnDesmarcar);
                
                //Limpiar por codigo addJavascript("refreshEmployeeHomePage();");
            } catch (IOException e) {
                System.out.println("E: " + e + "");
            }
        } else {
            JSFUtils.addErrorMessage(msg);
            /*cargaFileDesmarcado.setValue(null);*/
        }

    }
  
    
    public void setInputRefres2(RichInputText inputRefres2) {
        this.inputRefres2 = inputRefres2;
    }

    public RichInputText getInputRefres2() {
        return inputRefres2;
    }

    public RichInputDate getCompFechaAlmonedaFin() {
        return compFechaAlmonedaFin;
    }

    public void setOperadorFechaAlmoChoiseList(RichSelectOneChoice operadorFechaAlmoChoiseList) {
        this.operadorFechaAlmoChoiseList = operadorFechaAlmoChoiseList;
    }

    public RichSelectOneChoice getOperadorFechaAlmoChoiseList() {
        return operadorFechaAlmoChoiseList;
    }

    public void setCanalIngresoChoiseList(RichSelectOneChoice canalIngresoChoiseList) {
        this.canalIngresoChoiseList = canalIngresoChoiseList;
    }

    public RichSelectOneChoice getCanalIngresoChoiseList() {
        return canalIngresoChoiseList;
    }

    public void setCompFechaAlmonedaFin(RichInputDate compFechaAlmonedaFin) {
        this.compFechaAlmonedaFin = compFechaAlmonedaFin;
    }


    public void setMensajeError(String mensajeError) {
        this.mensajeError = mensajeError;
    }

    public String getMensajeError() {
        return mensajeError;
    }

    public void setErrorPopup(RichPopup errorPopup) {
        this.errorPopup = errorPopup;
    }

    public RichPopup getErrorPopup() {
        return errorPopup;
    }

    public void setPopupMensajes(RichPopup popupMensajes) {
        this.popupMensajes = popupMensajes;
    }

    public RichPopup getPopupMensajes() {
        return popupMensajes;
    }

    public void setSelectedRadioGroupEsNuevaEtapa(RichSelectOneRadio selectedRadioGroupEsNuevaEtapa) {
        this.selectedRadioGroupEsNuevaEtapa = selectedRadioGroupEsNuevaEtapa;
    }

    public RichSelectOneRadio getSelectedRadioGroupEsNuevaEtapa() {
        return selectedRadioGroupEsNuevaEtapa;
    }

    public BindingContainer getBindings() {
        return BindingContext.getCurrent().getCurrentBindingsEntry();
    }

    public void setSelectOneChoiseEtapa(RichSelectOneChoice selectOneChoiseEtapa) {
        this.selectOneChoiseEtapa = selectOneChoiseEtapa;
    }

    public RichSelectOneChoice getSelectOneChoiseEtapa() {
        return selectOneChoiseEtapa;
    }

    public void setInputTextEtapa(RichInputText inputTextEtapa) {
        this.inputTextEtapa = inputTextEtapa;
    }

    public RichInputText getInputTextEtapa() {
        return inputTextEtapa;
    }

    public void setInputTextSubEtapa(RichInputText inputTextSubEtapa) {
        this.inputTextSubEtapa = inputTextSubEtapa;
    }

    public RichInputText getInputTextSubEtapa() {
        return inputTextSubEtapa;
    }

    public void setCompFechaSolicitud(RichInputDate compFechaSolicitud) {
        this.compFechaSolicitud = compFechaSolicitud;
    }

    public RichInputDate getCompFechaSolicitud() {
        return compFechaSolicitud;
    }

    public void setCompFechaEjecucion(RichInputDate compFechaEjecucion) {
        this.compFechaEjecucion = compFechaEjecucion;
    }

    public RichInputDate getCompFechaEjecucion() {
        return compFechaEjecucion;
    }

    public void setCompFechaAlmoneda(RichInputDate compFechaAlmoneda) {
        this.compFechaAlmoneda = compFechaAlmoneda;
    }

    public RichInputDate getCompFechaAlmoneda() {
        return compFechaAlmoneda;
    }

    public void setCrgenerales(RichShowDetailItem crgenerales) {
        this.crgenerales = crgenerales;
    }

    public RichShowDetailItem getCrgenerales() {
        return crgenerales;
    }

    public void setSucexp(RichShowDetailItem sucexp) {
        this.sucexp = sucexp;
    }

    public RichShowDetailItem getSucexp() {
        return sucexp;
    }

    public void setNumpartida(RichShowDetailItem numpartida) {
        this.numpartida = numpartida;
    }

    public RichShowDetailItem getNumpartida() {
        return numpartida;
    }

    public void setAddNumeroPartida(RichButton addNumeroPartida) {
        this.addNumeroPartida = addNumeroPartida;
    }

    public RichButton getAddNumeroPartida() {
        return addNumeroPartida;
    }

    public void setInputTextNumeroPartida(RichInputText inputTextNumeroPartida) {
        this.inputTextNumeroPartida = inputTextNumeroPartida;
    }

    public RichInputText getInputTextNumeroPartida() {
        return inputTextNumeroPartida;
    }

    public void setCagarFile(RichInputFile cagarFile) {
        this.cagarFile = cagarFile;
    }

    public RichInputFile getCagarFile() {
        return cagarFile;
    }

    public void setPanelPE(RichPanelFormLayout panelPE) {
        this.panelPE = panelPE;
    }

    public RichPanelFormLayout getPanelPE() {
        return panelPE;
    }

    public void setFechasPopup(RichPopup fechasPopup) {
        this.fechasPopup = fechasPopup;
    }

    public RichPopup getFechasPopup() {
        return fechasPopup;
    }

    public void setPopupConfirmar(RichPopup popupConfirmar) {
        this.popupConfirmar = popupConfirmar;
    }

    public RichPopup getPopupConfirmar() {
        return popupConfirmar;
    }

    public void setPopupEtapa(RichPopup popupEtapa) {
        this.popupEtapa = popupEtapa;
    }

    public RichPopup getPopupEtapa() {
        return popupEtapa;
    }

    public void setEtapaNext(RichOutputText etapaNext) {
        this.etapaNext = etapaNext;
    }

    public RichOutputText getEtapaNext() {
        return etapaNext;
    }

    public void setShuttleSucursales(RichSelectManyShuttle shuttleSucursales) {
        this.shuttleSucursales = shuttleSucursales;
    }

    public RichSelectManyShuttle getShuttleSucursales() {
        return shuttleSucursales;
    }

    public void setSelectExpendio(RichSelectOneChoice selectExpendio) {
        this.selectExpendio = selectExpendio;
    }

    public RichSelectOneChoice getSelectExpendio() {
        return selectExpendio;
    }

    public void setSelectSucursal(RichSelectOneChoice selectSucursal) {
        this.selectSucursal = selectSucursal;
    }

    public RichSelectOneChoice getSelectSucursal() {
        return selectSucursal;
    }

    public void setgExpendios(RichSelectManyChoice smcExpendios) {
        this.gExpendios = smcExpendios;
    }

    public RichSelectManyChoice getgExpendios() {
        return gExpendios;
    }

    public void setGsubRamo(RichSelectManyChoice gsubRamo) {
        this.gsubRamo = gsubRamo;
    }

    public RichSelectManyChoice getGsubRamo() {
        return gsubRamo;
    }

    public void setPanelSucUni(RichPanelAccordion panelSucUni) {
        this.panelSucUni = panelSucUni;
    }

    public RichPanelAccordion getPanelSucUni() {
        return panelSucUni;
    }

    public void setPanelSucMulti(RichPanelAccordion panelSucMulti) {
        this.panelSucMulti = panelSucMulti;
    }

    public RichPanelAccordion getPanelSucMulti() {
        return panelSucMulti;
    }

    public void setRgSucursales(RichSelectOneRadio rgSucursales) {
        this.rgSucursales = rgSucursales;
    }

    public RichSelectOneRadio getRgSucursales() {
        return rgSucursales;
    }

    public void vclShuttle(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        AdfFacesContext.getCurrentInstance().addPartialTarget(shuttleSucursales);
    }



    public void setRamoC(RichSelectOneChoice ramoC) {
        this.ramoC = ramoC;
    }

    public RichSelectOneChoice getRamoC() {
        return ramoC;
    }

    public void setPanelVRamoSub(RichPanelGroupLayout panelVRamoSub) {
        this.panelVRamoSub = panelVRamoSub;
    }

    public RichPanelGroupLayout getPanelVRamoSub() {
        return panelVRamoSub;
    }

    public void setSelected(RichSelectOneChoice selected) {
        this.selected = selected;
    }

    public RichSelectOneChoice getSelected() {
        return selected;
    }

    public void setSelectecCanalVenta(RichSelectOneChoice selectecCanalVenta) {
        this.selectecCanalVenta = selectecCanalVenta;
    }

    public RichSelectOneChoice getSelectecCanalVenta() {
        return selectecCanalVenta;
    }

    public void setSelectecFactor(RichSelectOneChoice selectecFactor) {
        this.selectecFactor = selectecFactor;
    }

    public RichSelectOneChoice getSelectecFactor() {
        return selectecFactor;
    }

    public void setSelectecFuente(RichSelectOneChoice selectecFuente) {
        this.selectecFuente = selectecFuente;
    }

    public RichSelectOneChoice getSelectecFuente() {
        return selectecFuente;
    }

    public void setInputRefrendo(RichInputText inputRefrendo) {
        this.inputRefrendo = inputRefrendo;
    }

    public RichInputText getInputRefrendo() {
        return inputRefrendo;
    }

    public void setRadioButtonSucursales(RichSelectOneRadio radioButtonSucursales) {
        this.radioButtonSucursales = radioButtonSucursales;
    }

    public RichSelectOneRadio getRadioButtonSucursales() {
        return radioButtonSucursales;
    }

    public void setSelectEdoPrenda(RichSelectOneChoice selectEdoPrenda) {
        this.selectEdoPrenda = selectEdoPrenda;
    }

    public RichSelectOneChoice getSelectEdoPrenda() {
        return selectEdoPrenda;
    }


    public void setAdfContext(AdfFacesContext adfContext) {
        this.adfContext = adfContext;
    }

    public AdfFacesContext getAdfContext() {
        return adfContext;
    }

    public void setBandera(String bandera) {
        this.bandera = bandera;
    }

    public String getBandera() {
        return bandera;
    }


    public void setPopupLoading(RichPopup popupLoading) {
        this.popupLoading = popupLoading;
    }

    public RichPopup getPopupLoading() {
        return popupLoading;
    }

    public void setTapDesmarcado(RichShowDetailItem tapDesmarcado) {
        this.tapDesmarcado = tapDesmarcado;
    }

    public RichShowDetailItem getTapDesmarcado() {
        return tapDesmarcado;
    }

    public void setBtnSimulaMarcado(RichButton btnSimulaMarcado) {
        this.btnSimulaMarcado = btnSimulaMarcado;
    }

    public RichButton getBtnSimulaMarcado() {
        return btnSimulaMarcado;
    }

     public void setPanelGroupLayoutBotonesFinales(RichPanelGroupLayout panelGroupLayoutBotonesFinales) {
        this.panelGroupLayoutBotonesFinales = panelGroupLayoutBotonesFinales;
    }

    public RichPanelGroupLayout getPanelGroupLayoutBotonesFinales() {
        return panelGroupLayoutBotonesFinales;
    }

    public void setShowDetailItemProyectoEtapa(RichShowDetailItem showDetailItemProyectoEtapa) {
        this.showDetailItemProyectoEtapa = showDetailItemProyectoEtapa;
    }

    public RichShowDetailItem getShowDetailItemProyectoEtapa() {
        return showDetailItemProyectoEtapa;
    }

    public void setOutPutFormattedParametrosObli(RichOutputFormatted outPutFormattedParametrosObli) {
        this.outPutFormattedParametrosObli = outPutFormattedParametrosObli;
    }

    public RichOutputFormatted getOutPutFormattedParametrosObli() {
        return outPutFormattedParametrosObli;
    }
    
    public void setPanelAcordionProyectoEtapa(RichPanelAccordion panelAcordionProyectoEtapa) {
        this.panelAcordionProyectoEtapa = panelAcordionProyectoEtapa;
    }

    public RichPanelAccordion getPanelAcordionProyectoEtapa() {
        return panelAcordionProyectoEtapa;
    }


    public void setCargaFileDesmarcado(RichInputFile cargaFileDesmarcado) {
        this.cargaFileDesmarcado = cargaFileDesmarcado;
    }

    public RichInputFile getCargaFileDesmarcado() {
        return cargaFileDesmarcado;
    }

    public void setBtnEnvioCriterios(RichButton btnEnvioCriterios) {
        this.btnEnvioCriterios = btnEnvioCriterios;
    }

    public RichButton getBtnEnvioCriterios() {
        return btnEnvioCriterios;
    }

    public void setBtnDesmarcar(RichButton btnDesmarcar) {
        this.btnDesmarcar = btnDesmarcar;
    }

    public RichButton getBtnDesmarcar() {
        return btnDesmarcar;
    }

    public void setPopupConfirmaPartidasDescartar(RichPopup popupConfirmaPartidasDescartar) {
        this.popupConfirmaPartidasDescartar = popupConfirmaPartidasDescartar;
    }

    public RichPopup getPopupConfirmaPartidasDescartar() {
        return popupConfirmaPartidasDescartar;
    }


    public void setSelectecFactorCon(RichSelectManyChoice selectecFactorCon) {
        this.selectecFactorCon = selectecFactorCon;
    }

    public RichSelectManyChoice getSelectecFactorCon() {
        return selectecFactorCon;
    }

    

    public void validarEntero(ValueChangeEvent valueChangeEvent) {
        String cadena = valueChangeEvent.getNewValue().toString();
                
                if (esNumero(cadena) == true)
                {
                        System.out.println ("Entrada OK, introdujo el número " + cadena);
                        ADFUtil.setEL("#{bindings.Refrendos.inputValue}", cadena.toString());
                }
                else
                {
                    System.out.println ("Entrada no válida, no introdujo un número"); 
                    JSFUtils.addErrorMessage("El Refrendo deben ser un número de dos diguitos ");
                    inputRefrendo.setValue(null);
                    AdfFacesContext.getCurrentInstance().addPartialTarget(inputRefrendo);
                }
    }

    public static boolean esNumero(String str) {
        return (str.matches("\\d*") && str.equals("")==false);
    }

    public void setTablaNumPart(RichTable tablaNumPart) {
        this.tablaNumPart = tablaNumPart;
    }

    public RichTable getTablaNumPart() {
        return tablaNumPart;
    }

    public void setPanelGroupLayoutNumeroPartidas(RichPanelGroupLayout panelGroupLayoutNumeroPartidas) {
        this.panelGroupLayoutNumeroPartidas = panelGroupLayoutNumeroPartidas;
    }

    public RichPanelGroupLayout getPanelGroupLayoutNumeroPartidas() {
        return panelGroupLayoutNumeroPartidas;
    }

    public void setPanelAcordionPestañas(RichPanelAccordion panelAcordionPestañas) {
        this.panelAcordionPestañas = panelAcordionPestañas;
    }

    public RichPanelAccordion getPanelAcordionPestañas() {
        return panelAcordionPestañas;
    }

    public void cargarArchivoTest(ValueChangeEvent valueChangeEvent) {
        // Add event code here...
        System.out.println("LLega al BeakingBean");
    }


    
}
