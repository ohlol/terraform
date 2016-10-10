resource "aws_iam_role_policy" "ec2_readonly" {
  name = "ec2_readonly"
  role = "${aws_iam_role.ec2_readonly.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:Describe*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "elasticloadbalancing:Describe*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "cloudwatch:ListMetrics",
        "cloudwatch:GetMetricStatistics",
        "cloudwatch:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "autoscaling:Describe*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "ec2_readonly" {
    name = "ec2_readonly"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "readonly_instance" {
  name = "ec2_readonly"
  roles = ["${aws_iam_role.ec2_readonly.name}"]
}

resource "aws_key_pair" "builder" {
  key_name = "builder"
  public_key = <<EOF
---- BEGIN SSH2 PUBLIC KEY ----
---- END SSH2 PUBLIC KEY ----
EOF
}
