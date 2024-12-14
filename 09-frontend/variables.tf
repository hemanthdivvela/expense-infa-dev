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
        Component = "frontend"
    }
  
}

variable "zone-name" {
    default = "hemanth78s.online"
  
}