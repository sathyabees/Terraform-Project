terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }

provider "mysql" {
  host = "localhost"
  port = 4305
  user = "root"
  password = "password"
}

resource "mysql_database" "default" {
  name = "my_database"
}

resource "mysql_user" "default" {
  name = "my_user"
  password = "password"
  database = mysql_database.default.name
}

resource "mysql_grant" "default" {
  user = mysql_user.default.name
  database = mysql_database.default.name
  privileges = ["SELECT", "INSERT", "UPDATE", "DELETE"]

  }
  
provider "aws" {
  region = "us-east-1"
}