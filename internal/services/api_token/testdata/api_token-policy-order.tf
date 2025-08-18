resource "cloudflare_api_token" "policy-order-test" {
  name = "%[1]s"

  policies = [
    {
      effect = "allow"
      resources = {
        "com.cloudflare.api.account.%[2]s" = "*"
      }
      permission_groups = [
        { id = "%[3]s" },
      ]
    },
    {
      effect = "allow"
      resources = {
        "com.cloudflare.api.account.%[2]s" = "*"
      }
      permission_groups = [
        { id = "%[4]s" },
      ]
    }
  ]

  condition = {
    request_ip = {
      in = ["127.0.0.1/32"]
    }
  }
}
