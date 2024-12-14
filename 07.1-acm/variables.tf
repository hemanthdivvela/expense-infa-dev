variable "project_name" {
    default = "expense"
  
}

variable "environment" {
    default = "dev"
  
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
        component = "backend"
    }
  
}

variable "zone-name" {
    default = "hemanth78s.online"
  
}

variable "zone-id" {
    default = "Z06442153P3P64BRXY581"
  
}