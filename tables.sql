CREATE TABLE Usuario (
  usuario_id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  telefone VARCHAR(20),
  senha_hash VARCHAR(255) NOT NULL,
  tipo VARCHAR(15) CHECK (tipo IN ('cliente', 'profissional')) NOT NULL
);

CREATE TABLE Profissional (
  profissional_id SERIAL PRIMARY KEY,
  usuario_id INT NOT NULL REFERENCES Usuario(usuario_id) ON DELETE CASCADE,
  especialidade VARCHAR(100) NOT NULL,
  descricao TEXT,
  avaliacao_media DECIMAL(3,2) DEFAULT 0
);

CREATE TABLE Cliente (
  cliente_id SERIAL PRIMARY KEY,
  usuario_id INT NOT NULL REFERENCES Usuario(usuario_id) ON DELETE CASCADE,
  data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Servico (
  servico_id SERIAL PRIMARY KEY,
  profissional_id INT NOT NULL REFERENCES Profissional(profissional_id) ON DELETE CASCADE,
  titulo VARCHAR(100) NOT NULL,
  descricao TEXT,
  preco DECIMAL(10,2) NOT NULL,
  duracao_minutos INT CHECK (duracao_minutos > 0)
);

CREATE TABLE Agendamento (
  agendamento_id SERIAL PRIMARY KEY,
  cliente_id INT NOT NULL REFERENCES Cliente(cliente_id) ON DELETE CASCADE,
  profissional_id INT NOT NULL REFERENCES Profissional(profissional_id) ON DELETE CASCADE,
  servico_id INT NOT NULL REFERENCES Servico(servico_id) ON DELETE CASCADE,
  data_hora TIMESTAMP NOT NULL,
  status VARCHAR(20) CHECK (status IN ('agendado', 'concluido', 'cancelado')) DEFAULT 'agendado'
);

CREATE TABLE Avaliacao (
  avaliacao_id SERIAL PRIMARY KEY,
  agendamento_id INT UNIQUE NOT NULL REFERENCES Agendamento(agendamento_id) ON DELETE CASCADE,
  nota INT CHECK (nota BETWEEN 1 AND 5) NOT NULL,
  comentario TEXT,
  data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
