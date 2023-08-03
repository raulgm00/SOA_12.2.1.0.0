xquery version "2004-draft" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$obtenerInformacionPartidaResponse" element="ns2:obtenerInformacionPartidaResponse" location="../WSDL/ServicioBancarioWSDL.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:consultarDatosResponse" location="../XSD/BancarioSvcXSD.xsd" ::)

declare namespace xf = "http://tempuri.org/NMP/Integracion/Bancario/Resources/XQ/consultaDatosMidasRespTransformXQ/";
declare namespace ns2 = "urn:mx.com.nmp.midas";
declare namespace ns1 = "http://servicios.montedepiedad.com.mx/NMP/Schema/NMPBancario";
declare namespace ns0 = "http://dto.model.midas.nmp.com.mx";

declare function xf:consultaDatosMidasRespTransformXQ($obtenerInformacionPartidaResponse as element(ns2:obtenerInformacionPartidaResponse))
    as element(ns1:consultarDatosResponse) {
        <ns1:consultarDatosResponse>
        	<ns1:referencia>{ data($obtenerInformacionPartidaResponse/ns2:return/ns0:folio) }</ns1:referencia>
            <ns1:transaccion>{ data($obtenerInformacionPartidaResponse/ns2:return/ns0:transaccion) }</ns1:transaccion>
            <ns1:tipoContrato>{ data($obtenerInformacionPartidaResponse/ns2:return/ns0:tipoContrato) }</ns1:tipoContrato>
            <ns1:sucursal>{ $obtenerInformacionPartidaResponse/ns2:return/ns0:sucursal/text() }</ns1:sucursal>
            <ns1:operacionesBancariasDisponibles>
	            <ns1:detalleOperacionBancaria>
	                <ns1:idOperacion>{ data($obtenerInformacionPartidaResponse/ns2:return/ns0:detalleOperacionBancaria/ns0:idOperacion) }</ns1:idOperacion>
	                <ns1:montoMaximo>{ data($obtenerInformacionPartidaResponse/ns2:return/ns0:detalleOperacionBancaria/ns0:montoMaximo) }</ns1:montoMaximo>
	                <ns1:montoMinimo>{ data($obtenerInformacionPartidaResponse/ns2:return/ns0:detalleOperacionBancaria/ns0:montoMinimo) }</ns1:montoMinimo>
	                <ns1:nombreOperacion>{ data($obtenerInformacionPartidaResponse/ns2:return/ns0:detalleOperacionBancaria/ns0:nombreOperacion) }</ns1:nombreOperacion>
	            </ns1:detalleOperacionBancaria>
            </ns1:operacionesBancariasDisponibles>
            {
            	for $ticket_info in $obtenerInformacionPartidaResponse/ns2:return/ns0:ticketBancario
            	return
            		<ns1:InfoTicket>
						<ns1:desc1>{ replace($ticket_info/ns0:t01_BilleteContrato/text(), '#', ' ') }</ns1:desc1> 
               			<ns1:desc2>{ replace($ticket_info/ns0:t02_ClienteLinea1/text(), '#', ' ') }</ns1:desc2> 
                        <ns1:desc3>
                        { 	
							if(exists($ticket_info/ns0:t03_ClienteLinea2) and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								replace($ticket_info/ns0:t03_ClienteLinea2/text(), '#', ' ') 
							else
								replace($ticket_info/ns0:t04_NoSucursal/text(), '#', ' ') 
                        }
                        </ns1:desc3>				        
				        
				        <ns1:desc4>
						{ 
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								replace($ticket_info/ns0:t04_NoSucursal/text(), '#', ' ')  
							else
								replace($ticket_info/ns0:t05_FolioVerificador/text(), '#', ' ')  
						}
						</ns1:desc4>
						
                        <ns1:desc5>
						{ 
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								replace($ticket_info/ns0:t05_FolioVerificador/text(), '#', ' ') 
							else
								replace($ticket_info/ns0:t06_ImportePrestamo/text(), '#', ' ') 
						}
						</ns1:desc5>
						
                        <ns1:desc6>
						{ 
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								replace($ticket_info/ns0:t06_ImportePrestamo/text(), '#', ' ') 
							else
								replace($ticket_info/ns0:t07_InteresesDevengados/text(), '#', ' ') 
						}
						</ns1:desc6>
						
						
						{
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t07_InteresesDevengados)) then
									<ns1:desc7>{ replace($ticket_info/ns0:t07_InteresesDevengados/text(), '#', ' ') }</ns1:desc7> 
								else ()
							else
								if(exists($ticket_info/ns0:t08_Comisiones)) then
									<ns1:desc7>{ replace($ticket_info/ns0:t08_Comisiones/text(), '#', ' ') }</ns1:desc7> 
								else ()
						}				
						
						{
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t08_Comisiones)) then
									<ns1:desc8>{ replace($ticket_info/ns0:t08_Comisiones/text(), '#', ' ') }</ns1:desc8>  
								else ()
							else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									<ns1:desc8>{ replace($ticket_info/ns0:t09_CapitalActual/text(), '#', ' ') }</ns1:desc8>  
								else 
									if(exists($ticket_info/ns0:t10_Calendario1)) then
										<ns1:desc8>{ replace($ticket_info/ns0:t10_Calendario1/text(), '#', ' ') }</ns1:desc8>  
									else () 
                        }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
										<ns1:desc9>{ replace($ticket_info/ns0:t09_CapitalActual/text(),'#', ' ') }</ns1:desc9> 
								else
									if(exists($ticket_info/ns0:t10_Calendario1)) then
										<ns1:desc9>{ replace($ticket_info/ns0:t10_Calendario1/text(),'#', ' ') }</ns1:desc9> 
									else () 
							else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
										if(exists($ticket_info/ns0:t10_Calendario1)) then
											<ns1:desc9>{ replace($ticket_info/ns0:t10_Calendario1/text(),'#', ' ') }</ns1:desc9> 
										else () 
								else
									if(exists($ticket_info/ns0:t11_Calendario2)) then
										<ns1:desc9>{ replace($ticket_info/ns0:t11_Calendario2/text(),'#', ' ') }</ns1:desc9> 
									else () 
	                    }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t10_Calendario1)) then
										<ns1:desc10>{ replace($ticket_info/ns0:t10_Calendario1/text(),'#', ' ') }</ns1:desc10> 
							 		else () 
								else
									if(exists($ticket_info/ns0:t11_Calendario2)) then
										<ns1:desc10>{ replace($ticket_info/ns0:t11_Calendario2/text(),'#', ' ') }</ns1:desc10> 
									else () 
                        	else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t11_Calendario2)) then
										<ns1:desc10>{ replace($ticket_info/ns0:t11_Calendario2/text(),'#', ' ') }</ns1:desc10> 
									else () 
								else 
									if(exists($ticket_info/ns0:t12_Calendario3)) then
										<ns1:desc10>{ replace($ticket_info/ns0:t12_Calendario3/text(),'#', ' ') }</ns1:desc10> 
									else 
										if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
											<ns1:desc10>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc10> 
										else() 
                       }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t11_Calendario2)) then
										<ns1:desc11>{ replace($ticket_info/ns0:t11_Calendario2/text(),'#', ' ') }</ns1:desc11> 
									else () 
								else
									if(exists($ticket_info/ns0:t12_Calendario3)) then
										<ns1:desc11>{ replace($ticket_info/ns0:t12_Calendario3/text(),'#', ' ') }</ns1:desc11> 
									else 
										if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
											<ns1:desc11>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc11> 
										else () 
	                        else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t12_Calendario3)) then
										<ns1:desc11>{ replace($ticket_info/ns0:t12_Calendario3/text(),'#', ' ') }</ns1:desc11> 
									else
										if(exists($ticket_info/ns0:t11_Calendario2)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc11>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc11> 
											else ()
										else () 
								else 
									if(exists($ticket_info/ns0:t13_Calendario4)) then
										<ns1:desc11>{ replace($ticket_info/ns0:t13_Calendario4/text(),'#', ' ') }</ns1:desc11> 
									else
										if(exists($ticket_info/ns0:t12_Calendario3)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc11>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc11> 
											else ()
										else
											if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
												<ns1:desc11>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc11> 
											else() 
                        }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t12_Calendario3)) then
										<ns1:desc12>{ replace($ticket_info/ns0:t12_Calendario3/text(),'#', ' ') }</ns1:desc12> 
									else
										if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
											<ns1:desc12>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc12> 
										else () 
								else
									if(exists($ticket_info/ns0:t13_Calendario4)) then
										<ns1:desc12>{ replace($ticket_info/ns0:t13_Calendario4/text(),'#', ' ') }</ns1:desc12> 
									else
										if(exists($ticket_info/ns0:t12_Calendario3)) then
											if($ticket_info/ns0:t16_MontoSigOperacion) then
												<ns1:desc12>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc12> 
											else ()
										else
											if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
													<ns1:desc12>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc12> 
											else ()
                        	else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t13_Calendario4)) then
										<ns1:desc12>{ replace($ticket_info/ns0:t13_Calendario4/text(),'#', ' ') }</ns1:desc12> 
									else
										if(exists($ticket_info/ns0:t12_Calendario3)) then
											if($ticket_info/ns0:t16_MontoSigOperacion) then
												<ns1:desc12>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc12> 
											else ()
										else
											if(exists($ticket_info/ns0:t11_Calendario2)) then
												if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
													<ns1:desc12>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc12> 
												else ()
											else () 
								else
									if(exists($ticket_info/ns0:t14_Calendario5)) then
										<ns1:desc12>{ replace($ticket_info/ns0:t14_Calendario5/text(),'#', ' ') }</ns1:desc12> 
									else
										if(exists($ticket_info/ns0:t13_Calendario4)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc12>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc12> 
											else ()
										else
											if(exists($ticket_info/ns0:t12_Calendario3)) then
												if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
													<ns1:desc12>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc12> 
												else ()
											else() 
                        }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t13_Calendario4)) then
										<ns1:desc13>{ replace($ticket_info/ns0:t13_Calendario4/text(),'#', ' ') }</ns1:desc13> 
									else
										if(exists($ticket_info/ns0:t12_Calendario3)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc13>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc13> 
											else ()
										else
											if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
												<ns1:desc13>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc13> 
											else ()
								else
									if(exists($ticket_info/ns0:t14_Calendario5)) then
										<ns1:desc13>{ replace($ticket_info/ns0:t14_Calendario5/text(),'#', ' ') }</ns1:desc13> 
									else
										if(exists($ticket_info/ns0:t13_Calendario4)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc13>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc13> 
											else() 
										else 
											if(exists($ticket_info/ns0:t12_Calendario3)) then
												if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
													<ns1:desc13>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc13> 
												else ()
											else () 
                        	else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t14_Calendario5)) then
										<ns1:desc13>{ replace($ticket_info/ns0:t14_Calendario5/text(),'#', ' ') }</ns1:desc13> 
									else
										if(exists($ticket_info/ns0:t13_Calendario4)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc13>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc13> 
											else()
										else
											if(exists($ticket_info/ns0:t12_Calendario3)) then
												if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
													<ns1:desc13>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc13> 
												else()
											else
												if(exists($ticket_info/ns0:t11_Calendario2)) then
													if(exists($ticket_info/ns0:t18_SeguroPoliza1)) then
														<ns1:desc13>{ replace($ticket_info/ns0:t18_SeguroPoliza1/text(),'#', ' ') }</ns1:desc13> 
													else()
												else () 
								else 
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										<ns1:desc13>{ replace($ticket_info/ns0:t15_Calendario6/text(),'#', ' ') }</ns1:desc13> 
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc13>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc13> 
											else () 
										else
											if(exists($ticket_info/ns0:t13_Calendario4)) then
												if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
													<ns1:desc13>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc13> 
												else () 
											else ()  
                        }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t14_Calendario5)) then
										<ns1:desc14>{ replace($ticket_info/ns0:t14_Calendario5/text(),'#', ' ') }</ns1:desc14> 
									else
										if(exists($ticket_info/ns0:t13_Calendario4)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc14>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc14> 
											else ()
										else
											if(exists($ticket_info/ns0:t12_Calendario3)) then
												if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
													<ns1:desc14>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc14> 
												else ()
											else
												if(exists($ticket_info/ns0:t18_SeguroPoliza1)) then
													<ns1:desc14>{ replace($ticket_info/ns0:t18_SeguroPoliza1/text(),'#', ' ') }</ns1:desc14> 
												else ()  
								else
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										<ns1:desc14>{ replace($ticket_info/ns0:t15_Calendario6/text(),'#', ' ') }</ns1:desc14> 
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc14>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc14> 
											else ()
										else
											if(exists($ticket_info/ns0:t13_Calendario4)) then
												if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
													<ns1:desc14>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc14> 
												else()
											else () 
                        	else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										<ns1:desc14>{ replace($ticket_info/ns0:t15_Calendario6/text(),'#', ' ') }</ns1:desc14> 
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc14>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc14> 
											else ()
										else
											if(exists($ticket_info/ns0:t13_Calendario4)) then
												if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
													<ns1:desc14>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc14> 
												else ()
											else
												if(exists($ticket_info/ns0:t12_Calendario3)) then
													if(exists($ticket_info/ns0:t18_SeguroPoliza1)) then
														<ns1:desc14>{ replace($ticket_info/ns0:t18_SeguroPoliza1/text(),'#', ' ') }</ns1:desc14> 
													else ()
												else
													if(exists($ticket_info/ns0:t11_Calendario2)) then
														if(exists($ticket_info/ns0:t19_SeguroPoliza2)) then
															<ns1:desc14>{ replace($ticket_info/ns0:t19_SeguroPoliza2/text(),'#', ' ') }</ns1:desc14> 
														else ()
													else () 
								else
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
											<ns1:desc14>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc14> 
										else ()
									else 
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
												<ns1:desc14>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc14> 
											else ()
										else () 
                        }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2) and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										<ns1:desc15>{ replace($ticket_info/ns0:t15_Calendario6/text(),'#', ' ') }</ns1:desc15> 
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
												<ns1:desc15>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc15> 
											else ()
										else
											if(exists($ticket_info/ns0:t13_Calendario4)) then
												if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
													<ns1:desc15>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc15> 
												else ()
											else
												if(exists($ticket_info/ns0:t12_Calendario3)) then
													if(exists($ticket_info/ns0:t18_SeguroPoliza1)) then
														<ns1:desc15>{ replace($ticket_info/ns0:t18_SeguroPoliza1/text(),'#', ' ') }</ns1:desc15> 
													else ()
												else
												if(exists($ticket_info/ns0:t19_SeguroPoliza2)) then
														<ns1:desc15>{ replace($ticket_info/ns0:t19_SeguroPoliza2/text(),'#', ' ') }</ns1:desc15> 
												else ()
								else
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
											<ns1:desc15>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc15> 
										else ()
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
												<ns1:desc15>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc15> 
											else() 
										else () 
                        	else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
											<ns1:desc15>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc15> 
										else ()
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											<ns1:desc15>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc15> 
										else
											if(exists($ticket_info/ns0:t13_Calendario4)) then
												if(exists($ticket_info/ns0:t18_SeguroPoliza1)) then
													<ns1:desc15>{ replace($ticket_info/ns0:t18_SeguroPoliza1/text(),'#', ' ') }</ns1:desc15> 
												else ()
											else
												if(exists($ticket_info/ns0:t12_Calendario3)) then
													if(exists($ticket_info/ns0:t19_SeguroPoliza2)) then
														<ns1:desc15>{ replace($ticket_info/ns0:t19_SeguroPoliza2/text(),'#', ' ') }</ns1:desc15> 
													else ()
												else
													if(exists($ticket_info/ns0:t11_Calendario2)) then
														if(exists($ticket_info/ns0:t20_SeguroPoliza3)) then
															<ns1:desc15>{ replace($ticket_info/ns0:t20_SeguroPoliza3/text(),'#', ' ') }</ns1:desc15> 
														else ()
													else () 
								else 
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
											<ns1:desc15>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc15> 
										else () 
									else ()
                        }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t16_MontoSigOperacion)) then
											<ns1:desc16>{ replace($ticket_info/ns0:t16_MontoSigOperacion/text(),'#', ' ') }</ns1:desc16> 
										else ()
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
												<ns1:desc16>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc16> 
											else ()
										else
											if(exists($ticket_info/ns0:t13_Calendario4)) then
												if(exists($ticket_info/ns0:t18_SeguroPoliza1)) then
													<ns1:desc16>{ replace($ticket_info/ns0:t18_SeguroPoliza1/text(),'#', ' ') }</ns1:desc16> 
												else ()
											else
												if(exists($ticket_info/ns0:t12_Calendario3)) then
													if(exists($ticket_info/ns0:t19_SeguroPoliza2)) then
														<ns1:desc16>{ replace($ticket_info/ns0:t19_SeguroPoliza2/text(),'#', ' ') }</ns1:desc16> 
													else ()
												else
													if(exists($ticket_info/ns0:t20_SeguroPoliza3)) then
														<ns1:desc16>{ replace($ticket_info/ns0:t20_SeguroPoliza3/text(),'#', ' ') }</ns1:desc16> 
													else () 
								else
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
											<ns1:desc16>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc16> 
										else () 
									else () 
                        	else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
											<ns1:desc16>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc16> 
										else ()
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t18_SeguroPoliza1)) then
												<ns1:desc16>{ replace($ticket_info/ns0:t18_SeguroPoliza1/text(),'#', ' ') }</ns1:desc16> 
											else ()
										else
											if(exists($ticket_info/ns0:t13_Calendario4)) then
												if(exists($ticket_info/ns0:t19_SeguroPoliza2)) then
													<ns1:desc16>{ replace($ticket_info/ns0:t19_SeguroPoliza2/text(),'#', ' ') }</ns1:desc16> 
												else ()
											else
												if(exists($ticket_info/ns0:t12_Calendario3)) then
													if(exists($ticket_info/ns0:t20_SeguroPoliza3)) then
														<ns1:desc16>{ replace($ticket_info/ns0:t20_SeguroPoliza3/text(),'#', ' ') }</ns1:desc16> 
													else ()
												else () 
								else () 
                        }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t17_FechaLimitePago)) then
											<ns1:desc17>{ replace($ticket_info/ns0:t17_FechaLimitePago/text(),'#', ' ') }</ns1:desc17> 
										else ()
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t18_SeguroPoliza1)) then
												<ns1:desc17>{ replace($ticket_info/ns0:t18_SeguroPoliza1/text(),'#', ' ') }</ns1:desc17> 
											else ()
										else
											if(exists($ticket_info/ns0:t13_Calendario4)) then
												if(exists($ticket_info/ns0:t19_SeguroPoliza2)) then
													<ns1:desc17>{ replace($ticket_info/ns0:t19_SeguroPoliza2/text(),'#', ' ') }</ns1:desc17> 
												else ()
											else
												if(exists($ticket_info/ns0:t12_Calendario3)) then
													if(exists($ticket_info/ns0:t20_SeguroPoliza3)) then
														<ns1:desc17>{ replace($ticket_info/ns0:t20_SeguroPoliza3/text(),'#', ' ') }</ns1:desc17> 
													else ()
												else () 
								else () 
							else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t18_SeguroPoliza1)) then
											<ns1:desc17>{ replace($ticket_info/ns0:t18_SeguroPoliza1/text(),'#', ' ') }</ns1:desc17> 
										else ()
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t19_SeguroPoliza2)) then
												<ns1:desc17>{ replace($ticket_info/ns0:t19_SeguroPoliza2/text(),'#', ' ') }</ns1:desc17> 
											else ()
										else
											if(exists($ticket_info/ns0:t13_Calendario4)) then
												if(exists($ticket_info/ns0:t20_SeguroPoliza3)) then
													<ns1:desc17>{ replace($ticket_info/ns0:t20_SeguroPoliza3/text(),'#', ' ') }</ns1:desc17> 
												else ()
											else () 
								else () 
                        }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t18_SeguroPoliza1)) then
											<ns1:desc18>{ replace($ticket_info/ns0:t18_SeguroPoliza1/text(),'#', ' ') }</ns1:desc18> 
										else ()
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t19_SeguroPoliza2)) then
												<ns1:desc18>{ replace($ticket_info/ns0:t19_SeguroPoliza2/text(),'#', ' ') }</ns1:desc18> 
											else ()
										else
											if(exists($ticket_info/ns0:t13_Calendario4)) then
												if(exists($ticket_info/ns0:t20_SeguroPoliza3)) then
													<ns1:desc18>{ replace($ticket_info/ns0:t20_SeguroPoliza3/text(),'#', ' ') }</ns1:desc18> 
												else ()
											else ()
								else () 
							else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t19_SeguroPoliza2)) then
											<ns1:desc18>{ replace($ticket_info/ns0:t19_SeguroPoliza2/text(),'#', ' ') }</ns1:desc18> 
										else ()
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t20_SeguroPoliza3)) then
												<ns1:desc18>{ replace($ticket_info/ns0:t20_SeguroPoliza3/text(),'#', ' ') }</ns1:desc18> 
											else ()
										else () 										
								else ()  
                        }
                        
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2)and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t19_SeguroPoliza2)) then
											<ns1:desc19>{ replace($ticket_info/ns0:t19_SeguroPoliza2/text(),'#', ' ') }</ns1:desc19> 
										else ()
									else
										if(exists($ticket_info/ns0:t14_Calendario5)) then
											if(exists($ticket_info/ns0:t20_SeguroPoliza3)) then
												<ns1:desc19>{ replace($ticket_info/ns0:t20_SeguroPoliza3/text(),'#', ' ') }</ns1:desc19> 
											else ()
										else () 
								else () 
							else
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t20_SeguroPoliza3)) then
											<ns1:desc19>{ replace($ticket_info/ns0:t20_SeguroPoliza3/text(),'#', ' ') }</ns1:desc19> 
										else ()
									else () 
								else () 
                        }
                                           
                        {
							if(exists($ticket_info/ns0:t03_ClienteLinea2) and (not(empty($ticket_info/ns0:t03_ClienteLinea2/text())))) then
								if(exists($ticket_info/ns0:t09_CapitalActual)) then
									if(exists($ticket_info/ns0:t15_Calendario6)) then
										if(exists($ticket_info/ns0:t20_SeguroPoliza3)) then
											<ns1:desc20>{ replace($ticket_info/ns0:t20_SeguroPoliza3/text(),'#', ' ') }</ns1:desc20> 
										else ()
									else () 
								else () 
							else () 
                        }     
					</ns1:InfoTicket>
			}
        </ns1:consultarDatosResponse>
};

declare variable $obtenerInformacionPartidaResponse as element(ns2:obtenerInformacionPartidaResponse) external;

xf:consultaDatosMidasRespTransformXQ($obtenerInformacionPartidaResponse)