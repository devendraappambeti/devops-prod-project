provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = "flask-app"
    namespace = "devops"
    labels = {
      app = "flask-app"
    }
  }
  

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "flask-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "flask-app"
        }
      }

      spec {
        container {
          name  = "flask-container"
          image = "flask-devops:latest"

          port {
            container_port = 5000
          }

          image_pull_policy = "Never"
        }
      }
    }
  }
}
resource "kubernetes_service_v1" "app_service" {
  metadata {
    name = "flask-service"
    namespace = "devops"
  }

  spec {
    selector = {
      app = "flask-app"
    }

    port {
      port        = 80
      target_port = 5000
      node_port   = 30007
    }

    type = "NodePort"
  }
}