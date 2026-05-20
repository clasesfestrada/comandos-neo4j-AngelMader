MATCH (e:Estudiante)
RETURN e.id AS id, e.nombre AS nombre, e.carrera AS carrera, e.semestre AS semestre
ORDER BY e.id;


MATCH (m:Materia)
RETURN m.id AS id, m.nombre AS nombre, m.area AS area
ORDER BY m.id;


MATCH (p:Profesor)
RETURN p.id AS id, p.nombre AS nombre, p.departamento AS departamento
ORDER BY p.id;

MATCH (e:Estudiante)-[r:INSCRITO_EN]->(m:Materia)
RETURN e.id AS estudiante_id, e.nombre AS estudiante, m.id AS materia_id, m.nombre AS materia, r.nota AS nota
ORDER BY estudiante_id, materia_id;

MATCH (a:Estudiante)-[r:AMIGO_DE]->(b:Estudiante)
RETURN a.id AS origen, a.nombre AS nombre_origen, b.id AS destino, b.nombre AS nombre_destino
ORDER BY origen, destino;

MATCH (p:Profesor)-[r:IMPARTE]->(m:Materia)
RETURN p.id AS profesor_id, p.nombre AS profesor, m.id AS materia_id, m.nombre AS materia
ORDER BY profesor_id, materia_id;

MATCH (e:Estudiante) RETURN count(e) AS total_estudiantes;
MATCH (m:Materia) RETURN count(m) AS total_materias;
MATCH (p:Profesor) RETURN count(p) AS total_profesores;
MATCH ()-[r:INSCRITO_EN]-() RETURN count(r) AS total_inscripciones;
MATCH ()-[r:AMIGO_DE]-() RETURN count(r) AS total_amistades;
MATCH ()-[r:IMPARTE]-() RETURN count(r) AS total_imparticiones;

CALL db.relationshipTypes();
