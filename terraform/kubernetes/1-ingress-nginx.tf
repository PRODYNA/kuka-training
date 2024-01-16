# https://kubernetes.github.io/ingress-nginx/
resource "helm_release" "ingress_nginx" {
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  name             = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
  set {
    name  = "controller.service.annotations.service.beta.kubernetes.io/azure-load-balancer-health-probe-request-path"
    value = "/healthz"
  }
  set {
    name  = "controller.service.loadBalancerIP"
    value = data.azurerm_public_ip.ingress.ip_address
  }
  set {
    name  = "controller.service.annotations.service.beta.kubernetes.io/azure-load-balancer-resource-group"
    value = var.resource_group_name
  }
}