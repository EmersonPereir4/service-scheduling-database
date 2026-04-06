-- Inserção de usuários para teste
INSERT INTO usuarios (nome, email, senha, tipo) VALUES
('João Silva', 'joao@email.com', '123', 'cliente'),
('Maria Souza', 'maria@email.com', '123', 'prestador');

-- Inserção de serviços básicos
INSERT INTO servicos (nome, preco_base, tipo_cobranca) VALUES
('Corte de Cabelo', 30, 'fixo');

-- Relaciona prestador ao serviço
INSERT INTO prestador_servicos (prestador_id, servico_id)
VALUES (2, 1);

-- Cria um agendamento de exemplo
INSERT INTO agendamentos (cliente_id, prestador_servico_id, data_agendamento)
VALUES (1, 1, '2026-04-10 14:00:00');