#Creamos el Cluster

resource "aws_eks_cluster" "aws_eks" {
  name     = var.nombre-cluster
  role_arn = var.iam
  vpc_config {
    subnet_ids = [aws_subnet.sub-1a.id, aws_subnet.sub-1b.id, aws_subnet.sub-1c.id, aws_subnet.sub-1d.id]
    public_access_cidrs = ["0.0.0.0/0"]
  }
  tags = {
    Name = "EKS_Cluster"
  }
}




#Creamos los nodos

resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = var.nodo1
  node_role_arn   = var.iam
  subnet_ids      = [aws_subnet.sub-1a.id, aws_subnet.sub-1b.id, aws_subnet.sub-1c.id, aws_subnet.sub-1d.id]
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = var.desired
    max_size     = var.max
    min_size     = var.min
  }
}

