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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('44', 'Gilvan Rodrigues Teixeira ', '06592630680', 'gilvanr666@gmail.com', '38998499771', 'Rua aldilei augusto Furlan ', 'Piracicaba ', 'São Paulo ', 'Brasil ', '15-05-2024-07-29-24-17157689088341878325324996647904.jpg', '2024-05-14', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('45', 'Emerson nascimento ', '', 'emersonascimento2000@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-16', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('46', 'Emerson ', '', 'leonardo12270gamer@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-16', '', 'Não');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('47', 'RONESCLEI PEREIRA PIO', '07735483620', 'ronnipio12@gmail.com', '74999301309', 'R Vs 2 Qd 2bL Lt 43', 'Goiânia', 'GO', 'Brasil', '16-05-2024-09-44-06-Screenshot_20240423-233516.png', '2024-05-16', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('48', 'Wyctor garcia', '', 'wyctor62@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-16', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('49', 'Tiago Eterno Leite', '01948846195', 'tiagoeterno27@gmail.com', '62994966215', 'Rua Maria de Jesus Qd 57 Lt 24', 'Goiânia', 'GO', 'Brasil', '16-05-2024-09-52-28-Imagem-do-WhatsApp.jpg', '2024-05-16', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('50', 'João Paulo Rocha da Conceição ', '', 'jp.rcgo@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-16', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('51', 'Gilson Alexandre ', '11714031438', 'gilsonalexandre247@gmail.com', '19999477697', 'Natalício Norberto 24 bom sossego 2', 'Delmiro Gouveia Alagoas ', 'Alagoas ', 'Brasil ', '04-06-2024-14-55-02-IMG-20240330-WA0063.jpg', '2024-05-16', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('52', 'Cairo Rangel pires de carvalho alves ', '', 'cairorangel@hotmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-17', '', 'Não');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('53', 'Cleuber gomes ', '23829295', 'cleubergomes804@gmail.com', '31997463635', 'Rua Fernando de Freitas 313', 'Caéte ', 'Minas Gerais ', 'Brasil ', 'sem-perfil.jpg', '2024-05-21', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('54', 'Jean marcel ', '', 'jeanfontana1992@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-21', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('55', 'Ryan Lucas Soares Da Silva ', '', 'ryanlucassilva.22@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-21', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('56', 'Túlio Batista ', '', 'tuliohenrique12@hotmail.com.br', '31995312095', 'Rua jose de aquino 567 ', 'Caeté ', 'Mg ', 'Caeté ', 'sem-perfil.jpg', '2024-05-21', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('57', 'Leidiane Alves Lima', '', 'leidianny380@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-22', '', 'Não');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('58', 'Ana Karoline Pereira Dias', '', 'annadias887@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-22', '', 'Não');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('59', 'Leonardo Diogo ', '', 'leonardodiogomeirelesferreira@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-05-23', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('60', 'Ellington Machado de Paula', '325.085.270-84', 'ellingtonTeste@gmail.com', '(62) 99172-0735', 'av. antonio fontoura borges qd06 lt 02', 'goianesia', 'GO', 'Brasil', 'sem-perfil.jpg', '2024-06-03', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('61', 'Leandro Junio Teixeira De Sousa ', '', 'leandrosousaehs@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-06-05', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('62', 'Charles jose', '03929067161', 'charlesjoseoliveira52@gmail.com', '62984832801', 'Rua 1 número 96', 'Goianesia ', 'Goias', 'Brasil', 'sem-perfil.jpg', '2024-06-12', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('63', 'Martinho Pereira ', '', 'martinhopsilva16@hotmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-06-12', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('64', 'Eder ', '', 'eder4cruz2020@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-06-12', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('65', 'Wanderson Miguel Miranda ', '', 'miguelmirandawanderson@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-06-15', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('66', 'Ademir bispo da Silva ', '', 'ademirbispo80@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-06-17', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('67', 'Welington Rodrigues', '05952800300', 'welingtonrodrigues1704@gmail.com', '88981406507', 'Rua Manoel da Silva Raulino', 'Morada Nova', 'CE', 'Brasil', '12-08-2024-13-52-57-IMG-20240706-WA0057.jpeg', '2024-08-12', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('68', 'José Welington Rodrigues de Lima ', '', 'welington.rodrigues0417@hotmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-08-12', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('69', 'Valdecio jesus dos Santos ', '', 'valdeciojesus132@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-08-12', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('70', 'Fabio júnior da silva', '', 'fabiomataraca19@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-08-12', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('71', 'ALEXANDRO DE OLIVEIRA SILVA', '09390870577', 'fransiscaalexsandro@gmail.com', '74988484876', 'Rua12 Q S9', 'Sobradinho', 'BA', 'Brasil', '12-08-2024-17-01-41-IMG_20240609_171355_300.jpg', '2024-08-12', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('74', 'Jailson Souza PAIXAO ', '29600274851', 'jailsonPJpaixaohotmail@gmail.com', '11995223416', 'Rua Nonoai 351', 'Embu das artes ', 'São Paulo ', 'Brasil ', '13-08-2024-19-03-47-17235865674503045330209735958221.jpg', '2024-08-13', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('75', 'IARLA CAMARGO LACERDA', '70407542159', 'iarlacamargo2016@hotmail.com', '62985488494', 'RUA JOSÉ CARRILHO N 251 SANTA LUZIA', 'GOIANÉSIA', 'GOIÁS', 'BRASIL', '23-08-2024-10-07-13-WhatsApp-Image-2024-08-23-at-10.06.09.jpeg', '2024-08-23', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('76', 'Mateus José das gracas ', '', 'dasgracasmateusjose@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-08-23', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('77', 'Maurício da Silva feitosa', '', 'Mauriciofeitosa1973@hotmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-08-23', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('78', 'Maurício da Silva feitosa', '', 'mauriciofeitosamst@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-08-23', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('79', 'Gabriel Araujo dos Santos Araújo dos Santos', '052.825.541-00', 'cmp.1d.gabriel@gmail.com', '63981053098', 'Rua03 qd04 LT 25 casa 2', 'Goanesia ', 'Go', 'Brasil', '27-08-2024-12-40-27-IMG_20230912_154724.jpg', '2024-08-27', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('80', 'Joel Vieira Arruda ', '', 'prjoelarruda@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-08-27', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('81', 'Túlio Santiago ', '', 'tuliosantiago39@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-08-28', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('82', 'Túlio Santiago ', '', 'tuliosantiago39@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-08-28', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('83', 'Willian da Silva Veras', '', 'williamsilva0777@icloud.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-08-28', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('84', 'João pedro', '71167037138', 'joaopedrodossantossantos329@gmail.com', '62985700207', 'Rua 41 esquina 10 número 24', 'Goianésia ', 'Goiás ', 'Brasil ', '10-09-2024-14-28-32-IMG_1667.jpeg', '2024-09-10', '', 'Sim');
INSERT INTO `alunos` (`id`, `nome`, `cpf`, `email`, `telefone`, `endereco`, `cidade`, `estado`, `pais`, `foto`, `data`, `cartao`, `ativo`) VALUES ('85', 'Leonardo Daniel Alves Bonfim ', '', 'danielalvesbonfim750@gmail.com', '', '', '', '', '', 'sem-perfil.jpg', '2024-09-10', '', 'Sim');

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
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('128', '1', 'Uso de epi', 'https://drive.google.com/file/d/1fTp4d9nR3AcuzTRaxw2TyA48j2z-k-L5/preview?usp=drive_link', '240', '51', '35', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('129', '1', 'Segurança na operação com maquinas e equipamentos', 'https://drive.google.com/file/d/1kyl8o3LHVy0HlkII4aEQs_5NVaPx9n8Q/preview?usp=drive_link', '480', '52', '0', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('130', '2', 'Segurança na operação com maquinas e equipamentos', 'https://drive.google.com/file/d/1hUJwALnTrmtMUFG7vtQOP9YE3-46Alvn/preview?usp=drive_link', '480', '52', '0', '2');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('131', '1', 'segurança com eletricidade', 'https://drive.google.com/file/d/1CKg055V3o2Ak1faZDqsI1FwtIuhds-sY/preview?usp=drive_link', '2400', '54', '0', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('132', '2', 'segurança com eletricidade', 'https://drive.google.com/file/d/1yH-JhbjuSK6KzbrvLf0oKvex9JtmfgIJ/preview?usp=drive_link', '2400', '54', '0', '2');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('137', '1', 'SEGURANÇA NA CONSTRUÇÃO CIVIL', 'https://drive.google.com/file/d/16YiINGLPpME5SqG188CgICSwb3knEhOf/preview?usp=drive_link', '60', '56', '0', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('139', '2', 'Segurança nas atividades de espaço confinado', 'https://drive.google.com/file/d/1AnL5-F9wRccpSHgRFGijicowNxpFzKe8/preview?usp=drive_link', '960', '57', '0', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('140', '1', 'Trabalho a Quente', 'https://drive.google.com/file/d/1bvgw5Fy54MebrhiKJ0U-ShYRLvpKl6BD/preview?usp=drive_link', '480', '58', '0', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('141', '1', 'SEGURANÇA NO TRABALHO EM ALTURA', 'https://drive.google.com/file/d/1Aj5H375Vjg8uDeUvdP--lU6zvEy4-K85/preview?usp=drive_link', '480', '55', '0', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('142', '1', 'Seguança com liquidos e Combustiveis Inflamaveis', 'https://drive.google.com/file/d/1Z7G951_Bos8oFw9rAgALrYNJESl5hJFL/preview?usp=sharing', '960', '59', '0', '1');
INSERT INTO `aulas` (`id`, `num_aula`, `nome`, `link`, `tempo_aula`, `curso`, `sessao`, `sequencia_aula`) VALUES ('143', '1', 'Segurança na Montagem de Andaimes', 'https://drive.google.com/file/d/1EUkz76ec29T9nXZvdka_57bSwuntyr7C/preview?usp=drive_link', '120', '60', '0', '1');

-- TABLE: avaliacoes
CREATE TABLE `avaliacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` int(11) NOT NULL,
  `comentario` varchar(500) NOT NULL,
  `curso` int(11) NOT NULL,
  `aluno` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
INSERT INTO `avaliacoes` (`id`, `nota`, `comentario`, `curso`, `aluno`, `data`) VALUES ('8', '5', 'Excelente curso!', '29', '25', '2022-04-13');
INSERT INTO `avaliacoes` (`id`, `nota`, `comentario`, `curso`, `aluno`, `data`) VALUES ('15', '5', 'Avaliação do curso', '29', '20', '2022-04-20');
INSERT INTO `avaliacoes` (`id`, `nota`, `comentario`, `curso`, `aluno`, `data`) VALUES ('16', '5', 'Excelente curso!', '55', '55', '2024-06-04');
INSERT INTO `avaliacoes` (`id`, `nota`, `comentario`, `curso`, `aluno`, `data`) VALUES ('17', '5', 'Excelente curso!', '58', '55', '2024-06-04');

-- TABLE: banner_index
CREATE TABLE `banner_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(35) NOT NULL,
  `descricao` varchar(160) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `link` varchar(50) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
INSERT INTO `banner_index` (`id`, `titulo`, `descricao`, `foto`, `link`, `ativo`) VALUES ('9', 'NR-06', 'Curso NR-06: Capacitação sobre uso correto, seleção e manutenção de EPIs, conforme a Norma Regulamentadora Nº 06. Segurança no trabalho garantida.', '02-06-2024-18-12-26-bannerNrSeis.png', '#', 'Sim');
INSERT INTO `banner_index` (`id`, `titulo`, `descricao`, `foto`, `link`, `ativo`) VALUES ('10', 'NR-33', 'Curso NR-33: Treinamento para trabalho seguro em espaços confinados. Identificação de riscos, procedimentos de segurança e resgate.', '02-06-2024-18-05-27-BANNER-NR-33.png', '', 'Sim');
INSERT INTO `banner_index` (`id`, `titulo`, `descricao`, `foto`, `link`, `ativo`) VALUES ('11', 'NR-10', 'Curso NR-10: Capacitação em segurança elétrica. Prevenção de acidentes, procedimentos seguros e primeiros socorros em instalações elétricas.', '02-06-2024-18-06-21-BANNER-NR-10.png', '', 'Sim');
INSERT INTO `banner_index` (`id`, `titulo`, `descricao`, `foto`, `link`, `ativo`) VALUES ('12', 'NR-18', 'Curso NR-18: Treinamento em segurança na construção civil. Normas de prevenção de acidentes, uso de EPIs e práticas seguras em canteiros de obras.', '02-06-2024-18-07-22-BANNER-NR-18.png', '', 'Sim');
INSERT INTO `banner_index` (`id`, `titulo`, `descricao`, `foto`, `link`, `ativo`) VALUES ('13', 'NR-35', 'Curso NR-35: Capacitação para trabalho em altura. Técnicas de segurança, uso de EPIs, prevenção de acidentes e procedimentos de resgate.', '02-06-2024-18-07-50-BANNER-NR-35.png', '', 'Sim');
INSERT INTO `banner_index` (`id`, `titulo`, `descricao`, `foto`, `link`, `ativo`) VALUES ('14', 'NR-34', 'Curso NR-34: Treinamento em segurança para trabalhos na indústria naval. Procedimentos de segurança, uso de EPIs e prevenção de acidentes.', '02-06-2024-18-08-36-BANNER-NR-34.png', '', 'Sim');

-- TABLE: banner_login
CREATE TABLE `banner_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
INSERT INTO `banner_login` (`id`, `nome`, `link`, `foto`, `ativo`) VALUES ('7', 'investimento', 'http://localhost/portalead/sistema', '21-03-2024-16-13-09-Carrinhoaberto#4.jpg', 'Não');
INSERT INTO `banner_login` (`id`, `nome`, `link`, `foto`, `ativo`) VALUES ('8', 'login', 'http://localhost/plataformaJediael/sistema', '09-04-2024-08-01-53-52134209_109104266892631_4473667798421209088_n.jpg', 'Não');
INSERT INTO `banner_login` (`id`, `nome`, `link`, `foto`, `ativo`) VALUES ('9', 'banner 2', '#', '01-07-2024-16-06-06-Projeto-Assinatura-Jediael.png', 'Sim');

-- TABLE: categorias
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  `nome_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('18', 'Eletrica', '', 'sem-foto.png', 'eletrica');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('19', 'EPI', '', 'sem-foto.png', 'epi');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('20', 'FERRAMENTAS MANUAIS', '', 'sem-foto.png', 'ferramentas-manuais');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('21', 'TRABALHO A QUENTE', '', 'sem-foto.png', 'trabalho-a-quente');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('22', 'SEGURANÇA NA CONSTRUÇÃO CIVIL', '', 'sem-foto.png', 'seguranca-na-construcao-civil');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('23', 'SEGURANÇA NO TRABALHO EM ALTURA', 'ALTURA', '07-05-2024-15-26-48-NR35.png', 'seguranca-no-trabalho-em-altura');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('24', 'NR 33', 'Espaço Confinado', '09-05-2024-11-11-35-NR-33.png', 'nr-33');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('25', 'Liquidos Combustiveis e Inflam´veis', 'NR 20', 'sem-foto.png', 'liquidos-combustiveis-e-inflam');
INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`) VALUES ('26', 'NR 18.15 Andaime', '', '10-09-2024-15-00-30-NR-18.andaime.png', 'nr-18.15-andaime');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO `config` (`id`, `nome_sistema`, `tel_sistema`, `email_sistema`, `cnpj_sistema`, `tipo_chave_pix`, `chave_pix`, `logo`, `icone`, `logo_rel`, `qrcode_pix`, `facebook`, `instagram`, `youtube`, `itens_pag`, `video_sobre`, `itens_relacionados`, `aulas_liberadas`, `desconto_pix`, `email_adm_mat`, `cartoes_fidelidade`, `taxa_boleto`, `taxa_mp`, `taxa_paypal`, `valor_max_cartao`, `total_emails_por_envio`, `intervalo_envio_email`, `script_dia`, `dias_email_matricula`, `dias_excluir_matricula`, `professor_cad`, `comissao_professor`, `dia_pgto_comissao`, `questionario`, `media`, `verso`) VALUES ('1', 'Plataforma A&S', '(62) 98513-5258', 'aes.assessoriaeconsultoria@gmail.com', '32.532.892/0001-68', 'Telefone', '62981785842', 'logo.png', 'favicon.ico', 'logo_rel.jpg', 'qrcode.jpg', 'https://www.facebook.com/profile.php?id=100033791746552&mibextid=ZbWKwL', 'https://www.instagram.com/aes.sessoriaemsegtrab?utm_source=qr&igsh=c2F1NGdoYWx2MmQy', '', '12', '', '8', '2', '5', 'Sim', '5', '3.45', '5.00', '7.50', '65.00', '480', '70', '2024-09-11', '3', '30', 'Não', '20', '20', 'Sim', '60', 'Sim');

-- TABLE: cupons
CREATE TABLE `cupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(25) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('51', 'NR 06', '', '', '180.00', '42', '19', '07-05-2024-10-45-08-NR-06.png', 'Aprovado', '4', '', '', '2024', '', '5', 'nr-06', '', '', '', '', '100.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('52', 'NR 12', '', '', '0.00', '42', '20', '07-05-2024-10-23-36-NR-12.png', 'Aprovado', '120', '', '', '2024', '', '6', 'nr-12', '', '', '', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('54', 'NR 10', '', '', '0.00', '42', '18', '07-05-2024-14-08-06-NR-10.png', 'Aprovado', '40', '', '', '2024', '', '4', 'nr-10', '', '', 'https://drive.google.com/file/d/1CKg055V3o2Ak1faZDqsI1FwtIuhds-sY/preview?usp=drive_link', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('55', 'NR 35', '', '', '0.00', '42', '23', '07-05-2024-15-27-38-NR35.png', 'Aprovado', '0', '', '', '2024', '', '9', 'nr-35', '', '', '', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('56', 'NR 18', '', '', '0.00', '42', '22', '07-05-2024-15-32-04-NR-18.png', 'Aprovado', '0', '', '', '2024', '', '7', 'nr-18', '', '', '', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('57', 'NR 33', '', '', '0.00', '0', '24', '09-05-2024-14-11-24-NR-33.png', 'Aprovado', '16', '', '', '2024', '', '10', 'nr-33', '', '', '', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('58', 'NR 34', '', '', '0.00', '42', '21', '16-05-2024-08-08-44-NR-34.png', 'Aprovado', '8', '', '', '2024', '', '8', 'nr-34', '', '', '', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('59', 'NR 20', '', '', '0.00', '42', '25', '23-08-2024-09-42-01-NR20.png', 'Aprovado', '16', '', '', '2024', '', '11', 'nr-20', '', '', '', '', '0.00', '', '20');
INSERT INTO `cursos` (`id`, `nome`, `desc_rapida`, `desc_longa`, `valor`, `professor`, `categoria`, `imagem`, `status`, `carga`, `mensagem`, `arquivo`, `ano`, `palavras`, `grupo`, `nome_url`, `pacote`, `sistema`, `link`, `tecnologias`, `promocao`, `matriculas`, `comissao`) VALUES ('60', 'NR 18.15 Andaime', '', '', '0.00', '42', '26', 'sem-foto.png', 'Aguardando', '120', '', '', '2024', '', '12', 'nr-18.15-andaime', '', '', '', '', '0.00', '', '20');

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
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
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('26', 'emersonascimento2000@gmail.com', 'Emerson nascimento ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('27', 'leonardo12270gamer@gmail.com', 'Emerson ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('28', 'ronnipio12@gmail.com', 'RONESCLEI PEREIRA PIO', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('29', 'wyctor62@gmail.com', 'Wyctor garcia', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('30', 'tiagoeterno27@gmail.com', 'Tiago Eterno Leite', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('31', 'jp.rcgo@gmail.com', 'João Paulo Rocha da Conceição ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('32', 'gilsonalexandre247@gmail.com', 'Gilson Alexandre ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('33', 'cairorangel@hotmail.com', 'Cairo Rangel pires de carvalho alves ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('34', 'cleubergomes804@gmail.com', 'Cleuber gomes ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('35', 'jeanfontana1992@gmail.com', 'Jean marcel ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('36', 'ryanlucassilva.22@gmail.com', 'Ryan Lucas Soares Da Silva ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('37', 'tuliohenrique12@hotmail.com.br', 'Túlio Batista ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('38', 'leidianny380@gmail.com', 'Leidiane Alves Lima', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('39', 'annadias887@gmail.com', 'Ana Karoline Pereira Dias', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('40', 'leonardodiogomeirelesferreira@gmail.com', 'Leonardo Diogo ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('41', 'leandrosousaehs@gmail.com', 'Leandro Junio Teixeira De Sousa ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('42', 'charlesjoseoliveira52@gmail.com', 'Charles jose', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('43', 'martinhopsilva16@hotmail.com', 'Martinho Pereira ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('44', 'eder4cruz2020@gmail.com', 'Eder ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('45', 'miguelmirandawanderson@gmail.com', 'Wanderson Miguel Miranda ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('46', 'ademirbispo80@gmail.com', 'Ademir bispo da Silva ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('47', 'welington.rodrigues1704@hotmail.com', 'José Welington Rodrigues de Lima ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('48', 'welington.rodrigues0417@hotmail.com', 'José Welington Rodrigues de Lima ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('49', 'valdeciojesus132@gmail.com', 'Valdecio jesus dos Santos ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('50', 'fabiomataraca19@gmail.com', 'Fabio júnior da silva', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('51', 'fransiscaalexsandro@gmail.com', 'ALEXANDRO DE OLIVEIRA SILVA', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('52', 'jailsonsouzapaixao@hotmail.com', 'Jailson Souza PAIXAO ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('53', 'jailson.souzapaixao@hotmail.com', 'Jailson Souza PAIXAO ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('54', 'jailsonPJpaixaohotmail@gmail.com', 'Jailson Souza PAIXAO ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('55', 'iarlacamargo2016@hotmail.com', 'IARLA CAMARGO LACERDA', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('56', 'dasgracasmateusjose@gmail.com', 'Mateus José das gracas ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('57', 'Mauriciofeitosa1973@hotmail.com', 'Maurício da Silva feitosa', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('58', 'mauriciofeitosamst@gmail.com', 'Maurício da Silva feitosa', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('59', 'cmp.1d.gabriel@gmail.com', 'Gabriel Araújo dos Santos ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('60', 'prjoelarruda@gmail.com', 'Joel Vieira Arruda ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('61', 'tuliosantiago39@gmail.com', 'Túlio Santiago ', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('62', 'williamsilva0777@icloud.com', 'Willian da Silva Veras', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('63', 'joaopedrodossantossantos329@gmail.com', 'João pedro', 'sim');
INSERT INTO `emails` (`id`, `email`, `nome`, `enviar`) VALUES ('64', 'danielalvesbonfim750@gmail.com', 'Leonardo Daniel Alves Bonfim ', 'sim');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
INSERT INTO `grupos` (`id`, `nome`) VALUES ('4', 'Eletrica');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('5', 'EPI');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('6', 'FERRAMENTAS MANUAIS');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('7', 'CONSTRUÇÃO CIVIL');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('8', 'TRABALHO A QUENTE');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('9', 'TRABALHO EM ALTURA');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('10', 'Segurança no Trabalho em Espaço Confinado');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('11', 'Segurança com liquidos e Combustiveis Imflamaveis');
INSERT INTO `grupos` (`id`, `nome`) VALUES ('12', 'NR 18.15');

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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('27', '44', '37', '', '1', '0.00', '2024-03-27', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-04-10', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('47', '57', '46', '', '1', '0.00', '2024-05-14', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('48', '55', '46', '', '1', '0.00', '2024-05-14', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('49', '57', '48', '', '1', '0.00', '2024-05-15', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('50', '55', '48', '', '1', '0.00', '2024-05-15', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-17', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('51', '51', '50', '', '1', '0.00', '2024-05-16', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('52', '54', '50', '', '1', '0.00', '2024-05-16', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('53', '55', '50', '', '1', '0.00', '2024-05-16', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('54', '51', '51', '', '1', '0.00', '2024-05-16', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-16', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('55', '54', '51', '', '2', '0.00', '2024-05-16', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-16', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('56', '55', '51', '', '1', '0.00', '2024-05-16', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-18', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('57', '55', '53', '', '1', '0.00', '2024-05-16', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-18', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('58', '54', '53', '', '2', '0.00', '2024-05-16', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-16', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('59', '51', '53', '', '1', '0.00', '2024-05-16', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-16', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('60', '51', '52', '', '1', '0.00', '2024-05-16', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-17', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('61', '54', '52', '', '1', '0.00', '2024-05-16', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('62', '55', '52', '', '1', '0.00', '2024-05-16', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-18', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('63', '51', '56', '', '1', '0.00', '2024-05-17', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-19', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('64', '54', '56', '', '2', '0.00', '2024-05-17', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-19', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('65', '55', '56', '', '1', '0.00', '2024-05-17', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-17', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('66', '52', '62', '', '1', '0.00', '2024-05-22', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('67', '55', '62', '', '1', '0.00', '2024-05-22', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('68', '52', '57', '', '1', '0.00', '2024-05-23', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('69', '55', '57', '', '1', '0.00', '2024-05-23', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-23', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('70', '55', '59', '', '1', '0.00', '2024-05-23', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-23', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('71', '52', '59', '', '1', '0.00', '2024-05-23', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('72', '52', '60', '', '1', '0.00', '2024-05-23', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('73', '55', '60', '', '1', '0.00', '2024-05-23', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-05-23', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('74', '55', '58', '', '1', '0.00', '2024-05-23', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('75', '52', '58', '', '1', '0.00', '2024-05-23', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('76', '52', '63', '', '1', '0.00', '2024-05-24', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('77', '55', '63', '', '1', '0.00', '2024-05-24', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('78', '51', '55', '', '1', '0.00', '2024-05-28', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-06-05', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('79', '52', '55', '', '2', '0.00', '2024-05-28', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-06-05', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('80', '57', '55', '', '1', '0.00', '2024-05-28', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('81', '58', '55', '', '1', '0.00', '2024-05-28', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-06-04', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('82', '55', '55', '', '1', '0.00', '2024-05-28', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-06-03', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('83', '51', '64', '', '1', '0.00', '2024-06-03', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('84', '54', '64', '', '1', '0.00', '2024-06-03', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('85', '52', '64', '', '1', '0.00', '2024-06-03', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('86', '56', '64', '', '1', '0.00', '2024-06-03', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('87', '57', '64', '', '1', '0.00', '2024-06-03', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('88', '58', '64', '', '1', '0.00', '2024-06-03', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-06-03', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('89', '51', '65', '', '1', '0.00', '2024-06-05', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-06-05', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('90', '54', '65', '', '1', '0.00', '2024-06-05', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('91', '52', '65', '', '1', '0.00', '2024-06-05', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('92', '57', '65', '', '1', '0.00', '2024-06-05', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('93', '58', '65', '', '1', '0.00', '2024-06-05', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-06-05', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('94', '55', '65', '', '1', '0.00', '2024-06-05', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-06-05', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('95', '51', '68', '', '1', '0.00', '2024-06-13', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('96', '51', '66', '', '1', '0.00', '2024-06-13', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-06-17', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('97', '51', '67', '', '1', '0.00', '2024-06-13', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-06-17', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('98', '51', '70', '', '1', '0.00', '2024-06-18', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('99', '55', '74', '', '1', '0.00', '2024-08-12', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-08-12', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('100', '59', '79', '', '1', '0.00', '2024-08-23', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-08-23', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('101', '51', '88', '', '1', '0.00', '2024-09-10', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('102', '60', '88', '', '1', '0.00', '2024-09-10', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-09-10', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('103', '57', '88', '', '1', '0.00', '2024-09-10', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('104', '55', '88', '', '1', '0.00', '2024-09-10', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-09-10', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('105', '55', '89', '', '1', '0.00', '2024-09-10', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-09-11', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('106', '57', '89', '', '1', '0.00', '2024-09-10', 'Matriculado', '', '', '0.00', '0.00', '', '', '0', '', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('107', '60', '89', '', '1', '0.00', '2024-09-10', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-09-10', '0.00', '', '', '');
INSERT INTO `matriculas` (`id`, `id_curso`, `aluno`, `professor`, `aulas_concluidas`, `valor`, `data`, `status`, `pacote`, `alertado`, `valor_cupom`, `subtotal`, `forma_pgto`, `boleto`, `id_pacote`, `data_conclusao`, `total_recebido`, `obs`, `nota`, `ref_api`) VALUES ('108', '51', '89', '', '1', '0.00', '2024-09-10', 'Finalizado', '', '', '0.00', '0.00', '', '', '0', '2024-09-10', '0.00', '', '', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
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
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('29', '0', 'aula NR  35 nao abre', '55', '51', '2024-05-16', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('30', '1', 'A aula3 do NR 35 não abre.', '55', '53', '2024-05-16', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('31', '1', 'As aulas de NR 33 e 35 não estão abrindo', '55', '48', '2024-05-16', 'Sim');
INSERT INTO `perguntas` (`id`, `aula`, `pergunta`, `curso`, `aluno`, `data`, `respondida`) VALUES ('32', '0', 'Nr33', '57', '55', '2024-06-04', 'Não');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
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
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('53', 'Tenta novamente  ', '0', '42', '2024-05-16', '31', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('54', 'Tenta novamente ', '0', '42', '2024-05-16', '30', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('55', 'Tenta novamente ', '0', '42', '2024-05-16', '29', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('56', 'Nao abre', '55', '51', '2024-05-16', '29', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('57', '', '55', '51', '2024-05-16', '29', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('58', 'Liberei novamente ve se da certo!', '0', '42', '2024-05-17', '31', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('59', 'Liberei novamente ve se da certo!', '0', '42', '2024-05-17', '30', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('60', 'Liberei novamente ve se da certo!', '0', '42', '2024-05-17', '29', 'Professor');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('61', '', '57', '55', '2024-06-04', '32', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('62', '', '57', '55', '2024-06-04', '32', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('63', '', '57', '55', '2024-06-04', '32', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('64', '', '57', '55', '2024-06-04', '32', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('65', '', '57', '55', '2024-06-04', '32', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('66', '', '57', '0', '2024-06-06', '32', 'Aluno');
INSERT INTO `respostas` (`id`, `resposta`, `curso`, `pessoa`, `data`, `pergunta`, `funcao`) VALUES ('67', '', '57', '0', '2024-06-06', '32', 'Aluno');

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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('2', 'Ellington Machado ', '019.292.181-92', 'ellington1209@gmail.com', '899117', 'fc01dc0f7a228bb2e8ab09365d3c800f', 'Administrador', '07-02-2024-13-09-42-IMG_20181104_120732.jpg', '1', 'Sim', '2022-03-07');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('42', 'Jediael Aquino Araujo', '905.323.091-20', 'aes.assessoriaeconsultoria@gmail.com', '325168', '27424c6819a2c6fb59a051c4ef01dafb', 'Administrador', '07-05-2024-15-14-51-A&S.png', '4', 'Sim', '2024-04-16');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('48', 'Gilvan Rodrigues Teixeira ', '06592630680', 'gilvanr666@gmail.com', '232458', '20cf86098fe43edf53cd583ca7c5eff5', 'Aluno', '15-05-2024-07-29-24-17157689088341878325324996647904.jpg', '44', 'Sim', '2024-05-14');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('49', 'Emerson nascimento ', '', 'emersonascimento2000@gmail.com', '3357@3357', '1bbf667a9d8d783253c47dc3ea1632d4', 'Aluno', 'sem-perfil.jpg', '45', 'Sim', '2024-05-16');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('50', 'Emerson ', '', 'leonardo12270gamer@gmail.com', '33573357', '9ee013d6bfa7b5d5d1330f7c83352953', 'Aluno', 'sem-perfil.jpg', '46', 'Não', '2024-05-16');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('51', 'RONESCLEI PEREIRA PIO', '07735483620', 'ronnipio12@gmail.com', 'pio1026401', '5d0b460dcafbf53a676127165a9e9b99', 'Aluno', '16-05-2024-09-44-06-Screenshot_20240423-233516.png', '47', 'Sim', '2024-05-16');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('52', 'Wyctor garcia', '', 'wyctor62@gmail.com', '3551', 'abdeb6f575ac5c6676b747bca8d09cc2', 'Aluno', 'sem-perfil.jpg', '48', 'Sim', '2024-05-16');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('53', 'Tiago Eterno Leite', '01948846195', 'tiagoeterno27@gmail.com', '965874Cg', '4f4ed5beea277b2f4ab15f12530ff074', 'Aluno', '16-05-2024-09-52-28-Imagem-do-WhatsApp.jpg', '49', 'Sim', '2024-05-16');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('54', 'João Paulo Rocha da Conceição ', '', 'jp.rcgo@gmail.com', '246135jp', 'e6b3a0efa095bb9832e66125cf7334f8', 'Aluno', 'sem-perfil.jpg', '50', 'Sim', '2024-05-16');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('55', 'Gilson Alexandre ', '11714031438', 'gilsonalexandre247@gmail.com', 'gilson123', '04b31871928406c840c9804a87e60a1e', 'Aluno', '04-06-2024-14-55-02-IMG-20240330-WA0063.jpg', '51', 'Sim', '2024-05-16');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('56', 'Cairo Rangel pires de carvalho alves ', '', 'cairorangel@hotmail.com', 'carola0607', 'b20929e82bb2337b0ce697ec6b778929', 'Aluno', 'sem-perfil.jpg', '52', 'Não', '2024-05-17');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('57', 'Cleuber gomes ', '23829295', 'cleubergomes804@gmail.com', 'cleuber157', '82e763a9cabb64945327e85cbee474d0', 'Aluno', 'sem-perfil.jpg', '53', 'Sim', '2024-05-21');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('58', 'Jean marcel ', '', 'jeanfontana1992@gmail.com', 'jean1992', '3801d960c8f2ccd397820170bbebc4b6', 'Aluno', 'sem-perfil.jpg', '54', 'Sim', '2024-05-21');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('59', 'Ryan Lucas Soares Da Silva ', '', 'ryanlucassilva.22@gmail.com', 'Ry4n.0709', '4bc2c51d8c9c23ca29eba80d981596bd', 'Aluno', 'sem-perfil.jpg', '55', 'Sim', '2024-05-21');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('60', 'Túlio Batista ', '', 'tuliohenrique12@hotmail.com.br', '36515813', 'ca2a5fc5acc891eba97854107a4f40b7', 'Aluno', 'sem-perfil.jpg', '56', 'Sim', '2024-05-21');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('61', 'Leidiane Alves Lima', '', 'leidianny380@gmail.com', '142701', '81c3d7cdc046fb4ab0f4f3013ed12352', 'Aluno', 'sem-perfil.jpg', '57', 'Não', '2024-05-22');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('62', 'Ana Karoline Pereira Dias', '', 'annadias887@gmail.com', '12345', '827ccb0eea8a706c4c34a16891f84e7b', 'Aluno', 'sem-perfil.jpg', '58', 'Não', '2024-05-22');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('63', 'Leonardo Diogo ', '', 'leonardodiogomeirelesferreira@gmail.com', 'Minhavida888', '00d6b708661febe81c843ccce658be6d', 'Aluno', 'sem-perfil.jpg', '59', 'Sim', '2024-05-23');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('64', 'Ellington Machado de Paula', '325.085.270-84', 'ellingtonTeste@gmail.com', '123', '202cb962ac59075b964b07152d234b70', 'Aluno', 'sem-perfil.jpg', '60', 'Sim', '2024-06-03');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('65', 'Leandro Junio Teixeira De Sousa ', '', 'leandrosousaehs@gmail.com', '199019', '611495ddac92cb7742d22dcde019c9de', 'Aluno', 'sem-perfil.jpg', '61', 'Sim', '2024-06-05');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('66', 'Charles jose', '03929067161', 'charlesjoseoliveira52@gmail.com', '12345678', '25d55ad283aa400af464c76d713c07ad', 'Aluno', 'sem-perfil.jpg', '62', 'Sim', '2024-06-12');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('67', 'Martinho Pereira ', '', 'martinhopsilva16@hotmail.com', 'Goianesia123', '2f35087bcd9d3f16c384feeb49168d0c', 'Aluno', 'sem-perfil.jpg', '63', 'Sim', '2024-06-12');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('68', 'Eder ', '', 'eder4cruz2020@gmail.com', '2121', '02b1be0d48924c327124732726097157', 'Aluno', 'sem-perfil.jpg', '64', 'Sim', '2024-06-12');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('69', 'Wanderson Miguel Miranda ', '', 'miguelmirandawanderson@gmail.com', '352833wa', 'cd4907c3282dd01093c81b492724296d', 'Aluno', 'sem-perfil.jpg', '65', 'Sim', '2024-06-15');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('70', 'Ademir bispo da Silva ', '', 'ademirbispo80@gmail.com', '072516jana', '2d579cfb6f9f440dfe55836106e3bdca', 'Aluno', 'sem-perfil.jpg', '66', 'Sim', '2024-06-17');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('71', 'Welington Rodrigues', '05952800300', 'welingtonrodrigues1704@gmail.com', 'Wr123456@', 'd59019e3a6168af5f6cd00ca3dce20e5', 'Aluno', '12-08-2024-13-52-57-IMG-20240706-WA0057.jpeg', '67', 'Sim', '2024-08-12');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('72', 'José Welington Rodrigues de Lima ', '', 'welington.rodrigues0417@hotmail.com', 'Wr123456@', 'd59019e3a6168af5f6cd00ca3dce20e5', 'Aluno', 'sem-perfil.jpg', '68', 'Sim', '2024-08-12');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('73', 'Valdecio jesus dos Santos ', '', 'valdeciojesus132@gmail.com', '823088', '6a46399f2cb3fe987d05020ff0863554', 'Aluno', 'sem-perfil.jpg', '69', 'Sim', '2024-08-12');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('74', 'Fabio júnior da silva', '', 'fabiomataraca19@gmail.com', '3555', '22b1cd168ec628442b3d4dc00fca434b', 'Aluno', 'sem-perfil.jpg', '70', 'Sim', '2024-08-12');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('75', 'ALEXANDRO DE OLIVEIRA SILVA', '09390870577', 'fransiscaalexsandro@gmail.com', 'Alexsandro129', 'dd4ddeac361e475bc5b684312f5ec980', 'Aluno', '12-08-2024-17-01-41-IMG_20240609_171355_300.jpg', '71', 'Sim', '2024-08-12');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('78', 'Jailson Souza PAIXAO ', '29600274851', 'jailsonPJpaixaohotmail@gmail.com', '220232PJ', '00c2a61bc93fa799a1159f84e307a7ff', 'Aluno', '13-08-2024-19-03-47-17235865674503045330209735958221.jpg', '74', 'Sim', '2024-08-13');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('79', 'IARLA CAMARGO LACERDA', '70407542159', 'iarlacamargo2016@hotmail.com', '02061723', '610878915b0603d5160cfc7af8c56699', 'Aluno', '23-08-2024-10-07-13-WhatsApp-Image-2024-08-23-at-10.06.09.jpeg', '75', 'Sim', '2024-08-23');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('80', 'Mateus José das gracas ', '', 'dasgracasmateusjose@gmail.com', '2238', '2952351097998ac1240cb2ab7333a3d2', 'Aluno', 'sem-perfil.jpg', '76', 'Sim', '2024-08-23');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('81', 'Maurício da Silva feitosa', '', 'Mauriciofeitosa1973@hotmail.com', '130173', '6aa9716b0f718f23470e7be16440ee71', 'Aluno', 'sem-perfil.jpg', '77', 'Sim', '2024-08-23');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('82', 'Maurício da Silva feitosa', '', 'mauriciofeitosamst@gmail.com', '130173', '6aa9716b0f718f23470e7be16440ee71', 'Aluno', 'sem-perfil.jpg', '78', 'Sim', '2024-08-23');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('83', 'Gabriel Araujo dos Santos Araújo dos Santos', '052.825.541-00', 'cmp.1d.gabriel@gmail.com', 'G@briel7', '2d361f8172de6b4109c91a2fcff37169', 'Aluno', '27-08-2024-12-40-27-IMG_20230912_154724.jpg', '79', 'Sim', '2024-08-27');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('84', 'Joel Vieira Arruda ', '', 'prjoelarruda@gmail.com', '63668995', 'de38affab313b5308dadc69f3b3547ad', 'Aluno', 'sem-perfil.jpg', '80', 'Sim', '2024-08-27');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('85', 'Túlio Santiago ', '', 'tuliosantiago39@gmail.com', '8535', 'db53e24fbc4e5a62aaa6e92f6bd1167f', 'Aluno', 'sem-perfil.jpg', '81', 'Sim', '2024-08-28');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('86', 'Túlio Santiago ', '', 'tuliosantiago39@gmail.com', '8535', 'db53e24fbc4e5a62aaa6e92f6bd1167f', 'Aluno', 'sem-perfil.jpg', '82', 'Sim', '2024-08-28');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('87', 'Willian da Silva Veras', '', 'williamsilva0777@icloud.com', '912521', '0f1dc912e36368ecad5dcdee6ff06cb0', 'Aluno', 'sem-perfil.jpg', '83', 'Sim', '2024-08-28');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('88', 'João pedro', '71167037138', 'joaopedrodossantossantos329@gmail.com', 'Jk1807@1', '3f8fe49844984f046f3f331839f5324a', 'Aluno', '10-09-2024-14-28-32-IMG_1667.jpeg', '84', 'Sim', '2024-09-10');
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `senha_crip`, `nivel`, `foto`, `id_pessoa`, `ativo`, `data`) VALUES ('89', 'Leonardo Daniel Alves Bonfim ', '', 'danielalvesbonfim750@gmail.com', '258525', 'e743c2cf30d4be0704e5f7ac6d7b6bf1', 'Aluno', 'sem-perfil.jpg', '85', 'Sim', '2024-09-10');

