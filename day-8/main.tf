variable "user_names" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["dev", "test", "prod"]
}


resource "aws_iam_user" "test" {
  for_each = var.user_names
  name  = each.value
}