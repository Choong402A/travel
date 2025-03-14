package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class m_update {
	Connection con = null;
	PreparedStatement ps = null;
	String sql = null;
	String result = null;
	int qresult = 0;
	m_db db = new m_db();
	

	public String verified(String mid,String verified) {
		try {
			this.con = this.db.getConnection();
			
			if(verified.equals("")||verified==null) {
				return null;
			} 
			
			
			if(verified.equals("Y")) {
				this.sql = "update member set verified=’Y’ where mid=’mid’;";
				this.result = "verified";
			} else if(verified.equals("N")){
				this.sql = "update member set verified=’N’ where mid=’mid’;";
				this.result = "unverified";
			} else {
				return null;
			}

			this.ps = this.con.prepareStatement(this.sql);
			qresult = this.ps.executeUpdate();
			
			if (qresult == 0 ) {
				this.result = null;
			} 
			
			
		} catch (Exception e) {
		} finally {
			try {
				this.ps.close();
				this.con.close();
			} catch (Exception e2) {
			}
		}

		
		
		
		return this.result;
	}

};