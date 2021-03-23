resource "spacelift_stack" "manager" {
  name = "Demo Preview Environments Manager"

  administrative = true
  autodeploy = true
  branch = "master"
  repository = var.manager_repository

  labels = [
    "destroy_on_delete",
    "demo-preview-environments"
  ]
}

resource "spacelift_policy" "manager-trigger_policy" {
  name = "Demo Preview Environments Manager Trigger Policy"
  type = "TRIGGER"
  body = file("policies/manager-trigger.rego")
}

resource "spacelift_environment_variable" "aws_role" {
  stack_id = spacelift_stack.manager.id
  name = "TF_VAR_aws_role"
  value = var.aws_role
  write_only = false
}

resource "spacelift_environment_variable" "domain_name" {
  stack_id = spacelift_stack.manager.id
  name = "TF_VAR_domain_name"
  value = var.aws_role
  write_only = false
}
