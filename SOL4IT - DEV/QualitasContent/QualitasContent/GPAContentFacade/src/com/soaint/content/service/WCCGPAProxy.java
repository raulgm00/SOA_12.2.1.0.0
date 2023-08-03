package com.soaint.content.service;

import com.soaint.content.actions.DeleteAction;
import com.soaint.content.actions.QueryAction;
import com.soaint.content.actions.RespuestaMetodo;
import com.soaint.content.model.ListaDocumentos;

import java.util.logging.Logger;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService(name = "WCCGPAProxyService", serviceName = "WCCGPAProxySvc", portName = "WCCGPAProxySvcPort")
public class WCCGPAProxy {

    private static Logger _log =  Logger.getLogger( WCCGPAProxy.class.getName() );

    @WebMethod
    public QueryActionResponse findDocuments(@WebParam(name = "request") QueryActionRequest request){
        _log.info(  "   [CONTENT FACADE::IdSolicitud:"+request.getNroSolicitud()+"] findDocuments"  );       
        QueryActionResponse response =  new QueryActionResponse();

        ListaDocumentos docs = QueryAction.getDocumentos( request.getNroSolicitud() );
        _log.info(  "   [CONTENT FACADE::IdSolicitud:"+request.getNroSolicitud()+"] docs encontrados: " +docs.size()  );       
        response.setDocumentos( docs );
        response.setSuccess( docs.isExito() );
        response.setDetail( docs.getErrorGenerico() );
        return response;
    }


    @WebMethod
    public DeleteActionResponse deleteDocuments(@WebParam(name = "request") DeleteActionRequest request){
        DeleteActionResponse response = new DeleteActionResponse();
        
        ListaDocumentos docs = QueryAction.getDocumentos( request.getNroSolicitud() );
        _log.info(  "   [CONTENT FACADE::IdSolicitud:"+request.getNroSolicitud()+"] Docs objetivos borrar:" + docs.size() );       
        RespuestaMetodo rpta = DeleteAction.deleteDocs(docs); 
        _log.info( "   [CONTENT FACADE::IdSolicitud:"+request.getNroSolicitud()+"] RUTINA TERMINADA #DOCS=>" + docs.size() );       
        response.setSuccess( rpta.isExito() );
        response.setDetail( rpta.getErrorGenerico() );
        response.setCode( rpta.getCodigoRespuesta() );
        return response;
    }    
}
