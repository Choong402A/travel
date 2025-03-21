package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class m_file {
	long filesize = 0;  //파일용량 가져옴
	String filenm = null;
	String url = null;
	String folder = null;
	
	public String file_attach(Part file, HttpServletRequest req)throws IOException{
		this.filesize = file.getSize();  //파일용량 가져옴
		if(file!=null && this.filesize !=0) {  //첨부파일이 있으면 
			this.filenm = file.getSubmittedFileName();  //파일명 가져옴
			this.url = req.getServletContext().getRealPath("/notice_file/");  
//			System.out.println(this.url);
			//첨부파일 저장될 경로 지정 (D:\Choong402A\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\travel\notice_file\)
			
			file.write(this.url+this.filenm);  //파일 저장
			
		}else {  //첨부파일 없으면
			this.filenm = null;
		}
		
		return this.filenm;
	}

}
