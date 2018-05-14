resource "aws_iam_role" "role" {
  count = "${var.toggle == "on" ? 1 : 0}"
  name = "${var.service_role_name}"
  path = "${var.service_iam_path}"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "${var.aws_service_role_name}.amazonaws.com"
        },
        "Effect": "Allow"
      }
    ]
}
EOF
}

resource "aws_iam_policy" "policy" {
  count = "${var.toggle == "on" ? 1 : 0}"
  name = "${coalesce(var.service_policy_name,format("%s-policy",var.service_role_name))}"
  path = "${var.service_iam_path}"

  policy = "${var.service_policy}"
}

resource "aws_iam_role_policy_attachment" "attachment" {
  count = "${var.toggle == "on" ? 1 : 0}"
  role = "${aws_iam_role.role.id}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "aws_iam_role_policy_attachment" "additional" {
  count      = "${var.toggle == "on" ? length(var.additional_policy_arns) : 0}"
  role       = "${aws_iam_role.role.id}"
  policy_arn = "${element(var.additional_policy_arns, count.index)}"
}

