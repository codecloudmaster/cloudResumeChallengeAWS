- [Return to main page](../README.md)
- [Initial stage: Tag 0.2.0](./initial_stage_tag_0.2.0.md)
- [Terraform code: Tag 0.3.0](./terraform_code_tag_0.3.0.md) 
- [Cloudflare option: Tag 0.4.0](./cloudflare_tag_0.4.0.md)


## Tag 0.2.0
- [Diagram](#the-initial-diagram-and-folders-structure-are)
- [ToDO](#to-do-at-this-stage)
- [Files and folders in the project. ](#files-and-folders-in-the-project)


## The initial folders structure are:


```
.
├── README.md
├── bin
├── docs
├── main.tf
├── outputs.tf
├── public
├── terraform.tfvars
├── terraform.tfvars.example
└── variables.tf

```
### TO DO at this stage:

- [X] Add explanation of file and folders
- [X] Start to creating issues, branches, tags and pull requests.



### Files and folders in the project.
We will use `Gitpod` as our workspace.

`- .gitpod.yml` - config file for Gitpod environment.

`- bin` - folder where we put scripts that will be executed in Gitpod environment, like install AWS CLI, Terraform etc.

`- docs` - Actually documentation of the project.

`- public` - Folder for site where we put all our index file, styles, js scripts, images, etc. There are files created locally and uploaded to github like `index.html` and `styles.css`. 

`- main.tf, outputs.tf, variables.tf, *.tf` - Terraform files for deploying our site to AWS Cloud.






