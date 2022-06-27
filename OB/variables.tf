#Seteamos las variables necesarias

#VPC
variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "default"
}

variable "block-vpc" {
  default = "192.168.0.0/16"
}

variable "block-a" {
  default = "192.168.0.0/24"
}

variable "block-b" {
  default = "192.168.1.0/24"
}

variable "block-c" {
  default = "192.168.2.0/24"
}

variable "block-d" {
  default = "192.168.3.0/24"
}

variable "zona-a" {
  default = "us-east-1a"
}

variable "zona-b" {
  default = "us-east-1b"
}

variable "zona-c" {
  default = "us-east-1c"
}

variable "zona-d" {
  default = "us-east-1d"
}


#Cluster
variable "nombre-cluster" {
  default = "kluster"
}

variable "ip-publica" {
  default = "false"
}

variable "iam" {
  default = "arn:aws:iam::637775454552:role/LabRole"
}

#Nodo
variable "nodo1" {
  default = "node_cluster"
}

variable "desired" {
  default = "4"
}

variable "max" {
  default = "4"
}

variable "min" {
  default = "2"

#Instancias
}
 variable "ami" {
  default = "ami-0022f774911c1d690"
}

 variable "instance_type" {
  default = "t2.micro"
}

 variable "key_name" {
  default = "llave"
}







