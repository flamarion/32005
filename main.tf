

# resource "null_resource" "git_commit_author" {
#   provisioner "local-exec" {
#     command = "echo {"git_commit_author":"$(git log -1 | grep ^Author | cut -f 2 -d : | sed 's/^ //g')"}"
#   }
# }

data "external" "git_commit_author" {
  program     = ["${path.module}/git_commit_author.sh"]
  #working_dir = path.root
}

output "git_commit_author" {
  value = data.external.git_commit_author.result
}
