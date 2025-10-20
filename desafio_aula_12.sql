USE empresa_db;

GRANT SELECT ON empresa_db.vendas TO 'ana.analista' @'%';

GRANT INSERT ON empresa_db.vendas TO 'bruno.estagiario' @'%';

GRANT SELECT, INSERT, UPDATE, DELETE
	ON empresa_db.vendas TO 'carla.gerente' @'%';