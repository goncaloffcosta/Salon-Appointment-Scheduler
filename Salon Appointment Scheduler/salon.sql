                         List of relations
 Schema |              Name               |   Type   |    Owner     
--------+---------------------------------+----------+--------------
 public | appointments                    | table    | freecodecamp
 public | appointments_appointment_id_seq | sequence | freecodecamp
 public | customers                       | table    | freecodecamp
 public | customers_customer_id_seq       | sequence | freecodecamp
 public | services                        | table    | freecodecamp
 public | services_service_id_seq         | sequence | freecodecamp
(6 rows)

                         List of relations
 Schema |              Name               |   Type   |    Owner     
--------+---------------------------------+----------+--------------
 public | appointments                    | table    | freecodecamp
 public | appointments_appointment_id_seq | sequence | freecodecamp
 public | customers                       | table    | freecodecamp
 public | customers_customer_id_seq       | sequence | freecodecamp
 public | services                        | table    | freecodecamp
 public | services_service_id_seq         | sequence | freecodecamp
(6 rows)

                                           Table "public.customers"
   Column    |          Type          | Collation | Nullable |                    Default                     
-------------+------------------------+-----------+----------+------------------------------------------------
 customer_id | integer                |           | not null | nextval('customers_customer_id_seq'::regclass)
 name        | character varying(100) |           | not null | 
 phone       | character varying(15)  |           |          | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
    "customers_phone_key" UNIQUE CONSTRAINT, btree (phone)
Referenced by:
    TABLE "appointments" CONSTRAINT "appointments_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

                                          Table "public.services"
   Column   |          Type          | Collation | Nullable |                   Default                    
------------+------------------------+-----------+----------+----------------------------------------------
 service_id | integer                |           | not null | nextval('services_service_id_seq'::regclass)
 name       | character varying(100) |           | not null | 
Indexes:
    "services_pkey" PRIMARY KEY, btree (service_id)
Referenced by:
    TABLE "appointments" CONSTRAINT "appointments_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id)

                                             Table "public.appointments"
     Column     |         Type          | Collation | Nullable |                       Default                        
----------------+-----------------------+-----------+----------+------------------------------------------------------
 appointment_id | integer               |           | not null | nextval('appointments_appointment_id_seq'::regclass)
 customer_id    | integer               |           |          | 
 service_id     | integer               |           |          | 
 time           | character varying(50) |           | not null | 
Indexes:
    "appointments_pkey" PRIMARY KEY, btree (appointment_id)
Foreign-key constraints:
    "appointments_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    "appointments_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id)

 customer_id |      name      |    phone     
-------------+----------------+--------------
           1 | Alice Smith    | 123-456-7890
           2 | Bob Johnson    | 987-654-3210
           3 | Carol Williams | 555-123-4567
(3 rows)

 service_id |   name   
------------+----------
          1 | Haircut
          2 | Manicure
          3 | Pedicure
(3 rows)

 appointment_id | customer_id | service_id |        time         
----------------+-------------+------------+---------------------
              1 |           1 |          1 | 2024-11-22 10:00:00
              2 |           2 |          2 | 2024-11-22 11:00:00
              3 |           3 |          3 | 2024-11-22 12:00:00
(3 rows)

