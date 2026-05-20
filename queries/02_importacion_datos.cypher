LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-AngelMader/refs/heads/main/data/estudiantes.csv' AS row
MERGE (e:Estudiante {id: trim(row.id)})
ON CREATE SET e.nombre = row.nombre, e.carrera = row.carrera, e.semestre = CASE WHEN row.semestre <> '' THEN toInteger(row.semestre) ELSE null END;


LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-AngelMader/refs/heads/main/data/materias.csv' AS row
MERGE (m:Materia {id: trim(row.id)})
ON CREATE SET m.nombre = row.nombre, m.area = row.area;


LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-AngelMader/refs/heads/main/data/profesores.csv' AS row
MERGE (p:Profesor {id: trim(row.id)})
ON CREATE SET p.nombre = row.nombre, p.departamento = row.departamento;


LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-AngelMader/refs/heads/main/data/amistades.csv' AS row
MATCH (a:Estudiante {id: trim(row.estudiante_origen)})
MATCH (b:Estudiante {id: trim(row.estudiante_destino)})
MERGE (a)-[:AMIGO_DE]->(b);


LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-AngelMader/refs/heads/main/data/inscripciones.csv' AS row
MATCH (e:Estudiante {id: trim(row.estudiante_id)})
MATCH (m:Materia {id: trim(row.materia_id)})
MERGE (e)-[r:INSCRITO_EN]->(m)
SET r.nota = CASE WHEN row.nota IS NOT NULL AND row.nota <> '' THEN toInteger(row.nota) ELSE r.nota END,
    r.fecha = coalesce(r.fecha, date());


LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/clasesfestrada/comandos-neo4j-AngelMader/refs/heads/main/data/imparticiones.csv' AS row
MATCH (p:Profesor {id: trim(row.profesor_id)})
MATCH (m:Materia {id: trim(row.materia_id)})
MERGE (p)-[:IMPARTE]->(m);
