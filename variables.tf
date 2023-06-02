variable "vpc-cidr" {
  default     = ""
  type        = string
  description = "CIDR block details for main VPC"
}

variable "pusub-1" {
  default     = ""
  type        = string
  description = "public subnet 1 CIDR"

}

variable "prisub-1" {
  default     = ""
  type        = string
  description = "private subnet 1 CIDR"

}

variable "prisub-2" {
  default     = ""
  type        = string
  description = "private subnet 2 CIDR"

}

variable "prisub-3" {
  default     = ""
  type        = string
  description = "private subnet 3 CIDR"

}


variable "pusub-2" {
  default     = ""
  type        = string
  description = "public subnet 2 CIDR"

}

variable "pusub-3" {
  default     = ""
  type        = string
  description = "public subnet 3 CIDR"

}

variable "internet" {
  default     = ""
  type        = string
  description = "Internet IP address"

}

variable "ami" {
  default     = ""
  type        = string
  description = "ami"

}