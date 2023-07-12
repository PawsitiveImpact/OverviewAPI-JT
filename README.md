# Product Overview API

## General Info
- This project serves as the backend design for Project Atelier, an e-commerce company.
- This server handles the Product Overview of the individual products.
- An ETL process was used to parse millions of rows of data and optimize the schema.
- The database was created with PostgreSQL.
- Load balancing was implemented utilizing Nginx.

## Performance
Back End Architecture utilizes AWS to deploy a load balancer with a cache, 2 servers, and a Postgres database. All load tests performed via Loader.io.

<img width="1152" alt="2023-04-15_loader_io_5_1078clients" src="https://github.com/PawsitiveImpact/OverviewAPI-JT/assets/120988755/d4e79fc6-4496-4166-ab1a-daee488b4547">

## Tech Stack
![NodeJS badge](https://img.shields.io/badge/node.js-5DA50F?style=for-the-badge&logo=node.js&logoColor=white)
![PostgreSQL badge](https://img.shields.io/badge/postgresql-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Nginx badge](https://img.shields.io/badge/nginx-293?style=for-the-badge&logo=nginx&logoColor=white)
![JavaScript badge](https://img.shields.io/badge/javascript-333?style=for-the-badge&logo=javascript&logoColor=FFE400)
![AWS badge](https://img.shields.io/badge/AWS-EF870A?style=for-the-badge&logo=amazonaws&logoColor=white)
![Loader.io badge](https://img.shields.io/badge/loader.io-4AF?style=for-the-badge&logo=loader.io)
