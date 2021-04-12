
variable "compartment_ocid" {
  default = ""
}

# for mysql  mds
variable "mysql_db_system_admin_password" {
  default="ABCabc123$%"
}

variable "mysql_db_system_admin_username" {
  default = "usermds"
}

variable "mysql_shape_name" {
  default = "VM.Standard.E2.1"
}

variable "mysql_db_system_availability_domain" {
  default = "Aodz:EU-FRANKFURT-1-AD-1"
}

variable "mysql_storage" {
  default = 50
}


#for vcn block

variable "cidrblockz" {
  type = list(string)
  default = ["10.0.0.0/16"]
}

#for subnet

variable "cidrsubnet" {
  default = "10.0.1.0/24"
}

variable "cidrinstancesubnet" {
  default = "10.0.2.0/24"
}

# for ingress


variable "cidr_ingress" {
  default = "10.0.0.0/16"
}

# for security list

variable "portz" {
 default = [22,3306,3307,33060]
}

## for instance

variable "private_IP" {
  default = "10.0.1.3"
}

variable "instance_name" {
  default = "MySqlShellInstance"
}

variable "instance_shape" {
  default = "VM.Standard.E2.1"
}

variable "instance_image" {
  default =   "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa2fbceq23oofnxf4v23urfnfzui6n6det6ianoyvtmsbo5nzv2efq"
}


variable "private_key_path" {
  default = "/root/.ssh/id_rsa"
}



## for bucket
variable  "name_bucket"{
  default = "mdsbucket"
} 

variable "bucket_namespace" {
  default = ""
}

variable "bucket_object" {
  default = "mdsobject"
}
