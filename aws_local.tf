locals {
  staging_env = "staging"
}


locals {
  ports_in = [
    443,
    80,
    22
  ]
  ports_out = [
    0
  ]
}
