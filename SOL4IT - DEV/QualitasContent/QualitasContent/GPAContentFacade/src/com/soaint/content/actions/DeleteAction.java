package com.soaint.content.actions;

import com.soaint.content.common.ConstantesMetadatos;
import com.soaint.content.common.ConstantesServicios;

import com.soaint.content.common.ContentProperties;
import com.soaint.content.model.Documento;
import com.soaint.content.model.ListaDocumentos;

import java.util.Iterator;
import java.util.logging.Logger;

import javax.xml.ws.BindingProvider;

import qualitas.ws.invocations.cs.InvocationsCS;

public class DeleteAction {
    private static final Logger _log = Logger.getLogger( DeleteAction.class.getName() );


    public static RespuestaMetodo deleteDoc(Integer docId, String docName) {
        RespuestaMetodo respuestaMetodo = new RespuestaMetodo();
        respuestaMetodo.setExito(true);
        
        try {
           
            qualitas.ws.proxy.cs.checkIn.CheckInSoap checkInContentService = InvocationsCS.invocationCheckInCS();
            String endpointCheckIn =ConstantesServicios.getConstanteByName(ConstantesServicios.UCM_CHECKIN_SERVICE_END_POINT_KEY);
            ((BindingProvider) checkInContentService).getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, endpointCheckIn);
            
            qualitas.ws.types.cs.checkIn.IdcPropertyList extraProps =  new qualitas.ws.types.cs.checkIn.IdcPropertyList();
            qualitas.ws.types.cs.checkIn.IdcProperty prop;
            prop = new qualitas.ws.types.cs.checkIn.IdcProperty();
            prop.setName(ConstantesMetadatos.XXXNUMEROSOLICITUD);
            prop.setValue("");
            extraProps.getProperty().add(prop);
            
            prop = new qualitas.ws.types.cs.checkIn.IdcProperty();
            prop.setName(ConstantesMetadatos.XXXNUMEROFOLIOFISCAL);
            prop.setValue("");
            extraProps.getProperty().add(prop);
            
            qualitas.ws.types.cs.checkIn.UpdateDocInfoResult updateDocInfoResult
                =checkInContentService.updateDocInfo(/*Integer.parseInt(doc.getDID())*/docId, 
                                                                                       null, 
                                                                                        docName
                                                                                       /*doc.getDDocName()*/, 
                                                                                       null, null, null, null, null, null, 
                                                                                       extraProps);
            
            if (updateDocInfoResult.getStatusInfo().getStatusCode() != 0) {                    
                respuestaMetodo.setExito(false);
                respuestaMetodo.setCodigoRespuesta(updateDocInfoResult.getStatusInfo().getStatusCode().toString());
                respuestaMetodo.setErrorGenerico(updateDocInfoResult.getStatusInfo().getStatusMessage().toString());                    
            }
            
            /*
            if (doc.isXML() && doc.getNombre().getCodigo().equalsIgnoreCase(ConstantesComunes.FACTURA_ELECTRONICA_ID)) {
                
                qualitas.ws.types.cs.checkIn.UpdateDocInfoResult updateDocInfoResult
                    =checkInContentService.updateDocInfo(Integer.parseInt(doc.getDID()), null, doc.getDDocName(), null, null, null, null, null, null, extraProps);
                
                if (updateDocInfoResult.getStatusInfo().getStatusCode() != 0) {                    
                    respuestaMetodo.setExito(false);
                    respuestaMetodo.setCodigoRespuesta(updateDocInfoResult.getStatusInfo().getStatusCode().toString());
                    respuestaMetodo.setErrorGenerico(updateDocInfoResult.getStatusInfo().getStatusMessage().toString());                    
                }
                
            } else {
                
                qualitas.ws.proxy.cs.deleteDoc.DeleteFileSoap deleteFileSoap = InvocationsCS.invocationDeleteCS();
                String endpoint = ConstantesServicios.getConstanteByName(ConstantesServicios.UCM_DELETEFILE_SERVICE_END_POINT_KEY);
                ((BindingProvider) deleteFileSoap).getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, endpoint);
                
                qualitas.ws.types.cs.deleteDoc.DeleteDocResult deleteDoc = deleteFileSoap.deleteDoc(doc.getDDocName(), null, null);
                
                if (deleteDoc.getStatusInfo().getStatusCode() != 0) {
                    respuestaMetodo.setExito(false);
                    respuestaMetodo.setCodigoRespuesta(deleteDoc.getStatusInfo().getStatusCode().toString());
                    respuestaMetodo.setErrorGenerico(deleteDoc.getStatusInfo().getStatusMessage().toString());
                }
                
            }
            */
        } catch (javax.xml.ws.soap.SOAPFaultException e) {
            _log.severe(e.getMessage());
            e.printStackTrace();
            respuestaMetodo.setExito(false);
        } catch (Exception e) {
            _log.severe(e.getMessage());
            e.printStackTrace();
            respuestaMetodo.setExito(false);
        }
        
        return respuestaMetodo;
    }


    public static RespuestaMetodo deleteDocs( ListaDocumentos docs ) {
        RespuestaMetodo respuestaMetodo = new RespuestaMetodo();
        respuestaMetodo.setExito(true);
        
        try {
           
            qualitas.ws.proxy.cs.checkIn.CheckInSoap checkInContentService = InvocationsCS.invocationCheckInCS();
            //String endpointCheckIn =ConstantesServicios.getConstanteByName(ConstantesServicios.UCM_CHECKIN_SERVICE_END_POINT_KEY);
            String endpoint = ContentProperties.getProperty(ConstantesServicios.UCM_SEARCH_SERVICE_END_POINT_KEY );
            
            
            ((BindingProvider) checkInContentService).getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, endpoint);
            
            Iterator itDocs = docs.iterator();
            Documento docItem = null;
            Integer docId = null;
            String docName = null;
            while( itDocs.hasNext()  ){

                docItem = (Documento)itDocs.next();
                docId = Integer.parseInt( docItem.getDID() );
                docName = docItem.getDocName();
                
                System.out.println( "***     Eliminando Doc<" + docId + ":" +  docName + ">" );
                
                qualitas.ws.types.cs.checkIn.IdcPropertyList extraProps =  new qualitas.ws.types.cs.checkIn.IdcPropertyList();
                qualitas.ws.types.cs.checkIn.IdcProperty prop;
                prop = new qualitas.ws.types.cs.checkIn.IdcProperty();
                prop.setName(ConstantesMetadatos.XXXNUMEROSOLICITUD);
                prop.setValue("GPADELETE");
                extraProps.getProperty().add(prop);
                
                prop = new qualitas.ws.types.cs.checkIn.IdcProperty();
                prop.setName(ConstantesMetadatos.XXXNUMEROFOLIOFISCAL);
                prop.setValue("");
                extraProps.getProperty().add(prop);
                
                
                if(true){
                    qualitas.ws.types.cs.checkIn.UpdateDocInfoResult updateDocInfoResult
                        =checkInContentService.updateDocInfo(/*Integer.parseInt(doc.getDID())*/docId, 
                                                                                               null, 
                                                                                                docName
                                                                                               /*doc.getDDocName()*/, 
                                                                                               null, null, null, null, null, null, 
                                                                                               extraProps);
                    
                    if (updateDocInfoResult.getStatusInfo().getStatusCode() != 0) {                    
                        respuestaMetodo.setExito(false);
                        respuestaMetodo.setCodigoRespuesta(updateDocInfoResult.getStatusInfo().getStatusCode().toString());
                        respuestaMetodo.setErrorGenerico(updateDocInfoResult.getStatusInfo().getStatusMessage().toString());                    
                        System.out.println( "***     Doc<" + docId + ":" +  docName + "> NO PUDO SER ELIMINADO" );
                    } else{
                            System.out.println( "***     Doc<" + docId + ":" +  docName + "> ELIMINADO" );
                            respuestaMetodo.setExito(true);
                        
                        }
                }
                    
            }
            
            /*
            if (doc.isXML() && doc.getNombre().getCodigo().equalsIgnoreCase(ConstantesComunes.FACTURA_ELECTRONICA_ID)) {
                
                qualitas.ws.types.cs.checkIn.UpdateDocInfoResult updateDocInfoResult
                    =checkInContentService.updateDocInfo(Integer.parseInt(doc.getDID()), null, doc.getDDocName(), null, null, null, null, null, null, extraProps);
                
                if (updateDocInfoResult.getStatusInfo().getStatusCode() != 0) {                    
                    respuestaMetodo.setExito(false);
                    respuestaMetodo.setCodigoRespuesta(updateDocInfoResult.getStatusInfo().getStatusCode().toString());
                    respuestaMetodo.setErrorGenerico(updateDocInfoResult.getStatusInfo().getStatusMessage().toString());                    
                }
                
            } else {
                
                qualitas.ws.proxy.cs.deleteDoc.DeleteFileSoap deleteFileSoap = InvocationsCS.invocationDeleteCS();
                String endpoint = ConstantesServicios.getConstanteByName(ConstantesServicios.UCM_DELETEFILE_SERVICE_END_POINT_KEY);
                ((BindingProvider) deleteFileSoap).getRequestContext().put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, endpoint);
                
                qualitas.ws.types.cs.deleteDoc.DeleteDocResult deleteDoc = deleteFileSoap.deleteDoc(doc.getDDocName(), null, null);
                
                if (deleteDoc.getStatusInfo().getStatusCode() != 0) {
                    respuestaMetodo.setExito(false);
                    respuestaMetodo.setCodigoRespuesta(deleteDoc.getStatusInfo().getStatusCode().toString());
                    respuestaMetodo.setErrorGenerico(deleteDoc.getStatusInfo().getStatusMessage().toString());
                }
                
            }
            */
                
        } catch (javax.xml.ws.soap.SOAPFaultException e) {
            _log.severe(e.getMessage());
            e.printStackTrace();
            respuestaMetodo.setExito(false);
        } catch (Exception e) {
            _log.severe(e.getMessage());
            e.printStackTrace();
            respuestaMetodo.setExito(false);
        }
        
        return respuestaMetodo;
    }
        
}
