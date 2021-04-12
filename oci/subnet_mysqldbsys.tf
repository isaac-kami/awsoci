resource "oci_core_subnet" "MySqlOciSubnet"{

  cidr_block = var.cidrsubnet
  compartment_id = oci_identity_compartment.MySqlOciCompartment.id
  vcn_id = oci_core_virtual_network.MySqlOciVCN.id

  display_name = "MySqlOciSubnet"
  
  prohibit_public_ip_on_vnic = true


  security_list_ids = [oci_core_security_list.MySqlOciSecurityList.id]


  route_table_id = oci_core_route_table.MySqlOciRouteTable.id
  
  dhcp_options_id = oci_core_dhcp_options.MySqlOciDHCPOptions.id
  
  dns_label = "MySqlOci"
  
}
