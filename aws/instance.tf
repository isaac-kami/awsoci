resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = file("/root/.ssh/id_rsa.pub")
}

resource "aws_instance" "example" {
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"
 
  associate_public_ip_address = true

  key_name         = "ssh-key"

  vpc_security_group_ids = [aws_security_group.allow_ports.id]
 
  provisioner "remote-exec" {

       inline = ["echo I am in ",
              "hostname",
              "python3 --version",
              "sleep 10",
              "sudo apt update",
              "sleep 5",
              "sudo apt install -y wget",
              "sudo wget https://dev.mysql.com/get/Downloads/MySQL-Shell/mysql-shell_8.0.23-1ubuntu20.04_amd64.deb",
              "sudo dpkg -i mysql-shell_8.0.23-1ubuntu20.04_amd64.deb",
              "sudo apt update",
              "sudo apt -y install ufw",
              "sudo ufw allow 3306",
              "sudo ufw allow 33060",
              "sudo ufw allow 22",
              "sudo ufw --force enable"
            ]
             

    connection {
    type = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host = aws_instance.example.public_ip
   } 
  }

  provisioner "local-exec" {

   command = "ansible-playbook -i '${aws_instance.example.public_ip},' --private-key ${var.private_key_path} ./mysql.yml  -u ubuntu"
  }

  tags = {
    Name = "TestInstance"
  }


}
