data "external" "git_commit_author" {
  program     = ["/bin/bash", "-c", "echo {\"git_commit_author\":\"$(git log -1 | grep ^Author | cut -f 2 -d : | sed 's/^ //g')\"}"]
  working_dir = path.root
}

# resource "null_resource" "git_commit_author" {
#   provisioner "local-exec" {
#     command = "echo {"git_commit_author":"$(git log -1 | grep ^Author | cut -f 2 -d : | sed 's/^ //g')"}"
#   }
# }

output "git_commit_author" {
    value = data.git_commit_author.result
}