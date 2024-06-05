# Terraform-Playground

A playground repo for exploring the world of Terraform with help from the book _Terraform Up & Running: Writing Infrastructure as Code_ by Yevgeniy Brikman, [Phind](Phind.com), and a whole bunch of AWS and Terraform online documentation.

## Learnings/Best practices

- AWS root users should only be used to create other users
- Use those users for creating resources
- use `~/.aws` configuration instead of machine environment variables
- IAM is different than IAM Identity Centre. The former is what we used for creating resources and giivng our local machine access. The latter was previously called AWS Single-Sign-On. I'm a team of one while I'm learning so I won't need to use IAM Identity Centre.
- Your user (from IAM) must have the same access as the resources you're trying to create - user and group priveleges as well as AMI (image IDs).
- You can use a tool like Packer to create a custom AMI

## Glossary

IAM - Identity Access Management
AMI - Amazon Machine Image, region specific
