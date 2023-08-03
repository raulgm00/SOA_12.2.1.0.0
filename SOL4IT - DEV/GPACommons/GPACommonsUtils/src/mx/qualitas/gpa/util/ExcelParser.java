package mx.qualitas.gpa.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.text.DecimalFormat;

import mx.qualitas.gpa.modelo.Prorrateo;
import mx.qualitas.gpa.modelo.ProrrateoRow;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelParser {
    
    private static DecimalFormat decimalFormat = new DecimalFormat("#");
    private static DataFormatter formatter = new DataFormatter();
    
    
    public static void main(String[] args) throws IOException {
        String filePath = 
            "C:\\JDeveloper\\12.2.1.0.0\\GPACommons\\GPACommonsUtils\\excel\\GF_VIGILANCIA_ModFolio.xlsx"
            //"/Users/jacfeth/Documents/Clientes/SOAInt/Qualitas/Prorrateo/20abril/GF_VIGILANCIA_20170419.xlsx"
            //"/Users/jacfeth/Documents/Clientes/SOAInt/Qualitas/Prorrateo/caso22Mar1248/GF_Vigilancia y Sistemas.xlsx"
            //"/Users/jacfeth/Documents/Clientes/SOAInt/Qualitas/Prorrateo/GF_Teléfono_19Mzr1809.xlsx"
            //"/Users/jacfeth/Documents/Clientes/SOAInt/Qualitas/Prorrateo/GF_Teléfono_Bay.xlsx";
            //"/Users/jacfeth/Documents/Clientes/SOAInt/Qualitas/Prorrateo/v2/GF_Vigilancia y Sistemas.xlsx"
            
            ;
        
        
        Prorrateo pro = parsearArchivoProrrateo( filePath );
        System.out.println( "[getCuentaContable]" + pro.getCuentaContable() );
        System.out.println( "[getDescripcion]" + pro.getDescripcion());
        System.out.println( "[getTotal]" + pro.getTotal());
        System.out.println( "[getConcepto]" + pro.getConcepto() );

        System.out.println( "[getDescripcionIVA]" + pro.getDescripcionIVA() );
        System.out.println( "[getCuentaContableIVA]" + pro.getCuentaContableIVA() );
        System.out.println( "[getOficinaIVA]" + pro.getOficinaIVA() );
        System.out.println( "[getCentroCostosIVA]" + pro.getCentroCostosIVA() );
        
        System.out.println( "[TotalProrrateos]" + pro.getListaProrrateoRow().size() );
        int i = 1;
        for (ProrrateoRow row :  pro.getListaProrrateoRow() ) {
           System.out.println( (i++) + "\t\t" + row.getFolio() + "\t\t" + row.getImporte()  + "\t\t" + row.getNumeroOficina() + "\t\t" + row.getNumeroCentroCosto());
            
       }




    }


    private static String getCellValue(Sheet sheet, int row, int column){
        try{
            Cell cell = sheet.getRow(row).getCell(column) ;
            /*
            System.out.println(row + "," + column + "====> getStringCellValue=" + cell.getStringCellValue());
            System.out.println(row + "," + column + "====> getCellFormula=" + cell.getCellFormula());
            System.out.println(row + "," + column + "====> isPartOfArrayFormulaGroup=" + cell.isPartOfArrayFormulaGroup());
            System.out.println(row + "," +  column + "====> toString=" + cell.toString()   );
            System.out.println(row + "," +  column + "====> getBooleanCellValue=" + cell.getBooleanCellValue() );
            */
            //System.out.println("getBooleanCellValue=" + cell.get );
            
            
            
            
            //if( cell. )
            return formatter.formatCellValue( cell );
        }catch(Exception ex){
            System.err.println( "[Prorrateo Parsing:"+ sheet.getSheetName() +"] No es posible leer la posición [" + row +"," + column + "]" );
            ex.printStackTrace();
        }
            
        return "";
    }
    

    private static String getString(Sheet sheet, int row, int column){
        try {
            return sheet.getRow(row).getCell(column).getStringCellValue() ;
        }catch(Exception ex){
            System.err.println( "[Prorrateo Parsing:"+ sheet.getSheetName() +"] No es posible leer la posición [" + row +"," + column + "]" );
            ex.printStackTrace();
        }
            
        return "";
    }
    
    private static Double getDouble(Sheet sheet, int row, int column){
        try {
            return sheet.getRow(row).getCell(column).getNumericCellValue() ;
        }catch(Exception ex){
            System.err.println( "[Prorrateo Parsing:"+ sheet.getSheetName() +"] No es posible leer la posición [" + row +"," + column + "]" );
            ex.printStackTrace();
        }
            
        return null;
    }


    /**
     * Parsear el documento de prorrateo
     * @param archivo
     * @return
     */
    public static Prorrateo parsearArchivoProrrateo(InputStream archivo) throws IOException {
        Workbook workbook;
        workbook = new XSSFWorkbook(archivo);
        Prorrateo prorrateo = parsearArchivoProrrateo(workbook);
        //IOUtils.closeQuietly(archivo);
        return prorrateo;

    }

    

    private static Prorrateo parsearArchivoProrrateo(Workbook workbook) throws IOException {
        Prorrateo prorrateo = new Prorrateo();
        Sheet firstSheet = workbook.getSheetAt(0);
        Sheet secondSheet = workbook.getSheetAt(1);

        prorrateo.setDescripcion(  getString ( firstSheet, 3, 2) );

        prorrateo.setCuentaContable( getCellValue( firstSheet, 5, 2) );
        //System.out.println("setCuentaContable -> " + getCellValue( firstSheet, 5, 2).toString());

        prorrateo.setConcepto(  getString(secondSheet, 3, 2) );
        
        prorrateo.setTotal( getDouble(secondSheet, 5, 2) );

        prorrateo.setDescripcionIVA( getString(secondSheet, 3, 5 ) );

        prorrateo.setCuentaContableIVA( getCellValue(firstSheet, 7, 2 ) );
        prorrateo.setOficinaIVA( getCellValue(firstSheet, 7, 4 ) );
        prorrateo.setCentroCostosIVA( getCellValue(firstSheet, 7, 6 ) );

        int lastRow = secondSheet.getLastRowNum();


        System.out.println( "  *** [TotalFilas]" + lastRow );

        for (int i = 8; i <= lastRow; i++) {
            
            String folio = getString( secondSheet, i, 1) ;
            double importe = secondSheet.getRow(i).getCell(2).getNumericCellValue();
            String numeroOficina = getString( secondSheet, i, 3) ;//secondSheet.getRow(i).getCell(3).getStringCellValue();
            String numeroCentroCosto =   getString( secondSheet, i, 4) ;//;secondSheet.getRow(i).getCell(4).getStringCellValue();
            if (folio==null || importe == 0 || numeroOficina == null ||
                numeroCentroCosto == null) {
                break;
            }
            ProrrateoRow prorrateoRow = new ProrrateoRow(folio, importe, numeroOficina, numeroCentroCosto);
            prorrateo.getListaProrrateoRow().add(prorrateoRow);
        }
        return prorrateo;
    }    

    
    public static Prorrateo parsearArchivoProrrateoFromBytes(byte[] data) throws IOException {
        InputStream bytesInputStream = new ByteArrayInputStream(data); 
        Workbook workbook;
        workbook = new XSSFWorkbook(bytesInputStream);
        Prorrateo prorrateo = parsearArchivoProrrateo(workbook);
        //IOUtils.closeQuietly(archivo);
        return prorrateo;

    }
        
    public static Prorrateo parsearArchivoProrrateo(String archivo) throws IOException {
        Workbook workbook;
        workbook = new XSSFWorkbook(archivo);
        return parsearArchivoProrrateo(workbook);

    }

    public static Prorrateo parsearArchivoProrrateoDummy(String archivo) throws IOException {
        Prorrateo prorrateo = new Prorrateo();
        prorrateo.setTotal(180000D);
        prorrateo.setDescripcion("SOAINT SA de CV EXCEL PARSER II");
        prorrateo.setCuentaContable("5411310900000");

        ProrrateoRow row = new ProrrateoRow();
        row.setFolio("123456");
        row.setImporte(10000);
        row.setNumeroCentroCosto("15");
        row.setNumeroOficina("20");

        ProrrateoRow row1 = new ProrrateoRow();
        row1.setFolio("789654");
        row1.setImporte(8000);
        row1.setNumeroCentroCosto("15");
        row1.setNumeroOficina("20");

        prorrateo.getListaProrrateoRow().add(row);
        prorrateo.getListaProrrateoRow().add(row1);
        return prorrateo;
    }
    
    
    
}
