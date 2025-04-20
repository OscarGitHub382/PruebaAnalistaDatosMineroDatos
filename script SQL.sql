USE `grupo_asd_prueba`;
CREATE TABLE `grupo_asd_prueba`.`jefe` (
    Jefe VARCHAR(100),
    Asesor VARCHAR(100) NOT NULL PRIMARY KEY
)
ENGINE = InnoDB;

CREATE TABLE `grupo_asd_prueba`.`cliente` (
    Desc_Cliente VARCHAR(100),
    Desc_Programa VARCHAR(255) NOT NULL PRIMARY KEY
)
ENGINE = InnoDB;

CREATE TABLE `grupo_asd_prueba`.`representantes` (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `date` DATETIME(3),
    conversation_id CHAR(36),
    bot_id VARCHAR(100),
    response TEXT,
    start_datetime DATETIME(3),
    end_datetime DATETIME(3),
    `query` TEXT,
    confidence DECIMAL(10,9),
    response_time INT,
    intent VARCHAR(100),
    entities TEXT,
    operation_user VARCHAR(255),
    network_user VARCHAR(100),
    FOREIGN KEY (network_user) REFERENCES jefe(Asesor),
    FOREIGN KEY (operation_user) REFERENCES cliente(Desc_Programa)
)
ENGINE = InnoDB;

SELECT COUNT(*) FROM representantes;

SELECT
    j.Asesor,
    COUNT(r.id) AS CantidadTransacciones
FROM
    jefe j
JOIN
    representantes r ON j.Asesor = r.network_user
GROUP BY
    j.Asesor
ORDER BY
    CantidadTransacciones DESC;
    
SELECT
    j.Jefe,
    AVG(r.response_time) AS TiempoPromedioMilisegundos,
    AVG(r.response_time) / 1000 AS TiempoPromedioSegundos,
    AVG(r.response_time) / 60000 AS TiempoPromedioMinutos
FROM
    jefe j
JOIN
    representantes r ON j.Asesor = r.network_user
GROUP BY
    j.Jefe
ORDER BY
    TiempoPromedioMilisegundos;