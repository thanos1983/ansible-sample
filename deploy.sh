#!/usr/bin/env bash
# set -x
# set -e

function error() {
	echo "'${1-parameter}' failed with exit code $? in function '${FUNCNAME[1]}' at line ${BASH_LINENO[0]}" \
		echo ""	&& exit 1
}

function deploy() {
        bamboo_env="dev"
	bamboo_ansible_user="tinyos"

	case "$bamboo_env" in 
		"dev")
    			bamboo_inventory_file="inventories/development/hosts.yml"
  		;;
  		"prod")
    			bamboo_inventory_file="inventories/production/hosts.yml"
  		;;
  		*)
    			echo "Unknown environment [$bamboo_env] have to be either dev or prod"
    			exit 1
  		;;
	esac

	echo "HOSTS TO DEPLOY TO ${bamboo_inventory_file} environment is ${bamboo_env}"

	if [ -z $bamboo_ansible_user ]; then
		echo "Bamboo ansible user is not defined. Exit!!!"
		exit 1
	else
		ansible-playbook \
		  -i ${bamboo_inventory_file} \
		  -e ansible_user=${bamboo_ansible_user} \
		  site.yml -v || error "deploy"
	fi

}

deploy
