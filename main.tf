
data "external" "git_commit_author" {
  program     = ["${path.module}/git_commit_author.sh"]
  #working_dir = path.root
}


resource "null_resource" "git_commit_author" {
  provisioner "local-exec" {
    command = "echo ${data.external.git_commit_author.result}"
  }
}

# output "git_commit_author" {
#   value = data.external.git_commit_author.result
# }
