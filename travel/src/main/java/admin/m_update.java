package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class m_update {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String sql = "";
	Integer result = null;
	
	m_db db = new m_db();
	
	ArrayList<String> one_notice = null;  //1개 공지데이터만 저장시킴 
	
	public void viewcount(int nidx) {
		try {
			this.con = this.db.getConnection();
			
			this.sql = "update notice set n_view = n_view+1 where nidx=?";
			this.ps = this.con.prepareStatement(this.sql);
			this.ps.setInt(1, nidx);  
			this.ps.executeUpdate();  
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} finally {
			try {
				this.ps.close();
				this.con.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		
		
	}
}
