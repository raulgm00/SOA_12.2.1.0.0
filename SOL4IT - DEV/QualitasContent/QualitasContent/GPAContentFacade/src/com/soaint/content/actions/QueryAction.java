package com.soaint.content.actions;

import com.soaint.content.common.ConstantesComunes;
import com.soaint.content.common.ConstantesMetadatos;
import com.soaint.content.common.ConstantesServicios;
import com.soaint.content.common.ContentProperties;
import com.soaint.content.model.Documento;
import com.soaint.content.model.GenericItem;
import com.soaint.content.model.ListaDocumentos;

import com.soaint.content.model.TipoDocumentoTipo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.ws.BindingProvider;

import qualitas.ws.invocations.cs.InvocationsCS;

public class QueryAction {
    

    public static void main(String args[]){
        String numeroSolicitud = "GPA011704400";
        System.out.println( "Busqueda=" + numeroSolicitud );       
        
        ListaDocumentos result = getDocumentos(numeroSolicitud);
        System.out.println( "Docs encontrados:" + result.size() );       
        Iterator it = result.iterator();
        Documento doc = null;
        while(it.hasNext()){
            doc = (Documento)it.next();
            System.out.println( "  >>:" + doc.getDID() + ":" + doc.getDDocName() );       
            
            
            }
        
        //DeleteAction.deleteDocs(result);
    }
        
    
    public static ListaDocumentos  getDocumentos(String numeroSolicitud/*,  List<Documento> documentosList*/) {
        
        System.out.println( "   ==>           getDocumentos:numeroSolicitud=" + numeroSolicitud );       
        ListaDocumentos documentos;
        List<GenericItem> subtiposDocumento = new ArrayList<GenericItem>();
        
        subtiposDocumento.add( new GenericItem(ConstantesComunes.CONTANCIA_RESIDENCIA_FISCAL_ID , "Constancia de Residencia Fiscal") );  
        subtiposDocumento.add( new GenericItem(ConstantesComunes.FACTURA_ELECTRONICA_ID , "Factura Electrónica") );  
        subtiposDocumento.add( new GenericItem(ConstantesComunes.CONTRATO_ID, "Contrato") );  
        subtiposDocumento.add( new GenericItem(ConstantesComunes.ANEXO_CONTRATO_ID , "Anexo de Contrato") );  
        subtiposDocumento.add( new GenericItem(ConstantesComunes.COMPROBANTE_PAGO_ID ,"Comprobante de Pago" ) );  
     
        /*
         * 
         */
        String query =
            ConstantesMetadatos.DDOCTYPE + " <matches> `" + ConstantesMetadatos.DDOCTYPE_DOCUMENT +"` <AND>  " +
            ConstantesMetadatos.XXXNUMEROSOLICITUD +" <matches> `" + numeroSolicitud + "`";
        Integer i = -1;
        for (GenericItem subtipo : subtiposDocumento) {
            i++;
            if (i == 0) {
                query += " <AND> (";
            }
            if (i != subtiposDocumento.size() - 1) {
                query += ConstantesMetadatos.XXXSUBTIPODOCUMENTO + " <matches> `" + subtipo.getId() + "` <OR> ";
            } else {
                query += ConstantesMetadatos.XXXSUBTIPODOCUMENTO + " <matches> `" + subtipo.getId() + "`)";
            }
        }
          documentos = advancedSearch(query, null);

            
            return documentos;
            
          }
    


    public static ListaDocumentos advancedSearch(String query, List<GenericItem> idcPropertyList) {
        ListaDocumentos fileList =  new ListaDocumentos();
        
        //RespuestaMetodo respuestaMetodo = new RespuestaMetodo();
        fileList.setExito(true);

        try {

            qualitas.ws.types.cs.search.IdcPropertyList extraProps = new qualitas.ws.types.cs.search.IdcPropertyList();

            qualitas.ws.types.cs.search.IdcProperty prop;

            if (idcPropertyList != null) {
                for (int i = 0; i < idcPropertyList.size(); i++) {
                    prop = new qualitas.ws.types.cs.search.IdcProperty();
                    prop.setName(idcPropertyList.get(i).getId());
                    prop.setValue(idcPropertyList.get(i).getDescription());
                    extraProps.getProperty().add(prop);
                }
            }

            qualitas.ws.proxy.cs.search.SearchSoap searchContentService = InvocationsCS.invocationSearchCS();
            String endpoint = ContentProperties.getProperty(ConstantesServicios.UCM_SEARCH_SERVICE_END_POINT_KEY );
            System.out.println( "   ==>           advancedSearch:ENDPOINT=" + endpoint );
            System.out.println( "   ==>           advancedSearch:QUERY=" + query );
            //TODO: validar si endpoint se puede poner generico de otra manera
            
              //  ConstantesServicios.getConstanteByName(ConstantesServicios.UCM_SEARCH_SERVICE_END_POINT_KEY);
            ((BindingProvider) searchContentService).getRequestContext()
                .put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, endpoint);
            qualitas.ws.types.cs.search.AdvancedSearchResult rsSearchFile =
                searchContentService.advancedSearch(query, null, null, null, extraProps);

            if (rsSearchFile.getStatusInfo().getStatusCode() == 0) {
                for (int i = 0; i < rsSearchFile.getSearchResults().size(); i++) {
                    Documento fileSearc = new Documento();
                    
                    fileSearc.setDID(rsSearchFile.getSearchResults()
                                                     .get(i)
                                                     .getDID().toString());

                    fileSearc.setDocName(rsSearchFile.getSearchResults()
                                                     .get(i)
                                                     .getDDocName());
                    fileSearc.setTitle(rsSearchFile.getSearchResults()
                                                   .get(i)
                                                   .getDDocTitle());
                    fileSearc.setDDocName(rsSearchFile.getSearchResults()
                                                      .get(i)
                                                      .getDDocName());
                    fileSearc.setOriginalName(rsSearchFile.getSearchResults()
                                                          .get(i)
                                                          .getDOriginalName());
                    fileSearc.setExtension(rsSearchFile.getSearchResults()
                                                       .get(i)
                                                       .getDExtension());
                    fileSearc.setOriginalName(rsSearchFile.getSearchResults()
                                                          .get(i)
                                                          .getDDocName() + "." + rsSearchFile.getSearchResults()
                                                                                             .get(i)
                                                                                             .getDExtension());
                    
                    fileSearc.setDRevLabel(rsSearchFile.getSearchResults()
                                                       .get(i)
                                                       .getDRevLabel());
                    fileSearc.setDDocType(rsSearchFile.getSearchResults()
                                                      .get(i)
                                                      .getDDocType());
                    fileSearc.setDDocAuthor(rsSearchFile.getSearchResults()
                                                        .get(i)
                                                        .getDDocAuthor());
                    fileSearc.setDSecurityGroup(rsSearchFile.getSearchResults()
                                                            .get(i)
                                                            .getDSecurityGroup());
                    fileSearc.setDDocAccount(rsSearchFile.getSearchResults()
                                                         .get(i)
                                                         .getDDocAccount());
                    fileSearc.setUrl(rsSearchFile.getSearchResults()
                                                 .get(i)
                                                 .getUrl());

                    for (int j = 0; j < rsSearchFile.getSearchResults()
                                                    .get(i)
                                                    .getCustomDocMetaData()
                                                    .getProperty()
                                                    .size(); j++) {
                        String subtipoDocumento = "";
                        if (ConstantesMetadatos.XXXSUBTIPODOCUMENTO.equalsIgnoreCase(rsSearchFile.getSearchResults()
                                        .get(i)
                                        .getCustomDocMetaData()
                                        .getProperty()
                                        .get(j)
                                        .getName())) {
                            subtipoDocumento = rsSearchFile.getSearchResults()
                                                           .get(i)
                                                           .getCustomDocMetaData()
                                                           .getProperty()
                                                           .get(j)
                                                           .getValue();
                            fileSearc.setNombre(new TipoDocumentoTipo(rsSearchFile.getSearchResults()
                                                                                  .get(i)
                                                                                  .getCustomDocMetaData()
                                                                                  .getProperty()
                                                                                  .get(j)
                                                                                  .getValue(), "",
                                                                      getSubtipoDocumento(rsSearchFile.getSearchResults()
                                                                                                                                   .get(i)
                                                                                                                                   .getCustomDocMetaData()
                                                                                                                                   .getProperty()
                                                                                                                                   .get(j)
                                                                                                                                   .getValue())));
                        }

                        if (ConstantesMetadatos.XXXOBSERVACIONES.equalsIgnoreCase(rsSearchFile.getSearchResults()
                                        .get(i)
                                        .getCustomDocMetaData()
                                        .getProperty()
                                        .get(j)
                                        .getName())) {
                            fileSearc.setObservaciones(rsSearchFile.getSearchResults()
                                                                   .get(i)
                                                                   .getCustomDocMetaData()
                                                                   .getProperty()
                                                                   .get(j)
                                                                   .getValue());
                        }

                        if (ConstantesMetadatos.DINDATE.equalsIgnoreCase(rsSearchFile.getSearchResults()
                                        .get(i)
                                        .getCustomDocMetaData()
                                        .getProperty()
                                        .get(j)
                                        .getName()) 
                                         && !rsSearchFile.getSearchResults()
                                                                                     .get(i)
                                                                                     .getCustomDocMetaData()
                                                                                     .getProperty()
                                                                                     .get(j)
                                                                                     .getValue()
                                                                                     .isEmpty()) {
                            fileSearc.setCreationDate(rsSearchFile.getSearchResults()
                                                                  .get(i)
                                                                  .getCustomDocMetaData()
                                                                  .getProperty()
                                                                  .get(j)
                                                                  .getValue()
                                                                  .split("T")[0]);
                        }
                        
                        if (ConstantesMetadatos.XXXNUMEROFOLIOFISCAL.equalsIgnoreCase(rsSearchFile.getSearchResults()
                                        .get(i)
                                        .getCustomDocMetaData()
                                        .getProperty()
                                        .get(j)
                                        .getName())) {
                            fileSearc.setFolioFiscalFactura(rsSearchFile.getSearchResults()
                                                                   .get(i)
                                                                   .getCustomDocMetaData()
                                                                   .getProperty()
                                                                   .get(j)
                                                                   .getValue());
                        }
                        if (rsSearchFile.getSearchResults()
                                        .get(i)
                                        .getCustomDocMetaData()
                                        .getProperty()
                                        .get(j)
                                        .getName()
                                        .equalsIgnoreCase(ConstantesMetadatos.XXXNUMEROSOLICITUD)) {
                            fileSearc.setNumeroSolicitud(rsSearchFile.getSearchResults()
                                                                   .get(i)
                                                                   .getCustomDocMetaData()
                                                                   .getProperty()
                                                                   .get(j)
                                                                   .getValue());
                        }

                    }
                    fileList.agregar( fileSearc );
                }

            } else {
                fileList.setExito(false);
                fileList.setCodigoRespuesta(rsSearchFile.getStatusInfo()
                                                               .getStatusCode()
                                                               .toString());
                fileList.setErrorGenerico(rsSearchFile.getStatusInfo()
                                                             .getStatusMessage()
                                                             .toString());
            }
        } catch (javax.xml.ws.soap.SOAPFaultException e) {
            e.printStackTrace();
            fileList.setExito(false);
            fileList.setAux( e.getMessage() );
        } catch (Exception e) {
            e.printStackTrace();
            fileList.setExito(false);
            fileList.setAux( e.getMessage() );
        }

        return fileList;
    }    
    

    public static String getTipoDocumento(String subtipoDocumento) {
        String tipoDocumento = "";
        if (ConstantesComunes.CONTANCIA_RESIDENCIA_FISCAL_ID.equals(subtipoDocumento)) {
            tipoDocumento = "Identificación";
        }
        if (ConstantesComunes.FACTURA_ELECTRONICA_ID.equals(subtipoDocumento)) {
            tipoDocumento = "Factura";
        }
        if (ConstantesComunes.CONTRATO_ID.equals(subtipoDocumento) ||
            ConstantesComunes.ANEXO_CONTRATO_ID.equals(subtipoDocumento)) {
            tipoDocumento = "Legal";
        }
        if (ConstantesComunes.COMPROBANTE_PAGO_ID.equals(subtipoDocumento)) {
            tipoDocumento = "Comprobante";
        }
        return tipoDocumento;
    }

    public static String getSubtipoDocumento(String idSubtipoDocumento) {
        String subtipoDocumento = "";
        if (ConstantesComunes.CONTANCIA_RESIDENCIA_FISCAL_ID.equals(idSubtipoDocumento)) {
            subtipoDocumento = "Constancia de Residencia Fiscal";
        }
        if (ConstantesComunes.FACTURA_ELECTRONICA_ID.equals(idSubtipoDocumento)) {
            subtipoDocumento = "Factura Electrónica";
        }
        if (ConstantesComunes.CONTRATO_ID.equals(idSubtipoDocumento)) {
            subtipoDocumento = "Contrato";
        }
        if (ConstantesComunes.ANEXO_CONTRATO_ID.equals(idSubtipoDocumento)) {
            subtipoDocumento = "Anexo de Contrato";
        }
        if (ConstantesComunes.COMPROBANTE_PAGO_ID.equals(idSubtipoDocumento)) {
            subtipoDocumento = "Comprobante de Pago";
        }
        return subtipoDocumento;
    }        
}
