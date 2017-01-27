package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.MemberDAO;
import model.MemberVO;

public class MemberUpdateController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request,	HttpServletResponse response) throws Exception {
		System.out.println("여긴옴?");
		int maxSize = 1024 * 1024 * 10; // 10Mbyte 제한
		String root = "C:\\java-kosta\\WAS\\semi-tomcat\\webapps\\cocoa2\\"; //웹서버 컨테이너 경로
		 //root = "C:\\java-kosta\\semi\\cocoa2\\WebContent\\";
		String savePath = root + "img\\"; //파일 저장 경로
		String uploadFile = null; //업로드 파일명
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
/*		if(newFileName==""){
			HttpSession session = request.getSession(false);
			MemberVO vo = (MemberVO)session.getAttribute("login");
			newFileName = vo.getPicture();
		}*/
		
			multi = new MultipartRequest(request, savePath, maxSize,
					"UTF-8", new DefaultFileRenamePolicy());
			id = multi.getParameter("id");
			password = multi.getParameter("pass");
			gender = multi.getParameter("gender");
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
			
			uploadFile = multi.getFilesystemName("uploadFile");
			System.out.println(uploadFile+"업로드파일");
		if(uploadFile==null){
			System.out.println("if수행전");
				uploadFile = id+".jpg";
			}
			System.out.println(uploadFile);
			//파일 업로드
		
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
	
		MemberVO vo=new MemberVO(id, password, gender, age, location, job, height, hobby, newFileName, mbti, kakao);
		System.out.println("업데이트"+vo);
		MemberDAO.getInstance().memberUpdate(vo);
		System.out.println("업데이트 완료");
		return new ModelAndView("DispatcherServlet?command=showDetail&id="+vo.getId());

	}

}
