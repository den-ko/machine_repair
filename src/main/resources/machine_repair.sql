CREATE TABLE "users" (
"id" serial4 NOT NULL,
"login" varchar(32) NOT NULL,
"password" text NOT NULL,
"enabled" bool NOT NULL,
PRIMARY KEY ("id") ,
CONSTRAINT "uq_users_login" UNIQUE ("login")
);

CREATE TABLE "clients" (
"id" serial4 NOT NULL,
"name" varchar(32) NOT NULL,
"user_id" int NOT NULL,
PRIMARY KEY ("id") ,
CONSTRAINT "uq_clients_users_user_id" UNIQUE ("user_id")
);

CREATE TABLE "users_roles" (
"user_id" int NOT NULL,
"role_id" int NOT NULL
);

CREATE TABLE "session_management" (
"session_timeout" int NOT NULL DEFAULT 300
);

CREATE TABLE "roles" (
"id" serial4 NOT NULL,
"name" text NOT NULL,
PRIMARY KEY ("id") ,
CONSTRAINT "uq_roles_name" UNIQUE ("name")
);


ALTER TABLE "clients" ADD CONSTRAINT "fq_clients_users_user_id" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "users_roles" ADD CONSTRAINT "fq_roles_users_user_id" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "users_roles" ADD CONSTRAINT "fq_roles_users_role_id" FOREIGN KEY ("role_id") REFERENCES "roles" ("id");
