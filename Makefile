install-tf-docs:
	brew install terraform-docs

update-docs:
	terraform-docs markdown . >> README.md
