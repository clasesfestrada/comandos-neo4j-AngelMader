MERGE (e:Estudiante {id: 'E006'})
ON CREATE SET e.nombre = 'Marcos', e.carrera = 'Ingeniería', e.semestre = 3;

MATCH (e:Estudiante {id: 'E006'})
RETURN e.id AS id, e.nombre AS nombre, e.carrera AS carrera, e.semestre AS semestre;

MATCH (e:Estudiante {id: 'E006'})
SET e.semestre = 4, e.nombre = 'Marcos Pérez'
RETURN e.id AS id, e.nombre AS nombre, e.semestre AS semestre;

MATCH (e:Estudiante {id: 'E006'})
SET e.semestre = coalesce(e.semestre,0) + 1
RETURN e.id AS id, e.nombre AS nombre, e.semestre AS semestre;

MATCH (e:Estudiante {id: 'E006'})
MATCH (m:Materia {nombre: 'Redes'})
MERGE (e)-[r:INSCRITO_EN]->(m)
SET r.nota = coalesce(r.nota, null), r.fecha = coalesce(r.fecha, date())
RETURN e.id AS estudiante, m.id AS materia, type(r) AS relacion;



MATCH (e:Estudiante {id: 'E006'})-[r:INSCRITO_EN]->(m:Materia {id: 'M001'})
DELETE r;


MATCH (e:Estudiante {id: 'E006'})-[r]-()
DELETE r;


MATCH (e:Estudiante {id: 'E006'})
DETACH DELETE e;
