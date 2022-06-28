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

![image](/OB/online-boutique/src/frontend/static/icons/Hipster_HeroLogoCyan.svg) 
![image](/img/online-boutique1.png)

## Diagrama de APP.
### Online Boutique se compone de 11 servicios.

![image](/img/DiagramaApp.png)

## Diagrama de Infraestructura planteada.
### El siguiente diagrama muestra la infraestructura necesaria que respalda la solucion propuesta en este oblicagorio.

![image](/img/ObligatorioISC.drawio.png)

## Infraestructura empleada:
### En la siguiente tabla se datalla los recursos usados en la solucion como tambien el nombre de dicho recurso y el archivo asociado en el repositorio

| Servicios AWS  |    Nombre       |   Archivo asociado   |
| ---------------|:---------------:|:--------------------:|
|       VPC      |     ob-vpc      |        vpc.tf        |
|   Subnet 1-4   | ob-sub-1, ob-sub-2, ob-sub-3, ob-sub-4 |        vpc.tf        |
|Internet Gateway|    ob-gw-a      |        vpc.tf        |
|   Nat Gateway  |  eks-nat-gw-private-ab            |        vpc.tf              |
|  Route Talbe   |ob-route-table-publica, ob-route-table-private          |   vpc.tf                   |
| Security group |      permite ssh bastion           |         sg.tf             |
| ECR Repository |      ob         |         repositorio.tf             |
|   EKS Cluster  |   EKS_Cluster   |     cluster.tf       |
| EKS Node Group |       EKS_Node          |       cluster.tf     |
|   EC2 Instance |    bastion      |     instances.tf     |

## Requerimientos necesarios para poder desplegar la infraestructura.
### El usuario debera tener una cuenta en AWS.
* Debera contar con AWS cli con sus credenciales configuradas.
* git instalado
* Terraform instalado
* docker instalado
* kubectl instalado

## Guia para lograr un despliegue correcto.
### A continuacion detallamos el paso a paso para poder desplegar la Web Online Boutique aplicando este repositorio
### Entendemos en este punto que los requerimientos detallados anteriormente se cumplen


1 - Necesitamos clonar el repositorio como primer paso

 `git clone https://github.com/JavierPorley/obligatorioISC2022-cp-.git`

2 - Una vez tengamos el repositorio localmente se necesita modificar varios items en los archivos del repositorio

  2. A) Variable.ft: [variables.tf](/OB/variables.tf).
  
                    Cambiar la variable aim por el LabRole que corresponda
                    
                    Cambiar la variable “key name” por la llave de tu aws account




