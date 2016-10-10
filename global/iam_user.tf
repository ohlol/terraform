resource "aws_iam_user" "users" {
  name = "${element(split(",", var.iam_users), count.index)}"
  path = "/users/"
  count = "${length(split(",", var.iam_users))}"
}

resource "aws_iam_access_key" "users_access_key" {
  user = "${element(aws_iam_user.users.*.name, count.index)}"
  count = "${length(split(",", var.iam_users))}"
}

resource "aws_iam_group" "eng" {
  name = "eng"
  path "/eng/"
}

resource "aws_iam_group_membership" "eng" {
  name = "eng"
  users = [ "${aws_iam_user.users.*.name}" ]
  group = "${aws_iam_group.eng.name}"
}

resource "aws_iam_group_policy" "eng" {
    name = "eng"
    group = "${aws_iam_group.eng.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_group" "ops" {
  name = "ops"
  path "/ops/"
}

resource "aws_iam_group_membership" "ops" {
  name = "ops"
  users = ["${split(",", var.iam_users_ops)}"]
  group = "${aws_iam_group.ops.name}"
}

resource "aws_iam_group_policy" "ops" {
    name = "ops"
    group = "${aws_iam_group.ops.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
