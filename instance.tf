resource "aws_key_pair" "dove-key" {
  key_name   = "test"
  public_key = file("test.pub")
}

resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id = aws_subnet.sub-pub-3.id
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_tf.id]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
    Test    = "yes"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "ls -la /tmp",
      "sudo chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
  
  connection {
    user        = var.USER
    private_key = file("test")
    host        = self.public_ip
  }
}

