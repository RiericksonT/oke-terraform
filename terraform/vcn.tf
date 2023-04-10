resource "oci_core_virtual_network" "vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.comapartment_ocid
  display_name   = "vcn-terraform"
  dns_label      = var.vcn_dns_label
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.comapartment_ocid
  display_name   = "igw-terraform"
  vcn_id         = oci_core_virtual_network.vcn.id
}

resource "oci_core_route_table" "rt" {
  compartment_id = var.comapartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "rtTerraform"

  route_rules {
    cidr_block        = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

resource "oci_core_subnet" "subnet-cluster" {
  cidr_block        = cidrsubnet(var.vcn_cidr, 8, 1)
  compartment_id    = var.comapartment_ocid
  display_name      = "subnetcluster"
  vcn_id            = oci_core_virtual_network.vcn.id
  route_table_id    = oci_core_route_table.rt.id
  dns_label         = "subnetcluster"
  security_list_ids = [oci_core_security_list.sl.id]

}


resource "oci_core_subnet" "subnet-nodepool" {
  cidr_block        = cidrsubnet(var.vcn_cidr, 8, 0)
  compartment_id    = var.comapartment_ocid
  display_name      = "subnetnodepool"
  vcn_id            = oci_core_virtual_network.vcn.id
  route_table_id    = oci_core_route_table.rt.id
  dns_label         = "subnetnodepool"
  security_list_ids = [oci_core_security_list.sl.id]
}

resource "oci_core_security_list" "sl" {
  compartment_id = var.comapartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "slTerraform"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  //ingress rules all ports open
  ingress_security_rules {
    protocol = "all"
    source   = "0.0.0.0/0"

  }
}
