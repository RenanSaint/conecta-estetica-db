-- Inserir usuário
INSERT INTO Usuario (nome, email, senha_hash, tipo)
VALUES ('Ana Souza', 'ana@email.com', 'hash123', 'cliente');

-- Inserir Cliente referenciando o usuário
INSERT INTO Cliente (usuario_id) VALUES (1);

-- Atualizar agendamento
UPDATE Agendamento
SET status = 'Concluido'
WHERE agendamento_id = 5;

-- Remover serviço
DELETE FROM Servico
WHERE servico_id = 3;

-- Listar agendamentos futuros de um profissional
SELECT a.agendamento_id, u.nome AS cliente, s.titulo, a.data_hora, a.status
FROM Agendamento a
JOIN Cliente c ON a.cliente_id = c.cliente_id
JOIN Usuario u ON c.usuario_id = u.usuario_id
JOIN Servico s ON a.servico_id = s.servico_id
WHERE a.profissional_id = 2 AND a.data_hora > NOW();
