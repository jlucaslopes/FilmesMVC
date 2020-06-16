DROP TABLE FILME;


CREATE TABLE FILME
   (	"ID" NUMBER(10,0), 
	"NOME" VARCHAR2(256 BYTE), 
	"SINOPSE" VARCHAR2(1000 BYTE), 
	"GENERO" VARCHAR2(256 BYTE), 
	"PRODUTORA" VARCHAR2(256 BYTE), 
	"DATALANCAMENTO" VARCHAR2(20 BYTE)
   ) 

CREATE SEQUENCE filme_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER insert_id_filme
                  BEFORE INSERT ON filme FOR EACH ROW       
BEGIN
 
SELECT filme_seq.NEXTVAL
INTO :NEW.id
FROM DUAL;
END;


Insert into FILME (ID,NOME,SINOPSE,GENERO,PRODUTORA,DATALANCAMENTO) values ('1','primeiro filme','primeira sinopse','primeiro genero','primeira produtora','31/03/2020');
Insert into FILME (ID,NOME,SINOPSE,GENERO,PRODUTORA,DATALANCAMENTO) values ('2','segundo filme','segundo sinopse','segundo genero','segundo produtora','31/03/2020');
Insert into FILME (ID,NOME,SINOPSE,GENERO,PRODUTORA,DATALANCAMENTO) values ('3','terceira filme','terceira sinopse','terceira genero','terceira produtora','31/03/2020');
Insert into FILME (ID,NOME,SINOPSE,GENERO,PRODUTORA,DATALANCAMENTO) values ('4','quarto filme','droga, é o braia','quarto genero','quarta produtora','31/03/2020');

commit;

SELECT * FROM filme;