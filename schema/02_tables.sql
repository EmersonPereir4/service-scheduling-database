-- Tabela principal de usuários do sistema
-- Amazena tanto clientes quanto prestadores de serviços
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY, -- Identificador único automático
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL, -- Evita emails duplicados
    senha VARCHAR(255) NOT NULL,
    tipo tipo_usuario NOT NULL, -- Define se é cliente ou prestador
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data automática de criação
);

-- Tabela de serviços disponíveis no sistema
CREATE TABLE servicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_base DECIMAL(10,2) NOT NULL CHECK (preco_base >= 0), -- Impede valores negativos
    tipo_cobranca tipo_cobranca NOT NULL,
    ativo BOOLEAN DEFAULT TRUE -- Permite ativar/desativar serviços sem excluir
);

-- Tabela intermediária (relacionamento N:N)
-- Um prestador pode ter vários serviços e um servico pode ter vários prestadores
CREATE TABLE prestador_servicos (
    id SERIAL PRIMARY KEY,

    -- FK para usuário (prestador)
    -- CASCADE remove vínculos automaticamentese o usuário for deletado
    prestador_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,

    -- FK para serviço
    servico_id INT NOT NULL REFERENCES servicos(id) ON DELETE CASCADE,
    preco_personalizado DECIMAL(10,2), -- Permite preço diferente do padrão
    ativo BOOLEAN DEFAULT TRUE,

    -- Evita duplicidade (mesmo prestador oferecendo o mesmo serviço mais de uma vez)
    UNIQUE (prestador_id, servico_id)
);

-- Tabela de agendamentos
-- Conecta cliente, prestador e serviço
CREATE TABLE agendamentos (
    id SERIAL PRIMARY KEY,

    -- Cliente que realizou o agendamento
    cliente_id INT NOT NULL REFERENCES usuarios(id),

    -- Serviço específico de um prestador
    prestador_servico_id INT NOT NULL REFERENCES prestador_servicos(id),
    data_agendamento TIMESTAMP NOT NULL, -- Data e hora do serviço agendado
    status status_agendamento DEFAULT 'pendente', -- Status inicial padrão
    observacoes TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Registro automático
);