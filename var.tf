variable "AMI_ID" {
    type = string
    description = "AMI ID"
    default = "ami-09988af04120b3591"
}

variable "INSTANCE_TYPE" {
    type = string
    description = "type of EC2 instance"
    default = "t2.micro"
}