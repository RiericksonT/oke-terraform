variable "tenancy_ocid" {
  description = "Tenancy OCID"
  default     = "ocid1.tenancy.oc1..aaaaaaaazv3wapnqqxhlnmtigfknedmrsho6u7xpt56o3mt2evrgepwuzv6q"
}

variable "user_ocid" {
  description = "User OCID"
  default     = "ocid1.user.oc1..aaaaaaaakhqiyb2tsh3h2zwqltj5tmxmtlrgnofs27qwgui4bo5sb2pcq6uq"
}

variable "comapartment_ocid" {
  description = "Comapartment OCID"
  default     = "ocid1.compartment.oc1..aaaaaaaazsbnyvcsqq775ephtvnyn4syrig45wrlcfmfh2bvcg2bfjvgyn2a"
}

variable "fingerprint" {
  description = "Fingerprint"
  default     = "e4:f4:f8:23:4d:b1:cc:1e:56:4b:e3:c9:1b:81:d8:25"
}

variable "private_key_path" {
  description = "Private Key Path"
  default     = "C:/Users/rieri/Downloads/oracleidentitycloudservice_krts-03-23-19-16.pem"
}

variable "region" {
  description = "Region"
  default     = "sa-saopaulo-1"
}

variable "vcn_cidr" {
  description = "VCN CIDR"
  default     = "10.0.0.0/16"
}

variable "vcn_dns_label" {
  description = "VCN DNS Label"
  default     = "vcnterraform"
}

variable "ssh_public_key_file" {
  description = "SSH Public Key File"
  default     = "C:/Users/rieri/.ssh/id_rsa.pub"
}

variable "ssh_private_key_file" {
  description = "SSH Private Key File"
  default     = "C:/Users/rieri/.ssh/id_rsa"
}

