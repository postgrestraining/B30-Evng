#Steps for DMS

In SCT,

1. add source and target 
2. Create Mapping
3. Select HR -> Right Click -> Convert schema -> It shoud populate HR in destination
4. Select Schema in destination -> Apply to database

Login to Aurora PostgreSQL and check metadata is loaded?

```
postgres=> \dt hr.*
             List of relations
 Schema |     Name      | Type  |  Owner
--------+---------------+-------+----------
 hr     | countries     | table | postgres
 hr     | departments   | table | postgres
 hr     | employees     | table | postgres
 hr     | identity_tst  | table | postgres
 hr     | job_history   | table | postgres
 hr     | jobs          | table | postgres
 hr     | locations     | table | postgres
 hr     | regions       | table | postgres
 hr     | system_events | table | postgres
(9 rows)

postgres=> set search_path=hr;
SET
postgres=> select * from hr.jobs;
 job_id | job_title | min_salary | max_salary
--------+-----------+------------+------------
(0 rows)

postgres=>
```

In DMS,

1. DMS -> Subnet groups -> Create -> Name: b30-replication-subnet-group
2. Replication instances -> Create -> Name: b30-replication, Instance Class -> t3.medium
3. Create source endpoint -> Most of the details are auto populated and Test endpoint connection
4. Create target endpoint -> SSL Socket layer mode -> Require;  Most of the details are auto populated and Test endpoint connection
5. Select Source -> Schemas -> Refresh to populate schemas
6. Create migration task
   Task identifier - ora2pg
   Migration type - Migrate existing data and replicate ongoing change

