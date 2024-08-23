#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Using ASCII art to make the welcome message larger
echo -e "\033[1;32m"
cat << "EOF"
.▄▄ ·  ▄· ▄▌ ▐ ▄        ▄▄▄·.▄▄ ·  ▄· ▄▌.▄▄ · 
▐█ ▀. ▐█▪██▌•█▌▐█▪     ▐█ ▄█▐█ ▀. ▐█▪██▌▐█ ▀. 
▄▀▀▀█▄▐█▌▐█▪▐█▐▐▌ ▄█▀▄  ██▀·▄▀▀▀█▄▐█▌▐█▪▄▀▀▀█▄
▐█▄▪▐█ ▐█▀·.██▐█▌▐█▌.▐▌▐█▪·•▐█▄▪▐█ ▐█▀·.▐█▄▪▐█
 ▀▀▀▀   ▀ • ▀▀ █▪ ▀█▄▀▪.▀    ▀▀▀▀   ▀ •  ▀▀▀▀                          
EOF
echo -e "\033[0m"

echo -e "\033[1;34mAvailable tools are as follows:\033[0m"

# Define license environment
export LM_LICENSE_FILE=2700@localhost
export SNPSLMD_LICENSE_FILE=2700@localhost

# Enable bridge
export SCL_ENABLE_BRIDGE=1

# Define aliases for license management
alias lmgrd="/home/icdesign/synopsys/scl/2023.09/linux64/bin/lmgrd -c /home/icdesign/synopsys/license/Synopsys.dat"
alias lmreread="/home/icdesign/synopsys/scl/2023.09/linux64/bin/lmreread -c /home/icdesign/synopsys/license/Synopsys.dat"

# Toolset configurations
declare -A tool_paths=(
    [VCS]="/home/icdesign/synopsys/vcs/V-2023.12-1/bin"
    [FusionCompiler]="/home/icdesign/synopsys/fusioncompiler/T-2022.03-SP2-1/bin"
    [CoreTools]="/home/icdesign/synopsys/coretools/V-2024.03/bin"
    [CustomCompiler]="/home/icdesign/synopsys/customcompiler/U-2023.03/bin"
    [CustomInfrastructure]="/home/icdesign/synopsys/custominfrastructure/U-2023.03-SP1-1/bin"
    [ICValidator]="/home/icdesign/synopsys/icvalidator/V-2023.12-SP1-3/bin"
    [PrimeTime]="/home/icdesign/synopsys/prime/U-2022.12-SP5-3/bin"
    [PrimeWave]="/home/icdesign/synopsys/primewave/U-2023.03/bin"
    [ESP]="/home/icdesign/synopsys/esp/V-2023.12-SP3/bin"
    [RTLArchitect]="/home/icdesign/synopsys/rtla/S-2021.06-1/bin"
    [VCStatic]="/home/icdesign/synopsys/vc_static/V-2023.12-1/bin"
    [Verdi]="/home/icdesign/synopsys/verdi/V-2023.12/bin"
    [Spyglass]="/home/icdesign/synopsys/spyglass/V-2023.12-1/bin"
    [StarRC]="/home/icdesign/synopsys/starrc/U-2022.12-SP5-2/bin"
    [TCM]="/home/icdesign/synopsys/tcm/V-2023.12-SP2-1/bin"
    [Execman]="/home/icdesign/synopsys/execman/U-2023.03-1/bin"
    [MachineLearningPlatform]="/home/icdesign/synopsys/cmlp/R-2020.09-1/bin"
    [Formality]="/home/icdesign/synopsys/fm/U-2022.12-SP1/bin"
    [SCL]="/home/icdesign/synopsys/scl/2023.09/linux64/bin"
)

# Display all available tools with color and formatting
for tool in "${!tool_paths[@]}"; do
    export PATH="${tool_paths[$tool]}:$PATH"
    echo -e "\033[1;35m$tool\033[0m"  # Display only the tool name
done

export VCS_HOME="/home/icdesign/synopsys/vcs/V-2023.12-1/"
export VCS_ARCH_OVERRIDE=linux
export VCS_TARGET_ARCH=amd64

####export FLEXLM_DIAGNOSTICS=3

export VCS_HOME="/home/icdesign/synopsys/vcs/V-2023.12-1/"
export FC_HOME="/home/icdesign/synopsys/fusioncompiler/T-2022.03-SP2-1"
export CoreTools_HOME="/home/icdesign/synopsys/coretools/V-2024.03"
export CustomCompiler_HOME="/home/icdesign/synopsys/customcompiler/U-2023.03"
export CustomInfrastructure_HOME="/home/icdesign/synopsys/custominfrastructure/U-2023.03-SP1-1"
export ICValidator_HOME="/home/icdesign/synopsys/icvalidator/V-2023.12-SP1-3"
export PrimeTime_HOME="/home/icdesign/synopsys/prime/U-2022.12-SP5-3"
export PrimeWave_HOME="/home/icdesign/synopsys/primewave/U-2023.03"
export ESP_HOME="/home/icdesign/synopsys/esp/V-2023.12-SP3"
export RTLArchitect_HOME="/home/icdesign/synopsys/rtla/S-2021.06-1"
export VC_STATIC_HOME="/home/icdesign/synopsys/vc_static/V-2023.12-1"
export VERDI_HOME="/home/icdesign/synopsys/verdi/V-2023.12"
export Spyglass_HOME="/home/icdesign/synopsys/spyglass/V-2023.12-1"
export StarRC_HOME="/home/icdesign/synopsys/starrc/U-2022.12-SP5-2"
export TCM_HOME="/home/icdesign/synopsys/tcm/V-2023.12-SP2-1"
export Execman_HOME="/home/icdesign/synopsys/execman/U-2023.03-1"
export MLP_HOME="/home/icdesign/synopsys/cmlp/R-2020.09-1"
export Formality_HOME="/home/icdesign/synopsys/fm/U-2022.12-SP1"
export SCL_HOME="/home/icdesign/synopsys/scl/2023.09"

