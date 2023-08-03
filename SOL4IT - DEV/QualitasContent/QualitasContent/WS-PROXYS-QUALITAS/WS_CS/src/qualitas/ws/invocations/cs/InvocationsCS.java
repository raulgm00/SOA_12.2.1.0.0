package qualitas.ws.invocations.cs;

import java.util.HashMap;
import java.util.Map;
import javax.xml.ws.BindingProvider;

import qualitas.ws.proxy.cs.getFile.GetFile;
import qualitas.ws.proxy.cs.getFile.GetFileSoap;


public class InvocationsCS {
    public InvocationsCS() {
        super();
    }
    
    private static final String CREDENTIAL_STORE_MAP = "qualitas.pagosAdministrativos";
    private static final String CREDENTIAL_STORE_KEY = "wsUser";

    public static qualitas.ws.proxy.cs.getFile.GetFileSoap invocationGetFileCS(){
        
        qualitas.ws.proxy.cs.getFile.GetFile getFile = new qualitas.ws.proxy.cs.getFile.GetFile();
        qualitas.ws.proxy.cs.getFile.GetFileSoap getFileSoap=getFile.getGetFileSoap();
        Map<String,String> auxMap = getCredentialStoreUser();
       ((BindingProvider)getFileSoap).getRequestContext().put(BindingProvider.USERNAME_PROPERTY,auxMap.get("CREDENTIAL_USER"));
       ((BindingProvider)getFileSoap).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY,auxMap.get("CREDENTIAL_PSW"));
        return getFileSoap;
    }
    
    public static qualitas.ws.proxy.cs.checkIn.CheckInSoap  invocationCheckInCS(){
        
        qualitas.ws.proxy.cs.checkIn.CheckIn chechIn = new qualitas.ws.proxy.cs.checkIn.CheckIn();
        qualitas.ws.proxy.cs.checkIn.CheckInSoap checkInSoap=chechIn.getCheckInSoap();
        Map<String,String> auxMap = getCredentialStoreUser();
       ((BindingProvider)checkInSoap).getRequestContext().put(BindingProvider.USERNAME_PROPERTY,auxMap.get("CREDENTIAL_USER"));
       ((BindingProvider)checkInSoap).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY,auxMap.get("CREDENTIAL_PSW"));
        return checkInSoap;
    }
    
    public static qualitas.ws.proxy.cs.search.SearchSoap  invocationSearchCS(){
        
        qualitas.ws.proxy.cs.search.Search search = new qualitas.ws.proxy.cs.search.Search();
        qualitas.ws.proxy.cs.search.SearchSoap searchSoap=search.getSearchSoap();
        Map<String,String> auxMap = getCredentialStoreUser();
       ((BindingProvider)searchSoap).getRequestContext().put(BindingProvider.USERNAME_PROPERTY,auxMap.get("CREDENTIAL_USER"));
       ((BindingProvider)searchSoap).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY,auxMap.get("CREDENTIAL_PSW"));
        return searchSoap;
    }
    
    
    public static qualitas.ws.proxy.cs.deleteDoc.DeleteFileSoap  invocationDeleteCS(){
        
        qualitas.ws.proxy.cs.deleteDoc.DeleteFile  deleteFile = new qualitas.ws.proxy.cs.deleteDoc.DeleteFile();
        qualitas.ws.proxy.cs.deleteDoc.DeleteFileSoap deleteFileSoap=deleteFile.getDeleteFileSoap();
        Map<String,String> auxMap = getCredentialStoreUser();
       ((BindingProvider)deleteFileSoap).getRequestContext().put(BindingProvider.USERNAME_PROPERTY,auxMap.get("CREDENTIAL_USER"));
       ((BindingProvider)deleteFileSoap).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY,auxMap.get("CREDENTIAL_PSW"));
        return deleteFileSoap;
    }
    
    private static Map<String,String> getCredentialStoreUser(){
        
        Map<String,String> auxMap =  null;
        try{
            //Crear logica para que busque las credenciales

            if(auxMap == null || auxMap.size() == 0)
                throw new Exception();
        }catch(Exception e){
            //Hard Code User and Password (getCredentialStoreUser)
            auxMap = new HashMap<String,String>();
            auxMap.put("CREDENTIAL_USER", "weblogic");
            auxMap.put("CREDENTIAL_PSW", "weblogic1");
        }
        return auxMap;
    }
    
}
