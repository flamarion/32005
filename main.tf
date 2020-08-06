
data "external" "git_commit_author" {
  program     = ["${path.module}/git_commit_author.sh"]
  working_dir = path.module
}


resource "null_resource" "git_commit_author" {
  provisioner "local-exec" {
    command = "echo '${data.external.git_commit_author.result["git_commit_author"]}'"
  }
}

# output "git_commit_author" {
#   value = data.external.git_commit_author.result
# }
