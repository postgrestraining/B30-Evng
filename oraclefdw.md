Syntax for Oracel fdw

```
CREATE EXTENSION oracle_fdw;
CREATE SERVER oraserver FOREIGN DATA WRAPPER oracle_fdw OPTIONS (dbserver '//orcl.cijxwe4ckz1m.us-east-1.rds.amazonaws.com:1521/orcl');
GRANT USAGE ON FOREIGN SERVER oraserver TO postgres;
CREATE USER MAPPING FOR postgres SERVER oraserver OPTIONS (user 'hr', password 'oracle');
create schema hro;
IMPORT FOREIGN SCHEMA "HR" FROM SERVER oraserver INTO hro;
set search_path=hro;
select * from jobs;
```

##New table 

###In Source

```
create table newtable (id varchar(10), sal varchar(10));
insert into newtable values(1,100);
commit;
```
###In PostgreSQL

```
 CREATE FOREIGN TABLE hro.newtable (
        id varchar(10),
        SAL varchar(10)
)
        SERVER oraserver OPTIONS (SCHEMA 'HR', TABLE 'NEWTABLE');

select * from hro.newtable;
```
