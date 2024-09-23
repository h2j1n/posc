package ad.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdDownload", urlPatterns = { "/AdDownload.do" }, loadOnStartup = 1)
public class AdDownload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 업로드된 파일이 저장된 디렉토리 상대 경로
    private static final String UPLOAD_DIR = "uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 요청 파라미터로부터 다운로드할 파일의 이름을 가져옴 (URL 디코딩)
        String fileName = URLDecoder.decode(request.getParameter("fileName"), "UTF-8");

        // 파일 경로 설정
        String appPath = request.getServletContext().getRealPath("");
        String filePath = appPath + File.separator + UPLOAD_DIR + File.separator + fileName;

        File file = new File(filePath);

        // 파일이 존재하는지 확인
        if (file.exists()) {
            // 파일이 존재하면 다운로드 시작
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName, "UTF-8") + "\"");

            try (FileInputStream fis = new FileInputStream(file)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fis.read(buffer)) != -1) {
                    response.getOutputStream().write(buffer, 0, bytesRead);
                }
            } catch (IOException e) {
                e.printStackTrace();
                response.setContentType("text/html");
                response.getWriter().println("<h3>파일 다운로드 중 오류가 발생했습니다.</h3>");
            }
        } else {
            // 파일이 존재하지 않으면 에러 메시지 출력
            response.setContentType("text/html");
            response.getWriter().println("<h3>파일이 존재하지 않습니다.</h3>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
