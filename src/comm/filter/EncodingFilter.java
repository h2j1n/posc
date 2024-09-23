package comm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;



public class EncodingFilter implements Filter {
	private String encoding;
	@Override
	public void destroy() {
		System.out.println("utf-8인코딩 필터 끝");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("EncodingFilter doFilter() 동작중... ");
		if(request.getCharacterEncoding()==null) {
			request.setCharacterEncoding(encoding);
		}
		chain.doFilter(request, response);
		

			
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		System.out.println("utf-8 인코딩 적용시작 ");
		encoding = filterConfig.getInitParameter("encoding");
	}
	

}
