package com.btaylor.languages.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.btaylor.languages.models.Language;

@Repository
public interface LanguageRepository extends CrudRepository<Language, Long>{
	List<Language> findAll();
    // this method finds books with descriptions containing the search string
    List<Language> findByCreatorContaining(String search);
    // this method counts how many titles contain a certain string
    Long countByVersionContaining(String search);
    // this method deletes a book that starts with a specific title
    Long deleteByCreatorStartingWith(String search);
}
