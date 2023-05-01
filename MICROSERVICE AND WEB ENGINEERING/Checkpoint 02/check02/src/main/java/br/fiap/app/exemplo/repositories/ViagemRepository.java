package br.fiap.app.exemplo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.fiap.app.exemplo.models.Viagem;

public interface ViagemRepository extends JpaRepository<Viagem, Long>{

}
