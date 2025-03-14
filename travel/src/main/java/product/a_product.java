package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import admin.m_db;

public class a_product {
	Connection con = null;
	PreparedStatement pst = null;
	String sql = "";
	m_db db = new m_db();
	ResultSet rs = null;
	
	ArrayList<String> p_data = null;
	ArrayList<ArrayList<String>> palldata = null;
	
	public ArrayList<ArrayList<String>> ap_data(String hw_select ,String hw_s_word){
		try {
			if(hw_select.equals("상품명")) {
			this.con = this.db.getConnection();
			this.sql = "select pcode,pimg,pname,pbigca,psmallca,pprice,psale,pcount,psell "
					+ "from p_register where pname =? order by pprice desc";
			this.pst = this.con.prepareStatement(this.sql);
			this.pst.setString(1, hw_s_word);
			this.rs = this.pst.executeQuery();
			
			
			this.palldata = new ArrayList<ArrayList<String>>();
			while(this.rs.next()) {
				this.p_data = new ArrayList<String>();
				this.p_data.add(this.rs.getString("pcode"));
				this.p_data.add(this.rs.getString("pimg"));
				this.p_data.add(this.rs.getString("pname"));
				this.p_data.add(this.rs.getString("pbigca"));
				this.p_data.add(this.rs.getString("psmallca"));
				this.p_data.add(this.rs.getString("pprice"));
				this.p_data.add(this.rs.getString("psale"));
				this.p_data.add(this.rs.getString("pcount"));
				this.p_data.add(this.rs.getString("psell"));
				this.palldata.add(this.p_data);
			}
			}else if (hw_select.equals("상품코드")) {
				this.con = this.db.getConnection();
				this.sql = "select pcode,pimg,pname,pbigca,psmallca,pprice,psale,pcount,psell "
						+ "from p_register where pcode =? order by pprice desc";
				this.pst = this.con.prepareStatement(this.sql);
				this.pst.setString(1, hw_s_word);
				this.rs = this.pst.executeQuery();
				
				
				this.palldata = new ArrayList<ArrayList<String>>();
				while(this.rs.next()) {
					this.p_data = new ArrayList<String>();
					this.p_data.add(this.rs.getString("pcode"));
					this.p_data.add(this.rs.getString("pimg"));
					this.p_data.add(this.rs.getString("pname"));
					this.p_data.add(this.rs.getString("pbigca"));
					this.p_data.add(this.rs.getString("psmallca"));
					this.p_data.add(this.rs.getString("pprice"));
					this.p_data.add(this.rs.getString("psale"));
					this.p_data.add(this.rs.getString("pcount"));
					this.p_data.add(this.rs.getString("psell"));
					this.palldata.add(this.p_data);
			}
			}	
		}catch (Exception e) {
			this.palldata = null;
			System.out.println("뭐임??"+e.getMessage());

		}finally {
			try {
				this.rs.close();
				this.pst.close();
				this.con.close();
			}catch (Exception e) {
				
			}
		}
		
		
		
		return this.palldata;
	}
}
