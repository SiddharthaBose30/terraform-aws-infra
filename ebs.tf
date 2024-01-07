resource "aws_ebs_volume" "ebs-1" {
  availability_zone = "us-east-1c"
  size              = 3

  tags = {
    Name = "myEBS"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs-1.id
  instance_id = aws_instance.dove-inst.id
}
