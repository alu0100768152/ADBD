#---------------- FARMACIA -------------------

CREATE OR REPLACE FUNCTION no_negativo()
RETURNS TRIGGER AS $no_negativo$
DECLARE
BEGIN
	IF NEW.precio < 0 THEN
            RAISE EXCEPTION 'El precio no puede ser negativo';
            NEW.precio = OLD.precio; 
    END IF;


END;
$no_negativo$ LANGUAGE plpgsql;



CREATE TRIGGER no_negativo
AFTER UPDATE OF precio ON medicamento 
FOR EACH ROW 
EXECUTE PROCEDURE no_negativo();


#---------------- VIVEROS -------------------
CREATE OR REPLACE FUNCTION no_negativo2()
RETURNS TRIGGER AS $no_negativ2o$
DECLARE
BEGIN
	IF NEW.stock < 0 THEN
            RAISE EXCEPTION 'El stock no puede ser negativo';
            NEW.stock = OLD.stock;
    END IF;


END;
$no_negativo2$ LANGUAGE plpgsql;



CREATE TRIGGER no_negativo2
AFTER INSERT OR UPDATE OF stock ON producto 
FOR EACH ROW 
EXECUTE PROCEDURE no_negativo2();
