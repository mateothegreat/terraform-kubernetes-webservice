provider "kubernetes" {

    load_config_file = false
    host             = var.host
    token            = var.token
    insecure         = true

}

resource "kubernetes_pod_disruption_budget" "pdb" {

    metadata {

        name      = var.name
        namespace = var.namespace

    }

    spec {

        min_available = var.pdb_min_available

        selector {

            match_labels = {

                app = var.name

            }

        }

    }

}

resource "kubernetes_deployment" "deployment" {

    metadata {

        name      = var.name
        namespace = var.namespace

        labels = {

            app = var.name

        }

    }

    spec {

        replicas = var.replicas

        selector {

            match_labels = {

                app = var.name

            }

        }

        template {

            metadata {

                name = var.name

                labels = {

                    app = var.name

                }

            }

            spec {

                termination_grace_period_seconds = var.termination_grace_period_seconds

                node_selector = var.node_selector

                container {

                    name  = var.name
                    image = var.image

                    dynamic "env" {

                        for_each = var.envs

                        content {

                            name  = env.value[ "name" ]
                            value = env.value[ "value" ]

                        }

                    }

                    port {

                        container_port = var.container_port
                        protocol       = "TCP"

                    }

                    resources {

                        requests {

                            cpu    = var.limit_cpu
                            memory = var.limit_memory

                        }

                        limits {

                            cpu    = var.limit_cpu
                            memory = var.limit_memory

                        }

                    }

                }

            }

        }

    }

}

resource "kubernetes_service" "service" {

    metadata {

        name      = var.name
        namespace = var.namespace

        labels = {

            app = var.name

        }

    }

    spec {

        selector = {

            app = var.name

        }

        port {

            port     = var.container_port
            protocol = "TCP"

        }

    }

}

resource "kubernetes_ingress" "ingress" {

    metadata {

        name      = var.name
        namespace = var.namespace

    }

    spec {

        tls {

            hosts       = [ var.ingress_host ]
            secret_name = var.ingress_secret_name

        }

        rule {

            host = var.ingress_host

            http {

                path {

                    path = var.ingress_path

                    backend {

                        service_name = var.name
                        service_port = var.container_port

                    }

                }

            }

        }

    }

}
