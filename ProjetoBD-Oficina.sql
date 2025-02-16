CREATE TABLE ClientePessoaFisica (  
    idCliente INT PRIMARY KEY,  
    Nome VARCHAR(45),  
    CPF VARCHAR(45),  
    Endereco VARCHAR(45),  
    Forma_de_pagamento VARCHAR(45)  
);  

CREATE TABLE ClientePessoaJuridica (  
    idClientePJ INT PRIMARY KEY,  
    CNPJ VARCHAR(45),  
    Endereco VARCHAR(45),  
    Forma_de_pagamento VARCHAR(45)  
);  

CREATE TABLE Produtos_P (  
    idProduto INT PRIMARY KEY,  
    Categoria VARCHAR(45),  
    Descricao VARCHAR(45),  
    Valor REAL  
);  

CREATE TABLE Pedidos_P (  
    idPedido INT PRIMARY KEY,  
    StatusPedido VARCHAR(45),  
    Descricao VARCHAR(45),  
    Cliente_idCliente INT,  -- Alterado para int  
    FOREIGN KEY (Cliente_idCliente) REFERENCES ClientePessoaFisica(idCliente)  
);  

CREATE TABLE Relacao_de_produto_por_pedidos_ (  
    Produto_idProduto INT,  
    Pedido_idPedido INT,  
    Quantidade INT,  
    FOREIGN KEY (Produto_idProduto) REFERENCES Produtos_P(idProduto),  
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedidos_P(idPedido)  
);  

CREATE TABLE CartaoPessoaFisica (  
    idCartaoPF INT PRIMARY KEY,  
    CPF VARCHAR(45),  
    Numero_do_cartao VARCHAR(45),  
    Data_de_validade DATE,  
    Nome_do_cartao VARCHAR(45),  
    Cliente_idCliente INT,  
    FOREIGN KEY (Cliente_idCliente) REFERENCES ClientePessoaFisica(idCliente)  
);  

CREATE TABLE CartaoPessoaJuridica (  
    idCartaoPJ INT PRIMARY KEY,  
    CNPJ VARCHAR(45),  
    Data_de_validade DATE,  
    Numero_do_cartao VARCHAR(45),  
    ClientePJ_idClientePJ INT,  
    FOREIGN KEY (ClientePJ_idClientePJ) REFERENCES ClientePessoaJuridica(idClientePJ)  
);

INSERT INTO ClientePessoaFisica (idCliente, Nome, CPF, Endereco, Forma_de_pagamento) VALUES  
(11, 'Ana Souza', '12345678911', 'Rua dos Lírios, 123', 'Cartão de Crédito'),  
(12, 'Carlos Alberto', '98765432122', 'Av. Brasil, 456', 'Boleto'),  
(13, 'Fernanda Lima', '45678912333', 'Rua das Flores, 789', 'Débito');

INSERT INTO ClientePessoaJuridica (idClientePJ, CNPJ, Endereco, Forma_de_pagamento) VALUES  
(11, '12.345.678/0001-90', 'Rua das Indústrias, 1', 'Cartão Empresarial'),  
(12, '23.456.789/0001-01', 'Av. das Nações, 10', 'Boleto'),  
(13, '34.567.890/0001-12', 'Rua do Comércio, 5', 'Transferência');

INSERT INTO Produtos_P (idProduto, Categoria, Descricao, Valor) VALUES  
(1, 'Acessórios', 'Freio de Carro', 150.00),  
(2, 'Manutenção', 'Óleo de Motor', 50.00),  
(3, 'Peças', 'Filtro de Ar', 20.00);

INSERT INTO Pedidos_P (idPedido, StatusPedido, Descricao, Cliente_idCliente) VALUES  
(1, 'Pendente', 'Compra de freio de carro', 11), 
(2, 'Concluído', 'Revisão do motor', 12), 
(3, 'Pendente', 'Troca de óleo do carro', 13); 

INSERT INTO Pedidos_P (idPedido, StatusPedido, Descricao, Cliente_idCliente) VALUES  
(4, 'Pendente', 'Manutenção de frota', 11),
(5, 'Concluído', 'Fornecimento de peças', 12),   
(6, 'Pendente', 'Serviço de limpeza de ar', 13); 

INSERT INTO Relacao_de_produto_por_pedidos_ (Produto_idProduto, Pedido_idPedido, Quantidade) VALUES  
(1, 1, 2), 
(2, 2, 1),
(1, 4, 5), 
(3, 5, 10); 

SELECT Nome FROM ClientePessoaFisica;

SELECT * FROM Pedido WHERE StatusPedido = 'Pendente';

SELECT Descricao, Valor, Valor * 1.1 AS ValorComImposto FROM Produto;

SELECT Nome FROM ClientePF ORDER BY Nome ASC;

SELECT Cliente_idCliente, COUNT(*) AS NumeroDePedidos  
FROM Pedido  
GROUP BY Cliente_idCliente  
HAVING COUNT(*) > 1;

SELECT c.Nome, p.StatusPedido  
FROM ClientePF c  
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente;
