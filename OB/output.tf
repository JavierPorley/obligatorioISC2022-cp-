#Mostramos las salidas

output "access_cluster" {
  value = "To access the cluster, run 'aws eks --region us-east-1 update-kubeconfig --name ${aws_eks_cluster.aws_eks.name}'"
}

output "repository_url" {
  description = "The URL of the repository."
  value       = aws_ecr_repository.ob.repository_url
}


