variable "endpoints_service_iam_members" {
  description = <<EOT
Map of endpoints_service_iam_members, attributes below
Required:
    - member
    - role
    - service_name
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member       = string
    role         = string
    service_name = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

