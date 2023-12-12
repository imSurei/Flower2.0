package tw.sure.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.sure.model.news.News;
import tw.sure.model.news.NewsService;
import tw.sure.model.news.NewsServiceImpl;
import tw.sure.utils.WebUtils;

public class NewsServlet extends BaseServlet{

	private static final long serialVersionUID = 1L;
	private NewsService nService = new NewsServiceImpl();
	
	
	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<News> news = nService.findAllNews();
		
		request.setAttribute("news", news);
		
		request.getRequestDispatcher("/pages/adminNews.jsp").forward(request, response);

	}
	
	protected void listAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<News> news = nService.findAllNews();
		
		request.setAttribute("news", news);
		
		request.getRequestDispatcher("/pages/news.jsp").forward(request, response);

	}
	
	protected void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		News news = new News();
		news.setTitle(request.getParameter("title"));
		news.setDate(request.getParameter("date"));
		news.setContent(request.getParameter("content"));
		
		nService.insertNews(news);
		
		response.sendRedirect(request.getContextPath()+"/manager/NewsServlet?action=list");
		
	}
	
	protected void getNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = WebUtils.parseInt(request.getParameter("id"), 0);
		
		News news = nService.findNewsById(id);
		
		request.setAttribute("news", news);
		
		request.getRequestDispatcher("/pages/news_edit.jsp").forward(request, response);
		
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		News news = new News();
		
		news.setId(WebUtils.parseInt(request.getParameter("id"), 0));
		news.setDate(request.getParameter("date"));
		news.setTitle(request.getParameter("title"));
		news.setContent(request.getParameter("content"));
		
		nService.updateNews(news);
		
		response.sendRedirect(request.getContextPath()+"/manager/NewsServlet?action=list");
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = WebUtils.parseInt(request.getParameter("id"), 0);
		
		nService.deleteNews(id);
		
		response.sendRedirect(request.getContextPath()+"/manager/NewsServlet?action=list");
	}
	
}
