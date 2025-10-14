-- Aula 12 - Prática
    
USE DB_PraticaAula12_Lizandra_03361B;
    
CREATE TABLE Produtos_Padaria (
  id INT PRIMARY KEY AUTO_INCREMENT,
  produto VARCHAR(150),
  secao VARCHAR(50),
  preco DECIMAL(5, 2)
  );
    
INSERT INTO Produtos_Padaria (produto, secao, preco) VALUES
	('Bolo de fubá', 'Confeitaria', 35.00),
  ('Pão francês', 'Padaria', 16.00),
  ('Bauru', 'Lanchonete', 4.00),
  ('Café com leite', 'Lanchonete', 1.50);
        
SELECT * FROM Produtos_Padaria;
    
UPDATE Produtos_Padaria SET preco = 4.50 WHERE id = 3;
    
INSERT INTO Produtos_Padaria (produto, secao, preco) VALUES
	('Bolo de cenoura', 'Confeitaria', 45.00);
	
DELETE FROM Sapatos WHERE id = 5;

SELECT * FROM Produtos_Padaria;
