package tw.sure.test;

import java.util.List;

import tw.sure.model.news.News;
import tw.sure.model.news.NewsService;
import tw.sure.model.news.NewsServiceImpl;

public class TestNews {
	public static void main(String[] args) {
		
		 NewsService nService = new NewsServiceImpl();
		 
		 
		 List<News> findAllNews = nService.findAllNews();
		 for(News news:findAllNews) {
			 System.out.println(news);
		 }
		
		
	}

}
