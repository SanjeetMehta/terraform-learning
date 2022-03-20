// Terrafor block contains terraform settings including the required providers used by terraform to provision the infrastructure.
terraform {
  required_providers {
      // Example of aws as a provider. This is available in registry.terraform.io
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

// Provider block configures the specified provider.
provider "aws" {
  profile = "techp"
  region  = "us-west-2"
}

// Resource block is used to define components of infrastructure. Resource has 2 strings, resource_type followed by resource_name. Prefix of the resource type maps with the name of the provider. eg: aws_instance
// resource_type and resource_name forms the unique id for the resources. Eg: Id of this resource will be aws_instance.app_server
resource "aws_instance" "app_server" { 
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
