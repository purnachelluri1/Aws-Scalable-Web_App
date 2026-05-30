
############################################
# LAUNCH TEMPLATE
############################################

resource "aws_launch_template" "launch_template" {
  name_prefix   = "my-launch-template"
  image_id      = var.ltemp_ami
  instance_type = var.ltemp_itype
  key_name      = var.key_name

  vpc_security_group_ids = [
    var.private_sg_id
  ]

  user_data = base64encode(file("${path.root}/userdata.sh"))
}

############################################
# AUTO SCALING GROUP
############################################

resource "aws_autoscaling_group" "asg" {

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  target_group_arns = [
    var.target_group_arn
  ]
  vpc_zone_identifier = var.private_subnets

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  health_check_type = "ELB"

  force_delete = true

  tag {
    key                 = "Name"
    value               = "asg-instance"
    propagate_at_launch = true
  }
}