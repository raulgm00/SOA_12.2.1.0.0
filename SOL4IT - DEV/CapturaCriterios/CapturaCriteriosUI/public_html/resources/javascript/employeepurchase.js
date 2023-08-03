

var firstTimeSkuFocus = 'Y';

function verId(evt)
{
var componentId = evt.getSource().getClientId();
alert(componentId);

}


function showPopupTimer(evt)
{
 var popup = AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:glassPane');
    if (popup != null) {
        popup.show();
    }
}


function soloenteros(evt){
var key=window.event.keyCode;
if (key < 48 || key > 57){
window.event.keyCode=0;
}
}


function refreshEmployeeHomePage(evt)
{
  var linkRefresh = AdfPage.PAGE.findComponent('pt1:lnkRefreshOrderForm');  
  AdfActionEvent.queue(linkRefresh, linkRefresh.getPartialSubmit());
}


function gocIsWhiteSpace(c) {
    if (c > ' ')
        return false;
    else 
        return true;
}

function gocTrim(str) {
    if (str == null)
        return str;

    var strLen = str.length;
    if (strLen == 0)
        return str;

    var startIndex =  - 1;
    var endIndex;
    var newStr;

    for (var i = 0;i < strLen;i++) {
        if (!gocIsWhiteSpace(str.charAt(i))) {
            startIndex = i;
            break;
        }
    }

    if (startIndex ==  - 1)
        return '';

    for (var j = strLen - 1;j >= startIndex;j--) {
        if (!gocIsWhiteSpace(str.charAt(j))) {
            endIndex = j;
            break;
        }
    }

    newStr = str.substring(startIndex, endIndex + 1);

    return newStr;
}



function padding(input) {
    if (null == input || '' === input)
        return input;
    var len = input.length;
    if (len >= 4)
        return input.substring(0, 4);
    var output = input;
    var index = 0;
    for (index = len;index < 4;index++) {
        output = '0' + output;
    }
    return output.toUpperCase();
}

/*
function onSkuBlur(evt) {



}
*/
/**
 * Get sku details
 *
 * @param evt
 */
function GetSkuDetails(evt) {
    var skuValue = evt.getSource().getValue();
    skuValue = padding(skuValue);
    skuValue = gocTrim(skuValue);// added on 04-Aug-2012
    var componentId = evt.getSource().getClientId();
    
    /*
    var dupLineNumber = checkDuplicateSku(evt);
    
    if (dupLineNumber!=false)
    {
    */
    
    retrieveGOCCatalog(evt, skuValue, componentId, 'Y');
      
      /*  
    }
    else
    {
        var msg = 'Duplicate sku # found for ' + skuValue ;        
        AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue(msg);
        evt.getSource().focus();
    }
    */
  
    

    // Alex Ao Bie 02/26/2013 PhaseIII 14512 (BY: PC message should be displayed when DS crosses the PC limit.) fix - do the limit check when qty is defaulted to 1
    //var delimitor = ':';
    //var firstColon = componentId.indexOf(delimitor);
    //var lastColon = componentId.lastIndexOf(delimitor);
    //var currentRow = componentId.substring(firstColon + 1, lastColon);
    //customalert('calling doVolumePointLimitCheck from GetSkuDetail ' + skuValue);
    //temporary comment
    //if (null != skuValue && '' != skuValue)
    //    doVolumePointLimitCheck(evt.getSource(), currentRow);
}



function checkDuplicateSku(evt){
    
    var tab = 'pt1:r1:0:linesTb:';
    var field = ':skuNo1::content';
    var lineNro =  ':itLno::content';
    
    
   
    var componentId = evt.getSource().getClientId();
    var lastColon = componentId.lastIndexOf(':');    
    var auxComponentId = componentId.substring(0,lastColon);
    var firstColon = auxComponentId.lastIndexOf(':');
    var currentIndex = componentId.substring(firstColon + 1, lastColon);
    var currentValue = evt.getSource().getValue();
    currentValue = padding(currentValue);
    currentValue = gocTrim(currentValue);
    var linePosition =  document.getElementById(tab + currentIndex + lineNro).value;
    var index = parseInt(currentIndex) - parseInt(linePosition)+1;
    var indexError=0;
    
    var flagNext = true;
    while (flagNext)
    {   
        if (document.getElementById(tab + index + lineNro)==null)
        {
            flagNext = false;
            indexError=-1;
        }
        else 
        {
            if (index!=currentIndex)
            {            
                var skuValue = document.getElementById(tab + index + field).value;
            
                if (currentValue!='' && currentValue!=null && skuValue==currentValue)
                {
                    evt.getSource().setValue('');
                    flagNext = false;
                }
            }
            
            index++;
            indexError++;
        }
    }
    
    return indexError;
}






/**
 * Retrieve GOC Catalog
 *
 * Alex Ao Bie 05/15/2013
 * @param evt
 * @param skuValue
 * @param componentId
 */
function retrieveGOCCatalog(evt, skuValue, componentId) {
    try {
        makeXMLHTTpReq(evt, skuValue, componentId, 'Y');
    }
    catch (err) {
        //customalert('GetSkuDetails exception from makeXMLHTTpReq: ' + err.message);
        // Added for easy debugging. Jagadeesh. 25-02-2013
        //AdfPage.PAGE.findComponentByAbsoluteId('errmsg1').setValue(err.message);
        // Alex Ao Bie 10/19/2012 added the below logic to retry until service finishes writing of the catalog file
        
        /* temporary commented
        if (null == skuDescription || '' == skuDescription) {
            customalert('GetSkuDetails, sku description is null!');
            var retryTimes = 0;
            while (retryTimes < 10 && (null == skuDescription || '' == skuDescription)) {
                try {
                    makeXMLHTTpReqRandom(evt, skuValue, componentId, 'Y');
                }
                catch (exception) {
                    customalert('Exception when calling makeXMLHTTpReqRandom: ' + exception.message);
                }
                retryTimes = parseInt(retryTimes) + 1;
            }
            customalert('Retried 10 times or the sku is working now!');
        }
        */
        customalert("error retrieveGOCCatalog");
    }
}








/**
 * METHOD NAME: customalert(msg)
 * Author: Raja
 * Added on 7-Jul-12.
 * call this method in your own javascript methods
 * type 'GOCDEBUG" in Shipping instructions field to get these customalerts for debugging purposes
 * this custom customalert message is to enable debugging for javascript
 */

function customalert(msg) {
    var shipInstObj = AdfPage.PAGE.findComponentByAbsoluteId('ShipIns');
    if (shipInstObj != null) {
        var shipInstValue = shipInstObj.getValue();
        if (shipInstValue != null && shipInstValue != '' && shipInstValue != ' ') {
            if (shipInstValue.indexOf('GOCDEBUG') >= 0)
                customalert("DEBUG - " + msg);
        }
    }
}




/**
 * Make XML http request to fill out the order line row
 * @param evt - Alex Ao Bie 08/31/2012 13178 fix. added this as a parameter
 * @param skuValue
 * @param componentId
 * @param performValidation
 */
function makeXMLHTTpReq(evt, skuValue, componentId, performValidation) {
   
   
    if (document.getElementById('srvmsg') != null)
        document.getElementById('srvmsg').style.visibility = 'hidden';
    if (document.getElementById('srvmsgWarning') != null)
        document.getElementById('srvmsgWarning').style.visibility = 'hidden';
    var delimitor = ':';
    var firstColon = componentId.indexOf(delimitor);
    var lastColon = componentId.lastIndexOf(delimitor);
    var tabName = 'pt1' + delimitor;    
    var currentRow = componentId.substring(firstColon + 1, lastColon);
    var nextComponent = delimitor + 'qty1';
    var defaultQty = '1';
    var skuNo = delimitor + 'skuNo1';
    var skuDescription = delimitor + 'it21';
    var skuUOM = delimitor + 'it20';
    var skuType = delimitor + 'it22';
    var skuTypeValue='';
    var lineUnitPrice = delimitor + 'it24';
    var lineTotalPrice = delimitor + 'it26';
    var lineDiscountPrice = delimitor + 'it28';
    
    
    var xmlhttp = null;
    var sURL = null;
    
    var unitVol = '';
    var unitPrice = '';
    
   // AdfPage.PAGE.findComponentByAbsoluteId('errmsg1').setValue('');
   
    var dupLineNumber = checkDuplicateSku(evt);
    
    if (dupLineNumber!=-1) {
    
        var duplicateMessage = 'Duplicate sku # found for ' + skuValue + ' in line number ' + (dupLineNumber);
        AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue(duplicateMessage);
        
        return;
    }
    
    try {
        xmlhttp = new XMLHttpRequest();
        sURL = buildXMLUrl(false);
        customalert('makeXMLHTTpReq sURL: ' + sURL);
        
        if (sURL==null || sURL=='' )
        {
            AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue('Price List undefined. Choose a location');
            document.getElementById(tabName + currentRow + skuNo + '::content').value = '';
            return;
        }
        
        xmlhttp.open("GET", sURL, false);
        xmlhttp.setRequestHeader("User-Agent", navigator.userAgent);
        xmlhttp.setRequestHeader("Host", sURL);
        xmlhttp.send(null);
        customalert('makeXMLHTTpReq after xmlhttp send');
        var xmlDoc = xmlhttp.responseXML;        
        customalert(xmlDoc);
        // Start - Moved these lines in to the try block to get the message regarding 'No Catalog File'. Jagadeesh. 28-02-2013
        var priceHeadList = xmlDoc.getElementsByTagName("q:h3");
         // update price list
        
        
       AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:itPriceList').setValue(priceHeadList[0].childNodes[0].nodeValue);
        
        //customalert ("price list : "+priceHeadList[0].childNodes[0].nodeValue);
        // update 
        //AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:it14').setValue(newTotal.toFixed(2));
       
    }
    catch (err) {
        customalert("err.message :->"+err.message)
        customalert("Error reading: " + sURL + " err: " + err.message);
        // Added error message. Jagadeesh. 28-02-2013
        // Raja - comment out on 24-Mar-13. This is preventing other messages from coming up
        //AdfPage.PAGE.findComponentByAbsoluteId('errmsg1').setValue("Error reading: " + sURL + " err: " + err.message);
    }
    
    var x = xmlDoc.getElementsByTagName("q:Sku");
    var matchFound = 0;
    for (i = 0;i < x.length;i++) {
        var catalogString = x[i].getElementsByTagName("q:a")[0].childNodes[0].nodeValue;
        var skuFromCatalogStr = catalogString.substring(0, 4);
        
        if (skuFromCatalogStr.toUpperCase() == skuValue.toUpperCase()) {
             matchFound = 1;
            
             var splitStr = catalogString.split('|');
            
            var blockedField = splitStr[16];
            
            if (null != blockedField && blockedField == 'B') 
            {
                var blockedMessage = 'SKU # ' + skuValue + ' is blocked. Message : ' + splitStr[17];
                AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue(blockedMessage);
                document.getElementById(tabName + currentRow + skuNo + '::content').value = '';
                return;
                
            }
                
                        
            if (splitStr[11] != null)
                document.getElementById(tabName + currentRow + ':it20::content').value = splitStr[11];
                
            if (splitStr[7] != null) 
                document.getElementById(tabName + currentRow + ':it21::content').value = splitStr[7];

            if (splitStr[8] != null)
            {
                document.getElementById(tabName + currentRow + ':it22::content').value = splitStr[8];
                skuTypeValue = splitStr[8];
            }
            
            unitPrice = splitStr[3];
            unitVol = splitStr[4];
                             
            document.getElementById(tabName + currentRow + nextComponent + '::content').value = defaultQty;
            
            calculateRuningTotalVolume(unitVol, unitPrice, defaultQty, currentRow);
            
            document.getElementById(tabName + currentRow + skuNo + '::content').value = skuValue.toUpperCase(); 
            
            
            document.getElementById(tabName + currentRow + ':itUnit::content').value = splitStr[1];
            document.getElementById(tabName + currentRow + ':itInv::content').value = splitStr[9];
            
            // clean error
            AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue('');
            // disabled buttons
            disableSubmitButton(true);
            //disablePriceButton(false)
            
            AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:itPStat').setValue('INCOMPLETE');
            
           
            
            
            break;
        }
   }
   
   if (skuValue != null && skuValue != '') {
        
        if (matchFound == 0||getLimitType(skuTypeValue)==-1) {
        
            
            AdfPage.PAGE.findComponentByAbsoluteId(tabName + currentRow + skuNo).setValue('');
            // remove values 
            //document.getElementById(tabName + currentRow + skuNo + '::content').value = '';
            document.getElementById(tabName + currentRow + nextComponent + '::content').value = '';
            document.getElementById(tabName + currentRow + skuDescription + '::content').value = '';
            document.getElementById(tabName + currentRow + skuUOM + '::content').value = '';
            document.getElementById(tabName + currentRow + skuType + '::content').value = '';
            document.getElementById(tabName + currentRow + lineUnitPrice + '::content').value = '';
            document.getElementById(tabName + currentRow + lineTotalPrice + '::content').value = '';
            document.getElementById(tabName + currentRow + lineDiscountPrice + '::content').value = '';
            
            //AdfPage.PAGE.findComponentByAbsoluteId(tabName + currentRow + skuNo).focus();
            
            msg = 'Sku #' + skuValue + ' is not found. Please re-enter a valid sku #';
            AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue(msg);
            
            disableSubmitButton(true);
            //disablePriceButton(false)
            AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:itPStat').setValue('INCOMPLETE');
        }
   }
}

function onChangeOfQtyField(evt) {
    
   
    var componentId = evt.getSource().getClientId();
    
    var tabName = 'pt1:';
    var unitVol = '';
    var firstColon = componentId.indexOf(':');
    var lastColon = componentId.lastIndexOf(':');
    var currentRow = componentId.substring(firstColon + 1, lastColon);
    var qty1 = document.getElementById(tabName + currentRow + ':qty1::content').value;
    var unitPrice = document.getElementById(tabName + currentRow + ':it24::content').value;
    calculateRuningTotalVolume(unitVol, unitPrice, qty1, currentRow) 
    // update status
    AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:itPStat').setValue('INCOMPLETE');
    disableSubmitButton(true);
    //disablePriceButton(false)
    
    // move next field
    //onBlurOfQtyField(evt);
}




function disableSubmitButton(disabled) {
    if (AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:cbSmt1') != null)
        AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:cbSmt1').setProperty('disabled', disabled);
}


/*
function disablePriceButton(disabled) {
    if (AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:cbPrice') != null)
        AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:cbPrice').setProperty('disabled', disabled);
   
}
*/


function updateStatus(evt) {
 AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:itPStat').setValue('COMPLETE');
}

function updateStatusIncomplete(evt) {
 AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:itPStat').setValue('INCOMPLETE');
}

function clearStatus(evt) {
 AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:itPStat').setValue('');
}
function clearErrorMsg(evt) {
AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue('');
}

function calculateRuningTotalVolume(unitVol, unitPrice, qty1, currentRow) {
    try {
        
        var unitPriceIsNull = (null == unitPrice || '' == unitPrice) ? true : false;
        document.getElementById('pt1:' + currentRow + ':it24::content').value = unitPriceIsNull ? '' : parseFloat(unitPrice).toFixed(2);
       
        var qty1IsNull = (null == qty1 || '' == qty1) ? true : false;
        var lnTot = (unitPriceIsNull || qty1IsNull) ? '' : parseFloat(unitPrice) * parseFloat(qty1);
        var lnTotIsNull = (null == lnTot || '' == lnTot) ? true : false;
        
        /*
        var lnDsc = (unitPriceIsNull || qty1IsNull) ? '' : parseFloat(unitPrice) * parseFloat(qty1) * .5;
        var lnDscIsNull = (null == lnDsc || '' == lnDsc) ? true : false;
        */
        
        document.getElementById('pt1:' + currentRow + ':it26::content').value = lnTotIsNull ? '' : lnTot.toFixed(2);        
        //--document.getElementById('pt1:' + currentRow + ':it28::content').value = lnDscIsNull ? '' : lnDsc.toFixed(2);
        
        /*
        var currentTotal = AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:it14').getValue();
        var newTotal = (currentTotal==null || currentTotal=='')? lnTot : parseFloat(currentTotal)+ lnTot;
        AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:it14').setValue(newTotal.toFixed(2));
       */
       
        
    }
    catch (err) {
        customalert(err.message);
    }
}

function buildXMLUrl(referenceNewFile) {

    customalert('Inside buildXMLUrl');
    var delimitor = ':';
    var shippingRegionId = 'dmShip';
    
    var comp = AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:ctlgurlop');
    var urlBase = comp.getValue();
    
    var sURL = urlBase
    
    /*
    var country='US';
    var orderTypeCode = 'RSO';
    var selectedWarehouse='09';
    
    
    var sURL = urlBase + country + '_' + orderTypeCode + '_' + selectedWarehouse +  '_M.xml' ;
     */
     
    return sURL;
   
    
}


function getLimitType(skuType)
{
     var skuTypeList = AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:limitTypeSku').getValue();
     var splitStrs = skuTypeList.split('|-|-');
     var withouLimit=-1;
     
     if (skuType==null||skuType=='')
        return withouLimit;
        
     for (i = 0;i < splitStrs.length;i++) {
        if (splitStrs[i] == null || splitStrs[i] == '' || splitStrs[i] == ' ')
        continue;
        var type = splitStrs[i].substring(splitStrs[i].indexOf("$")+1,splitStrs[i].lastIndexOf("$"));
        var limit = splitStrs[i].substring(splitStrs[i].lastIndexOf("$")+1);        
        if (type==skuType)
            return limit;        
     }
     return withouLimit;

}


function onBlurOfQtyField(evt) {
    // move to the next line's sku field
    
     
    var componentId = evt.getSource().getClientId();
    var tabName = 'pt1:r1:0:linesTb:';
    var skuNo = ':skuNo1';
    
    /*
    var skuDescription = ':it21';
    var skuUOM = ':it20';
    var skuTypeId = ':it22';
    var lineUnitPrice = ':it24';
    var lineTotalPrice = ':it26';
    var lineDiscountPrice = ':it28';
    var quantity = ':qty1';
    */
    
    var lastColon = componentId.lastIndexOf(':');    
    var auxComponentId = componentId.substring(0,lastColon);
    var firstColon = auxComponentId.lastIndexOf(':');
    var currentRow = componentId.substring(firstColon + 1, lastColon);
    var skuType = document.getElementById(tabName + currentRow + ':it22::content').value;
    var qty1 = document.getElementById(tabName + currentRow + ':qty1::content').value;
    var limit =getLimitType(skuType); 
    
    // validate sku.
     var currentSku = AdfPage.PAGE.findComponentByAbsoluteId(tabName + currentRow + skuNo).getValue();
    // check if valid sku is there before entering quantity
    if ((null == currentSku || '' == currentSku || ' ' == currentSku) && (null != qty1 && '' != qty1)) {
        AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue('Please enter a valid sku # before entering Quantity');
        //AdfPage.PAGE.findComponentByAbsoluteId(tabName + currentRow + 'qty1').setValue('');
        AdfPage.PAGE.findComponentByAbsoluteId(tabName + currentRow + ':qty1').setValue('');
        //document.getElementById(tabName + currentRow + 'qty1::content').value = '';// DO NOT USE Adf provided library to set value since this triggers a duplicate on change event. use pure javascript instead
        AdfPage.PAGE.findComponentByAbsoluteId(tabName + currentRow + skuNo).focus();
        return;
    }
    
    
     
     // validate null
    
     var description = document.getElementById(tabName + currentRow + ':it21::content').value;   
    
    if ((null == qty1 || '' == qty1)&& (null != description && '' != description)){
        AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue('Quantity is a mandatory field. Please enter a value.');
        AdfPage.PAGE.findComponentByAbsoluteId(tabName + currentRow + ':qty1').focus();
        return;
    }
    
    
    // validate no negative
    
     if (qty1 != null && qty1 != '') {
    
        if (qty1.indexOf('.') == 0) {
            qty1 = '0' + qty1;
        }
        
        if (isNaN(qty1) || parseInt(qty1, 10) < 1 || qty1.indexOf('.') > 0) {
            //cleanDetails(componentId);
            AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue('Quantity is mandatory and cannot be empty, negative, zero or contain decimals. Please enter a value.');
            document.getElementById(tabName + currentRow + ':qty1::content').value = '';// DO NOT USE Adf provided library to set value. use pure javascript instead
            AdfPage.PAGE.findComponentByAbsoluteId(tabName + currentRow + ':qty1').focus();
            return;
        }
    }
    
    // validate limit
    if (parseInt(qty1)>parseInt(limit))
    {
         //cleanDetails(componentId);
        
        var msg = 'Limit for '+  skuType +' type items is '+ limit +' per order. Please verify';
        AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue(msg);
        
        //AdfPage.PAGE.findComponentByAbsoluteId(tabName + currentRow + skuNo).focus();
        
        
        document.getElementById(tabName + currentRow + ':qty1::content').value = '';// DO NOT USE Adf provided library to set value. use pure javascript instead
        AdfPage.PAGE.findComponentByAbsoluteId(tabName + currentRow + ':qty1').focus();
            
        return;
    }
    
    
    var nextRow = new Number(parseInt(currentRow) + 1);
    
    
     AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue('');
    
    AdfPage.PAGE.findComponentByAbsoluteId(tabName + nextRow + skuNo).focus();
    AdfPage.PAGE.findComponentByAbsoluteId(tabName + nextRow + skuNo).select();
    
}


function cleanDetails(componentId){


    var tabName = 'pt1:r1:0:linesTb:';
    var skuNo = ':skuNo1';
    var skuDescription = ':it21';
    var skuUOM = ':it20';
    var skuTypeId = ':it22';
    var lineUnitPrice = ':it24';
    var lineTotalPrice = ':it26';
    var lineDiscountPrice = ':it28';
    var quantity = ':qty1';
    
    
    var lastColon = componentId.lastIndexOf(':');    
    var auxComponentId = componentId.substring(0,lastColon);
    var firstColon = auxComponentId.lastIndexOf(':');
    var currentRow = componentId.substring(firstColon + 1, lastColon);
    
    document.getElementById(tabName + currentRow + skuNo + '::content').value = '';
    document.getElementById(tabName + currentRow + skuDescription + '::content').value = '';
    document.getElementById(tabName + currentRow + skuUOM + '::content').value = '';
    document.getElementById(tabName + currentRow + skuTypeId + '::content').value = '';
    document.getElementById(tabName + currentRow + lineUnitPrice + '::content').value = '';
    document.getElementById(tabName + currentRow + lineTotalPrice + '::content').value = '';
    document.getElementById(tabName + currentRow + lineDiscountPrice + '::content').value = '';        
    document.getElementById(tabName + currentRow + quantity + '::content').value = '';


}
function showPopupFromAction(evt) {

    var status = AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:itPStat').getValue();
    var priceList = AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:itPriceList').getValue();
    
    //alert("priceList :"+priceList);  
    
    if (priceList==null ||status == null || status =='' || status=='COMPLETE') {
        alert('Please enter or modify items to calculate your order price');
        evt.cancel();
        return;
    }
        
    
    var popup = AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:glassPane');
    if (popup != null) {
        popup.show();
    }
}

function hidePopupFromAction(evt) {
    var popup = AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:glassPane');
    if (popup != null) {
        popup.hide();
    }
}

function toUpperCase(evt) {
    var inputComp = evt.getSource();
    var value = inputComp.getValue();
    if (value != null && value != '') {
        inputComp.setValue(value.toUpperCase());
     }
}

function validateFileNumber(evt){
   var comp = evt.getSource();
    var value = evt.getSource().getValue();
    var regmatch = matchRegEx(value,"^\\d{1,6}$");
    if(regmatch == null || regmatch == ''){
        alert('File Number must be of 1-6 digits long ');
        comp.setValue('');
        comp.focus();
    }
}

function matchRegEx(value, regex) {
    if (regex == null || regex == '')
        return false;
    if (value == null || value == '')
        return true;//do not match for empty values with regex.
    var re = new RegExp(regex);
    return value.match(re);
}

function valueChangeName(evt){
    toUpperCase(evt);
    updateStatusIncomplete(evt);
    disableSubmitButton(true);
}

function valueChangeFileNumber(evt){
    validateFileNumber(evt);
    updateStatusIncomplete(evt);
    disableSubmitButton(true);
    
}

function valueChangeStreet(evt){
    updateStatusIncomplete(evt);
    disableSubmitButton(true);
    
}

function valueChangeLocation(evt){
    updateStatusIncomplete(evt);
    disableSubmitButton(true);
    
}

function valueChangeZIP(evt){
    updateStatusIncomplete(evt);
    disableSubmitButton(true);    
}

function cleanOrderMessages()
{
    AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:it12').setValue(null);
    AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:it13').setValue(null);
    AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:it14').setValue(null);
    AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue(null);
   // AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:it15').setValue(false);
}

function setCategoryDefault()
{
  AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:errmsg1').setValue('entro???');
  alert('hola');
  AdfPage.PAGE.findComponentByAbsoluteId('pt1:r1:0:socCategory').setValue('0');
   
}
