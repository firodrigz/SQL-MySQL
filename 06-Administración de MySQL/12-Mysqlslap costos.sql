SELECT * FROM FACTURAS WHERE FECHA_VENTA = "20170101";
SELECT * FROM FACTURAS1 WHERE FECHA_VENTA = "20170101";

/*
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqlslap -uroot -p --concurrency=100 --iterations=10 --create-schema=jugos_ventas --query="SELECT * FROM FACTURAS WHERE FECHA_VENTA = "20170101"";
Enter password: *************
Benchmark
        Average number of seconds to run all queries: 0.215 seconds
        Minimum number of seconds to run all queries: 0.093 seconds
        Maximum number of seconds to run all queries: 1.093 seconds
        Number of clients running queries: 100
        Average number of queries per client: 1


C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqlslap -uroot -p --concurrency=100 --iterations=10 --create-schema=jugos_ventas --query="SELECT * FROM FACTURAS1 WHERE FECHA_VENTA = "20170101"";
Enter password: *************
Benchmark
        Average number of seconds to run all queries: 2.974 seconds
        Minimum number of seconds to run all queries: 2.406 seconds
        Maximum number of seconds to run all queries: 3.484 seconds
        Number of clients running queries: 100
        Average number of queries per client: 1
*/

-- Usamos índices para los campos que hacen parte de la igualdad de los JOIN y el que está en el criterio de filtro WHERE.
-- Si la parte de igualdad de los JOIN ya son PK, entonces solo habría que crear índices para el campo que contiene el criterio de filtro a través de la cláusula WHERE.