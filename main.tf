resource "google_endpoints_service_iam_member" "endpoints_service_iam_members" {
  for_each = var.endpoints_service_iam_members

  member       = each.value.member
  role         = each.value.role
  service_name = each.value.service_name

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

