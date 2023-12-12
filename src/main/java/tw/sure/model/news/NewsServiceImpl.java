package tw.sure.model.news;

import java.util.List;

public class NewsServiceImpl implements NewsService {
	
	private NewsDao newsDao = new NewsDaoImpl();

	@Override
	public News findNewsById(Integer id) {
		return newsDao.findNewsById(id);
	}

	@Override
	public List<News> findAllNews() {
		return newsDao.findAllNews();
	}

	@Override
	public int insertNews(News news) {
		return newsDao.insertNews(news);
	}

	@Override
	public int updateNews(News news) {
		return newsDao.updateNews(news);
	}

	@Override
	public void deleteNews(Integer id) {
		newsDao.deleteNews(id);
	}

}
