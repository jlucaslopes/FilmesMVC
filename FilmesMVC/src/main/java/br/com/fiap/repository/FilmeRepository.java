package br.com.fiap.repository;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import br.com.fiap.model.FilmeModel;

@Repository
public class FilmeRepository {

	private final String GET_ALL = "Select * from filme";
	private final String SAVE = "Insert into FILME (NOME,SINOPSE,GENERO,PRODUTORA,DATALANCAMENTO) values (?,?,?,?,?)";
	private static final String GET_BYID = "SELECT * FROM FILME where ID = ?";
	private static final String UPDATE = "UPDATE FILME SET NOME = ? , SINOPSE = ? , GENERO = ? , PRODUTORA = ? , DATALANCAMENTO = ? where ID = ?";
    private static final String DELETE = "DELETE FROM FILME WHERE ID = ?";
	
	private static FilmeRepository instance;

	
	@Autowired 
	public JdbcTemplate jdbcTemplate;

	public static FilmeRepository getInstance() {

		if (instance == null) {
			instance = new FilmeRepository();
		}
		return instance;
	}

	public FilmeRepository() {
	}
		
	public List<FilmeModel> findAll() {
		
		List<FilmeModel> filmes = jdbcTemplate.query(GET_ALL, new BeanPropertyRowMapper<FilmeModel>(FilmeModel.class));
		
		return filmes;
	}

	public FilmeModel findById(long id) {
		return jdbcTemplate.queryForObject(GET_BYID, new BeanPropertyRowMapper<>(FilmeModel.class), id);
	}
	
	public void save(FilmeModel filmeModel) {
		this.jdbcTemplate.update(SAVE, 
				filmeModel.getNome(), 
				filmeModel.getSinopse(), 
				filmeModel.getGenero(), 
				filmeModel.getProdutora(), 
				filmeModel.getDataLancamento());
	}
	
	public void update(FilmeModel filmeModel) {
		this.jdbcTemplate.update(UPDATE, 
				filmeModel.getNome(), 
				filmeModel.getSinopse(), 
				filmeModel.getGenero(), 
				filmeModel.getProdutora(), 
				filmeModel.getDataLancamento(),
				filmeModel.getId());


	}
	
	public void deleteById(long id) {
		jdbcTemplate.update(DELETE, id);
	}
	
	
	
	
	
	

}
