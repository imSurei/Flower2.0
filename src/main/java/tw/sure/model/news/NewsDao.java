package tw.sure.model.news;

import java.util.List;

public interface NewsDao {
	
		// Read
		News findNewsById(Integer id); 
		
		// Read All
		List<News> findAllNews();
		
		// Create 
		int insertNews(News news);
		
		// Update
		int updateNews(News news);
		
		// Delete
		void deleteNews(Integer id);

}
