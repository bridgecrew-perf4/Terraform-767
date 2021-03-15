resource "aws_iam_user" "admin-user1" {
  name = "admin-user1"
}

resource "aws_iam_user" "admin-user2" {
  name = "admin-user2"
}

resource "aws_iam_group" "admin-group" {
  name = "admin-group"
}

resource "aws_iam_group_membership" "admin-user-group" {
  name = "admin-user-group"

  users = [
    aws_iam_user.admin-user1.name,
    aws_iam_user.admin-user2.name,
  ]

  group = aws_iam_group.admin-group.name
}

resource "aws_iam_policy_attachment" "admin-user-group-attach" {
  name       = "admin-user-group-attach"
  groups     = [aws_iam_group.admin-group.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
