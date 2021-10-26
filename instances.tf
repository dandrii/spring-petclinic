#Get Linux AMI ID using SSM Parameter endpoint in eu-central-1
data "aws_ssm_parameter" "PetclinicAmi" {
  provider = aws.region-master
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

#Create key-pair for logging into EC2 in eu-central-1
resource "aws_key_pair" "master-key" {
  provider   = aws.region-master
  key_name   = "petclinic"
  public_key = file("~/.ssh/id_rsa.pub")
}

#Create and bootstrap EC2 in eu-central-1
resource "aws_instance" "petclinic" {
  provider                    = aws.region-master
  ami                         = data.aws_ssm_parameter.PetclinicAmi.value
  instance_type               = var.instance-type
  key_name                    = aws_key_pair.master-key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "petclinic_tf"
  }

  provisioner "local-exec" {
    command = <<EOF
aws --profile ${var.profile} ec2 wait instance-status-ok --region ${var.region-master} --instance-ids ${self.id} \
&& ansible-playbook --extra-vars 'passed_in_hosts=tag_Name_${self.tags.Name}' ansible-petclinic-deploy.yml
EOF
  }
}