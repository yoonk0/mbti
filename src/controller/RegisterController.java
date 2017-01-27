package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RegisterController implements Controller {

   @Override
   public ModelAndView execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
		int maxSize = 1024 * 1024 * 10; // 10Mbyte 제한
		String root = "/Users/YoonKim/Documents/MBTI/mbti/WebContent/"; //웹서버 컨테이너 경로
		// root = "C:\\java-kosta\\semi\\cocoa2\\WebContent\\";
		String savePath = root + "img/"; //파일 저장 경로
		String uploadFile = ""; //업로드 파일명
		String newFileName = ""; //실제저장할 파일명
		int read = 0;
		byte[] buf = new byte[1024];
		FileInputStream fin = null;
		FileOutputStream fout = null;
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
		MultipartRequest multi = null;
		String id = null;
		String password = null;
		String gender = null;
		int age = 0;
		String location = null;
		String hobby = null;
		int height = 0;
		String job = null;
		String kakao = null;
		String ie = null;
		String sn = null;
		String tf = null;
		String pj = null;
		String mbti = null;
		
		try {
			multi = new MultipartRequest(request, savePath, maxSize,
					"UTF-8", new DefaultFileRenamePolicy());
			id = multi.getParameter("id");
			password = multi.getParameter("password");
			gender = multi.getParameter("sex");
			age = Integer.parseInt(multi.getParameter("age"));
			location = multi.getParameter("location");
			hobby = multi.getParameter("hobby");
			height = Integer.parseInt(multi.getParameter("height"));
			job = multi.getParameter("job");
			kakao = multi.getParameter("kakao");
			ie = multi.getParameter("ie");
			sn = multi.getParameter("sn");
			tf = multi.getParameter("tf");
			pj = multi.getParameter("pj");
			mbti = ie + sn + tf + pj;
			//파일 업로드
			uploadFile = multi.getFilesystemName("uploadFile");

			//실제 저장할 파일명
			newFileName = id + "."
					+ uploadFile.substring(uploadFile.lastIndexOf(".") + 1);
			System.out.println(newFileName);
			//업로드된 파일 객체 생성
			File oldFile = new File(savePath + uploadFile);

			//실제 저장될 파일 객체 생성
			File newFile = new File(savePath + newFileName);

			//파일명 rename
			if (!oldFile.renameTo(newFile)) {
				//rename이 되지 않을 경우 강제로 파일을 복사하고 기존파일은 삭제
				buf = new byte[1024];
				fin = new FileInputStream(oldFile);
				fout = new FileOutputStream(newFile);
				read = 0;
				while ((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
				}

				fin.close();
				fout.close();
				oldFile.delete();
			}
			MemberDAO.getInstance().register(id, password, gender, age, location, job, height, hobby,newFileName, mbti, kakao);
		} catch (Exception e) {
			e.printStackTrace();
		}

   
      
      return new ModelAndView("redirect:member/register_ok.jsp");
   }

}