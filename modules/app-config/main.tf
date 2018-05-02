resource "null_resource" "config-scripts" {
  provisioner "file" {
    connection {
      host = "${var.public-ip}" 
      user = "${var.instance_user}"
      private_key = "${var.ssh_private_key}"
    }
    source      = "scripts/"
    destination = "/tmp/"
  }
}

resource "null_resource" "docker-registry-config" {

  provisioner "local-exec" {
    command = "echo '${var.public-ip}:5000' > userdata/docker_registry_ip_and_port.cfg"
  }
}


resource "null_resource" "userdata-scripts" {

  depends_on = ["null_resource.docker-registry-config"]
  
  provisioner "file" {
    connection {
      host = "${var.public-ip}" 
      user = "${var.instance_user}"
      private_key = "${var.ssh_private_key}"
    }
    source      = "userdata"
    destination = "/home/opc/"
  }
}

resource "null_resource" "docker-config" {

  depends_on = ["null_resource.config-scripts"]
  
  provisioner "remote-exec" {
    connection {
      host= "${var.public-ip}"
      user = "${var.instance_user}"
      private_key = "${var.ssh_private_key}"
    }
    
    inline = [
      "chmod +x /tmp/setup.sh",	
      "sudo /tmp/setup.sh"
    ]
  }
}

resource "null_resource" "jenkins-config" {

  depends_on = ["null_resource.docker-config"]
  
  provisioner "remote-exec" {
    connection {
      host= "${var.public-ip}"
      user = "${var.instance_user}"
      private_key = "${var.ssh_private_key}"
    }
    
    inline = [
      "chmod +x /tmp/install_jenkins.sh",	
      "sudo /tmp/install_jenkins.sh ${var.public-ip}"
    ]
  }
}

resource "null_resource" "terraform-config" {

  provisioner "remote-exec" {
    connection {
      host= "${var.public-ip}"
      user = "${var.instance_user}"
      private_key = "${var.ssh_private_key}"
    }
    
    inline = [
      "curl -sSL https://github.com/caseyr003/terraform-install-oci/raw/master/install_terraform.sh > terraform-install.sh",
      "chmod +x terraform-install.sh",
      "sudo sh terraform-install.sh"
    ]
  }
}

resource "null_resource" "oci-cli-config" {

  depends_on = ["null_resource.docker-config"]

  provisioner "remote-exec" {
    connection {
      host= "${var.public-ip}"
      user = "${var.instance_user}"
      private_key = "${var.ssh_private_key}"
    }
    
    inline = [
      "chmod +x /tmp/install_oci_cli.sh",
      "chmod +x /tmp/oci_cli.sh",
      "sudo /tmp/oci_cli.sh"
    ]
  }
}

resource "null_resource" "docker-pull" {

  depends_on = ["null_resource.docker-config", "null_resource.jenkins-config"]

  provisioner "remote-exec" {
    connection {
      host= "${var.public-ip}"
      user = "${var.instance_user}"
      private_key = "${var.ssh_private_key}"
    }
    
    inline = [
      "echo '${var.docker_password}' | docker login -u '${var.docker_user}' --password-stdin",
      "docker pull store/oracle/weblogic:12.2.1.2",
      "docker tag  store/oracle/weblogic:12.2.1.2 ${var.public-ip}:5000/weblogic-1221",
      "docker push ${var.public-ip}:5000/weblogic-1221",
      "docker image rm ${var.public-ip}:5000/weblogic-1221",
      "docker image rm store/oracle/weblogic:12.2.1.2"
    ]
  }
}
