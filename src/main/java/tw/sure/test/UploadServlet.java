package tw.sure.test;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//	ServletInputStream inputStream = request.getInputStream();
		//	byte[] buffer = new byte[1024];
		//	int read = inputStream.read(buffer); 
		//	System.out.println(new String(buffer,0,read));
			
		
		// 以下API都用apache.commons的包，不要使用tomcat的包
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			FileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
			
			try {
				// 解析上傳數據，得到表單項FileItem
				List<FileItem> list = servletFileUpload.parseRequest(request);
				
				for(FileItem fileItem:list) {
					
					if(fileItem.isFormField()) { // 普通表單項目
						
						System.out.println("表單name屬性： "+fileItem.getFieldName());
						
						System.out.println("表單value屬性： "+fileItem.getString("UTF-8"));
						
					}else { // 上傳的文件
						
						System.out.println("表單name屬性： "+fileItem.getFieldName());
						System.out.println("文件名： "+fileItem.getName());
						
						fileItem.write(new File("/Users/sure/eclipse/MyFlower/MyFlower2.0/src/main/webapp/pages/pics/"+fileItem.getName()));
						
						
					}
					
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		
		
	
	}

}
