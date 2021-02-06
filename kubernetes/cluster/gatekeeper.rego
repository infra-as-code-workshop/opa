package terraform.analysis

import input as tfplan

########################
# Parameters for Policy
########################

# acceptable score for automated authorization
blast_radius = 30

# weights assigned for each operation on each resource-type
weights = {
    "helm_release": {"delete": 100, "create": 10, "modify": 1},
    "local_file": {"delete":1, "create": 1, "modify": 1},
}

# Consider exactly these resource types in calculations
resource_types = {"helm_release","local_file"}

#########
# Policy
#########

# Authorization holds if score for the plan is acceptable and no changes are made to helm release
default authz = false
authz {
    score < blast_radius
    not touches_helm_release
}

# Compute the score for a Terraform plan as the weighted sum of deletions, creations, modifications
score = s {
    all := [ x |
            some resource_type
            crud := weights[resource_type];
            del := crud["delete"] * num_deletes[resource_type];
            new := crud["create"] * num_creates[resource_type];
            mod := crud["modify"] * num_modifies[resource_type];
            x := del + new + mod
    ]
    s := sum(all)
}

score_helm = c {
    crud := weights["helm_release"];
    c := crud["delete"] * num_deletes["helm_release"]
}

# Whether there is any change to helm_release
touches_helm_release {
    crud := weights["helm_release"];
    s := crud["delete"] * num_deletes["helm_release"]
    s > 0
}

####################
# Terraform Library
####################

# list of all resources of a given type
resources[resource_type] = all {
    some resource_type
    resource_types[resource_type]
    all := [name |
        name:= tfplan.resource_changes[_]
        name.type == resource_type
    ]
}

# number of creations of resources of a given type
num_creates[resource_type] = num {
    some resource_type
    resource_types[resource_type]
    all := resources[resource_type]
    creates := [res |  res:= all[_]; res.change.actions[_] == "create"]
    num := count(creates)
}


# number of deletions of resources of a given type
num_deletes[resource_type] = num {
    some resource_type
    resource_types[resource_type]
    all := resources[resource_type]
    deletions := [res |  res:= all[_]; res.change.actions[_] == "delete"]
    num := count(deletions)
}

# number of modifications to resources of a given type
num_modifies[resource_type] = num {
    some resource_type
    resource_types[resource_type]
    all := resources[resource_type]
    modifies := [res |  res:= all[_]; res.change.actions[_] == "update"]
    num := count(modifies)
}