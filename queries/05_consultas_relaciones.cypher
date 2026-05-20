MATCH (a:Estudiante)-[r:AMIGO_DE]->(b:Estudiante)
RETURN a.id AS origen_id, a.nombre AS origen, b.id AS destino_id, b.nombre AS destino
ORDER BY origen_id, destino_id;


MATCH (a:Estudiante)-[r:AMIGO_DE]-(b:Estudiante)
WHERE a.id < b.id
RETURN a.id AS id_a, a.nombre AS nombre_a, b.id AS id_b, b.nombre AS nombre_b
ORDER BY id_a, id_b;


MATCH (e:Estudiante)-[r:INSCRITO_EN]->(m:Materia)
RETURN e.id AS estudiante_id, e.nombre AS estudiante, m.id AS materia_id, m.nombre AS materia, r.nota AS nota
ORDER BY estudiante_id, materia_id;


MATCH (e:Estudiante)-[r:INSCRITO_EN]->(m:Materia {nombre: 'Redes'})
RETURN m.id AS materia_id, m.nombre AS materia, e.id AS estudiante_id, e.nombre AS estudiante, r.nota AS nota
ORDER BY r.nota DESC;


MATCH (e:Estudiante {id: 'E006'})-[r]-(x)
RETURN e.id AS marcos_id, e.nombre AS marcos, type(r) AS tipo_relacion, 
       CASE WHEN x:Estudiante THEN x.id ELSE x.id END AS otro_id,
       CASE WHEN x:Estudiante THEN x.nombre ELSE x.nombre END AS otro_nombre
ORDER BY tipo_relacion, otro_id;


MATCH (p:Profesor)-[r:IMPARTE]->(m:Materia)
RETURN p.id AS profesor_id, p.nombre AS profesor, m.id AS materia_id, m.nombre AS materia
ORDER BY profesor_id, materia_id;


MATCH ()-[r:AMIGO_DE]-() RETURN count(r) AS total_amistades;
MATCH ()-[r:INSCRITO_EN]-() RETURN count(r) AS total_inscripciones;
MATCH ()-[r:IMPARTE]-() RETURN count(r) AS total_imparticiones;
