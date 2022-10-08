terraform {
  required_providers {
    statsig = {
      version = "0.1.0"
      source  = "statsig-io/statsig"
    }
  }
}

resource "statsig_gate" "example_gate" {
  name        = "example_gate"
  description = "A short description of what this Gate is used for."
  is_enabled  = false
  id_type     = "userID"
  rules {
    name            = "All Conditions"
    pass_percentage = 10
    conditions {
      type = "public"
    }
    conditions {
      type         = "user_id"
      target_value = [
        "1", "2"
      ]
      operator = "any"
    }
    conditions {
      type         = "email"
      target_value = ["@outlook.com", "@gmail.com"]
      operator     = "str_contains_any"
    }
    conditions {
      type         = "custom_field"
      target_value = [31]
      operator     = "gt"
      field        = "age"
    }
    conditions {
      type         = "app_version"
      target_value = ["1.1.1"]
      operator     = "version_gt"
    }
    conditions {
      type         = "browser_name"
      target_value = ["Firefox", "Chrome"]
      operator     = "any"
    }
    conditions {
      type         = "browser_version"
      target_value = ["94.0.4606.81", "94.0.4606.92"]
      operator     = "any"
    }
    conditions {
      type         = "os_name"
      target_value = ["Android", "Windows"]
      operator     = "none"
    }
    conditions {
      type         = "os_version"
      target_value = ["11.0.0"]
      operator     = "version_lte"
    }
    conditions {
      type         = "country"
      target_value = ["NZ", "US"]
      operator     = "any"
    }
    conditions {
      type         = "passes_gate"
      target_value = ["my_gate_2"]
    }
    conditions {
      type         = "fails_gate"
      target_value = ["a_failing_gate"]
    }
    conditions {
      type         = "time"
      target_value = [1643070357193]
      operator     = "after"
    }
    conditions {
      type         = "environment_tier"
      target_value = ["production"]
      operator     = "any"
    }
    conditions {
      type         = "passes_segment"
      target_value = ["growth_org"]
      operator     = "any"
    }
    conditions {
      type         = "fails_segment"
      target_value = ["promo_id_list"]
      operator     = "any"
    }
    conditions {
      type         = "ip_address"
      target_value = ["1.1.1.1", "8.8.8.8"]
      operator     = "any"
    }
  }
  dev_rules {
    name            = "All Conditions"
    pass_percentage = 10
    conditions {
      type = "public"
    }
  }
}


output "example_gate" {
  value = statsig_gate.example_gate
}
