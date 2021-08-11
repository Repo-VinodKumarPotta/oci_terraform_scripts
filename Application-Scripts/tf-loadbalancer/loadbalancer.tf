#https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/load_balancer_shapes
resource "oci_load_balancer_load_balancer" "application_load_balancer" {
  #Required
  compartment_id = "ocid1.compartment.oc1..aaaaaaaarpcjfdeqyoml4ksojtp7cm57x5b65knmcewzbiuz5wz24c2hdvkq"
  display_name = "application_load_balancer"
  shape          =  "10Mbps"
  subnet_ids =  var.subnet_ids

  /* reserved_ips {

     #Optional
     #id = "${oci_core_public_ip.reserved_ip.id}"
   }*/
  /*  shape_details {
      #Required
      maximum_bandwidth_in_mbps = var.load_balancer_shape_details_maximum_bandwidth_in_mbps
      minimum_bandwidth_in_mbps = var.load_balancer_shape_details_minimum_bandwidth_in_mbps
    }*/
}

resource "oci_load_balancer_backend" "load_balancer_backend" {
  load_balancer_id = oci_load_balancer_load_balancer.application_load_balancer.id
  backendset_name  = oci_load_balancer_backend_set.load_balancer_backend_set.name
  ip_address       = var.oci_core_instance_ip
  port             = 80
  backup           = false
  drain            = false
  offline          = false
  weight           = 1

}

variable "oci_core_instance_ip" {
  default = "10.0.0.108"
}

resource "oci_load_balancer_backend_set" "load_balancer_backend_set" {
  name             = "load_balancer_backend_set"
  load_balancer_id = oci_load_balancer_load_balancer.application_load_balancer.id
  policy           = "ROUND_ROBIN"

  health_checker {
    port                = "80"
    protocol            = "HTTP"
    response_body_regex = ".*"
    url_path            = "/"
  }
}

/*resource "oci_load_balancer_certificate" "load_balancer_certificate" {
  load_balancer_id = oci_load_balancer_load_balancer.application_load_balancer.id
  certificate_name   = "ca_certificate"

  lifecycle {
    create_before_destroy = true
  }
}*/

/*resource "oci_load_balancer_ssl_cipher_suite" "ssl_cipher_suite" {
  #Required
  name = "cipher_name"

  ciphers = ["AES128-SHA", "AES256-SHA"]

  #Optional
  load_balancer_id = oci_load_balancer_load_balancer.application_load_balancer.id
}*/

resource "oci_load_balancer_hostname" "hostname" {
  #Required
  hostname         = "test.app.api.com"
  load_balancer_id = oci_load_balancer_load_balancer.application_load_balancer.id
  name             = "hostname"
  lifecycle {
    create_before_destroy = true
  }
}
/*
resource "oci_load_balancer_hostname" "hostname" {
  #Required
  hostname = var.hostname_hostname
  load_balancer_id = oci_load_balancer_load_balancer.application_load_balancer.id
  name = var.hostname_hostname

  #Optional
  lifecycle {
    create_before_destroy = true
  }
}*/

resource "oci_load_balancer_listener" "load_balancer_listener" {
  load_balancer_id         = oci_load_balancer_load_balancer.application_load_balancer.id
  name                     = "http"
  default_backend_set_name = oci_load_balancer_backend_set.load_balancer_backend_set.name
  #hostname_names           = [oci_load_balancer_hostname.hostname.hostname]
  port                     = 80
  protocol                 = "HTTP"
  rule_set_names           = [oci_load_balancer_rule_set.load_balancer_rule_set.name]

  connection_configuration {
    idle_timeout_in_seconds = "2"
  }
}

variable "load_balancer_shape_details_maximum_bandwidth_in_mbps" {
  default = 10
}

variable "load_balancer_shape_details_minimum_bandwidth_in_mbps" {
  default = 10
}

variable "subnet_ids"{
  default = [
    "ocid1.subnet.oc1.ap-hyderabad-1.aaaaaaaad5g45brusjosnuwkshocdo5oyubitfopuyhrmamyahdhs25dfkbq"
  ]
}




/*resource "oci_core_public_ip" "reserved_ip" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaarpcjfdeqyoml4ksojtp7cm57x5b65knmcewzbiuz5wz24c2hdvkq"
  lifetime       = "RESERVED"

  lifecycle {
    ignore_changes = [private_ip_id]
  }
}*/

/*

resource "oci_load_balancer_load_balancer_routing_policy" "load_balancer_routing_policy" {
  #Required
  condition_language_version = var.load_balancer_routing_policy_condition_language_version
  load_balancer_id = oci_load_balancer_load_balancer.load_balancer.id
  name = var.load_balancer_routing_policy_name
  rules {
    #Required
    actions {
      #Required
      name = var.load_balancer_routing_policy_rules_actions_name

      #Optional
      backend_set_name = oci_load_balancer_backend_set.backend_set.name
    }
    condition = var.load_balancer_routing_policy_rules_condition
    name = var.load_balancer_routing_policy_rules_name
  }
}
*/

resource "oci_load_balancer_path_route_set" "path_route_set" {
  #Required
  load_balancer_id = oci_load_balancer_load_balancer.application_load_balancer.id
  name             = "path_route_set"

  path_routes {
    #Required
    backend_set_name = oci_load_balancer_backend_set.load_balancer_backend_set.name
    path             = "/hello-world"

    path_match_type {
      #Required
      match_type = "FORCE_LONGEST_PREFIX_MATCH"
    }
  }
}

resource "oci_load_balancer_rule_set" "load_balancer_rule_set" {
  #Required
  items {
    #Required
    action = "REDIRECT"

    #Optional
    allowed_methods = ["GET","POST"]
    are_invalid_characters_allowed = true
    conditions {
      attribute_name = "PATH"
      attribute_value = "/hello-world"
      operator = "FORCE_LONGEST_PREFIX_MATCH"
    }
    redirect_uri {
      protocol = "http"
      host = "{host}"
      port = 8080
      path = "/hello-world/calculateFibonacciSeries"
      query = "?number=7"
    }
    #description = var.rule_set_items_description
    #header = var.rule_set_items_header
    #http_large_header_size_in_kb = var.rule_set_items_http_large_header_size_in_kb
    #prefix = var.rule_set_items_prefix

    #response_code = var.rule_set_items_response_code
    #status_code = var.rule_set_items_status_code
    #suffix = var.rule_set_items_suffix
    #value = var.rule_set_items_value
  }
  load_balancer_id = oci_load_balancer_load_balancer.application_load_balancer.id
  name = "oci_load_balancer_rule_set"
}