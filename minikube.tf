module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region    = "us-east-1"
  cluster_name  = "roboshop"
  aws_instance_type = "t3.medium"
  ssh_public_key =  "C:/Users/hp/dwas76s-github-2.pub"#"~/dwas76s-github-2.pub" #"~/.ssh/daws-76s.pub"
  aws_subnet_id = "subnet-07cbfcd73eb6e4d37" #"subnet-0ea509ad4cba242d7" #replace your default subnet id
  # by default centos7 will be used
  #ami_image_id = "ami-b81dbfc5"
  hosted_zone = "nihatech.online"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}