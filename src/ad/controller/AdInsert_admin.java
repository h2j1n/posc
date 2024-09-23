package ad.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ad.service.AdServiceImpl;
import ad.service.IAdService;
import ad.vo.AdVO;

@WebServlet("/AdInsert_admin.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
                 maxFileSize = 1024 * 1024 * 5,    // 5MB
                 maxRequestSize = 1024 * 1024 * 5 * 5) // 25MB
public class AdInsert_admin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads"; // 파일 업로드 상대 경로 설정

    private IAdService service = AdServiceImpl.getInstance();

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        
        request.getRequestDispatcher("/jsp/ad/adForm_admin.jsp").forward(request, response);
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        AdVO adList = new AdVO();
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String user = request.getParameter("user");
        Part filePart = request.getPart("file");

        // 업로드된 파일의 이름을 가져옴
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        // 파일을 저장할 디렉토리 경로 설정
        String appPath = request.getServletContext().getRealPath("");
        String filePath = appPath + File.separator + UPLOAD_DIR + File.separator + fileName;

        File uploadDir = new File(appPath, UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // 디렉토리가 없으면 생성
        }
        
        try (InputStream input = filePart.getInputStream();
             OutputStream output = new FileOutputStream(filePath)) {
            // 파일을 저장
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 파일 내용을 바이트 배열로 설정
        try (InputStream input = filePart.getInputStream();
             ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
            byte[] fileBytes = output.toByteArray();
            adList.setAd_File_Byte(fileBytes);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // AdVO 객체 생성 및 값 설정
        adList.setAd_title(title);
        adList.setAd_content(content);
        adList.setAd_user(user);
        adList.setAd_file(fileName); // 파일명 저장

        // 서비스를 통해 광고 등록
        int status = service.insertAd_admin(adList);

        // 성공 시 메인 페이지로 리다이렉트, 실패 시 다시 등록 페이지로 이동
        if (status > 0) {
            // 파일을 저장할 경로 출력
            System.out.println("File Path: " + UPLOAD_DIR + File.separator + fileName);
            response.sendRedirect("/AdList.do");
        } else {
            request.getRequestDispatcher("/jsp/ad/adForm_admin.jsp").forward(request, response);
        }
    }
}
