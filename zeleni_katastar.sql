CREATE DATABASE zeleni_katastar;
-- Kreiranje potrebnih ekstenzija
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Tablica drvenaste_vrste
CREATE TABLE drvenaste_vrste (
    id INTEGER PRIMARY KEY,
    znanstveni_naziv VARCHAR(50) UNIQUE NOT NULL,
    hrvatski_naziv VARCHAR(50) NOT NULL
);

-- Tablica za trulež
CREATE TABLE trulez (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(20) UNIQUE NOT NULL
);

-- Tablica za mehaničke ozljede
CREATE TABLE mehanicke_ozljede (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(30) UNIQUE NOT NULL
);

-- Tablica za hipertrofije
CREATE TABLE hipertrofije (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(20) UNIQUE NOT NULL
);

-- Tablica za gljive
CREATE TABLE gljive (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(50) UNIQUE NOT NULL
);

-- Tablica za kukce
CREATE TABLE kukci (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(50) UNIQUE NOT NULL
);

-- Tablica za plodišta truležnica
CREATE TABLE plodista_truleznica (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(50) UNIQUE NOT NULL
);

-- Tablica za ostale nametnike
CREATE TABLE ostali_nametnici (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(50) UNIQUE NOT NULL
);

-- Tablica za vitalitet
CREATE TABLE vitalitet (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(30) UNIQUE NOT NULL
);

-- Tablica za TRAQ
CREATE TABLE traq (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(20) UNIQUE NOT NULL
);

-- Tablica za bonitet
CREATE TABLE bonitet (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(20) UNIQUE NOT NULL
);

-- Popunjavanje tablice za drvenaste vrste
INSERT INTO drvenaste_vrste (id, znanstveni_naziv, hrvatski_naziv) VALUES
(1, 'Obicna jela', 'Abies alba'),
(2, 'Abies concolor', 'Koloradska jela'), 
(4, 'Abies pinsapo', 'Španjolska jela'),
(5, 'Acacia dealbata', 'Srebrnasta akacija'),
(6, 'Acer campestre', 'Javor klen'),
(7, 'Acer japonicum', 'Japanski javor'),
(8, 'Acer monspessulanum', 'Maklen'),
(9, 'Acer negundo', 'Javor negundovac'),
(10, 'Acer obtusatum', 'Javor gluhač'),
(11, 'Acer opalus', ''),
(12, 'Acer palmatum', 'Dlanastolisni javor'),
(13, 'Acer platanoides', 'Javor mliječ'),
(14, 'Acer pseudoplatanus', 'Gorski javor'),
(15, 'Acer saccharinum', 'Srebrnolisni javor'),
(16, 'Acer saccharum', ''),
(17, 'Acer sp.', 'Javor'),
(18, 'Acer tataricum', 'Žestilj'),
(19, 'Acer tataricum subsp. ginnala', ''),
(20, 'Aesculus × carnea', 'Crvenocvjetni kesten'),
(21, 'Aesculus flava', ''),
(22, 'Aesculus hippocastanum', 'Divlji kesten'),
(23, 'Aesculus pavia', 'Američki crveni kesten'),
(24, 'Ailanthus altissima', 'Pajasen'),
(25, 'Albizia julibrissin', 'Albicija'),
(26, 'Alnus glutinosa', 'Crna joha'),
(27, 'Arbutus unedo', 'Obična planika'),
(28, 'Betula pendula', 'Obična breza'),
(29, 'Betula pendula ‘Youngii’', ''),
(30, 'Betula pubescens', ''),
(31, 'Betula sp.', 'Breza'),
(32, 'Betula utilis var. jacquemontii', ''),
(33, 'Bougainvillea spectabilis', 'Raskošna bugenvilija'),
(34, 'Broussonetia papyrifera', 'Dudovac'),
(35, 'Buxus sempervirens', 'Obični šimšir'),
(36, 'Callistemon citrinus', ''),
(37, 'Calocedrus decurrens', ''),
(38, 'Carpinus betulus', 'Obični grab'), 
(40, 'Carpinus orientalis', 'Bijeli grab'),
(41, 'Castanea sativa', 'Pitomi kesten'),
(42, 'Catalpa bignonioides', 'Obična katalpa'),
(43, 'Catalpa sp.', 'Katalpa'),
(44, 'Cedrus atlantica', 'Atlaski cedar'), 
(46, 'Cedrus deodara', 'Himalajski cedar'), 
(48, 'Cedrus libani', ''),
(49, 'Celtis australis', 'Obični koprivić'),
(50, 'Celtis occidentalis', 'Američki koprivić'),
(51, 'Celtis tourneforti', ''),
(52, 'Ceratonia siliqua', 'Rogač'),
(53, 'Cercidiphyllum japonicum', ''),
(54, 'Cercis siliquastrum', 'Obično Judino drvo'),
(55, 'Chamaecyparis lawsoniana', 'Lawsonov pačempres'),
(56, 'Chamaecyparis pisifera', 'Pjegavi pačempres'),
(57, 'Chamaerops humilis', 'Niska žumara'),
(58, 'Citrus × paradisi', 'Grejp'),
(59, 'Citrus limon', 'Pravi limun'),
(60, 'Citrus reticulata', 'Mandarina'),
(61, 'Citrus sp.', 'Citrus'),
(62, 'Citrus × aurantiifolia', 'Limeta'),
(63, 'Cornus florida', ''),
(64, 'Cornus kousa', ''),
(65, 'Cornus mas', 'Drijen'),
(66, 'Cornus sanguinea', ''),
(67, 'Corylus avellana', 'Obična lijeska'),
(68, 'Corylus colurna', 'Medvjeđa lijeska'),
(69, 'Cotinus coggygria', 'Obična rujevina'),
(70, 'Crataegus laevigata', ''),
(71, 'Crataegus monogyna', 'Jednoplodnički glog'),
(72, 'Crataegus sp.', 'Glog'),
(73, 'Cryptomeria japonica', ''),
(74, 'Cupressus arizonica', 'Arizonski čempres'),
(75, 'Cupressus sempervirens', 'Obični čempres'),
(76, 'Cupressus sempervirens var. horizontalis', 'Obični čempres'),
(77, 'Cupressus sempervirens var. pyramidalis', 'Obični čempres'),
(78, 'Cycas revoluta', 'Japanski cikas'),
(79, 'Cycas sp.', 'Cikas palma'),
(80, 'Diospyros virginiana', 'Virginijski dragun'),
(81, 'Eleagnus angustifolia', ''),
(82, 'Erica arborea', 'Veliki vrijes'),
(83, 'Eriobortya japonica', ''),
(84, 'Eriobotrya japonica', 'Japanska nešpula'),
(85, 'Eriobotrya sp.', 'Nešpula'),
(86, 'Eucalyptus globulus', 'Plavi eukaliptus'),
(87, 'Eucalyptus sp.', 'Eukaliptus'),
(88, 'Euonymus eropaeus', 'Obična kurika'),
(89, 'Fagus sylvatica', 'Obična bukva'),
(90, 'Ficus carica', 'Obična smokva'),
(91, 'Fraxinus americana', ''),
(92, 'Fraxinus angustifolia', 'Poljski jasen'),
(93, 'Fraxinus excelsior', 'Obični jasen'),
(94, 'Fraxinus ornus', 'Crni jasen'),
(95, 'Fraxinus pennsylvanica', 'Pensilvanski jasen'),
(96, 'Fraxinus sp.', 'Jasen'),
(97, 'Gingko biloba', ''),
(98, 'Ginkgo biloba', 'Ginkgo'),
(99, 'Gleditsia triacanthos', 'Trnovac'),
(100, 'Grevillea robusta', ''),
(101, 'Grevillea sp.', 'Grevileja'),
(102, 'Gymnocladus dioicus', 'Željezno drvo'),
(103, 'Hamamelis virginiana', ''),
(104, 'Hedera helix', ''),
(105, 'Hibiscus syriacus', ''),
(106, 'Ilex aquifolium', 'Božikovina'),
(107, 'Juglans nigra', 'Crni orah'),
(108, 'Juglans regia', 'Obični orah'),
(109, 'Juniperus chinensis', ''),
(110, 'Juniperus communis', 'Obična borovica'),
(111, 'Juniperus oxycedrus', 'Šmrika'),
(112, 'Juniperus phoenicea', ''),
(113, 'Juniperus sabina', ''),
(114, 'Juniperus sp.', 'Borovica'),
(115, 'Juniperus virginiana', 'Virginijska borovica'),
(116, 'Koelreuteria paniculata', 'Kelreuterija'),
(117, 'Laburnum sp.', 'Negnjil'),
(118, 'Lagerstroemia indica', 'Indijska lagerstremija'),
(119, 'Larix decidua', ''),
(120, 'Laurus nobilis', 'Lovor'),
(121, 'Ligustrum japonicum', 'Japanska kalina'),
(122, 'Ligustrum latifolium', 'Kalina'),
(123, 'Ligustrum lucidum', 'Japanska kalina'),
(124, 'Liquidambar styraciflua', 'Americki likvidambar'),
(125, 'Liriodendron tulipifera', 'Americki tulipanovac'),
(126, 'Maclura pomifera', 'Maklura'),
(127, 'Magnolia × soulangeana', ''),
(128, 'Magnolia grandiflora', ''),
(129, 'Magnolia kobus', ''),
(130, 'Magnolia sp.', 'Magnolija'),
(131, 'Malus sp.', 'Jabuka'),
(132, 'Malus sylvestris', ''),
(133, 'Melia azedarach', 'Očenašica'),
(134, 'Mespilus germanica', 'Obična mušmula'),
(135, 'Metasequoia glyptostroboides', ''),
(136, 'Morus alba', 'Bijeli dud'),
(137, 'Morus nigra', ''),
(138, 'Morus sp.', 'Dud'),
(139, 'Myrtus communis', 'Obična mirta'),
(140, 'Nedeterminirano', 'N/A'),
(141, 'Nerium oleander', 'Oleandar'),
(142, 'Olea europaea', 'Maslina'),
(143, 'Olea europaea subsp. sylvestris', ''),
(144, 'Osmanthus heterophyllus', ''),
(145, 'Ostrya carpinifolia', 'Crni grab'),
(146, 'Parkinsonia aculeata', 'Jeruzalemski trn'),
(147, 'Parrotia persica', 'Perzijska parocija'),
(148, 'Paulownia fortunei', 'Paulovnija'),
(149, 'Paulownia tomentosa', 'Pustenasta paulovnija'),
(150, 'Persea americana', ''),
(151, 'Phellodendron amurense', ''),
(152, 'Phillyrea latifolia', 'Širokolisna zelenika'),
(153, 'Phillyrea sp.', 'Zelenika'),
(154, 'Philyrea sp.', ''),
(155, 'Phoenix canariensis', 'Kanarska datulja'),
(156, 'Phoenix dactylifera', 'Prava datulja'),
(157, 'Phoenix sp.', 'Datulja'),
(158, 'Photinia serrulata', ''),
(159, 'Phyllirea latifolia', 'Širokolisna komorika'),
(160, 'Picea abies', 'Obična smreka'),
(161, 'Picea glauca', ''),
(162, 'Picea omorika', 'Omorika'),
(163, 'Picea orientalis', ''),
(164, 'Picea pungens', 'Bodljikava smreka'),
(165, 'Pinus densiflora', ''),
(166, 'Pinus halepensis', 'Alepski bor'),
(167, 'Pinus mugo', ''),
(168, 'Pinus nigra', 'Crni bor'),
(169, 'Pinus parviflora', ''),
(170, 'Pinus pinaster', 'Primorski bor'),
(171, 'Pinus pinea', 'Pinija'),
(172, 'Pinus strobus', 'Američki borovac'),
(173, 'Pinus sylvestris', 'Obični bor'),
(174, 'Pistacia lentiscus', 'Tršlja'),
(175, 'Pistacia sp.', 'Pistacija'),
(176, 'Pistacia terebinthos', ''),
(177, 'Pistacia terebinthus', 'Smrdljika'),
(178, 'Pittosporum tobira', 'Tobirovac'),
(179, 'Platanus × hispanica', 'Javorolisna platana'),
(180, 'Platanus occidentalis', 'Američka platana'),
(181, 'Platanus orientalis', 'Azijska platana'),
(182, 'Platanus sp.', 'Platana'),
(183, 'Platycladus orientalis', 'Orijentalna tuja'), 
(185, 'Populus × canadensis', 'Kanadska topola'),
(186, 'Populus alba', 'Bijela topola'), 
(188, 'Populus nigra', 'Crna topola'),
(189, 'Populus nigra ''Italica''', 'Jablan'),
(190, 'Populus sp.', 'Topola'),
(191, 'Populus tremula', ''),
(192, 'Prunus armeniaca', 'Marelica'),
(193, 'Prunus avium', 'Divlja trešnja'),
(194, 'Prunus cerasifera', 'Crvenolisna šljiva'), 
(197, 'Prunus laurocerasus', 'Lovorvišnja'),
(198, 'Prunus mahaleb', 'Rašeljka'),
(199, 'Prunus padus', 'Sremza'),
(200, 'Prunus persica', ''),
(201, 'Prunus serotina', ''),
(202, 'Prunus serrulata', ''),
(203, 'Prunus sp.', 'Prunus'),
(204, 'Pseudolarix amabilis', ''),
(205, 'Pseudotsuga menziesii', 'Obična američka duglazija'),
(206, 'Pterocaria fraxinifolia', 'Kavkaska pterokarija'),
(207, 'Punica granatum', 'Nar'),
(208, 'Pyracantha coccinea', ''),
(209, 'Pyrus piraster', ''),
(210, 'Pyrus pyraster', 'Divlja kruška'),
(211, 'Pyrus sp.', 'Kruška'),
(212, 'Quercus cerris', 'Hrast cer'),
(213, 'Quercus coccifera', ''),
(214, 'Quercus frainetto', 'Hrast sladun'),
(215, 'Quercus ilex', 'Hrast crnika'),
(216, 'Quercus palustris', ''),
(217, 'Quercus petraea', 'Hrast kitnjak'),
(218, 'Quercus pubescens', 'Hrast medunac'),
(219, 'Quercus robur', 'Hrast lužnjak'), 
(221, 'Quercus robur ‘Fastigiata’', 'Hrast lužnjak'),
(222, 'Quercus rubra', 'Crveni hrast'),
(223, 'Quercus sp.', 'Hrast'),
(224, 'Quercus suber', ''),
(225, 'Rhamnus alaternus', 'Vazdazelena krkavina'),
(226, 'Rhus sp.', 'Ruj'),
(227, 'Rhus typhina', ''),
(228, 'Robinia pseudoacacia', 'Obični bagrem'), 
(230, 'Salix × sepulcralis ‘Chrysocoma’', ''),
(231, 'Salix alba', 'Bijela vrba'),
(232, 'Salix caprea', 'Vrba iva'),
(233, 'Salix fragilis', 'Krhka vrba'),
(234, 'Salix purpurea', ''),
(235, 'Salix triandra', ''),
(236, 'Sambucus nigra', 'Crna bazga'),
(237, 'Sambucus racemosa', ''),
(238, 'Sambucus sp.', 'Bazga'),
(239, 'Schinus molle', 'Peruanski ljutovonj'),
(240, 'Sequoia sempervirens', ''),
(241, 'Sequoiadendron giganteum', ''),
(242, 'Sophora japonica', ''),
(243, 'Sorbus aria', ''),
(244, 'Sorbus aucuparia', 'Jarebika'),
(245, 'Sorbus domestica', 'Oskoruša'),
(246, 'Sorbus sp.', 'Oskoruša'),
(247, 'Sorbus torminalis', 'Brekinja'),
(248, 'Styphnolobium japonicum', 'Japanska sofora'),
(249, 'Syringa vulgaris', 'Jorgovan'),
(250, 'Tamarix gallica', 'Žutolisna tamarika'),
(251, 'Tamarix sp.', 'Tamarika'),
(252, 'Taxodium distichum', 'Močvarni taksodij'),
(253, 'Taxus × media', ''),
(254, 'Taxus baccata', 'Obična tisa'),
(255, 'Thuja occidentalis', 'Obična američka tuja'),
(256, 'Thuja plicata', 'Golema tuja'),
(257, 'Thujopsis dolabrata', 'Japanska hiba'),
(258, 'Tilia cordata', 'Malolisna lipa'),
(259, 'Tilia platyphyllos', 'Velelisna lipa'),
(260, 'Tilia sp.', 'Lipa'),
(261, 'Tilia tomentosa', 'Srebrnolisna lipa'),
(262, 'Trachycarpus fortunei', 'Visoka žumara'),
(263, 'Tsuga canadensis', 'Kanadska čuga'),
(264, 'Ulmus glabra', 'Gorski brijest'),
(265, 'Ulmus laevis', 'Vez'),
(266, 'Ulmus minor', 'Nizinski brijest'),
(267, 'Ulmus pumila', 'Sibirski brijest'),
(268, 'Viburnum sp.', 'Lemprika'),
(269, 'Vitex agnus-castus', ''),
(270, 'Washingtonia filifera', 'Kalifornijska vašingtonija'),
(271, 'Washingtonia robusta', 'Meksička vašingtonija'),
(272, 'Washingtonia sp.', 'Palma vašingtonija'),
(273, 'Zelkova serrata', 'Japanska zelkova'),
(274, 'Ziziphus jujuba', 'Žižula'),
(275, 'Citrus aurantium', 'Limeta'),
(276, 'Chamaerops excelsa', 'Žutolisna žumara'),
(277, 'Brussonetia papyrifera', 'Dudovac'),
(278, 'Citrus sinensis', 'Mandarina'),
(279, 'Pinus brutia', 'Brucijski bor'),
(280, 'Cocculus laurifolia', 'Lovorvišnja'),
(281, 'Paulownia sp.', 'Paulovnija');

-- Popunjavanje tablice za trulež
INSERT INTO trulez (id, naziv) VALUES
(1, 'Mala'),
(2, 'Srednja'),
(3, 'Jaka');

-- Popunjavanje tablice za mehaničke ozljede
INSERT INTO mehanicke_ozljede (id, naziv) VALUES
(1, 'Svježe'),
(2, 'Stare'),
(3, 'Dobro kalusiraju'),
(4, 'Loše kalusiraju');

-- Popunjavanje tablice za hipertrofije
INSERT INTO hipertrofije (id, naziv) VALUES
(1, 'Benigne'),
(2, 'Maligne');

-- Popunjavanje tablice za gljive
INSERT INTO gljive (id, naziv) VALUES
(1, 'Phellinus pini'),
(2, 'Ganoderma sp.'),
(3, 'Innotus sp.'),
(4, 'Phomopsis sp.'),
(5, 'Schizophyllum commune'),
(6, 'Bolest iglica'),
(7, 'Biscogniauxia mediterranea');

-- Popunjavanje tablice za kukce
INSERT INTO kukci (id, naziv) VALUES
(1, 'Mravi'),
(2, 'Ksilofagi'),
(3, 'Potkornjaci'),
(4, 'Defolijator'),
(5, 'Kornjaši truležari (listorošci)');

-- Popunjavanje tablice za plodišta truležnica
INSERT INTO plodista_truleznica (id, naziv) VALUES
(1, 'Malobrojna'),
(2, 'Brojna'),
(3, 'Vrlo brojna');

-- Popunjavanje tablice za ostale nametnike
INSERT INTO ostali_nametnici (id, naziv) VALUES
(1, 'Bršljan'),
(2, 'Imela'),
(3, 'Bakterije'),
(4, 'Virusi');

-- Popunjavanje tablice za vitalitet
INSERT INTO vitalitet (id, naziv) VALUES
(1, 'Vrlo dobar'),
(2, 'Dobar'),
(3, 'Srednji (oslabljen)'),
(4, 'Narušen (potrebno pratiti)'),
(5, 'Loš'),
(6, 'Vrlo loš'),
(7, 'Nepoznat / Nije specificiran');

-- Popunjavanje tablice za TRAQ
INSERT INTO traq (id, naziv) VALUES
(1, 'Malen'),
(2, 'Umjeren'),
(3, 'Visok'),
(4, 'Ekstreman');

-- Popunjavanje tablice za bonitet
INSERT INTO bonitet (id, naziv) VALUES
(1, 'I'),
(2, 'II'),
(3, 'III'),
(4, 'IV'),
(5, 'V'); 


-- Tablica katastri
CREATE TABLE katastri (
    id INTEGER PRIMARY KEY,
    naziv TEXT,
    opis TEXT,
    datum DATE
);

-- Tablica stabla
CREATE TABLE stabla (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    katastar_id INTEGER REFERENCES katastri(id) ON DELETE CASCADE,
    datum_mjerenja DATE NOT NULL,
    drvenasta_vrsta_id INTEGER REFERENCES drvenaste_vrste(id),
    geom GEOMETRY(Point, 3765)
);

-- Tablica fotografije
CREATE TABLE stabla_fotografije (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    stablo_id UUID REFERENCES stabla(id) ON DELETE CASCADE,
    fotourl VARCHAR(255) NOT NULL 
);


-- Tablica stabla_mjere
CREATE TABLE stabla_mjere (
    stablo_id UUID PRIMARY KEY REFERENCES stabla(id) ON DELETE CASCADE,
    visina DECIMAL(10, 2),
    visina_debla DECIMAL(10, 2),
    sirina_krosnje_n DECIMAL(10, 2),
    sirina_krosnje_s DECIMAL(10, 2),
    sirina_krosnje_e DECIMAL(10, 2),
    sirina_krosnje_w DECIMAL(10, 2),
    starost INTEGER,
    napomena TEXT
);

-- Tablica stabla_pridanci
CREATE TABLE stabla_pridanak (
    id UUID PRIMARY KEY REFERENCES stabla(id) ON DELETE CASCADE,
    uredno BOOLEAN,
    simptomi_izvale BOOLEAN,
    trulez_id INTEGER REFERENCES trulez(id),
    mehanicke_ozljede_id INTEGER REFERENCES mehanicke_ozljede(id),
    hipertrofije_id INTEGER REFERENCES hipertrofije(id),
    gljiva_id INTEGER REFERENCES gljive(id),
    kukci_id INTEGER REFERENCES kukci(id),
    kolizija_infrastruktura BOOLEAN,
    plodista_truleznica_id INTEGER REFERENCES plodista_truleznica(id),
    ostali_nametnici_id INTEGER REFERENCES ostali_nametnici(id)
);

-- Tablica stabla_deblo
CREATE TABLE stabla_deblo (
    id UUID PRIMARY KEY REFERENCES stabla(id) ON DELETE CASCADE,
    nagnuto BOOLEAN,
    zivotinjska_nisa BOOLEAN,
    prelomljeno BOOLEAN,
    plodista_truleznica_id INTEGER REFERENCES plodista_truleznica(id),
    trulez_id INTEGER REFERENCES trulez(id),
    mehanicke_ozljede_id INTEGER REFERENCES mehanicke_ozljede(id),
    hipertrofije_id INTEGER REFERENCES hipertrofije(id),
    gljiva_id INTEGER REFERENCES gljive(id),
    kukci_id INTEGER REFERENCES kukci(id),
    ostali_nametnici_id INTEGER REFERENCES ostali_nametnici(id)    
);

-- Tablica krosnja_oblici
CREATE TABLE krosnja_oblici (
    id INTEGER PRIMARY KEY,
    naziv VARCHAR(50) UNIQUE NOT NULL
);

-- Popunjavanje tablice krosnja_oblici
INSERT INTO krosnja_oblici (id, naziv) VALUES
(1, 'Cilindrična'),
(2, 'Elipsoidna'),
(3, 'Sferična'),
(4, 'Srcolika'),
(5, 'Višeća'),
(6, 'Jablan'),
(7, 'Četinjača');

-- Ažuriranje tablice stabla_krosnja
CREATE TABLE stabla_krosnja (
    id UUID PRIMARY KEY REFERENCES stabla(id) ON DELETE CASCADE,
    oblik_id INTEGER REFERENCES krosnja_oblici(id),
    prorijedjena BOOLEAN,
    pregusta BOOLEAN,
    previsoka BOOLEAN,
    asimetricna BOOLEAN,
    slomljene_grane BOOLEAN,
    suhe_grane BOOLEAN,
    trule_grane BOOLEAN,
    kolizija_drugo_stablo BOOLEAN,
    mehanicke_ozljede_id INTEGER REFERENCES mehanicke_ozljede(id),
    hipertrofije_id INTEGER REFERENCES hipertrofije(id),
    gljiva_id INTEGER REFERENCES gljive(id),
    kukci_id INTEGER REFERENCES kukci(id),
    plodista_truleznica_id INTEGER REFERENCES plodista_truleznica(id)
);

-- Tablica stabla_opce_stanje
CREATE TABLE stabla_opce_stanje (
    id UUID PRIMARY KEY REFERENCES stabla(id) ON DELETE CASCADE,
    vitalitet_id INTEGER REFERENCES vitalitet(id),
    traq_prije_id INTEGER REFERENCES traq(id),
    traq_nakon_id INTEGER REFERENCES traq(id),
    bonitet_id INTEGER REFERENCES bonitet(id),
    narusena_statika BOOLEAN,
    lose BOOLEAN,
    mrtvo BOOLEAN
);

-- Tablica stabla_preporuke
CREATE TABLE stabla_preporuka (
    id UUID PRIMARY KEY REFERENCES stabla(id) ON DELETE CASCADE,
    hitno BOOLEAN,
    orezati BOOLEAN,
    sanirati BOOLEAN, 
    rusiti BOOLEAN,
    zamijeniti BOOLEAN,
    posebne_mjere BOOLEAN,
    opis TEXT
);

