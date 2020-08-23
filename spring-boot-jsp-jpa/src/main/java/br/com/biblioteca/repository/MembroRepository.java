package br.com.biblioteca.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.biblioteca.model.Membro;

public interface MembroRepository extends JpaRepository<Membro, Long>{

}
