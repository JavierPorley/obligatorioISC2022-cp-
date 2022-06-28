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

En este repositorio tenemos en la carpeta OB el arbol de la solucion completa con los distintos archivos que sustentan el despliege automatizado de la aplicacion

En el siguiente enlace podemos pararnos en dicha carpeta y recorrer cada uno de los archivos [OB](/OB/)


1 - Necesitamos clonar el repositorio como primer paso

   `git clone https://github.com/JavierPorley/obligatorioISC2022-cp-.git`

2 - Una vez tengamos el repositorio localmente se necesita modificar varios items en los archivos del repositorio

   + A) Variable.ft : Enlace [variables.tf](/OB/variables.tf).
   
  
            Cambiar la variable "iam" en default = "arn:aws:iam::AWSAccountId:role/LabRole" por el AWSAccountId que corresponda
            
https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/295c57bc0d78edb82ad15e03566bb0e4cfa92d87/OB/variables.tf#L58-L59
                           
            Cambiar la variable "key_name" por una llave valida del la aws account del usuario.
 
 https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/745df16e864f010288cc9eb8343984c87043b234/OB/variables.tf#L88-L89
 
                    
   + B) Deploy.tf :	Enlace [deploy.tf](/OB/deploy.tf).
   
            Cambiar el AWSAccountId= (ingresar el del usuario AWS)
   
   https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/745df16e864f010288cc9eb8343984c87043b234/OB/deploy.tf#L10

            Push de imágenes (Ruta local donde este la carpeta SRC de Online-boutique)
            
   https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/745df16e864f010288cc9eb8343984c87043b234/OB/deploy.tf#L20

            Deploy de manifests (Ruta local donde este la carpeta Deployments)
            
     https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/745df16e864f010288cc9eb8343984c87043b234/OB/deploy.tf#L29
          
                    
   + C) desplegar_aplicacion :	Enlace [desplegar_aplicacion](/OB/desplegar_aplicacion).
  
             Item #Busco todos los manifestos
               
                  Ruta de manifiestos (Ruta local donde este la carpeta SRC de Online-boutique)
                  
  https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/745df16e864f010288cc9eb8343984c87043b234/OB/desplegar_aplicacion#L4
                         
             Item #Copio todos los manifestos a la carpeta Deployments
               
                  Ruta local de carpeta Deployments donde se copian los manifiestos
                  
  https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/745df16e864f010288cc9eb8343984c87043b234/OB/desplegar_aplicacion#L14

             Item #Busco todos los Dockerfiles

                  Ruta local dende se encuentra la carpeta scr dentro de online-boutique para que busque los dockerfiles
                  
  https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/745df16e864f010288cc9eb8343984c87043b234/OB/desplegar_aplicacion#L19
                  
                  Cambiar AWSAccountID por el del usuario
                  
  https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/745df16e864f010288cc9eb8343984c87043b234/OB/desplegar_aplicacion#L21

             Item #Creo las imagenes con sus respectivos tags

                  Dependiendo de la ruta que contenga Dockerfile.txt es la fila que tiene que tomar cut en este caso en particular -f7.
                  
  https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/745df16e864f010288cc9eb8343984c87043b234/OB/desplegar_aplicacion#L28
   
   + D) Por ultimo en cada `kubernetes-manifests.yaml` que se encuentra en cada servicio dentro de la carpeta Deployments debe cambiar en el parámetro `image:$AWSAccountID.dkr.ecr.$Region.amazonaws.com/$NombreRepositorio:$tag`
 
Ejemplo en el caso del servicio **adservice** el item imagen quedaria asi substituyendo el `$AWSAccountID`, `$Region`, `$NombreRepositorio:$tag`:

https://github.com/JavierPorley/obligatorioISC2022-cp-/blob/a3c37aede1f08c16ab9701711448017f9172a2b3/OB/online-boutique/src/adservice/deployment/kubernetes-manifests.yaml#L19

3 - El ultimo paso es ejecutar desplegar_aplicacion

`./desplegar_aplicacion`

 A partir de ese momento comenzara el despliegue en forma automatizada de todo lo mostrado hasta el momento.
 * Realiza una busqueda de todos los manifiestos
 * Copia esos manifiestos a la carpeta Deployments
 * Realiza una busqueda de los Dockerfiles
 * Crea las imagenes con sus respectivos tags
 * Inicia codigo de terraform

 Es bueno aclarar que este proceso lleva su tiempo el cual se puede estimar aproximadamente en `35 minutos`
