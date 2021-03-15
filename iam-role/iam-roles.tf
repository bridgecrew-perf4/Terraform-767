resource "aws_iam_role" "ozw_s3bucket_access_role" {
  name               = "ozw_s3bucket_access_role"
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

resource "aws_iam_role_policy" "ozw_s3bucket_access_role_policy" {
  name = "ozw_s3bucket_access_role_policy"
  role = aws_iam_role.ozw_s3bucket_access_role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::ozw_s3bucket-20210222",
              "arn:aws:s3:::ozw_s3bucket-20210222/*"
            ]
        }
    ]
}
EOF

}

resource "aws_iam_instance_profile" "ozw_s3bucket_access_role_instanceprofile" {
  name = "ozw_s3bucket_access_role"
  role = aws_iam_role.ozw_s3bucket_access_role.name
}
