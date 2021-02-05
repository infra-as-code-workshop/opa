package trivy

import data.lib.trivy

default ignore = false

ignore_pkgs := {"bash", "bind-license", "rpm", "vim", "vim-minimal"}

ignore_severities := {"LOW", "MEDIUM", "HIGH"}

ignore {
	input.PkgName == ignore_pkgs[_]
}

ignore {
	input.Severity == ignore_severities[_]
}
