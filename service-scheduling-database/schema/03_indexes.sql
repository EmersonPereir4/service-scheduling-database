-- Impede que o mesmo prestador tenha dois agendamentos no mesmo horário
-- Regra de negócio essencial do sistema
CREATE UNIQUE INDEX unique_agendamento
ON agendamentos (prestador_servico_id, data_agendamento);

-- Melhora performance ao buscar agendamentos por cliente
CREATE INDEX idx_agendamentos_cliente
ON agendamentos (cliente_id);


-- Otimiza consultas de serviços por prestador
CREATE INDEX idx_prestador_servicos_prestador
ON prestador_servicos (prestador_id);

-- Otimiza buscas de prestadores por tipo de serviço
CREATE INDEX idx_prestador_servicos_servico
ON prestador_servicos (servico_id);