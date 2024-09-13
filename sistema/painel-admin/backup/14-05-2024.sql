-- TABLE: administradores
CREATE TABLE `administradores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `administradores` (`id`, `nome`, `cpf`, `telefone`, `email`, `foto`, `ativo`, `data`) VALUES ('1', 'Ellington Machado ', '019.292.181-92', '(31) 00000-0000', 'ellington1209@gmail.com', '07-02-2024-13-09-42-IMG_20181104_120732.jpg', 'Sim', '2022-03-07');
INSERT INTO `administradores` (`id`, `nome`, `cpf`, `telefone`, `email`, `foto`, `ativo`, `data`) VALUES ('4', 'Jediael Aquino Araujo', '905.323.091-20', '(62) 98178-5842', 'aes.assessoriaeconsultoria@gmail.com', '07-05-2024-15-14-51-A&S.png', 'Sim', '2024-04-16');

-- TABLE: alertas
CREATE TABLE `alertas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `alertas` (`id`, `titulo`, `descricao`, `link`, `imagem`, `video`, `data`) VALUES ('1', 'Lançamento Portal EAD', 'fadfa fdaf asfdsafasfdas fdas fasfa fad fasds fdas fasf sdaf a fa fas<br>', 'cursos-do-pacote-portal-ead', '16-05-2022-18-20-11-recursos-grafico.png', 'https://www.youtube.com/embed/OE8Wz0-v5nc', '2022-05-16');
INSERT INTO `alertas` (`id`, `titulo`, `descricao`, `link`, `imagem`, `video`, `data`) VALUES ('2', 'Site em Manutenção', 'Nosso site estará em manutenção ....<br>', '', 'sem-foto.png', '', '2022-05-17');
INSERT INTO `alertas` (`id`, `titulo`, `descricao`, `link`, `imagem`, `video`, `data`) VALUES ('4', 'Desconto Portal Immobiliario', 'fdafdsafdasfdsf fdafdsfasf afdasf af<br>', 'cursos-do-pacote-portal-ead', '16-05-2022-19-51-01-eu.jpeg', 'https://www.youtube.com/embed/OE8Wz0-v5nc', '2022-05-16');

-- TABLE: alternativas
CREATE TABLE `alternativas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso` int(11) NOT NULL,
  `pergunta` int(11) NOT NULL,
  `resposta` varchar(255) NOT NULL,
  `correta` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('10', '29', '5', 'Resposta 1', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('11', '29', '5', 'Resposta 2', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('12', '29', '5', 'Resposta 3', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('13', '29', '5', 'Resposta 4', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('14', '29', '6', 'aaaaaa', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('15', '29', '6', 'bbbb', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('16', '29', '6', 'cccc', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('17', '29', '6', 'dddd', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('18', '29', '7', 'fdafdaf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('19', '29', '7', 'fdasfafasf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('20', '29', '7', 'fsfsdf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('22', '29', '7', 'fddfsfds', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('23', '31', '1', 'afsdafsd', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('24', '31', '1', 'fdasfas', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('25', '31', '1', 'fsdf', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('26', '31', '2', 'fdafdsaf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('27', '31', '2', 'sdaafaf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('28', '31', '2', 'dfadfasfas', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('29', '31', '8', 'afaf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('30', '31', '8', 'fdafdasf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('31', '31', '8', 'dfsafsaf', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('32', '31', '9', 'sdafaf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('33', '31', '9', 'fdsafdsaf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('34', '31', '9', 'fdasfdafa', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('35', '26', '10', 'fdadfsa', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('36', '26', '10', 'dfsafsaf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('37', '26', '10', 'fasdfasfs', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('38', '26', '10', 'fdasfasfas', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('39', '26', '11', 'dfsafsa', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('40', '26', '11', 'dasfasf', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('41', '26', '11', 'dfasfdsaf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('42', '26', '11', 'fdafasf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('43', '26', '12', 'dfafsdaf', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('44', '26', '12', 'dfsfafsa', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('45', '26', '12', 'dafdasfs', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('46', '26', '12', 'safsdafd', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('47', '26', '13', 'dfsasfsafa', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('48', '26', '13', 'dfadfasf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('49', '26', '13', 'dasfasf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('50', '26', '13', 'fdsafasf', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('51', '25', '14', 'a', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('52', '25', '14', 'b', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('53', '25', '14', 'c', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('54', '25', '15', 'a', 'Sim');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('55', '25', '15', 'b', '');
INSERT INTO `alternativas` (`id`, `curso`, `pergunta`, `resposta`, `correta`) VALUES ('56', '25', '15', 'c', '');

-- TABLE: alunos
CREATE TABLE `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `cartao` int(11) DEFAULT NULL,
  `ativo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('40', 'JOSÉ MARIO SANTOS CONCEIÇÃO', '062.114.855-57', 'santosjosemario449@gmail.com', '75983216079', 'Pov são Francisco ', 'São Félix ', 'Bahia ', 'Brasil ', 'sem-perfil.jpg', '2024-05-07', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('41', 'LUCAS SANTOS ALVES', '103.114.035-22', 'lucasalvess492@gmail.com', '', 'Rua da mangueira ', 'Nazaré ', 'Bahia', 'Brasil ', 'sem-perfil.jpg', '2024-05-07', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('42', 'GILVAN RODRIGUES TEIXEIRA', '065.926.306-8', 'gilvanrodriguesp2p@outlook.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-09', '', 'Não');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('44', 'Gilvan Rodrigues Teixeira ', '', 'gilvanr666@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-14', '', 'Sim');

-- TABLE: aulas
CREATE TABLE `aulas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_aula` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `link` varchar(150) DEFAULT NULL,
  `tempo_aula` int(11) DEFAULT '5',
  `curso` int(11) NOT NULL,
  `sessao` int(11) NOT NULL,
  `sequencia_aula` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('128', '1', 'Uso de epi', 'https://drive.google.com/file/d/1fTp4d9nR3AcuzTRaxw2TyA48j2z-k-L5/preview?usp=drive_link', '240', '51', '35', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('129', '1', 'Segurança na operação com maquinas e equipamentos', 'https://drive.google.com/file/d/1kyl8o3LHVy0HlkII4aEQs_5NVaPx9n8Q/preview?usp=drive_link', '480', '52', '0', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('130', '2', 'Segurança na operação com maquinas e equipamentos', 'https://drive.google.com/file/d/1hUJwALnTrmtMUFG7vtQOP9YE3-46Alvn/preview?usp=drive_link', '480', '52', '0', '2');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('131', '1', 'segurança com eletricidade', 'https://drive.google.com/file/d/1CKg055V3o2Ak1faZDqsI1FwtIuhds-sY/preview?usp=drive_link', '2400', '54', '0', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('132', '2', 'segurança com eletricidade', 'https://drive.google.com/file/d/1yH-JhbjuSK6KzbrvLf0oKvex9JtmfgIJ/preview?usp=drive_link', '2400', '54', '0', '2');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('136', '3', 'SEGURANÇA NO TRABALHO EM ALTURA', 'https://drive.google.com/file/d/1Aj5H375Vjg8uDeUvdP--lU6zvEy4-K85/preview?usp=sharing', '60', '55', '0', '2');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('137', '1', 'SEGURANÇA NA CONSTRUÇÃO CIVIL', 'https://drive.google.com/file/d/16YiINGLPpME5SqG188CgICSwb3knEhOf/preview?usp=drive_link', '60', '56', '0', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('139', '2', 'Segurança nas atividades de espaço confinado', 'https://drive.google.com/file/d/1AnL5-F9wRccpSHgRFGijicowNxpFzKe8/preview?usp=drive_link', '960', '57', '0', '1');

-- TABLE: avaliacoes
CREATE TABLE `avaliacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` int(11) NOT NULL,
  `comentario` varchar(500) NOT NULL,
  `curso` int(11) NOT NULL,
  `aluno` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
INSERT INTO `avaliacoes` (`id`, `nota`, `comentario`, `curso`, `aluno`, `data`) VALUES ('8', '5', 'Excelente curso!', '29', '25', '2022-04-13');
INSERT INTO `avaliacoes` (`id`, `nota`, `comentario`, `curso`, `aluno`, `data`) VALUES ('14', '5', 'fdsfdsfdsfsadf', '26', '9', '2022-04-20');
INSERT INTO `avaliacoes` (`id`, `nota`, `comentario`, `curso`, `aluno`, `data`) VALUES ('15', '5', 'Avaliação do curso', '29', '20', '2022-04-20');

-- TABLE: banner_index
CREATE TABLE `banner_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(35) NOT NULL,
  `descricao` varchar(160) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `link` varchar(50) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
INSERT INTO `banner_index` (`id`, `titulo`, `descricao`, `foto`, `link`, `ativo`) VALUES ('5', 'Estude em casa!', 'Nossos cursos são On-line e com acesso vitalício, para você estudar quando e onde quiser!', '04-04-2022-11-43-13-banner-slide-1.jpg', '', 'Sim');
INSERT INTO `banner_index` (`id`, `titulo`, `descricao`, `foto`, `link`, `ativo`) VALUES ('6', 'Curso com Certificado', 'Disponibilizamos certificação profissionalizante em todos nossos cursos! Otimize seu currículo ou utilize como horas extra-curriculares! ', '04-04-2022-13-27-26-banner-slide-2.jpg', '', 'Sim');
INSERT INTO `banner_index` (`id`, `titulo`, `descricao`, `foto`, `link`, `ativo`) VALUES ('7', 'Suporte direto com Professor', 'Aqui você conta com exclusivo suporte direto com professor! Caminhamos com você, para que seu treinamento seja concluído com SUCESSO!', '04-04-2022-13-28-45-banner-slide-3.jpg', '', 'Sim');
INSERT INTO `banner_index` (`id`, `titulo`, `descricao`, `foto`, `link`, `ativo`) VALUES ('8', 'Programe seu Futuro! ', 'Já são mais de 30 mil alunos formados! Venha você também fazer parte deste time e aproveitar as melhores oportunidades do mercado de trabalho!', '04-04-2022-13-28-07-banner-slide-4.jpg', '', 'Sim');

-- TABLE: banner_login
CREATE TABLE `banner_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
INSERT INTO `banner_login` (`id`, `nome`, `link`, `foto`, `ativo`) VALUES ('7', 'investimento', 'http://localhost/portalead/sistema', '21-03-2024-16-13-09-Carrinhoaberto#4.jpg', 'Não');
INSERT INTO `banner_login` (`id`, `nome`, `link`, `foto`, `ativo`) VALUES ('8', 'login', 'http://localhost/plataformaJediael/sistema', '09-04-2024-08-01-53-52134209_109104266892631_4473667798421209088_n.jpg', 'Sim');

-- TABLE: categorias
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  `nome_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('18', 'Eletrica', '', 'sem-foto.png', 'eletrica');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('19', 'EPI', '', 'sem-foto.png', 'epi');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('20', 'FERRAMENTAS MANUAIS', '', 'sem-foto.png', 'ferramentas-manuais');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('21', 'TRABALHO A QUENTE', '', 'sem-foto.png', 'trabalho-a-quente');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('22', 'SEGURANÇA NA CONSTRUÇÃO CIVIL', '', 'sem-foto.png', 'seguranca-na-construcao-civil');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('23', 'SEGURANÇA NO TRABALHO EM ALTURA', 'ALTURA', '07-05-2024-15-26-48-NR35.png', 'seguranca-no-trabalho-em-altura');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('24', 'NR 33', 'Espaço Confinado', '09-05-2024-11-11-35-NR-33.png', 'nr-33');

-- TABLE: config
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_sistema` varchar(50) NOT NULL,
  `tel_sistema` varchar(20) NOT NULL,
  `email_sistema` varchar(50) NOT NULL,
  `cnpj_sistema` varchar(25) DEFAULT NULL,
  `tipo_chave_pix` varchar(25) DEFAULT NULL,
  `chave_pix` varchar(100) DEFAULT NULL,
  `logo` varchar(20) NOT NULL,
  `icone` varchar(20) NOT NULL,
  `logo_rel` varchar(20) NOT NULL,
  `qrcode_pix` varchar(20) DEFAULT NULL,
  `facebook` varchar(120) DEFAULT NULL,
  `instagram` varchar(120) DEFAULT NULL,
  `youtube` varchar(120) DEFAULT NULL,
  `itens_pag` int(11) NOT NULL,
  `video_sobre` varchar(100) DEFAULT NULL,
  `itens_relacionados` int(11) NOT NULL,
  `aulas_liberadas` int(11) NOT NULL,
  `desconto_pix` int(11) NOT NULL,
  `email_adm_mat` varchar(5) DEFAULT NULL,
  `cartoes_fidelidade` int(11) NOT NULL,
  `taxa_boleto` decimal(8,2) NOT NULL,
  `taxa_mp` decimal(8,2) NOT NULL,
  `taxa_paypal` decimal(8,2) NOT NULL,
  `valor_max_cartao` decimal(8,2) NOT NULL,
  `total_emails_por_envio` int(11) NOT NULL,
  `intervalo_envio_email` int(11) NOT NULL,
  `script_dia` date DEFAULT NULL,
  `dias_email_matricula` int(11) NOT NULL,
  `dias_excluir_matricula` int(11) NOT NULL,
  `professor_cad` varchar(5) NOT NULL,
  `comissao_professor` int(11) NOT NULL,
  `dia_pgto_comissao` int(11) NOT NULL,
  `questionario` varchar(5) NOT NULL,
  `media` int(11) NOT NULL,
  `verso` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
INSERT INTO `config` (`id`, `nome_sistema`, `tel_sistema`, `email_sistema`, `cnpj_sistema`, `tipo_chave_pix`, `chave_pix`, `logo`, `icone`, `logo_rel`, `qrcode_pix`, `facebook`, `instagram`, `youtube`, `itens_pag`, `video_sobre`, `itens_relacionados`, `aulas_liberadas`, `desconto_pix`, `email_adm_mat`, `cartoes_fidelidade`, `taxa_boleto`, `taxa_mp`, `taxa_paypal`, `valor_max_cartao`, `total_emails_por_envio`, `intervalo_envio_email`, `script_dia`, `dias_email_matricula`, `dias_excluir_matricula`, `professor_cad`, `comissao_professor`, `dia_pgto_comissao`, `questionario`, `media`, `verso`) VALUES ('1', 'Plataforma A&S', '(62)985135258', 'aes.assessoriaeconsultoria@gmail.com', '32.532892/0001-68', 'Telefone', '62981785842', 'logo.png', 'favicon.ico', 'logo_rel.jpg', 'qrcode.jpg', 'https://www.facebook.com/profile.php?id=100033791746552&mibextid=ZbWKwL', 'https://www.instagram.com/aes.sessoriaemsegtrab?utm_source=qr&igsh=c2F1NGdoYWx2MmQy', '', '12', '', '8', '2', '5', 'Sim', '5', '3.45', '5.00', '7.50', '65.00', '480', '70', '2024-05-14', '3', '30', 'Não', '20', '20', 'Sim', '60', 'Sim');

-- TABLE: cupons
CREATE TABLE `cupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(25) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- TABLE: cursos
CREATE TABLE `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) DEFAULT NULL,
  `desc_rapida` varchar(40) DEFAULT NULL,
  `desc_longa` text,
  `valor` decimal(8,2) DEFAULT NULL,
  `professor` int(11) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `carga` int(11) DEFAULT NULL,
  `mensagem` varchar(255) DEFAULT NULL,
  `arquivo` varchar(150) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `palavras` varchar(255) DEFAULT NULL,
  `grupo` int(11) DEFAULT NULL,
  `nome_url` varchar(150) DEFAULT NULL,
  `pacote` varchar(100) DEFAULT NULL,
  `sistema` varchar(5) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `tecnologias` varchar(150) DEFAULT NULL,
  `promocao` decimal(8,2) DEFAULT NULL,
  `matriculas` int(11) DEFAULT NULL,
  `comissao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('51', 'NR 06', '', '', '180.00', '42', '19', '07-05-2024-10-45-08-NR-06.png', 'Aprovado', '4', '', '', '2024', '', '5', 'nr-06', '', '', '', '', '100.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('52', 'NR 12', '', '', '0.00', '42', '20', '07-05-2024-10-23-36-NR-12.png', 'Aprovado', '120', '', '', '2024', '', '6', 'nr-12', '', '', '', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('54', 'NR 10', '', '', '0.00', '42', '18', '07-05-2024-14-08-06-NR-10.png', 'Aprovado', '40', '', '', '2024', '', '4', 'nr-10', '', '', 'https://drive.google.com/file/d/1CKg055V3o2Ak1faZDqsI1FwtIuhds-sY/preview?usp=drive_link', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('55', 'NR 35', '', '', '0.00', '42', '23', '07-05-2024-15-27-38-NR35.png', 'Aprovado', '0', '', '', '2024', '', '9', 'nr-35', '', '', '', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('56', 'NR 18', '', '', '0.00', '42', '22', '07-05-2024-15-32-04-NR-18.png', 'Aprovado', '0', '', '', '2024', '', '7', 'nr-18', '', '', '', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('57', 'NR 33', '', '', '0.00', '0', '24', '09-05-2024-14-11-24-NR-33.png', 'Aprovado', '16', '', '', '2024', '', '10', 'nr-33', '', '', '', '', '0.00', '', '20');

-- TABLE: cursos_pacotes
CREATE TABLE `cursos_pacotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso` int(11) NOT NULL,
  `id_pacote` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('1', '1', '1');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('9', '6', '1');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('10', '1', '3');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('11', '3', '3');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('12', '4', '3');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('15', '24', '9');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('16', '25', '9');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('17', '26', '9');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('18', '27', '9');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('19', '28', '9');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('20', '28', '10');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('21', '24', '10');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('22', '27', '10');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('23', '26', '10');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('24', '25', '10');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('25', '28', '11');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('26', '27', '11');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('27', '26', '11');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('28', '24', '12');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('29', '25', '12');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('30', '24', '13');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('31', '26', '13');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('32', '28', '13');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('33', '24', '14');
INSERT INTO `cursos_pacotes` (`id`, `id_curso`, `id_pacote`) VALUES ('34', '25', '14');

-- TABLE: emails
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(55) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `enviar` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('1', 'joaopaulo@hotmail.com', 'João Paulo', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('2', 'joaopaulo2@hotmail.com', 'João Paulo x', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('3', 'aaa@hotmail.com', 'aaaaaaaaaa', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('4', 'alunotestemarcelo@hotmail.com', 'Marcelo Aluno Teste', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('5', 'hugovasconcelosf@hotmail.com', 'Hugo Freitas', 'não');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('6', 'aluno5@hotmail.com', 'Aluno teste 5', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('7', 'aluno6@hotmail.com', 'aluno6', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('8', 'hugofreitas20@hotmail.com', 'Hugo Freitas', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('9', 'tom123@gmail.com', 'tom', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('10', 'teste@gmail.com', 'tom machado de apa', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('11', 'maralidia24@gmail.com', 'Mara Lidia Araujo ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('12', 'mara123@gmail.com', 'Mara Lidia Araujo ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('13', 'SADDAF@GMAIL.COM', 'SDAFFD', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('14', 'ellington12209@gmail.com', 'investimento', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('15', 'ellington12019@gmail.com', 'investimento', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('16', 'ellington12109@gmail.com', 'investimento', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('17', 'ellington120S9@gmail.com', 'investimento', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('18', 'ellington12039@gmail.com', 'investimento', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('19', 'ellington13209@gmail.com', 'investimento', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('20', 'ellington12309@gmail.com', 'investimento', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('21', 'ellington12409@gmail.com', 'investimento', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('22', 'ellington1209@gmail.com', 'investimento', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('23', 'ellington16209@gmail.com', 'investimento', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('24', 'gilvanrodriguesp2p@outlook.com', 'Gilvan Rodrigues Teixeira ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('25', 'gilvanr666@gmail.com', 'Gilvan Rodrigues Teixeira ', 'sim');

-- TABLE: envios
CREATE TABLE `envios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `final` int(11) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO `envios` (`id`, `data`, `final`, `assunto`, `mensagem`, `link`) VALUES ('1', '2022-04-20 12:49:53', '0', 'AAAAA', 'fsdfdsfdsfds', 'cursos-do-pacote-aplicativo-financeiro');

-- TABLE: grupos
CREATE TABLE `grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
INSERT INTO `grupos` (`id`, `nome`) VALUES ('4', 'Eletrica');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('5', 'EPI');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('6', 'FERRAMENTAS MANUAIS');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('7', 'CONSTRUÇÃO CIVIL');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('8', 'TRABALHO A QUENTE');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('9', 'TRABALHO EM ALTURA');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('10', 'Segurança no Trabalho em Espaço Confinado');

-- TABLE: linguagens
CREATE TABLE `linguagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `nome_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
INSERT INTO `linguagens` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('2', 'Delphi', 'fdsadfas', '30-03-2022-00-30-24-10-03-2022-13-42-49-83.jpg', 'delphi');
INSERT INTO `linguagens` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('4', 'PHP', 'dfsafasfs', '30-03-2022-00-30-11-10-03-2022-13-42-49-83.jpg', 'php');
INSERT INTO `linguagens` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('6', 'fdsafda', 'aaaaaaaaaaa', '30-03-2022-00-29-34-10-03-2022-13-42-49-83.jpg', 'fdsafda');
INSERT INTO `linguagens` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('7', 'CSharp', 'fafafsdfaf', '30-03-2022-00-30-37-10-03-2022-13-42-49-83.jpg', 'csharp');

-- TABLE: matriculas
CREATE TABLE `matriculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso` int(11) NOT NULL,
  `aluno` varchar(20) NOT NULL,
  `professor` varchar(20) NOT NULL,
  `aulas_concluidas` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `pacote` varchar(5) NOT NULL,
  `alertado` varchar(5) DEFAULT NULL,
  `valor_cupom` decimal(8,2) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `forma_pgto` varchar(25) NOT NULL,
  `boleto` varchar(25) DEFAULT NULL,
  `id_pacote` int(11) NOT NULL,
  `data_conclusao` date DEFAULT NULL,
  `total_recebido` decimal(8,2) NOT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `nota` decimal(8,2) DEFAULT NULL,
  `ref_api` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('27', '44', '37', '', '1', '0.00', '2024-03-27', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-04-10', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('45', '57', '46', '', '1', '0.00', '2024-05-09', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('46', '55', '46', '', '1', '0.00', '2024-05-09', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');

-- TABLE: pacotes
CREATE TABLE `pacotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  `desc_rapida` varchar(40) NOT NULL,
  `desc_longa` text,
  `valor` decimal(8,2) NOT NULL,
  `professor` int(11) NOT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  `grupo` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `palavras` varchar(255) DEFAULT NULL,
  `nome_url` varchar(150) NOT NULL,
  `video` varchar(150) DEFAULT NULL,
  `linguagem` int(11) NOT NULL,
  `promocao` decimal(8,2) NOT NULL,
  `matriculas` int(11) NOT NULL,
  `comissao` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- TABLE: pagar
CREATE TABLE `pagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `vencimento` date NOT NULL,
  `pago` varchar(5) NOT NULL,
  `data_pgto` date NOT NULL,
  `arquivo` varchar(150) DEFAULT NULL,
  `professor` int(11) NOT NULL,
  `curso` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('3', 'Mensalidade Servidor', '25.00', '2022-04-19', '2022-04-19', 'Não', '0000-00-00', '19-04-2022-18-39-29-09-11-2021-09-21-26-conta3.jpg', '0', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('4', 'Conta Teste', '600.00', '2022-04-19', '2022-04-19', 'Sim', '2022-04-19', '19-04-2022-18-16-43-09-11-2021-10-17-10-pdfteste.pdf', '0', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('5', 'Conta de Luz', '550.00', '2022-04-19', '2022-04-20', 'Sim', '2022-04-19', '19-04-2022-18-17-15-09-11-2021-12-04-29-pdfteste.zip', '0', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('7', 'Comissão', '15.00', '2022-05-16', '2022-06-05', 'Não', '0000-00-00', 'sem-foto.png', '2', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('12', 'Comissão', '15.00', '2022-05-16', '2022-06-05', 'Não', '0000-00-00', 'sem-foto.png', '2', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('13', 'Comissão', '15.00', '2022-05-16', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('14', 'Comissão', '61.60', '2022-05-16', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('15', 'Comissão', '61.60', '2022-05-16', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Pacote Escritório');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('16', 'Comissão', '12.00', '2022-05-16', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '14', 'Curso Teste');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('18', 'Comissão', '61.60', '2022-05-16', '2022-05-20', 'Sim', '2022-04-12', 'sem-foto.png', '14', 'Pacote Escritório');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('19', 'Comissão', '45.00', '2022-05-16', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Pacote Igreja');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('20', 'Comissão', '50.00', '2022-05-16', '2022-05-20', 'Sim', '2022-05-16', 'sem-foto.png', '14', 'Pacote Teste');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('21', 'Comissão', '12.00', '2022-05-17', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '14', 'Curso Teste');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('22', 'Comissão', '125.00', '2022-05-17', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Gestão de Contratos');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('23', 'Comissão', '125.00', '2022-05-17', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Gestão de Contratos');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('24', 'Comissão', '125.00', '2022-05-17', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Gestão de Contratos');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('25', 'Comissão', '125.00', '2022-05-17', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Gestão de Contratos');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('26', 'Comissão', '125.00', '2022-05-17', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Gestão de Contratos');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('27', 'Comissão', '125.00', '2022-05-17', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Gestão de Contratos');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('29', 'Conta Luz', '800.00', '2022-05-17', '2022-05-17', 'Sim', '0000-00-00', '17-05-2022-17-27-02-09-11-2021-13-07-27-conta3.jpg', '0', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('30', 'Comissão', '125.00', '2022-05-17', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Gestão de Contratos');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('31', 'Aaa', '45.00', '2022-05-17', '2022-05-17', 'Não', '0000-00-00', '65ce8755-75e7-48ac-b040-d95d7cc0a123.jpg', '0', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('32', 'Vbb', '70.00', '2022-05-17', '2022-05-18', 'Não', '0000-00-00', 'sem-foto.png', '0', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('33', 'Sxxzzzzz', '59.00', '2022-05-17', '2022-05-17', 'Não', '0000-00-00', '94552797-e3a5-4241-b767-ed2449fa8ad5.jpg', '0', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('34', 'Ydg', '780.00', '2022-05-17', '2022-05-17', 'Não', '0000-00-00', 'fd01871c-f5c6-4851-8f15-a37d8d3dee3e.jpg', '0', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('35', 'Cxxxz', '70.00', '2022-05-17', '2022-05-17', 'Não', '0000-00-00', '5065f9fa-3a67-4d5b-b9fd-b9600b59fae3.jpg', '0', '');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('36', 'Comissão', '25.00', '2022-05-17', '2022-05-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Portal de Cursos');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('37', 'Comissão', '18.00', '2022-08-20', '2022-09-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'fafa');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('38', 'Comissão', '12.00', '2022-08-20', '2022-09-20', 'Não', '0000-00-00', 'sem-foto.png', '14', 'Curso Teste');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('39', 'Comissão', '12.00', '2022-08-20', '2022-09-20', 'Não', '0000-00-00', 'sem-foto.png', '14', 'Curso Teste');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('40', 'Comissão', '25.00', '2022-10-24', '2022-11-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Portal de Cursos');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('41', 'Comissão', '25.00', '2022-10-24', '2022-11-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Portal de Cursos');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('42', 'Comissão', '0.20', '2023-06-06', '2023-06-20', 'Não', '0000-00-00', 'sem-foto.png', '14', 'Curso Teste');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('43', 'Comissão', '15.00', '2023-06-12', '2023-06-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Gestao de Cobrancas');
INSERT INTO `pagar` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`, `professor`, `curso`) VALUES ('44', 'Comissão', '55.20', '2023-06-12', '2023-06-20', 'Não', '0000-00-00', 'sem-foto.png', '2', 'Pacote Aplicativo Financeiro');

-- TABLE: perguntas
CREATE TABLE `perguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aula` int(11) NOT NULL,
  `pergunta` varchar(255) NOT NULL,
  `curso` int(11) NOT NULL,
  `aluno` int(11) NOT NULL,
  `data` date NOT NULL,
  `respondida` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('3', '5', 'Pergunta para o Curso de Site imobiliario', '25', '20', '2022-04-12', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('5', '8', 'Pergunta para o gestao', '24', '20', '2022-04-12', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('6', '5', 'aaaaaaaaaaaaa', '24', '20', '2022-04-12', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('10', '9', 'Nova pergunta fdaf dfdaf fsadfdsafsdafsdf afasf', '25', '20', '2022-04-13', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('12', '0', 'fdsafadsfasas', '25', '20', '2022-04-13', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('16', '0', 'fdafasfaf', '28', '20', '2022-04-13', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('18', '0', 'fafdafaf  fdfsfsf', '25', '20', '2022-04-13', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('19', '0', 'fdsafadsf', '29', '20', '2022-04-13', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('20', '6', 'dggdsgsfdgsdg', '25', '20', '2022-04-13', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('22', '0', 'dsafaafa  ', '29', '20', '2022-04-18', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('23', '0', 'fadfaf   fdsafsdfa      ', '25', '20', '2022-04-18', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('24', '0', 'fdasfdasf', '33', '25', '2022-04-19', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('25', '0', 'fdsfafa', '26', '9', '2022-05-16', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('26', '0', 'fdsafdasf', '35', '25', '2022-05-16', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('27', '0', 'fdsafdasf', '26', '20', '2022-05-16', 'Não');

-- TABLE: perguntas_quest
CREATE TABLE `perguntas_quest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso` int(11) NOT NULL,
  `pergunta` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('1', '31', 'Pergunta 1');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('2', '31', 'Pergunta 2');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('5', '29', 'Pergunta 1');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('6', '29', 'Pergunta 2');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('7', '29', 'Pergunta 3');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('8', '31', 'Nova pergunta');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('9', '31', 'aaaaaaaaaaaaaa');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('10', '26', 'Qual é ...?');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('11', '26', 'Pergunta 2??');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('12', '26', 'Pergunta 3');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('13', '26', 'Pergunta 4');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('14', '25', 'teste');
INSERT INTO `perguntas_quest` (`id`, `curso`, `pergunta`) VALUES ('15', '25', 'teste2');

-- TABLE: professores
CREATE TABLE `professores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- TABLE: receber
CREATE TABLE `receber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `vencimento` date NOT NULL,
  `pago` varchar(5) NOT NULL,
  `data_pgto` date NOT NULL,
  `arquivo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
INSERT INTO `receber` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`) VALUES ('2', 'Conta teste', '60.00', '2022-04-19', '2022-04-19', 'Não', '0000-00-00', '19-04-2022-18-58-13-19-04-2022-18-17-15-09-11-2021-12-04-29-pdfteste.zip');
INSERT INTO `receber` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`) VALUES ('3', 'Conta x', '600.00', '2022-04-19', '2022-04-19', 'Sim', '2022-04-19', '19-04-2022-18-58-39-09-11-2021-10-17-10-pdfteste.pdf');
INSERT INTO `receber` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`) VALUES ('4', 'fdsfa', '60.00', '2022-04-19', '0000-00-00', 'Não', '0000-00-00', 'sem-foto.png');
INSERT INTO `receber` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`) VALUES ('7', 'Conta teste', '60.00', '2022-05-17', '2022-05-17', 'Não', '0000-00-00', 'sem-foto.png');
INSERT INTO `receber` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`) VALUES ('8', 'Conta Testess', '90.00', '2022-05-17', '2022-05-17', 'Não', '0000-00-00', '17-05-2022-18-18-42-09-11-2021-13-58-28-pdfteste.pdf');
INSERT INTO `receber` (`id`, `descricao`, `valor`, `data`, `vencimento`, `pago`, `data_pgto`, `arquivo`) VALUES ('9', 'Aaa', '70.00', '2022-05-17', '2022-05-17', 'Não', '0000-00-00', 'sem-foto.png');

-- TABLE: respostas
CREATE TABLE `respostas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resposta` varchar(500) NOT NULL,
  `curso` int(11) NOT NULL,
  `pessoa` int(11) NOT NULL,
  `data` date NOT NULL,
  `pergunta` int(11) NOT NULL,
  `funcao` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('12', 'fdafadf', '25', '20', '2022-04-13', '3', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('13', 'gdgdfgd', '25', '25', '2022-04-13', '3', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('14', 'fdsafsf', '25', '20', '2022-04-13', '3', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('15', 'fsdfsdf', '24', '20', '2022-04-13', '6', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('16', 'aaaa', '24', '20', '2022-04-13', '6', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('26', 'fdfdsfs', '0', '1', '2022-04-13', '16', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('27', 'fdfsfdsfds', '0', '1', '2022-04-13', '16', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('28', 'fdfdfa', '0', '1', '2022-04-13', '5', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('30', 'fdfdfds', '0', '1', '2022-04-13', '10', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('31', 'fdfdsf', '0', '1', '2022-04-13', '12', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('32', 'fdsfdsfs', '0', '1', '2022-04-13', '6', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('33', 'fdsfa\r\nfdsfasf\r\n\r\nfadf', '25', '20', '2022-04-13', '12', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('34', 'fafadf\r\nfdsaf\r\n\r\nfadfafa', '25', '20', '2022-04-13', '10', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('35', 'fsdafaffa gfgs', '25', '20', '2022-04-13', '18', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('36', 'fdsafdasfa', '29', '20', '2022-04-13', '19', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('37', 'afa', '29', '25', '2022-04-13', '19', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('39', 'tretretert', '25', '20', '2022-04-13', '20', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('40', 'tertertertert', '25', '20', '2022-04-13', '20', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('41', 'gfgfdggfdg', '0', '1', '2022-04-13', '18', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('42', 'tretretertre', '0', '1', '2022-04-13', '20', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('43', 'fdafdafafsfs', '0', '1', '2022-04-13', '19', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('44', 'fdsfdasf', '25', '20', '2022-04-18', '23', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('45', 'fdfdsfds', '0', '1', '2022-04-19', '24', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('46', 'sddfdf', '26', '9', '2022-05-16', '25', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('47', 'fsfafa', '25', '20', '2022-05-16', '23', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('48', 'dfasfasf', '0', '2', '2022-05-16', '23', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('49', 'sfdsfdsfsfdsfdsf', '0', '2', '2022-05-16', '3', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('50', 'gfdgfgdg', '0', '2', '2022-05-16', '10', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('51', 'fsdfsfaf', '0', '2', '2022-05-16', '3', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('52', 'fdsafdf', '0', '14', '2022-05-16', '26', 'Professor');

-- TABLE: sessao
CREATE TABLE `sessao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `curso` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('6', 'Módulo 1', '6');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('7', 'Módulo 2', '6');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('8', 'Módulo 3', '6');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('9', 'Básico', '14');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('10', 'Avançado', '14');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('11', 'Básico', '29');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('12', 'Avançado', '29');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('13', 'Outro', '29');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('15', 'aaa', '34');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('16', 'aaa', '35');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('17', 'bbb', '35');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('18', 'cc', '35');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('19', 'Modulo 1', '36');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('20', 'modulo 2', '36');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('21', 'nr-35', '36');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('22', 'nr-35', '37');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('23', 'seção 1', '38');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('24', 'modes um', '43');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('25', 'modis 2', '43');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('26', 'Modulo 1', '44');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('27', 'modulo 2', '44');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('28', 'Modulo 1', '45');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('29', 'modulo 2', '45');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('30', 'nr-01', '46');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('31', 'modis 1', '47');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('32', 'dsadsa', '44');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('33', 'Modulo 1', '50');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('34', 'modulo 2', '50');
INSERT INTO `sessao` (`id`, `nome`, `curso`) VALUES ('35', 'MODULO 1', '51');

-- TABLE: usuarios
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `senha_crip` varchar(150) NOT NULL,
  `nivel` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('2', 'Ellington Machado ', '019.292.181-92', 'ellington1209@gmail.com', '899117', 'fc01dc0f7a228bb2e8ab09365d3c800f', 'Administrador', '07-02-2024-13-09-42-IMG_20181104_120732.jpg', '1', 'Sim', '2022-03-07');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('42', 'Jediael Aquino Araujo', '905.323.091-20', 'aes.assessoriaeconsultoria@gmail.com', '325168', '27424c6819a2c6fb59a051c4ef01dafb', 'Administrador', '07-05-2024-15-14-51-A&S.png', '4', 'Sim', '2024-04-16');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('44', 'JOSÉ MARIO SANTOS CONCEIÇÃO', '062.114.855-57', 'santosjosemario449@gmail.com', '123', '202cb962ac59075b964b07152d234b70', 'Aluno', 'sem-perfil.jpg', '40', 'Sim', '2024-05-07');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('45', 'LUCAS SANTOS ALVES', '103.114.035-22', 'lucasalvess492@gmail.com', '82156966', '3a7a92789a062c37e46c73078d539396', 'Aluno', 'sem-perfil.jpg', '41', 'Sim', '2024-05-07');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('46', 'GILVAN RODRIGUES TEIXEIRA', '065.926.306-8', 'gilvanrodriguesp2p@outlook.com', '123', '202cb962ac59075b964b07152d234b70', 'Aluno', 'sem-perfil.jpg', '42', 'Não', '2024-05-09');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('48', 'Gilvan Rodrigues Teixeira ', '', 'gilvanr666@gmail.com', '232458', '20cf86098fe43edf53cd583ca7c5eff5', 'Aluno', 'sem-perfil.jpg', '44', 'Sim', '2024-05-14');

