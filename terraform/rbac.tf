resource "kubernetes_cluster_role_binding" "helm" {
  metadata {
    name = "user-admin-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster_admin"
  }

  subject {
    kind      = "User"
    name      = data.google_client_openid_userinfo.identity.email
    api_group = "rbac.authorization.k8s.io"
  }
}


resource "kubernetes_cluster_role_binding" "spinnaker" {
  metadata {
    name = "spinnaker-admin"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster_admin"
  }

  subject {
    kind = "ServiceAccount"
    name = "default"
  }
}


