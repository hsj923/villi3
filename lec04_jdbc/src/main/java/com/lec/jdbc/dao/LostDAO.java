package com.lec.jdbc.dao;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.lec.jdbc.commom.SearchVO;
import com.lec.jdbc.mapper.LostRowMapper;
import com.lec.jdbc.vo.LostVO;

@Repository("LostDAO")
@PropertySource("classpath:config/lostsql.properties")
public class LostDAO {
	
	@Autowired                    
	private JdbcTemplate jdbcTemplate;

	@Autowired
	Environment environment;
	
	
	private String sql = "";
	private String get_pageinfo     = ""; 
	private String insert_Lost     = ""; 
	private String update_Lost     = ""; 
	private String delete_Lost     = ""; 
	private String get_Lost        = ""; 
	private String get_Lost_list   = ""; 
	private String selectLostListByTitle = ""; 
	private String selectLostListByWriter = ""; 
	private String selectLostListByCate = ""; 

	@PostConstruct
	public void getSqlPropeties() {
		get_pageinfo     = environment.getProperty("get_pageinfo");
		insert_Lost     = environment.getProperty("insert_Lost");
		update_Lost 	 = environment.getProperty("update_Lost");
		delete_Lost 	 = environment.getProperty("delete_Lost");
		get_Lost 		 = environment.getProperty("get_Lost");
		get_Lost_list   = environment.getProperty("get_Lost_list");
		selectLostListByTitle   = environment.getProperty("selectLostListByTitle");
		selectLostListByWriter  = environment.getProperty("selectLostListByWriter");
		selectLostListByCate = environment.getProperty("selectLostListByCate");
	}
//	
//	public List<LostVO> getLostList(int currentPage, int perPage) {		
//		Object[] args = {(currentPage-1)*perPage,  perPage };
//		return jdbcTemplate.query(get_Lost_list, args, new LostRowMapper());		
//	}
		
	public LostVO getLost(LostVO Lost) {
		Object[] args = { Lost.getSeq() };
		return jdbcTemplate.queryForObject(get_Lost, args, new LostRowMapper());	
	}
	
	public int getTotalRowCount(SearchVO searchVO) {
		
		if(searchVO.getSearchType()==null || searchVO.getSearchType().isEmpty() ||
				searchVO.getSearchWord()==null || searchVO.getSearchWord().isEmpty()) {
			sql = get_pageinfo;
			searchVO.setSearchType("title");
		} else {			
			if(searchVO.getSearchType().equalsIgnoreCase("title")) {
				sql = get_pageinfo + " and title like '%" + searchVO.getSearchWord() + "%'";
			} else if(searchVO.getSearchType().equalsIgnoreCase("writer")) {
				sql = get_pageinfo + " and writer like '%" + searchVO.getSearchWord() + "%'";
			} else if(searchVO.getSearchType().equalsIgnoreCase("cate2")) {
				sql = get_pageinfo + " and cate2 like '%" + searchVO.getSearchWord() + "%'";
			}	
		}
		return jdbcTemplate.queryForInt(sql);
	}
	
	public List<LostVO> getLostList(SearchVO searchVO) {
		
		if(searchVO.getSearchType()==null || searchVO.getSearchType().isEmpty() ||
				searchVO.getSearchWord()==null || searchVO.getSearchWord().isEmpty()) {
			sql = selectLostListByTitle;
			searchVO.setSearchType("title");
		} else {
			if(searchVO.getSearchType().equalsIgnoreCase("title")) {
				sql = selectLostListByTitle;
			} else if(searchVO.getSearchType().equalsIgnoreCase("writer")) {
				sql = selectLostListByWriter;
			} else if(searchVO.getSearchType().equalsIgnoreCase("cate2")) {
				sql = selectLostListByCate;
			} 					
		}
		
		String searchWord = "%" + searchVO.getSearchWord() + "%";					
		Object[] args = {searchWord, searchVO.getFirstRow(), searchVO.getRowSizePerPage()};
		return jdbcTemplate.query(sql, args, new LostRowMapper());
	}

	public int insertLost(LostVO Lost) {
		return jdbcTemplate.update(insert_Lost, Lost.getTitle(), Lost.getWriter(), Lost.getContent(), Lost.getFileName1(),Lost.getFileName2()
				                   ,Lost.getFileName3(), Lost.getFileName4(), Lost.getFileName5(), Lost.getCate2());
	}

	public int deleteLost(LostVO Lost) {
		return jdbcTemplate.update(delete_Lost, Lost.getSeq());
	}

	public int updateLost(LostVO Lost) {
		return jdbcTemplate.update(update_Lost, Lost.getTitle(), Lost.getContent(), Lost.getSeq());
	}	
	

		
/* --------------------------------------------------------------------------------------------------- */
	


	   public int updateCnt(int seq) {
		      int updateCount = 0;
		      String sql = "update Lost set cnt = cnt + 1 " + " where seq = ?";
		      jdbcTemplate.update(sql, seq);
		      return updateCount;
		   }



}
