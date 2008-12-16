CREATE TABLE `empresas` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(255) NOT NULL default '',
  `razao_social` varchar(255) NOT NULL default '',
  `endereco` varchar(255) default NULL,
  `telefone` varchar(255) default NULL,
  `contato` varchar(255) default NULL,
  `cnpj` int(11) default NULL,
  `cep` int(11) default NULL,
  `bairro` varchar(255) default NULL,
  `estado` varchar(255) default NULL,
  `pais` varchar(255) default NULL,
  `insc_estadual` varchar(255) default NULL,
  `insc_municipal` varchar(255) default NULL,
  `obs` varchar(255) default NULL,
  `usuario_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `notas` (
  `id` int(11) NOT NULL auto_increment,
  `numero` int(11) NOT NULL,
  `valor` float NOT NULL default '0',
  `emissao` date default NULL,
  `cancelada` tinyint(1) NOT NULL default '0',
  `empresa_id` int(11) default NULL,
  `usuario_id` int(11) default NULL,
  `obs` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(255) NOT NULL default '',
  `hashed_password` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `schema_info` (version) VALUES (3)