variable "host" {

    type = string

}

variable "token" {

    type = string

}

variable "name" {

    type = string

}

variable "image" {

    type = string

}

variable "namespace" {

    type = string

}

variable "envs" {

    type = list(object({

        name  = string
        value = string

    }))

    default = [ ]
}

//variable "env_db_host" {
//
//    type = string
//
//}
//
//variable "env_db_port" {
//
//    type = number
//
//}
//
//variable "env_db_username" {
//
//    type = string
//
//}
//
//variable "env_db_password" {
//
//    type = string
//
//}
//
//variable "env_elasticsearch_host" {
//
//    type = string
//
//}
//
//variable "env_elasticsearch_scheme" {
//
//    type = string
//
//}
//
//variable "env_elasticsearch_port" {
//
//    type = string
//
//}
//
//variable "env_elasticsearch_username" {
//
//    type = string
//
//}
//
//variable "env_elasticsearch_password" {
//
//    type = string
//
//}
//
//variable "env_rabbitmq_uri" {
//
//    type = string
//
//}
//
//variable "env_rabbitmq_exchange" {
//
//    type = string
//
//}
//
//variable "env_jwt_token" {
//
//    type = string
//
//}
//
//variable "env_jwt_expiry" {
//
//    type = string
//
//}
//
//variable "env_jaeger_endpoint" {
//
//    type    = string
//    default = null
//
//}

variable "node_selector" {

    type    = object
    default = null

}

variable "pdb_min_available" {

    type    = number
    default = 1

}

variable "replicas" {

    type    = number
    default = 1

}

variable "termination_grace_period_seconds" {

    type    = number
    default = 10

}

variable "container_port" {

    type = number

}

variable "limit_cpu" {

    type = string

}

variable "limit_memory" {

    type = string

}

variable "ingress_path" {

    type    = string
    default = "/"

}

variable "ingress_host" {

    type = string

}

variable "ingress_secret_name" {

    type = string

}