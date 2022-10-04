
CREATE TABLE IF NOT EXISTS `tbl_alumno` (
  `alumno_id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno_nombre` varchar(100) NOT NULL,
  `alumno_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`alumno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;


INSERT INTO `tbl_alumno` (`alumno_id`, `alumno_nombre`, `alumno_email`) VALUES
	(1, 'César Mayta', 'cesarmayta@gmail.com'),
	(2, 'Susana Toro', 'susantoro@gmail.com'),
	(3, 'Claudia Loza', 'claudialoza@yahoo.com'),
	(4, 'Anibal Ruiz', 'anibalruiz@gmail.com'),
	(5, 'Jorge Contreras', 'jorgecontreras@gmail.com'),
	(6, 'Gino Carranza', 'gino.carranza@codigo.edu.pe'),
	(9, 'Alan Perez Rodriguez', 'perezalanrod@gmail.com'),
	(10, 'Sofia Delgado', 'sofiadelgado@gmail.com'),
	(11, 'Carla Lopez Manzanares', 'carlalopezman@gmail.com'),
	(13, 'Juan Perez', 'juanito@gmail.com'),
	(14, 'Sofia Vergara', 'undefined'),
	(15, 'andres ortega', 'andres@gmail.com'),
	(16, 'Oscar Ballon', 'oscarballon@yahoo.es');

CREATE TABLE IF NOT EXISTS `tbl_curso` (
  `curso_id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`curso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


INSERT INTO `tbl_curso` (`curso_id`, `curso_nombre`) VALUES
	(1, 'HTML Y CSS'),
	(2, 'JAVASCRIPT'),
	(3, 'REACT.JS'),
	(4, 'PYTHON'),
	(5, 'MYSQL'),
	(6, 'FLASK'),
	(7, 'NODE JS Y EXPRESS');

CREATE TABLE IF NOT EXISTS `tbl_nivel` (
  `nivel_id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



INSERT INTO `tbl_nivel` (`nivel_id`, `nivel_nombre`) VALUES
	(1, 'BASICO'),
	(2, 'AVANZADO');



CREATE TABLE IF NOT EXISTS `tbl_profesor` (
  `profesor_id` int(11) NOT NULL AUTO_INCREMENT,
  `profesor_nombre` varchar(255) NOT NULL,
  `profesor_email` varchar(255) NOT NULL,
  PRIMARY KEY (`profesor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;



INSERT INTO `tbl_profesor` (`profesor_id`, `profesor_nombre`, `profesor_email`) VALUES
	(1, 'cesar mayta', 'cmayta@codigo.edu.pe');

CREATE TABLE IF NOT EXISTS `tbl_evaluacion` (
  `evaluacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`evaluacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



INSERT INTO `tbl_evaluacion` (`evaluacion_id`, `evaluacion_nombre`) VALUES
	(1, 'PROYECTO CURSO');


CREATE TABLE IF NOT EXISTS `tbl_modulo` (
  `modulo_id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`modulo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



INSERT INTO `tbl_modulo` (`modulo_id`, `modulo_nombre`) VALUES
	(1, 'FRONT END'),
	(2, 'BACKEND');
	
CREATE TABLE IF NOT EXISTS `tbl_matricula` (
  `matricula_id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno_id` int(11) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  PRIMARY KEY (`matricula_id`),
  KEY `fk_tbl_matricula_tbl_alumno` (`alumno_id`),
  KEY `fk_tbl_matricula_tbl_nivel1` (`nivel_id`),
  KEY `fk_tbl_matricula_tbl_modulo1` (`modulo_id`),
  CONSTRAINT `fk_tbl_matricula_tbl_alumno` FOREIGN KEY (`alumno_id`) REFERENCES `tbl_alumno` (`alumno_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_tbl_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `tbl_modulo` (`modulo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_tbl_nivel1` FOREIGN KEY (`nivel_id`) REFERENCES `tbl_nivel` (`nivel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



INSERT INTO `tbl_matricula` (`matricula_id`, `alumno_id`, `nivel_id`, `modulo_id`) VALUES
	(1, 1, 1, 1);



CREATE TABLE IF NOT EXISTS `tbl_matricula_curso` (
  `matricula_curso_id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`matricula_curso_id`),
  KEY `fk_tbl_matricula_curso_tbl_matricula1` (`matricula_id`),
  KEY `fk_tbl_matricula_curso_tbl_curso1` (`curso_id`),
  CONSTRAINT `fk_tbl_matricula_curso_tbl_curso1` FOREIGN KEY (`curso_id`) REFERENCES `tbl_curso` (`curso_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_curso_tbl_matricula1` FOREIGN KEY (`matricula_id`) REFERENCES `tbl_matricula` (`matricula_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



INSERT INTO `tbl_matricula_curso` (`matricula_curso_id`, `matricula_id`, `curso_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6);



CREATE TABLE IF NOT EXISTS `tbl_matricula_nota` (
  `matricula_nota_id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_id` int(11) NOT NULL,
  `evaluacion_id` int(11) NOT NULL,
  `matricula_nota_valor` double DEFAULT NULL,
  PRIMARY KEY (`matricula_nota_id`),
  KEY `fk_tbl_matricula_nota_tbl_matricula1` (`matricula_id`),
  KEY `fk_tbl_matricula_nota_tbl_evaluacion1` (`evaluacion_id`),
  CONSTRAINT `fk_tbl_matricula_nota_tbl_evaluacion1` FOREIGN KEY (`evaluacion_id`) REFERENCES `tbl_evaluacion` (`evaluacion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_nota_tbl_matricula1` FOREIGN KEY (`matricula_id`) REFERENCES `tbl_matricula` (`matricula_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




