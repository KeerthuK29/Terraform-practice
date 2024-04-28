resource "aws_iam_user" "demo_user" {
  name = "demo-user"
}
resource "aws_iam_role" "demo_role_ec2" {
  name="ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
         Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
resource "aws_iam_role_policy" "s3_bucket_access_policy" {
  name        = "s3-bucket-acess-policy"
  
  role=aws_iam_role.demo_role_ec2.id
  policy = jsonencode({
     Version = "2012-10-17"
    Statement = [
      {
  Action = [
          "s3:ListAllMyBuckets",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect : "Allow"
        Resource = ["arn:aws:s3:::new-bucket-1", "arn:aws:s3:::new-bucket-1/*"]
      }
    ]
  })
}


resource "aws_iam_user_policy_attachment" "s3_bucket_access_policy_attachment" {
  user       = aws_iam_user.demo_user.name
  policy_arn = aws_iam_policy.s3_bucket_access_policy.arn
}
resource "aws_iam_instance_profile" "cec2_instance_profile" {
  name = "ec2-instnace-profile"
  role = aws_iam_role.demo_role_ec2.name
}
  
