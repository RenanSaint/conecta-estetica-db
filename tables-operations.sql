
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



-- TABELA SERVICO
-- Inserir serviços
INSERT INTO Servico (profissional_id, titulo, descricao, preco, duracao_minutos)
VALUES
  (1, 'Corte de cabelo masculino', 'Corte degradê e acabamento com navalha', 35.00, 40),
  (1, 'Barba completa', 'Modelagem e hidratação de barba', 25.00, 30);

-- Atualizar preço
UPDATE Servico
SET preco = 30.00
WHERE servico_id = 2;

-- Excluir serviço
DELETE FROM Servico
WHERE servico_id = 1;

-- Consultar serviços de um profissional
SELECT s.titulo, s.preco, s.duracao_minutos
FROM Servico s
WHERE s.profissional_id = 1;



-- TABELA AGENDAMENTO
-- Inserir agendamentos
INSERT INTO Agendamento (cliente_id, profissional_id, servico_id, data_hora, status)
VALUES
  (1, 1, 2, '2025-11-10 14:00:00', 'agendado'),
  (1, 1, 2, '2025-11-12 16:00:00', 'agendado');

-- Atualizar status após o atendimento
UPDATE Agendamento
SET status = 'concluido'
WHERE agendamento_id = 1;

-- Cancelar um agendamento
UPDATE Agendamento
SET status = 'cancelado'
WHERE agendamento_id = 2;

-- Consultar agenda futura de um profissional
SELECT a.agendamento_id, u.nome AS cliente, s.titulo, a.data_hora, a.status
FROM Agendamento a
JOIN Cliente c ON a.cliente_id = c.cliente_id
JOIN Usuario u ON c.usuario_id = u.usuario_id
JOIN Servico s ON a.servico_id = s.servico_id
WHERE a.profissional_id = 1
  AND a.data_hora >= NOW()
ORDER BY a.data_hora;



-- TABELA AVALIACAO
-- Inserir avaliação de um atendimento concluído
INSERT INTO Avaliacao (agendamento_id, nota, comentario)
VALUES (1, 5, 'Excelente atendimento, muito profissional!');

-- Atualizar nota da avaliação
UPDATE Avaliacao
SET nota = 4, comentario = 'Ótimo corte, mas pequeno atraso.'
WHERE avaliacao_id = 1;

-- Excluir uma avaliação indevida
DELETE FROM Avaliacao
WHERE avaliacao_id = 1;

-- Consultar avaliações de um profissional
SELECT u.nome AS cliente, a.nota, a.comentario, a.data_avaliacao
FROM Avaliacao a
JOIN Agendamento ag ON a.agendamento_id = ag.agendamento_id
JOIN Cliente c ON ag.cliente_id = c.cliente_id
JOIN Usuario u ON c.usuario_id = u.usuario_id
WHERE ag.profissional_id = 1;
