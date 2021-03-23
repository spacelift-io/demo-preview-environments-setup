terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {
}

resource "spacelift_stack" "manager" {
  name = "Demo Preview Environments Manager"

  administrative = true
  autodeploy = true
  branch = "master"
  repository = "manager"

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
