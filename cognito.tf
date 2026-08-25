resource "aws_cognito_user_pool" "pool" {
  name = "dsy1107-grupoXX"

  username_attributes      = ["email"]
  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_uppercase = true
    require_numbers   = true
    require_symbols   = false
  }

  admin_create_user_config {
    allow_admin_create_user_only = true
  }
}

resource "aws_cognito_user_pool_domain" "hosted_ui" {
  domain       = "dsy1107-grupoXX"
  user_pool_id = aws_cognito_user_pool.pool.id

  # 1 = Hosted UI clásica
  managed_login_version = 1
}
