# Universidad ORT
# Carrera : Analista en Infraestructura Informática
# Materia: Implementación de Soluciones Cloud
# Evaluación: Obligatorio
## Integrantes:
### Fabian Cabrera (242287)
### Javier Porley (206109)
## Objetivo del Obligatorio.
### El objetivo del obligatorio es facilitar una solución de infraestructura basada en servicios AWS (Amazon Web Services) que permita mantener la implementación del e-commerce desarrollado por la Empresa.
### Este repositorio contiene lo necesario para que un usuario con ciertos requisitos que detallaremos, despliegue de forma automatizada la web Online Boutique realizando una sola acción que es ejecutar `./desplegar_aplicacion`

## Web Online-Boutique.

![This is a alt text.](/OB/online-boutique/src/frontend/static/icons/Hipster_HeroLogoCyan.svg "This is a sample image.")

## Infraestructura empleada:
### En la siguiente tabla se datalla los recursos usados en la solucion como tambien el nombre de dicho recurso y el archivo asociado en el repositorio
| Servicios AWS  |    Nombre       |   Archivo asociado   |
| ---------------|:---------------:|:--------------------:|
|       VPC      |     ob-vpc      |        vpc.tf        |
|     Subnet 1   |    ob-sub-1     |        vpc.tf        |
|     Subnet 2   |    ob-sub-2     |        vpc.tf        |
|     Subnet 3   |    ob-sub-3     |        vpc.tf        |
|     Subnet 4   |    ob-sub-4     |        vpc.tf        |
|Internet Gateway|    ob-gw-a      |        vpc.tf        |
|   Nat Gateway  |                 |                      |
|                |                 |                      |
|                |                 |                      |
|   EKS Cluster  |   EKS_Cluster   |     cluster.tf       |
|   EC2 Instance |    bastion      |     instances.tf     |
|                |                 |                      |
|                |                 |                      |
|                |                 |                      |
|                |                 |                      |
|                |                 |                      |
|                |                 |                      |
|                |                 |                      |
