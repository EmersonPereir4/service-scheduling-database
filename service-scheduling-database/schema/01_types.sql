-- Define os tipos deusuário permitidos no sistema
-- Garante padronização e evita valores inválidos
CREATE TYPE tipo_usuario AS ENUM ('cliente', 'prestador');

-- Define como os serviços podem ser cobrados
-- Importante para regras de negócios futuras
CREATE TYPE tipo_cobranca AS ENUM ('hora', 'dia', 'metro', 'empreitada', 'fixo');

-- Define o status de um agendamento
-- Ajuda no controle do fluxo do sistema
CREATE TYPE status_agendamento AS ENUM ('pendente', 'confirmado', 'cancelado', 'concluido');