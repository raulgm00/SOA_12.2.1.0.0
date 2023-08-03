package monte.ws.catalogos;


import beans.PropertiesLoader;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import java.util.ArrayList;

import java.util.ResourceBundle;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import monte.captura.ItemBean;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import org.xml.sax.SAXException;

public class ConcentradoraSubCatalogoWS {
    public ConcentradoraSubCatalogoWS() {
        super();
    }
    
    public ArrayList<ItemBean> getSubCatalogo(String catalogoPadre,String nombre, long tipoP)throws MalformedURLException,IOException 
        {
            //Code to make a webservice HTTP request
            String responseString = "";
            String outputString = "";
            //Consulta Catalogos Nivel 2 "Subcatalogos"
            
            //DR
            //String wsURL = "http://10.30.82.200:8011/NMP/Midas/CatalagoMidasHttpService";
            //PROD
            //String wsURL = "http://10.30.2.38:8011/NMP/Midas/CatalagoMidasHttpService";
            //TEST
            //String wsURL = "http://10.30.6.50:8011/NMP/Midas/CatalagoMidasHttpService";
            //DEV
            //String wsURL = "http://10.30.3.15:17005/NMP/Midas/CatalagoMidasHttpService";
            
            
            //DEV
            String wsURL = generarURL("Cat","Dev");
            //TEST
            //String wsURL = generarURL("Cat","Test");
            //DR
            //String wsURL = generarURL("Cat","Dr");
            //PRODUC
            //String wsURL = generarURL("Cat","Prod");
            
            
            URL url = new URL(wsURL);
            URLConnection connection = url.openConnection();
            HttpURLConnection httpConn = (HttpURLConnection)connection;
            ByteArrayOutputStream bout = new ByteArrayOutputStream();
            
            String xmlInput =
            "<getSubCatalogoRequest>"+
            "<idProyecto>"+tipoP+"</idProyecto>"+
            "<idCatalogoPadre>"+catalogoPadre+"</idCatalogoPadre>"+
            "<nombre>"+nombre+"</nombre>"+
            "</getSubCatalogoRequest>";

            
            byte[] buffer = new byte[xmlInput.length()];
            buffer = xmlInput.getBytes();
            bout.write(buffer);
            byte[] b = bout.toByteArray();
            
            
            
            httpConn.setRequestProperty("Content-Length",
            String.valueOf(b.length));
            httpConn.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
            //httpConn.setRequestProperty("SOAPAction", SOAPAction);
            httpConn.setRequestMethod("POST");
            httpConn.setDoOutput(true);
            httpConn.setDoInput(true);
            OutputStream out = httpConn.getOutputStream();
            //Write the content of the request to the outputstream of the HTTP Connection.
            out.write(b);
            out.close();
            
            //Read the response.
            InputStreamReader isr =
            new InputStreamReader(httpConn.getInputStream());
            BufferedReader in = new BufferedReader(isr);
            //System.out.println("in = " + in);
            //Write the SOAP message response to a String.
            while ((responseString = in.readLine()) != null) {
            outputString = outputString + responseString;
            }
            //System.out.println("outputString = " + outputString);
            //outputString = outputString.replace("?","");
            //System.out.println("outputString = " + outputString);
            
            DocumentBuilder newDocumentBuilder=null;
            try {
            newDocumentBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            } catch (ParserConfigurationException e) {
            }
            
            //outputString = "<?xml version=\"1.0\" encoding=\"UTF-8\"?> <getSubCatalogoResponse>    <descripcion>SubRamo</descripcion>   <id>4</id>   <idCatalogoPadre>3</idCatalogoPadre>   <nombre>subramo</nombre>   <nombreCatalogoPadre>ramo</nombreCatalogoPadre>   <subCatalogo>   <elementoCatalogo>   <descripcion>ACCESORIOS Y ARTICULOS PERSONALES</descripcion>   <id>45</id>   <valor>AAP</valor>   </elementoCatalogo>   <elementoCatalogo>   <descripcion>ARTICULOS DECORATIVOS</descripcion>   <id>46</id>   <valor>AD </valor>   </elementoCatalogo>   <elementoCatalogo>    <descripcion>AUDIO Y VIDEO</descripcion>   <id>47</id>   <valor>AV </valor>   </elementoCatalogo>   <elementoCatalogo>   <descripcion>CAMARAS</descripcion>   <id>48</id>   <valor>CA </valor>   </elementoCatalogo>   <elementoCatalogo>   <descripcion>EQUIPO DE COMPUTO</descripcion>   <id>49</id>   <valor>EC </valor>   </elementoCatalogo>   <elementoCatalogo>         <descripcion>JUEGO DE VIDEO</descripcion>         <id>50</id>         <valor>JV </valor>       </elementoCatalogo>     </subCatalogo></getSubCatalogoResponse>";   
            Document parse=null;
            
            try {
                //parse = newDocumentBuilder.parse(new ByteArrayInputStream(outputString.getBytes("utf-8")));
                parse = newDocumentBuilder.parse(new ByteArrayInputStream(outputString.getBytes()));
            } catch (SAXException e) {
                e.printStackTrace();
            }catch(Exception w){
                w.printStackTrace();
                //System.out.println("Truena al Parsear el outputString");
            }
            
            ArrayList<ItemBean> listItemBean = new ArrayList<ItemBean>();
            if (parse!=null) {
            
            NodeList nList = parse.getElementsByTagName("elementoCatalogo");
           
            
           
            ItemBean itembean;
            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);
                itembean = new ItemBean();
                itembean.setEtiqueta(nNode.getChildNodes().item(5).getTextContent()+" "+nNode.getChildNodes().item(1).getTextContent());
                itembean.setIndice(nNode.getChildNodes().item(3).getTextContent());
                
                                
                listItemBean.add(itembean);
            }
            }
            //System.out.println(" listItemBean.size() " + listItemBean.size() );
            
            
            return listItemBean;
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
    
     /*   public String generarURL(String tipo) {
        PropertiesLoader Obj = new PropertiesLoader();
        String host = (String) Obj.getValor("url.host",tipo);
        String port = (String) Obj.getValor("url.port",tipo);
        String prefijo = (String) Obj.getValor("url.prefijo",tipo);
        System.out.println("=========== URL: " + host + port + prefijo);
        return (host + port + prefijo) ;
    }*/
    
    

}
