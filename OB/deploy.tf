#Pusheamos y desplegamos los manifestos

resource "null_resource" "kubectl" {
  depends_on = [aws_eks_node_group.node]

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT

AWSAccountId=637775454552
Region=us-east-1
Replicas=2
NombreRepositorio=ob
direccion_ekr=$AWSAccountId.dkr.ecr.$Region.amazonaws.com/$NombreRepositorio

#Login Repositorio
aws ecr get-login-password --region $Region | docker login --username AWS --password-stdin $AWSAccountId.dkr.ecr.$Region.amazonaws.com

#Push de imagenes
for app in $(ls ./online-boutique/src/)
do
docker push $direccion_ekr:$app
done

#Login en EKS
aws eks --region $Region update-kubeconfig --name ${aws_eks_cluster.aws_eks.name}

#Deploy de manifests
kubectl create -f ./Deployments

#Replicas del frontend
kubectl scale deployment.apps/frontend --replicas=$Replicas 
kubectl get svc frontend-external
EOT
  }
}
