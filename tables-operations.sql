
-- TABELA USUARIO
-- Inserir usuários (clientes e profissionais)
INSERT INTO Usuario (nome, email, telefone, senha_hash, tipo)
VALUES 
  ('Ana Souza', 'ana@email.com', '(71)99999-1111', 'hash_ana', 'cliente'),
  ('Bruno Lima', 'bruno@email.com', '(71)98888-2222', 'hash_bruno', 'profissional'),
  ('Carla Santos', 'carla@email.com', '(71)97777-3333', 'hash_carla', 'profissional');

-- Atualizar telefone de um usuário
UPDATE Usuario
SET telefone = '(71)99999-5555'
WHERE usuario_id = 1;

-- Excluir usuário inativo
DELETE FROM Usuario
WHERE usuario_id = 3;

-- Consultar todos os profissionais cadastrados
SELECT nome, email, telefone
FROM Usuario
WHERE tipo = 'profissional';



-- TABELA PROFISSIONAL
-- Inserir profissionais (referenciando Usuario)
INSERT INTO Profissional (usuario_id, especialidade, descricao)
VALUES
  (2, 'Barbeiro', 'Cortes masculinos e design de barba.'),
  (3, 'Manicure', 'Serviços de unhas e alongamento em gel.');

-- Atualizar descrição de um profissional
UPDATE Profissional
SET descricao = 'Cortes modernos e barba estilizada.'
WHERE profissional_id = 1;

-- Remover profissional (por exemplo, se excluiu o perfil)
DELETE FROM Profissional
WHERE profissional_id = 2;

-- Listar profissionais e suas especialidades
SELECT u.nome, p.especialidade, p.avaliacao_media
FROM Profissional p
JOIN Usuario u ON u.usuario_id = p.usuario_id;



-- TABELA CLIENTE
-- Inserir cliente (referenciando Usuario)
INSERT INTO Cliente (usuario_id)
VALUES (1);

-- Atualizar data de cadastro manualmente (caso importado)
UPDATE Cliente
SET data_cadastro = '2025-10-01 09:00:00'
WHERE cliente_id = 1;

-- Excluir cliente
DELETE FROM Cliente
WHERE cliente_id = 1;

-- Consultar lista de clientes
SELECT u.nome, u.email, c.data_cadastro
FROM Cliente c
JOIN Usuario u ON u.usuario_id = c.usuario_id;