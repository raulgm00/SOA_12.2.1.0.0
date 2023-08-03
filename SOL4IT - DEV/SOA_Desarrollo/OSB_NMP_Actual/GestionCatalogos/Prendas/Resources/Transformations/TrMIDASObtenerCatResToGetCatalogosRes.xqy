(:: pragma bea:global-element-parameter parameter="$CatalogoSrcResponse" element="ns3:obtenerCatalogosBPMResponse" location="CatalogoBPMWS.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:getCatalogosResponse" location="catalogosMidasSvcXSD.xsd" ::)

declare namespace ns2 = "http://nmpcatalogobpm.schema.nmp.servicios.montedepiedad.com.mx";
declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCatMidasSvc";
declare namespace ns3 = "urn:mx.com.nmp.midas";
declare namespace ns0 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPCatMidas";
declare namespace xf = "http://tempuri.org/Test/TrCatalogosMidasToBPM/";

declare function xf:TrCatalogosMidasToBPM($CatalogoSrcResponse as element(ns3:obtenerCatalogosBPMResponse))
    as element(ns1:getCatalogosResponse) {
        <ns1:getCatalogosResponse>
        {
	    	for $catalogo in $CatalogoSrcResponse/ns3:out/ns2:catalogoBPM/ns2:CatalogoBPM
	    	return
	    		if($catalogo/*:id/text() = "1")then
	    			<ns1:catFactor>	    				
	    				{     
	        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}	            		
	            	</ns1:catFactor>
	            	
	            else if($catalogo/*:id/text() = "2")then
	            <ns1:catFuente>	    				
	    				{     
		        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}	            		
	            	</ns1:catFuente>
	            	
	            else if($catalogo/*:id/text() = "3")then
	            <ns1:catRamo>
	    				
	    				{     
		        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}
	            	</ns1:catRamo>
	            
	            else if($catalogo/*:id/text() = "5")then
	            <ns1:catCanalIngreso>
	    				{     
		        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}
	            	</ns1:catCanalIngreso>
	            
	            else if($catalogo/*:id/text() = "6")then
	            <ns1:catRefrendos>
	    				
	    				{     
		        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}
	            	</ns1:catRefrendos>
	            	
	            else if($catalogo/*:id/text() = "7")then
	            <ns1:catEdoPrenda>
	    				
	    				{     
		        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}
	            		
	            	</ns1:catEdoPrenda>
	            	
	            else if($catalogo/*:id/text() = "8")then
	            <ns1:catIngresoAlmoneda>
	    				
	    				{     
		        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}
	            		
	            	</ns1:catIngresoAlmoneda>
	            	
	            	
	            	else if($catalogo/*:id/text() = "9")then
	            <ns1:catSucursal>
	    				
	    				{     
		        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}
	            		
	            	</ns1:catSucursal>
	            	
	            	
	            else if($catalogo/*:id/text() = "10")then
	            <ns1:catExpendio>
	    				
	    				{     
		        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}
	            </ns1:catExpendio>	
	            	
	            	
	            	else if($catalogo/*:id/text() = "11")then
	            <ns1:catPartida>
	    				
	    				{     
		        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}
	            	</ns1:catPartida>	
	            	else if($catalogo/*:id/text() = "12")then
	            <ns1:catCanalVenta>
	    				
	    				{     
		        			for $itemCatalogo in $catalogo/*:valorCatalogoBPM/*:ValorCatalogoBPM
	        			return	
	        				<ns0:elementoCatalogo> 
	        					{
	        						for $item in $itemCatalogo
	        						return	<ns0:descripcion> {data($itemCatalogo/*:descripcion)} </ns0:descripcion>		        			 
		        				}
		        				{
		        					for $item in $itemCatalogo
		        					return <ns0:id> {data($itemCatalogo/*:id)} </ns0:id>
		        				}
		        				{
									for $item in $itemCatalogo
		        					return <ns0:valor> {data($itemCatalogo/*:valor)} </ns0:valor>
	        					}
	        				</ns0:elementoCatalogo>
	            		}
	            	</ns1:catCanalVenta>	
	            
	            else ()
        }
        </ns1:getCatalogosResponse>
};

declare variable $CatalogoSrcResponse as element(ns3:obtenerCatalogosBPMResponse) external;

xf:TrCatalogosMidasToBPM($CatalogoSrcResponse)