## Table of contents
* [General info](#general-info)
* [Group Vars](#group-vars)
* [Technologies](#technologies)
* [Setup](#setup)

## General info
This project was created se we can minimize the human interaction / configurations on the new / fresh nodes.
The following tasks are applied through this playbook:

<ul> <li>addRepo</li> <li>createDirectories</li> <li>createUser</li> <li>docker</li> <li>installPackages</li> <li>installPipPackages</li> </ul>

#### Note

The user will be defined on the environment variable. The reason that we need to do this is for example support-user should be created on all non-production nodes.
Separate user should be created for production environment (hostnames, user credentials etc).

## Group Vars

On this project we have common group vars for all groups. So all group vars should be common indepently the group. From more information: [Alternative Directory Layout](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#alternative-directory-layout)

## Technologies
Project is created with:
* Ansible version: 2.8.6
* Python version: 3.6.8
	
## Setup
To run this project, prerequicites are Python and Ansible. Also is required to have already exchange ssh keys with all destination nodes. Alternatively the user need to add the ssh password in the bash script "deploy.sh". To run the project simply cd in the dir that you have clone it and run:

```
$ ./deploy
```
