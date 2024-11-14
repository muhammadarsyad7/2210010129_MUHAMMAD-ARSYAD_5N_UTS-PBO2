/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package confignpm;
    import java.sql.Driver;
    import java.sql.DriverManager;
    import java.sql.Connection;
    import java.sql.SQLException;
    import java.sql.Statement;
    import java.sql.ResultSet;
    import javax.swing.JOptionPane;
    import javax.swing.table.DefaultTableModel;
    import javax.swing.JTable;
    import javax.swing.table.TableColumn;


/**
 *
 * @author USER
 */
public class config2210010129 {
    
    private String jdbcUrl = "jdbc:mysql://localhost:3306/2210010129_pbo2";
    private String username = "root";
    private String password = "";
    
    private DefaultTableModel Modelnya;
    private TableColumn Kolomnya;
    
    public config2210010129(){}
    public Connection getKoneksiNPM() throws SQLException{
        try {
	Driver mysqldriver = new com.mysql.cj.jdbc.Driver();
        DriverManager.registerDriver(mysqldriver);
        System.out.println("Koneksi DB Berhasil");
        } catch (SQLException e) {

	System.err.println(e.toString());
        }
	return DriverManager.getConnection(jdbcUrl, username, password);
        }
    
    public Boolean DuplicateKey(String NamaTable, String PrimaryKey, String isiData){
    Boolean hasil=false;
    
    int i = 0;

    try{
        String SQL = "SELECT * FROM "+NamaTable+" WHERE "+PrimaryKey+" = '"+isiData+"'";
        Statement perintah = getKoneksiNPM().createStatement();
        ResultSet hasilData = perintah.executeQuery(SQL);
        while(hasilData.next()){
            i++;
        }

        if(i==0){
            hasil=false;
        }else{
            hasil=true;
        }
        
        } catch (Exception e){
        System.err.println(e.toString());
        }

    return hasil; 
    }
    
    public String getFieldTable(String[] FieldTablenya){
        String hasilnya = "";
        int deteksiIndexAkhir=FieldTablenya.length-1;
        try {
            for (int i = 0; i < FieldTablenya.length; i++){
                if(i==deteksiIndexAkhir){
                    hasilnya=hasilnya+FieldTablenya[i];
                } else {
                   hasilnya=hasilnya+FieldTablenya[i]+","; 
                }
            }
            } catch (Exception e){
        System.out.println(e.toString());
        }
            return"("+hasilnya+")";
    }
    
    public String getIsiTable(String[] IsiTablenya){
        String hasilnya = "";
        int DeteksiIndex=IsiTablenya.length-1;
        try {
            for (int i = 0; i < IsiTablenya.length; i++){
                if(i==DeteksiIndex){
                    hasilnya=hasilnya+"'"+IsiTablenya[i]+"'";
                } else {
                   hasilnya=hasilnya+"'"+IsiTablenya[i]+"',"; 
                }
            }
            } catch (Exception e){
        System.out.println(e.toString());
        }
            return"("+hasilnya+")";
    }
    
    public void SimpanDinamis(String NamaTable, String[] Fieldnya, String[] Isinya){
    try{
           String SQLSave = "INSERT INTO "+NamaTable+" "+getFieldTable(Fieldnya)+" VALUES" +getIsiTable(Isinya);
           Statement perintah = getKoneksiNPM().createStatement();
           
           perintah.executeUpdate(SQLSave);
           perintah.close();
           System.out.println("Data Berhasil disimpan");
    
    } catch (Exception e){
        System.err.println(e.toString());
    }    
    }
    
    public String getFieldValueEdit(String[] Field, String[] value){
        String hasil = "";
        int deteksi = Field.length-1;
        try {
            for (int i = 0; i < Field.length; i++) {
                if (i==deteksi){
                    hasil = hasil +Field[i]+" ='"+value[i]+"'";
                }else{
                   hasil = hasil +Field[i]+" ='"+value[i]+"',";  
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return hasil;
    }

    public void UbahDinamis(String NamaTabel, String PrimaryKey, String IsiPrimary,String[] Field, String[] Value){
        
        try {
           String SQLUbah = "UPDATE "+NamaTabel+" SET "+getFieldValueEdit(Field, Value)+" WHERE "+PrimaryKey+"='"+IsiPrimary+"'";
           Statement perintah = getKoneksiNPM().createStatement();
           perintah.executeUpdate(SQLUbah);
           perintah.close();
           getKoneksiNPM().close();
           System.out.println("Data Berhasil diUbah");
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        
    }

    public void HapusDinamis(String NamaTabel, String PK, String isi){
        try {
            String SQL="DELETE FROM "+NamaTabel+" WHERE "+PK+"='"+isi+"'";
            Statement perintah = getKoneksiNPM().createStatement();
            perintah.executeUpdate(SQL);
            perintah.close();
            JOptionPane.showMessageDialog(null,"Data Berhasil Dihapus");
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    
}

