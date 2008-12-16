use controlenf_development;

insert into empresas (id, nome, razao_social, usuario_id, created_at) values
(1, 'Empresa A', 'Empresa A Ltda', 1, curdate()),
(2, 'Empresa B', 'Empresa B Ltda', 2, curdate());

                                                             
-- Senha teste (hashed)
insert into usuarios (id, nome, hashed_password) values 
(1, 'Cristiano', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(2, 'Marcelo', '40bd001563085fc35165329ea1ff5c5ecbdbbeef');


insert into notas (numero, emissao, valor, cancelada, empresa_id, usuario_id, obs, created_at)  values 

(100, str_to_date('01/11/2008', '%d/%m/%Y'), 6437.85, 0, 2, 1, '', curdate()),
(101, str_to_date('06/11/2006', '%d/%m/%Y'),  889.70, 0, 1, 2, '', curdate()),
(102, str_to_date('06/12/2006', '%d/%m/%Y'), 1560.33, 0, 2, 2, '', curdate()),
(103, str_to_date('31/12/2006', '%d/%m/%Y'), 3750.00, 0, 1, 1, '', curdate());
