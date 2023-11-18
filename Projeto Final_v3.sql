---- Criação do banco de dados ----

CREATE DATABASE ecommerce_projeto;

USE ecommerce_projeto;

---- Criação das tabelas ----

CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(100),
    ultimo_nome VARCHAR(100),
    cnpj_cliente VARCHAR(18),
    razao_social VARCHAR(200),
    email_cliente VARCHAR(100),
    endereco VARCHAR(200),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    cep VARCHAR(9));
    
CREATE TABLE pedidos (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    quantidade_itens INT,
    endereco_entrega VARCHAR(300),
    descontos DECIMAL(4,2),
    cupons VARCHAR(50),
    valor_total_pedido FLOAT,
    forma_pagamento VARCHAR(50),
    prazo_entrega VARCHAR(20),
    id_devolucao INT,
    id_transportadora INT);

CREATE TABLE produtos(
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100),
    marca_peca VARCHAR(100),
    modelo_carro VARCHAR(50),
    ano_modelo INT,
    categoria_peca VARCHAR(50),
    valor_produto FLOAT);

CREATE TABLE estoque(
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    qtde_estoque INT,
    status_estoque VARCHAR(50),
    id_fornecedor INT);

CREATE TABLE fornecedores(
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(200),
    cnpj_fornecedor VARCHAR(18),
    email_fornecedor VARCHAR(100),
    telefone VARCHAR(11),
    data_registro DATE);

CREATE TABLE nota_fiscal(
    id_nota_fiscal INT AUTO_INCREMENT PRIMARY KEY,
    data_emissao DATETIME,
    valor FLOAT,
    numero_nota_fiscal INT,
    chave_acesso VARCHAR(30),
    id_pedido INT);

CREATE TABLE devolucoes(
    id_devolucao INT AUTO_INCREMENT PRIMARY KEY,
    motivo_devolucao VARCHAR(200),
    forma_estorno VARCHAR(50),
    custo_retirada FLOAT,
    data_solicitacao DATETIME,
    data_conclusao DATETIME);

CREATE TABLE itens_pedidos(
    id_itens_pedidos INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_pedido INT,
    quantidade INT);

CREATE TABLE transportadora(
    id_transportadora INT AUTO_INCREMENT PRIMARY KEY,
    data_cadastro DATE,
    nome_contato VARCHAR(100),
    email_transportadora VARCHAR(100));

---- Inclusão das FOREIGN KEYS nas tabelas ----
ALTER TABLE pedidos
ADD FOREIGN KEY (id_cliente) REFERENCES ecommerce_projeto.clientes(id_cliente),
ADD FOREIGN KEY (id_devolucao) REFERENCES ecommerce_projeto.devolucoes(id_devolucao),
ADD FOREIGN KEY (id_transportadora) REFERENCES ecommerce_projeto.transportadora(id_transportadora);

ALTER TABLE estoque
ADD FOREIGN KEY (id_produto) REFERENCES ecommerce_projeto.produtos(id_produto),
ADD FOREIGN KEY (id_fornecedor) REFERENCES ecommerce_projeto.fornecedores(id_fornecedor);

ALTER TABLE nota_fiscal
ADD FOREIGN KEY (id_pedido) REFERENCES ecommerce_projeto.pedidos(id_pedido);

ALTER TABLE itens_pedidos
ADD FOREIGN KEY(id_produto) REFERENCES ecommerce_projeto.produtos(id_produto),
ADD FOREIGN KEY(id_pedido) REFERENCES ecommerce_projeto.pedidos(id_pedido);

---- Inclusão dados nas tabelas ----

INSERT INTO clientes (primeiro_nome, ultimo_nome, cnpj_cliente, razao_social, email_cliente, endereco, cidade, estado, cep) VALUES
('Link', 'Bate', '5048370164378580', 'Zooveo', 'lbate0@washingtonpost.com', '05040 Sunnyside Parkway', 'New Orleans', 'Louisiana', '70149'), 
('Bria', 'Signori', '5048373918198650', 'Youspan', 'bsignori1@ucla.edu', '77 Jana Crossing', 'Fort Smith', 'Arkansas', '72905'), 
('Min', 'Bloschke', '5048377989348460', 'Chatterbridge', 'mbloschke2@patch.com', '08488 Superior Place', 'Columbus', 'Georgia', '31904'), 
('Randa', 'Horribine', '5048371633240870', 'Avaveo', 'rhorribine3@constantcontact.com', '0216 Arkansas Road', 'Peoria', 'Illinois', '61640'), 
('Laurie', 'Bernot', '5048373738842590', 'Jaxspan', 'lbernot4@pinterest.com', '67 East Avenue', 'Lawrenceville', 'Georgia', '30045'), 
('Mona', 'Bristow', '5048373068810890', 'Trupe', 'mbristow5@google.it', '99998 Raven Terrace', 'Moreno Valley', 'California', '92555'), 
('Rivi', 'Allin', '5108754221385650', 'Skiptube', 'rallin6@miibeian.gov.cn', '5 Burrows Park', 'El Paso', 'Texas', '79905'), 
('Izak', 'Whitehorn', '5048377677410660', 'Topicware', 'iwhitehorn7@buzzfeed.com', '723 Swallow Circle', 'Brooklyn', 'New York', '11205'), 
('Hugo', 'Stichel', '5108753425454900', 'Browsecat', 'hstichel8@live.com', '212 Birchwood Avenue', 'Kansas City', 'Missouri', '64190'), 
('Krystle', 'Rival', '5048378075888140', 'Skaboo', 'krival9@sbwire.com', '63918 Ridge Oak Point', 'Peoria', 'Illinois', '61640'), 
('Jeromy', 'Kermannes', '5048376615805350', 'Demimbu', 'jkermannesa@about.me', '77323 Crowley Road', 'New Haven', 'Connecticut', '6538'), 
('Allison', 'Dugdale', '5048379443794510', 'Snaptags', 'adugdaleb@sun.com', '57482 Vera Lane', 'Des Moines', 'Iowa', '50362'), 
('Symon', 'Ranken', '5048371495018940', 'Roomm', 'srankenc@bandcamp.com', '15 Loftsgordon Hill', 'San Rafael', 'California', '94913'), 
('Nessa', 'Gabb', '5108755830326990', 'Youspan', 'ngabbd@cbsnews.com', '4 Mayfield Street', 'Denver', 'Colorado', '80243'), 
('Decca', 'Verna', '5108751853121130', 'Yakidoo', 'dvernae@sphinn.com', '77 Aberg Avenue', 'Detroit', 'Michigan', '48275'), 
('Tracey', 'Patrone', '5048373380280810', 'Youtags', 'tpatronef@boston.com', '05135 Summer Ridge Park', 'Fresno', 'California', '93750'), 
('Geri', 'Bottomore', '5048372253146120', 'Brainbox', 'gbottomoreg@topsy.com', '210 Vernon Pass', 'Washington', 'District of Columbia', '20062'), 
('Mallory', 'Boggers', '5108757675242000', 'Gigashots', 'mboggersh@twitter.com', '07 Elka Pass', 'Clearwater', 'Florida', '33758'), 
('Elbert', 'Henrys', '5108757214330020', 'Ntags', 'ehenrysi@businesswire.com', '7 Briar Crest Road', 'Hartford', 'Connecticut', '6105'), 
('Gabie', 'Pesak', '5048371573900020', 'Blogtag', 'gpesakj@phoca.cz', '535 Dryden Center', 'Hattiesburg', 'Mississippi', '39404'), 
('Bridget', 'Duckers', '5048373986154950', 'Jabbersphere', 'bduckersk@redcross.org', '67709 Paget Avenue', 'Madison', 'Wisconsin', '53726'), 
('Marcella', 'Baseke', '5108756729067530', 'Feedfish', 'mbasekel@mozilla.org', '635 Tennessee Point', 'Akron', 'Ohio', '44321'), 
('Levy', 'Pavic', '5048373414453000', 'Bubblemix', 'lpavicm@hc360.com', '20 Hooker Hill', 'Phoenix', 'Arizona', '85035'), 
('Karlens', 'Southouse', '5048370427147620', 'Wikibox', 'ksouthousen@google.es', '113 Susan Plaza', 'Madison', 'Wisconsin', '53726'), 
('Georgeanne', 'Horsley', '5048378508732580', 'Eare', 'ghorsleyo@alibaba.com', '42 Sage Crossing', 'Wichita', 'Kansas', '67230'), 
('Jamison', 'Ivanchikov', '5048376881762750', 'Fivechat', 'jivanchikovp@123-reg.co.uk', '4 Nelson Drive', 'Charlotte', 'North Carolina', '28242'), 
('Heindrick', 'Pringuer', '5108750716153000', 'Oyoba', 'hpringuerq@qq.com', '56211 Harbort Center', 'Jackson', 'Tennessee', '38308'), 
('Stewart', 'Mushet', '5108756860875940', 'Demivee', 'smushetr@newsvine.com', '50599 Dennis Way', 'Irvine', 'California', '92612'), 
('Webb', 'Lacy', '5108759593112210', 'Riffpath', 'wlacys@kickstarter.com', '70 Nancy Place', 'Des Moines', 'Iowa', '50981'), 
('Richard', 'Godbert', '5048378895209510', 'Wikido', 'rgodbertt@mtv.com', '83582 Burrows Alley', 'Dayton', 'Ohio', '45440'), 
('Minni', 'Harniman', '5048373352016340', 'Yodoo', 'mharnimanu@washington.edu', '6 Duke Park', 'Mobile', 'Alabama', '36670'), 
('Sonya', 'De Giovanni', '5108755095465210', 'Leexo', 'sdegiovanniv@google.cn', '198 Hermina Alley', 'Lincoln', 'Nebraska', '68583'), 
('Ashlan', 'Gomer', '5108750335917480', 'Tazz', 'agomerw@google.cn', '465 Anthes Place', 'Melbourne', 'Florida', '32941'), 
('Pablo', 'Manifould', '5048374038278810', 'Realbridge', 'pmanifouldx@ebay.com', '4 Ramsey Park', 'Seattle', 'Washington', '98127'), 
('Irving', 'Harsant', '5108758513075780', 'Zoombox', 'iharsanty@virginia.edu', '6782 Armistice Hill', 'Chicago', 'Illinois', '60652'), 
('Coletta', 'Strippling', '5108750927009110', 'Shufflester', 'cstripplingz@dell.com', '8084 Dayton Terrace', 'Peoria', 'Illinois', '61629'), 
('Dari', 'Balderston', '5048376807657490', 'Voonix', 'dbalderston10@youtube.com', '166 Lyons Way', 'Boise', 'Idaho', '83722'), 
('Lissi', 'Paddle', '5048379654893220', 'Livetube', 'lpaddle11@bbb.org', '6750 Sloan Junction', 'Charlotte', 'North Carolina', '28256'), 
('Lurette', 'Rebanks', '5108751160320320', 'Yambee', 'lrebanks12@mysql.com', '1802 Dayton Parkway', 'Mobile', 'Alabama', '36616'), 
('Jerrine', 'Simka', '5108755645654740', 'Browsebug', 'jsimka13@dedecms.com', '45 Union Avenue', 'Columbus', 'Ohio', '43231'), 
('Oliy', 'Troup', '5108750737851810', 'Photobug', 'otroup14@imdb.com', '83993 Lien Pass', 'Fresno', 'California', '93715'), 
('Gareth', 'Kalinsky', '5048370511726320', 'Dabvine', 'gkalinsky15@domainmarket.com', '94675 Northwestern Court', 'San Diego', 'California', '92196'), 
('Agnese', 'Coil', '5048375344077090', 'Realmix', 'acoil16@flavors.me', '9015 Novick Pass', 'Chicago', 'Illinois', '60619'), 
('Greer', 'Windram', '5108752306711980', 'Trilia', 'gwindram17@edublogs.org', '479 Moose Way', 'Riverside', 'California', '92513'), 
('Lee', 'Benoy', '5048372327871750', 'Shufflebeat', 'lbenoy18@thetimes.co.uk', '9 Moose Park', 'Round Rock', 'Texas', '78682'), 
('Dottie', 'McVicar', '5048370425035130', 'Zoomcast', 'dmcvicar19@sphinn.com', '8865 American Circle', 'Memphis', 'Tennessee', '38114'), 
('Ibbie', 'Ridel', '5048372844004660', 'Tanoodle', 'iridel1a@nature.com', '88 Anzinger Pass', 'Des Moines', 'Iowa', '50936'), 
('Moyra', 'Obray', '5048373611019030', 'Ooba', 'mobray1b@eepurl.com', '7076 Fremont Center', 'Akron', 'Ohio', '44305'), 
('Kissiah', 'Folger', '5048371479956730', 'Skyndu', 'kfolger1c@wordpress.org', '86 Marcy Hill', 'Charlottesville', 'Virginia', '22908'), 
('Sheela', 'Georgeon', '5048379174050110', 'Youspan', 'sgeorgeon1d@pagesperso-orange.fr', '64271 Michigan Pass', 'San Francisco', 'California', '94121'), 
('Shanon', 'Spyvye', '5048370457683400', 'Eire', 'sspyvye1e@fema.gov', '74401 Canary Parkway', 'Indianapolis', 'Indiana', '46231'), 
('Aurie', 'Larmor', '5048376047247960', 'Meembee', 'alarmor1f@cam.ac.uk', '48 Heffernan Street', 'Stockton', 'California', '95210'), 
('Zechariah', 'Gillise', '5108756594569730', 'Dabfeed', 'zgillise1g@independent.co.uk', '64653 Fallview Circle', 'Scranton', 'Pennsylvania', '18505'), 
('Kacie', 'Blaymires', '5108753649801800', 'Topdrive', 'kblaymires1h@nyu.edu', '2631 Fuller Lane', 'Hialeah', 'Florida', '33018'), 
('Lazarus', 'Lefridge', '5048376925844460', 'Leenti', 'llefridge1i@sciencedaily.com', '97 Anzinger Terrace', 'Greensboro', 'North Carolina', '27425'), 
('Cosetta', 'Clausson', '5108757377568000', 'Oyonder', 'cclausson1j@nytimes.com', '0 Meadow Ridge Lane', 'Durham', 'North Carolina', '27717'), 
('Elisha', 'Traill', '5108758162579080', 'Edgewire', 'etraill1k@wikipedia.org', '3856 Pleasure Plaza', 'Cleveland', 'Ohio', '44130'), 
('Shawna', 'Cranna', '5108757807021900', 'Tagopia', 'scranna1l@nifty.com', '04426 Marcy Street', 'San Diego', 'California', '92186'), 
('Brinn', 'Menlow', '5108757896723380', 'Vinte', 'bmenlow1m@people.com.cn', '5 Granby Trail', 'Huntsville', 'Alabama', '35815'), 
('Kata', 'Falls', '5108752390756770', 'Flipstorm', 'kfalls1n@baidu.com', '717 Amoth Parkway', 'Tuscaloosa', 'Alabama', '35487'), 
('Donica', 'Ivins', '5048376766451340', 'Buzzshare', 'divins1o@army.mil', '3 Steensland Drive', 'Bronx', 'New York', '10464'), 
('Melloney', 'Goodisson', '5048370068779760', 'Tazzy', 'mgoodisson1p@cargocollective.com', '469 Green Alley', 'Greensboro', 'North Carolina', '27415'), 
('Binny', 'Roly', '5108757939453260', 'Flipopia', 'broly1q@thetimes.co.uk', '6 Holy Cross Street', 'Tacoma', 'Washington', '98447'), 
('Field', 'Chicotti', '5108758653205090', 'Babbleopia', 'fchicotti1r@vimeo.com', '9 Graedel Junction', 'New York City', 'New York', '10060'), 
('Marlyn', 'Pimblett', '5048377587949890', 'Yozio', 'mpimblett1s@google.co.uk', '3 Mcbride Trail', 'Santa Ana', 'California', '92725'), 
('Kalil', 'Hollingshead', '5108755627483220', 'DabZ', 'khollingshead1t@mapy.cz', '8840 Sherman Junction', 'Montgomery', 'Alabama', '36177'), 
('Emerson', 'Pyett', '5048377296939560', 'Eabox', 'epyett1u@webmd.com', '038 Scofield Place', 'Oklahoma City', 'Oklahoma', '73142'), 
('Hetti', 'Callen', '5048370528378730', 'Dynabox', 'hcallen1v@blinklist.com', '39001 Schlimgen Road', 'Houston', 'Texas', '77050'), 
('Ralf', 'Itzik', '5048379056573550', 'Dynabox', 'ritzik1w@aboutads.info', '65 Brentwood Street', 'Charleston', 'West Virginia', '25331'), 
('Moyra', 'Dowles', '5048375027047680', 'Tagchat', 'mdowles1x@google.com.hk', '712 Carey Drive', 'Fort Pierce', 'Florida', '34981'), 
('Victor', 'Sackler', '5108754302209430', 'Dynabox', 'vsackler1y@biglobe.ne.jp', '35 Havey Park', 'Alexandria', 'Virginia', '22313'), 
('Aretha', 'Rosewell', '5108756731107450', 'Yacero', 'arosewell1z@dmoz.org', '76 Old Gate Court', 'Huntsville', 'Alabama', '35815'), 
('Nester', 'Balsom', '5048371057938870', 'Eabox', 'nbalsom20@reverbnation.com', '23286 Pleasure Junction', 'Bakersfield', 'California', '93305'), 
('Jeanna', 'Storah', '5108753264857560', 'Janyx', 'jstorah21@symantec.com', '2087 Saint Paul Lane', 'New Orleans', 'Louisiana', '70183'), 
('Carolan', 'MacPaden', '5048373828172060', 'Reallinks', 'cmacpaden22@go.com', '9237 Eggendart Place', 'Houston', 'Texas', '77010'), 
('Wilbur', 'Fonteyne', '5108750591670610', 'Gabspot', 'wfonteyne23@miitbeian.gov.cn', '46 Karstens Trail', 'Harrisburg', 'Pennsylvania', '17110'), 
('Jordain', 'Sleeman', '5048370583567070', 'Janyx', 'jsleeman24@fema.gov', '0403 Starling Point', 'Pittsburgh', 'Pennsylvania', '15240'), 
('Mayer', 'Elcock', '5048373696040140', 'Skajo', 'melcock25@freewebs.com', '15 Lyons Point', 'Long Beach', 'California', '90847'), 
('Emylee', 'Mustarde', '5048376788267420', 'Photolist', 'emustarde26@prweb.com', '21 1st Way', 'Louisville', 'Kentucky', '40293'), 
('Mirilla', 'Kassel', '5048371059370550', 'Skyvu', 'mkassel27@mapy.cz', '8049 Marquette Trail', 'Dayton', 'Ohio', '45414'), 
('Iggie', 'Gowanlock', '5108752668594480', 'Wikivu', 'igowanlock28@eventbrite.com', '67 Armistice Center', 'Macon', 'Georgia', '31217'), 
('Pat', 'Casado', '5048376959395520', 'Voonix', 'pcasado29@wisc.edu', '23835 Portage Street', 'Monticello', 'Minnesota', '55590'), 
('Gale', 'Sketh', '5108750888909700', 'Edgeify', 'gsketh2a@tuttocitta.it', '04 Amoth Trail', 'Flushing', 'New York', '11355'), 
('Law', 'Moye', '5048375603244810', 'Oyondu', 'lmoye2b@bbb.org', '67 Claremont Drive', 'Salt Lake City', 'Utah', '84115'), 
('Austine', 'Figgess', '5108750577783610', 'Jazzy', 'afiggess2c@nytimes.com', '5 American Ash Circle', 'Buffalo', 'New York', '14269'), 
('Kale', 'Topling', '5048375561544250', 'Mynte', 'ktopling2d@smugmug.com', '44 Doe Crossing Avenue', 'Baton Rouge', 'Louisiana', '70805'), 
('Mira', 'Bountiff', '5108758292272070', 'LiveZ', 'mbountiff2e@nyu.edu', '4 Aberg Junction', 'Sacramento', 'California', '95838'), 
('Margit', 'Mulcock', '5108758303662300', 'Realmix', 'mmulcock2f@reference.com', '60924 Transport Point', 'Gainesville', 'Florida', '32627'), 
('Nealon', 'Ferson', '5108756572240140', 'Tazzy', 'nferson2g@naver.com', '33594 Butterfield Crossing', 'Austin', 'Texas', '78721'), 
('Raimundo', 'Croci', '5108758994753280', 'Youspan', 'rcroci2h@google.es', '81 Sutherland Alley', 'Greensboro', 'North Carolina', '27455'), 
('Jan', 'Hilliam', '5048379421770860', 'Jaxnation', 'jhilliam2i@hubpages.com', '89524 Evergreen Avenue', 'Grand Junction', 'Colorado', '81505'), 
('Galvan', 'McAtamney', '5048373332132770', 'Flipstorm', 'gmcatamney2j@prlog.org', '981 Fairfield Pass', 'Huntington', 'West Virginia', '25705'), 
('Finley', 'Wheeler', '5048374346022920', 'Feednation', 'fwheeler2k@phpbb.com', '693 Monica Way', 'Chicago', 'Illinois', '60636'), 
('Gerick', 'Voice', '5108753866385470', 'Skippad', 'gvoice2l@vkontakte.ru', '00533 Tennyson Parkway', 'Sacramento', 'California', '94280'), 
('Krystalle', 'Bridgeman', '5108753518495910', 'Skalith', 'kbridgeman2m@t-online.de', '2678 Meadow Vale Drive', 'Washington', 'District of Columbia', '20029'), 
('Lauraine', 'Rountree', '5048372069733130', 'Rhycero', 'lrountree2n@epa.gov', '51 Hallows Parkway', 'Long Beach', 'California', '90847'), 
('Laurence', 'Loxdale', '5108751118429180', 'Yodel', 'lloxdale2o@ask.com', '511 Norway Maple Avenue', 'New York City', 'New York', '10045'), 
('Leonelle', 'Marsland', '5048375530006500', 'Topicware', 'lmarsland2p@friendfeed.com', '12206 Laurel Court', 'Shawnee Mission', 'Kansas', '66220'), 
('Eileen', 'Voas', '5048378118777840', 'Wikido', 'evoas2q@sfgate.com', '41 Southridge Hill', 'Johnson City', 'Tennessee', '37605'), 
('Lyell', 'Sterndale', '5048372728895550', 'Blogtags', 'lsterndale2r@addthis.com', '6 Mallory Center', 'Tampa', 'Florida', '33615');

INSERT INTO produtos (nome_produto, marca_peca, modelo_carro, ano_modelo, categoria_peca, valor_produto) VALUES
('Pastilhas de Freio', 'Bosch', 'Golf', '2018', 'Freios', '50'), 
('Filtro de Óleo', 'Mann', 'Civic', '2020', 'Filtros', '12'), 
('Bateria Automotiva', 'AC Delco', 'Corolla', '2019', 'Baterias', '80'), 
('Amortecedor Dianteiro', 'Monroe', 'Focus', '2017', 'Suspensão', '70'), 
('Óleo de Motor', 'Mobil', 'Accord', '2022', 'Lubrificantes', '30'), 
('Correia Dentada', 'Gates', 'Jetta', '2016', 'Transmissão', '15'), 
('Velas de Ignição', 'NGK', 'Fiesta', '2021', 'Ignição', '4'), 
('Radiador', 'Valeo', 'Tucson', '2015', 'Refrigeração', '90'), 
('Bomba de Combustível', 'Denso', 'Camry', '2020', 'Combustível', '60'), 
('Sensor de Oxigênio', 'Bosch', 'Sentra', '2019', 'Emissões', '25'), 
('Kit de Embreagem', 'Luk', 'A4', '2018', 'Transmissão', '70'), 
('Filtro de Ar', 'Fram', 'Outlander', '2017', 'Filtros', '10'), 
('Lâmpada de Farol', 'Philips', 'Fiesta', '2020', 'Iluminação', '8'), 
('Compressor de Ar Condicionado', 'Delphi', 'Civic', '2016', 'Ar Condicionado', '120'), 
('Sensor de ABS', 'Brembo', 'Jetta', '2019', 'Freios', '35'), 
('Caixa de Direção', 'TRW', 'Tucson', '2018', 'Direção', '100'), 
('Filtro de Combustível', 'Wix', 'Accord', '2018', 'Combustível', '9'), 
('Jogo de Juntas do Motor', 'Victor Reinz', 'Corolla', '2015', 'Motor', '40'), 
('Disco de Freio', 'ATE', 'Golf', '2019', 'Freios', '30'), 
('Palheta de Limpa-vidros', 'Valeo', 'Civic', '2021', 'Limpa-vidros', '6'), 
('Bomba de Água', 'GMB', 'Sentra', '2022', 'Refrigeração', '18'), 
('Regulador de Pressão de Combustível', 'VDO', 'Focus', '2018', 'Combustível', '20'), 
('Bieleta Estabilizadora', 'Febi Bilstein', 'Camry', '2021', 'Suspensão', '10'), 
('Terminal de Direção', 'Meyle', 'Outlander', '2016', 'Direção', '15'), 
('Kit de Correia Dentada', 'Contitech', 'A4', '2020', 'Transmissão', '25'), 
('Radiador de Óleo', 'Mocal', 'Jetta', '2015', 'Lubrificação', '40'), 
('Comutador de Ignição', 'Standard Motor', 'Tucson', '2019', 'Ignição', '8'), 
('Sensor de Temperatura do Motor', 'Walker', 'Focus', '2021', 'Emissões', '6'), 
('Junta do Cabeçote', 'Elring', 'Sentra', '2017', 'Motor', '20'), 
('Caixa de Filtro de Ar', 'Mahle', 'Corolla', '2016', 'Filtros', '12'), 
('Rolamento de Roda', 'SKF', 'Golf', '2022', 'Rolamentos', '15'), 
('Sensor de Velocidade', 'Delphi', 'Civic', '2019', 'Transmissão', '7'), 
('Jogo de Pastilhas de Freio', 'Textar', 'Camry', '2020', 'Freios', '28'), 
('Termostato', 'Wahler', 'Outlander', '2018', 'Refrigeração', '9'), 
('Coxim do Motor', 'Hutchinson', 'Jetta', '2017', 'Motor', '10'), 
('Barra de Direção', 'Lemförder', 'Focus', '2020', 'Direção', '16'), 
('Sensor de Pressão de Óleo', 'Hella', 'Golf', '2016', 'Lubrificação', '18'), 
('Disco de Embreagem', 'Valeo', 'Civic', '2017', 'Transmissão', '14'), 
('Tensor da Correia Dentada', 'Ruville', 'Corolla', '2019', 'Transmissão', '12'), 
('Regulador de Tensão', 'Bosch', 'Camry', '2018', 'Elétrica', '15'), 
('Bomba de Direção Hidráulica', 'Cardone', 'Sentra', '2021', 'Direção', '20'), 
('Sensor de Massa de Ar', 'Pierburg', 'Golf', '2018', 'Injeção de Ar', '8'), 
('Rolamento de Roda Traseira', 'NTN', 'Jetta', '2020', 'Rolamentos', '12'), 
('Compressor de Ar Condicionado', 'Sanden', 'Civic', '2015', 'Ar Condicionado', '35'), 
('Filtro de Cabine', 'Corteco', 'Corolla', '2022', 'Filtros', '6'), 
('Jogo de Vela de Ignição', 'Champion', 'Focus', '2016', 'Ignição', '10'), 
('Coxim do Câmbio', 'MTC', 'Tucson', '2017', 'Transmissão', '8'), 
('Válvula EGR', 'Pierburg', 'Sentra', '2018', 'Emissões', '14'), 
('Bobina de Ignição', 'Beru', 'A4', '2015', 'Ignição', '9'), 
('Sensor de Posição da Borboleta', 'Bremi', 'Golf', '2021', 'Injeção de Ar', '12');

INSERT INTO fornecedores(nome_fornecedor, cnpj_fornecedor, email_fornecedor, telefone, data_registro) VALUES
('Auto Peças Silva', '123456789/0001-01', 'contato@silvapecas.com', '1112345678', '2022-05-10'), 
('Peças Mais Baratas', '987654321/0001-02', 'vendas@pecasmaisbaratas.com', '2298765432', '2022-03-15'), 
('Auto Parts Center', '456789123/0001-03', 'atendimento@autopartscenter.com', '3345678912', '2022-06-20'), 
('Peças Rápidas', '654321987/0001-04', 'info@pecasrapidas.net', '4465432198', '2022-01-05'), 
('Fornecedor de Peças', '789123456/0001-05', 'vendas@fornecedordepecas.com', '5578901234', '2022-07-12'), 
('Auto Pecas ABC', '321654987/0001-06', 'contato@autopecasabc.com', '6632165498', '2022-04-25'), 
('Fornecedora de Autopeças', '567891234/0001-07', 'vendas@fornecedoraautopecas.com', '7756789123', '2022-02-18'), 
('Auto Parts Express', '234567891/0001-08', 'info@autopartsexpress.net', '8823456789', '2022-08-30'), 
('Peças Online', '789123456/0001-09', 'atendimento@pecasonline.com', '9978901234', '2022-09-05'), 
('Auto Pecas do Sul', '321654987/0001-10', 'contato@autopecasdorsul.com', '10132165498', '2022-07-29'), 
('Fornecedor AutoParts', '987654321/0001-11', 'vendas@fornecedorautoparts.com', '11198765432', '2022-02-12'), 
('Auto Pecas Premium', '456789123/0001-12', 'info@autopecaspremium.net', '12145678912', '2022-03-28'), 
('Peças Econômicas', '654321987/0001-13', 'vendas@pecaseconomicas.com', '13165432198', '2022-05-17'), 
('Fornecedor de Peças Automotivas', '789123456/0001-14', 'contato@fornecedordepecasautomotivas.com', '14178901234', '2022-11-08'), 
('Auto Peças Veloz', '321654987/0001-15', 'info@autopecasveloz.com', '15132165498', '2022-10-01');

INSERT INTO transportadora (data_cadastro, nome_contato, email_transportadora) VALUES
('2022-05-10', 'Transportadora A', 'contato@transportadoraA.com'),
('2022-03-15', 'Transportadora B', 'contato@transportadoraB.com'),
('2022-06-20', 'Transportadora C', 'contato@transportadoraC.com'),
('2022-01-05', 'Transportadora D', 'contato@transportadoraD.com'),
('2022-07-12', 'Transportadora E', 'contato@transportadoraE.com');

INSERT INTO devolucoes (motivo_devolucao, forma_estorno, custo_retirada, data_solicitacao, data_conclusao) VALUES
('Produto danificado', 'Estorno no cartão de crédito', 20.50, '2023-03-01', '2023-03-10'),
('Pedido incorreto', 'Estorno no pix', 0.00, '2023-03-05', '2023-03-12'),
('Produto danificado', 'Estorno no cartão de crédito', 15.25, '2023-03-08', '2023-03-15'),
('Desistência do cliente', 'Estorno no cartão de crédito', 10.75, '2023-03-10', '2023-03-17'),
('Atraso na entrega', 'Estorno no pix', 0.00, '2023-03-12', '2023-03-19'),
('Desistência do cliente', 'Estorno no cartão de crédito', 8.30, '2023-03-15', '2023-03-22'),
('Produto danificado', 'Estorno no pix', 0.00, '2023-03-18', '2023-03-25'),
('Erro no pedido', 'Estorno no cartão de crédito', 12.60, '2023-03-20', '2023-03-27'),
('Não especificado', 'Estorno no cartão de crédito', 7.45, '2023-03-23', '2023-03-30'),
('Produto danificado', 'Estorno no cartão de crédito', 18.75, '2023-03-25', '2023-04-01'),
('Pedido incorreto', 'Estorno no pix', 0.00, '2023-03-28', '2023-04-05'),
('Produto danificado', 'Estorno no cartão de crédito', 14.50, '2023-03-30', '2023-04-07'),
('Desistência do cliente', 'Estorno no cartão de crédito', 9.25, '2023-04-02', '2023-04-09'),
('Atraso na entrega', 'Estorno no pix', 0.00, '2023-04-05', '2023-04-12'),
('Desistência do cliente', 'Estorno no cartão de crédito', 6.80, '2023-04-08', '2023-04-15');

INSERT INTO pedidos (id_cliente, quantidade_itens, endereco_entrega, descontos, cupons, valor_total_pedido, forma_pagamento, prazo_entrega, id_devolucao, id_transportadora) VALUES
('61', '2', '3 Steensland Drive', '0', 'Nenhum', '16', 'Cartão de Crédito', '3 dias', 1, 1), 
('3', '1', '08488 Superior Place', '0', 'Nenhum', '60', 'Boleto Bancário', '5 dias', null, 2), 
('7', '3', '5 Burrows Park', '0', 'Nenhum', '45', 'Transferência', '2 dias', null, 3), 
('98', '2', '12206 Laurel Court', '0', 'Nenhum', '45', 'Cartão de Crédito', '4 dias', 2, 4), 
('28', '1', '50599 Dennis Way', '0', 'Nenhum', '8', 'Boleto Bancário', '6 dias', null, 5), 
('29', '4', '70 Nancy Place', '0', 'Nenhum', '60', 'Transferência', '3 dias', 3, 1), 
('36', '1', '8084 Dayton Terrace', '0', 'Nenhum', '14', 'Cartão de Crédito', '5 dias', 4, 2), 
('21', '2', '67709 Paget Avenue', '0', 'Nenhum', '37', 'Boleto Bancário', '4 dias', null, 3), 
('86', '3', '44 Doe Crossing Avenue', '0', 'Nenhum', '101', 'Transferência', '2 dias', 5, 4), 
('27', '2', '56211 Harbort Center', '0', 'Nenhum', '14', 'Cartão de Crédito', '3 dias', null, 5), 
('65', '1', '3 Mcbride Trail', '0', 'Nenhum', '8', 'Boleto Bancário', '5 dias', null, 1), 
('13', '3', '15 Loftsgordon Hill', '0', 'Nenhum', '120', 'Transferência', '2 dias', null, 2), 
('6', '4', '99998 Raven Terrace', '0', 'Nenhum', '89', 'Cartão de Crédito', '4 dias', null, 3), 
('31', '1', '6 Duke Park', '0', 'Nenhum', '9', 'Boleto Bancário', '6 dias', 6, 4), 
('16', '2', '05135 Summer Ridge Park', '0', 'Nenhum', '145', 'Transferência', '3 dias', 7, 5), 
('33', '3', '465 Anthes Place', '0', 'Nenhum', '45', 'Cartão de Crédito', '5 dias', 8, 1), 
('44', '2', '479 Moose Way', '0', 'Nenhum', '44', 'Boleto Bancário', '4 dias', null, 2), 
('37', '1', '166 Lyons Way', '0', 'Nenhum', '9', 'Transferência', '2 dias', null, 3), 
('43', '4', '9015 Novick Pass', '0', 'Nenhum', '43', 'Cartão de Crédito', '3 dias', null, 4), 
('74', '2', '2087 Saint Paul Lane', '0', 'Nenhum', '37', 'Boleto Bancário', '6 dias', 9, 5), 
('96', '3', '51 Hallows Parkway', '0', 'Nenhum', '28', 'Transferência', '5 dias', null, 1), 
('53', '1', '64653 Fallview Circle', '0', 'Nenhum', '8', 'Cartão de Crédito', '4 dias', null, 2), 
('8', '2', '723 Swallow Circle', '0', 'Nenhum', '70', 'Boleto Bancário', '3 dias', 10, 3), 
('30', '4', '83582 Burrows Alley', '0', 'Nenhum', '58', 'Transferência', '6 dias', null, 4), 
('54', '1', '2631 Fuller Lane', '0', 'Nenhum', '15', 'Cartão de Crédito', '2 dias', null, 5), 
('10', '2', '63918 Ridge Oak Point', '0', 'Nenhum', '30', 'Boleto Bancário', '5 dias', 11, 1), 
('82', '3', '23835 Portage Street', '0', 'Nenhum', '35', 'Transferência', '4 dias', null, 2), 
('95', '4', '2678 Meadow Vale Drive', '0', 'Nenhum', '89', 'Cartão de Crédito', '3 dias', null, 3), 
('51', '1', '74401 Canary Parkway', '0', 'Nenhum', '40', 'Boleto Bancário', '6 dias', null, 4), 
('73', '2', '23286 Pleasure Junction', '0', 'Nenhum', '47', 'Transferência', '5 dias', null, 5), 
('68', '3', '39001 Schlimgen Road', '0', 'Nenhum', '86', 'Cartão de Crédito', '4 dias', 12, 1), 
('97', '1', '511 Norway Maple Avenue', '0', 'Nenhum', '70', 'Boleto Bancário', '2 dias', null, 2), 
('77', '2', '0403 Starling Point', '0', 'Nenhum', '20', 'Transferência', '3 dias', null, 3), 
('9', '4', '212 Birchwood Avenue', '0', 'Nenhum', '42', 'Cartão de Crédito', '5 dias', null, 4), 
('41', '1', '83993 Lien Pass', '0', 'Nenhum', '8', 'Boleto Bancário', '6 dias', 13, 5), 
('2', '2', '77 Jana Crossing', '0', 'Nenhum', '30', 'Transferência', '4 dias', null, 1), 
('1', '3', '05040 Sunnyside Parkway', '0', 'Nenhum', '121', 'Cartão de Crédito', '2 dias', null, 2), 
('11', '1', '77323 Crowley Road', '0', 'Nenhum', '70', 'Boleto Bancário', '3 dias', null, 3), 
('93', '4', '693 Monica Way', '0', 'Nenhum', '107', 'Transferência', '5 dias', 14, 4), 
('58', '2', '04426 Marcy Street', '0', 'Nenhum', '40', 'Cartão de Crédito', '4 dias', null, 5), 
('64', '3', '9 Graedel Junction', '0', 'Nenhum', '78', 'Boleto Bancário', '6 dias', null, 1), 
('18', '4', '07 Elka Pass', '0', 'Nenhum', '62', 'Transferência', '2 dias', 15, 2);

INSERT INTO estoque (id_produto, qtde_estoque, status_estoque, id_fornecedor) VALUES
(1, 0, 'Indisponível', 14), 
(2, 97, 'Em estoque', 9), 
(3, 73, 'Em estoque', 7), 
(4, 85, 'Em estoque', 8), 
(5, 98, 'Em estoque', 2), 
(6, 22, 'Em estoque', 3), 
(7, 51, 'Em estoque', 10), 
(8, 0, 'Indisponível', 9), 
(9, 51, 'Em estoque', 8), 
(10, 30, 'Em estoque', 5), 
(11, 80, 'Em estoque', 8), 
(12, 52, 'Em estoque', 13), 
(13, 76, 'Em estoque', 15), 
(14, 25, 'Em estoque', 1), 
(15, 91, 'Em estoque', 11), 
(16, 0, 'Indisponível', 2), 
(17, 32, 'Em estoque', 8), 
(18, 0, 'Indisponível', 14), 
(19, 84, 'Em estoque', 1), 
(20, 90, 'Em estoque', 6), 
(21, 16, 'Em estoque', 9), 
(22, 47, 'Em estoque', 12), 
(23, 75, 'Em estoque', 3), 
(24, 0, 'Indisponível', 10), 
(25, 15, 'Em estoque', 12), 
(26, 15, 'Em estoque', 7), 
(27, 49, 'Em estoque', 5), 
(28, 47, 'Em estoque', 4), 
(29, 87, 'Em estoque', 2), 
(30, 93, 'Em estoque', 14), 
(31, 62, 'Em estoque', 2), 
(32, 92, 'Em estoque', 7), 
(33, 80, 'Em estoque', 11), 
(34, 34, 'Em estoque', 5), 
(35, 87, 'Em estoque', 6), 
(36, 57, 'Em estoque', 13), 
(37, 15, 'Em estoque', 3), 
(38, 15, 'Em estoque', 12), 
(39, 89, 'Em estoque', 10), 
(40, 89, 'Em estoque', 15), 
(41, 0, 'Indisponível', 4), 
(42, 51, 'Em estoque', 4), 
(43, 44, 'Em estoque', 1), 
(44, 39, 'Em estoque', 11), 
(45, 0, 'Indisponível', 1), 
(46, 88, 'Em estoque', 9), 
(47, 99, 'Em estoque', 8), 
(48, 20, 'Em estoque', 12), 
(49, 0, 'Indisponível', 6), 
(50, 50, 'Em estoque', 13);

INSERT INTO itens_pedidos (id_produto, id_pedido, quantidade) VALUES
(23, 1, 1), 
(20, 1, 1), 
(9, 2, 1), 
(43, 3, 1), 
(27, 3, 1), 
(10, 3, 1), 
(22, 4, 1), 
(25, 4, 1), 
(13, 5, 1), 
(42, 6, 1), 
(13, 6, 1), 
(38, 6, 1), 
(19, 6, 1), 
(38, 7, 1), 
(2, 8, 1), 
(10, 8, 1), 
(36, 9, 1), 
(4, 9, 1), 
(6, 9, 1), 
(35, 10, 1), 
(7, 10, 1), 
(47, 11, 1), 
(46, 12, 1), 
(11, 12, 1), 
(26, 12, 1), 
(50, 13, 1), 
(48, 13, 1), 
(33, 13, 1), 
(44, 13, 1), 
(34, 14, 1), 
(10, 15, 1), 
(14, 15, 1), 
(7, 16, 1), 
(20, 16, 1), 
(15, 16, 1), 
(17, 17, 1), 
(44, 17, 1), 
(34, 18, 1), 
(34, 19, 1), 
(50, 19, 1), 
(12, 19, 1), 
(43, 19, 1), 
(25, 20, 1), 
(30, 20, 1), 
(17, 21, 1), 
(35, 21, 1), 
(34, 21, 1), 
(27, 22, 1), 
(46, 23, 1), 
(9, 23, 1), 
(29, 24, 1), 
(37, 24, 1), 
(12, 24, 1), 
(12, 24, 1), 
(40, 25, 1), 
(29, 26, 1), 
(35, 26, 1), 
(50, 27, 1), 
(40, 27, 1), 
(27, 27, 1), 
(28, 28, 1), 
(37, 28, 1), 
(19, 28, 1), 
(44, 28, 1), 
(26, 29, 1), 
(32, 30, 1), 
(26, 30, 1), 
(4, 31, 1), 
(23, 31, 1), 
(28, 31, 1), 
(11, 32, 1), 
(13, 33, 1), 
(2, 33, 1), 
(28, 34, 1), 
(29, 34, 1), 
(46, 34, 1), 
(20, 34, 1), 
(13, 35, 1), 
(21, 36, 1), 
(39, 36, 1), 
(3, 37, 1), 
(20, 37, 1), 
(44, 37, 1), 
(11, 38, 1), 
(26, 39, 1), 
(19, 39, 1), 
(19, 39, 1), 
(32, 39, 1), 
(10, 40, 1), 
(6, 40, 1), 
(21, 41, 1), 
(5, 41, 1), 
(5, 41, 1), 
(10, 42, 1), 
(42, 42, 1), 
(48, 42, 1), 
(31, 42, 1); 

INSERT INTO nota_fiscal(data_emissao, valor, numero_nota_fiscal, chave_acesso, id_pedido) VALUES
('2023-02-05', 16, 1001, 33125128100324900000, 1), 
('2023-02-15', 60, 1002, 39618324607962100000, 2), 
('2023-02-20', 45, 1003, 71630549287331400000, 3), 
('2023-02-28', 45, 1004, 74609754945540200000, 4), 
('2023-02-28', 8, 1005, 27102638360751800000, 5), 
('2023-03-01', 60, 1006, 45089345381728100000, 6), 
('2023-03-05', 14, 1007, 29870728905727100000, 7), 
('2023-03-07', 37, 1008, 92086389919587400000, 8), 
('2023-03-10', 101, 1009, 64795590668348500000, 9), 
('2023-03-11', 14, 1010, 34547375345098600000, 10), 
('2023-03-11', 8, 1011, 78995430383433700000, 11), 
('2023-03-12', 120, 1012, 31567605355774900000, 12), 
('2023-03-13', 89, 1013, 45874201563289100000, 13), 
('2023-03-13', 9, 1014, 59154073881743100000, 14), 
('2023-03-15', 145, 1015, 50748720911133900000, 15), 
('2023-03-15', 45, 1016, 21086545976187400000, 16), 
('2023-03-18', 44, 1017, 38077122941928400000, 17), 
('2023-03-18', 9, 1018, 51458928537087100000, 18), 
('2023-03-19', 43, 1019, 89945826133049100000, 19), 
('2023-03-19', 37, 1020, 45308163232240300000, 20), 
('2023-03-20', 28, 1021, 48531225313595200000, 21), 
('2023-03-21', 8, 1022, 39635139934425000000, 22), 
('2023-03-21', 70, 1023, 30797347209741600000, 23), 
('2023-03-30', 58, 1024, 80459315437816100000, 24), 
('2023-03-30', 15, 1025, 72995760502793600000, 25), 
('2023-03-30', 30, 1026, 82111713514920000000, 26), 
('2023-03-30', 35, 1027, 63023167715258500000, 27), 
('2023-03-30', 89, 1028, 44258433347131600000, 28), 
('2023-03-30', 40, 1029, 93816881418708800000, 29), 
('2023-03-30', 47, 1030, 49108028452479600000, 30), 
('2023-03-27', 86, 1031, 14996823814484400000, 31), 
('2023-03-27', 70, 1032, 93337394935190200000, 32), 
('2023-03-27', 20, 1033, 30118159916599700000, 33), 
('2023-03-27', 42, 1034, 79501770032992300000, 34), 
('2023-04-01', 8, 1035, 23676327492938000000, 35), 
('2023-04-01', 30, 1036, 79692152722179000000, 36), 
('2023-04-03', 121, 1037, 16418381420840000000, 37), 
('2023-04-01', 70, 1038, 72179109245773900000, 38), 
('2023-04-04', 107, 1039, 89340942380212800000, 39), 
('2023-04-04', 40, 1040, 95243696326171700000, 40), 
('2023-04-04', 78, 1041, 18899503823930600000, 41), 
('2023-04-05', 62, 1042, 63256736751630200000, 42);

---- Criação Views ----

CREATE VIEW gold_pedidos AS(
SELECT p.id_pedido,
		concat(c.primeiro_nome,' ',c.ultimo_nome) AS "nome_cliente",
        c.razao_social,
        c.cnpj_cliente,
        p.quantidade_itens,
        p.endereco_entrega,
        c.cidade,
        c.estado,
        c.cep,
        p.cupons,
        p.descontos,
        p.valor_total_pedido,
        p.forma_pagamento,
        p.prazo_entrega,
        d.motivo_devolucao,
        d.forma_estorno,
        d.custo_retirada,
        d.data_solicitacao AS "solicitacao_devolucao",
        d.data_conclusao AS "conclusao_devolucao",
        t.nome_contato AS "nome_transportadora",
        nf.numero_nota_fiscal
FROM pedidos p
LEFT JOIN clientes c ON p.id_cliente = c.id_cliente
LEFT JOIN devolucoes d ON p.id_devolucao = d.id_devolucao
LEFT JOIN transportadora t ON p.id_transportadora = t.id_transportadora
LEFT JOIN nota_fiscal nf ON p.id_pedido = nf.id_pedido
ORDER BY p.id_pedido);

CREATE VIEW gold_itens_pedidos AS(
SELECT ip.id_itens_pedidos,
		ip.id_pedido as "numero_pedido",
		pd.nome_produto,
        pd.marca_peca,
        pd.modelo_carro,
        pd.ano_modelo,
        pd.categoria_peca,
        pd.valor_produto,
        nf.numero_nota_fiscal
FROM itens_pedidos ip
LEFT JOIN produtos pd ON ip.id_produto = pd.id_produto
LEFT JOIN nota_fiscal nf ON ip.id_pedido = nf.id_pedido
ORDER BY id_itens_pedidos);

CREATE VIEW top10_marcas_vendidas AS (
SELECT marca_peca,
       COUNT(*) AS "qtde.",
       SUM(valor_produto) as "valor_total",
       ROUND(SUM(valor_produto) / COUNT(*), 2) as "ticket_medio"
FROM gold_itens_pedidos
GROUP BY marca_peca
ORDER BY 3 DESC
LIMIT 10);

CREATE VIEW ranking_motivo_devolucao AS (
SELECT motivo_devolucao,
		COUNT(*) AS "qtde.",
        ROUND(SUM(custo_retirada)) AS "custo_total"
FROM devolucoes
GROUP BY motivo_devolucao
ORDER BY 2 DESC);

CREATE VIEW resultado_vendas_estados AS (
SELECT estado,
		COUNT(*) AS "qtde_vendas",
        ROUND(SUM(valor_total_pedido)) AS "valor_total",
        ROUND(SUM(valor_total_pedido) / COUNT(*), 2) AS "ticket_medio",
        COUNT(motivo_devolucao) AS "qtde_devolucoes",
		ROUND(SUM(custo_retirada)) AS "custo_devolucoes",
        ROUND(SUM(valor_total_pedido) - SUM(custo_retirada), 2) AS "resultado_estado"
FROM gold_pedidos
GROUP BY estado
ORDER BY 3 DESC);

---- Criação Funções ----

DELIMITER //
CREATE FUNCTION QtdeEntregaPorTransportadora(transportadora VARCHAR(100)) 
RETURNS INT
READS SQL DATA
BEGIN 
    DECLARE qtde_entregas INT;
    SELECT COUNT(*) INTO qtde_entregas FROM gold_pedidos 
    WHERE nome_transportadora = transportadora;
    RETURN qtde_entregas;
END;
//
DELIMITER;

---- SELECT QtdeEntregaPorTransportadora('Transportadora A') as "Qtde. Entregas Realizadas"; ----

DELIMITER //
CREATE FUNCTION InformacoesDoPedido(id_pedido INT) 
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN 
    DECLARE info_pedido VARCHAR(255);
    SELECT CONCAT('Número Pedido:', gp.id_pedido, ', Nome Cliente:', gp.nome_cliente, ', Valor Pedido:', gp.valor_total_pedido,", Produto: ",  (SELECT nome_produto FROM gold_itens_pedidos WHERE numero_pedido = gp.id_pedido)) INTO info_pedido
    FROM gold_pedidos gp
    WHERE gp.id_pedido = id_pedido;
    RETURN info_pedido;
END;
//
DELIMITER;

---- SELECT InformacoesDoPedido(2) as "Resumo Pedido" ----

---- Criação Stored Procedure ----

/* Store Procedure para ordenar campos específicos da View "resultado_vendas_estados"
campo: Trata-se do campo da view que deseja realizar a ordenção, sendo possível realizar por qtde_vendas, valor_total, ticket_medio, qtde_devolucoes e resultado_estado.
ordem: Refere-se ao tipo de ordenação que deseja realizar, ascendente (utilizar o ASC) ou decrescente (utilizar o DESC) */

DELIMITER //
CREATE PROCEDURE OrdenarVendasEstados(
	IN campo VARCHAR(100),
    IN ordem VARCHAR(10))
BEGIN
SET @ordenar = CONCAT('SELECT * FROM resultado_vendas_estados', ' ORDER BY ', campo, ' ', ordem);
    PREPARE RunSQL FROM @ordenar;
    EXECUTE RunSQL;
    DEALLOCATE PREPARE RunSQL;
END;
//
DELIMITER;

CALL OrdenarVendasEstados('resultado_estado', 'DESC'); /*Nesse exemplo estamos ordenando de forma descrescente as informações do campo resultado_estado */

/* Store Procedure para inserir um registro na tabela Clientes
Para a inserção foram utilizados todos os campos da tabela, sendo eles nessa ordem: primeiro_nome, ultimo_nome, cnpj_cliente, razao_social, email_cliente, endereco, cidade, estado, cep */

DELIMITER //
CREATE PROCEDURE NovoCliente(
    IN p_nome VARCHAR(100),
    IN u_nome VARCHAR(100),
    IN cnpj VARCHAR(18),
    IN razao_social VARCHAR(200),
    IN email_cliente VARCHAR(100),
    IN endereco VARCHAR(200),
    IN cidade VARCHAR(50),
    IN estado VARCHAR(50),
    IN cep VARCHAR(9)
)
BEGIN
    INSERT INTO clientes (primeiro_nome, ultimo_nome, cnpj_cliente, razao_social, email_cliente, endereco, cidade, estado, cep) 
    VALUES (p_nome, u_nome, cnpj, razao_social, email_cliente, endereco, cidade, estado, cep);
END;
//
DELIMITER;

CALL NovoCliente('Pedro', 'Raffaelli', 'xxxxxxxxxxxxxxxxxx', 'Empresa A', 'pedro.raffaelli@gmail.com', 'Av. Teste 225', 'São Paulo', 'São Paulo', '99999999');
/*Nesse exemplo estamos adicionando um novo registo a tabela Clientes*/

---- Criação Trigger ----

/* Essa Trigger verifica através do campo cnpj_cliente se há algum cadastro com o número que de CNPJ que estou tentando inserir.
Caso haja, a Trigger retorna a mensagem de "CNPJ já cadastrado.". Caso não haja esse número de CNPJ na base de clientes, ele insere
o novo registro e retorna a mensagem "Cliente cadastrado com sucesso!" */

DELIMITER //
CREATE TRIGGER verificar_cliente_existente
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
    DECLARE cliente_existente INT;
    SELECT COUNT(*) INTO cliente_existente FROM clientes WHERE cnpj_cliente = NEW.cnpj_cliente;
        IF cliente_existente > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CNPJ já cadastrado.';
    END IF;
END;
//
DELIMITER ;

/* Entender o que há de errado na Trigger abaixo. A intenção era que caso não houvesse o CNPJ já cadastrado, 
ele realizasse o cadastro do novo cliente e retornasse a mensagem "Cliente cadastrado com sucesso!"
O MySQL retorna o erro: "Error Code: 1407. Bad SQLSTATE: '00000'". Em um material no Wikipédia, diz que esse código
trata-se de um aviso de Conclusão Bem Sucedida. Link: https://en.wikipedia.org/wiki/SQLSTATE

DELIMITER //
CREATE TRIGGER verificar_cliente_existente
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
    DECLARE cliente_existente INT;
    SELECT COUNT(*) INTO cliente_existente FROM clientes WHERE cnpj_cliente = NEW.cnpj_cliente;
        IF cliente_existente > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CNPJ já cadastrado.';
        ELSE 
		SIGNAL SQLSTATE '00000' SET MESSAGE_TEXT = 'Cliente cadastrado com sucesso!';
    END IF;
END;
//
DELIMITER ; */

/* Já essa Trigger, é responsável por atualizar a quantidade do produto disponível no estoque, após um novo item ser
adicionado na itens_pedidos. Caso o valor do estoque passe a ser inferior a 0, o status_estoque é atualizado para 'Indisponível'. */

DELIMITER //
CREATE TRIGGER atualizar_estoque
AFTER INSERT ON itens_pedidos
FOR EACH ROW
BEGIN
    DECLARE quantidade_restante INT;
    UPDATE estoque SET qtde_estoque = qtde_estoque - NEW.quantidade
    WHERE id_produto = NEW.id_produto;
    SELECT qtde_estoque INTO quantidade_restante
    FROM estoque
    WHERE id_produto = NEW.id_produto;
    IF quantidade_restante =< 0 THEN
        UPDATE estoque SET status_estoque = 'Indisponível'
        WHERE id_produto = NEW.id_produto;
    END IF;
END;
//
DELIMITER;