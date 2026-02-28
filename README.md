<samp>

<p align="center"><img src="https://i.imgur.com/X5zKxvp.png" width=300px></p>
<div align="center">
    <a href="https://nixos.org"><img src="https://img.shields.io/badge/NixOS-Unstable-blue?style=for-the-badge&logo=NixOS&logoColor=white&label=Nixpkgs&labelColor=303446&color=6CB6EB"></a>
    <a href="https://nixos.org"><img src="https://img.shields.io/static/v1?style=for-the-badge&message=ON&logoColor=white&label=Home-Manager&labelColor=303446&color=A0C981"></a>
    <a href="https://nixos.org"><img src="https://img.shields.io/static/v1?style=for-the-badge&message=ON&logoColor=white&label=FLAKES&labelColor=303446&color=A0C981"></a><br>
    <!-- <a href="https://github.com/msalmanrafadhlih/Dotfiles/tree/bspwm"><img src="https://img.shields.io/github/stars/msalmanrafadhlih/Dotfiles?color=A0C981&labelColor=303446&style=for-the-badge&logo=starship&logoColor=A0C981"></a> -->
    <a href="https://github.com/r17x/universe/"><img src="https://img.shields.io/github/repo-size/msalmanrafadhlih/Dotfiles?color=D48AEA&labelColor=303446&style=for-the-badge&logo=github&logoColor=D48AEA"></a>
    <a href="https://github.com/msalmanrafadhlih/Dotfiles/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=EF9F76&logo=unlicense&logoColor=EF9F76&"/></a><br>
    <h5>Environments</h5>
    <a href="https://github.com/msalmanrafadhlih/Dotfiles/tree/bspwm"><img src="https://img.shields.io/static/v1?label=BSPWM&message=latest&style=for-the-badge&logo=bspwm&colorA=24273A&colorB=DB1E1C&logoColor=CAD3F5"/></a>
</div>

# Motivations

<p align="justify">
  Life management is essential. Like an operating system, it should not run randomly or without structure — it must be declared. NixOS teaches that the best systems are not those changed most frequently, but those built upon clear, conscious, and reproducible configurations. No impulsive modifications. No hidden dependencies. No untraceable chaos.
  
  <h4 align="center">
    "This is not merely a NixOS configuration. It is a declaration of how I choose to transform chaos into order — reproducible, intentional, and version-controlled."
  </h4>
</p>

<p align="justify">  
  It reflects a broader philosophy of life:  
  that everything should have structure, versioning, and direction. Just as NixOS provides generations and rollback capabilities, life itself should allow room for evaluation and refinement — without sacrificing stability. We do not erase the past; we preserve it as a reference to build improved versions of ourselves. Life management is a declaration of values. Configuration is the manifestation of awareness. Stability is the outcome of consistent discipline.
</p>

<p align="center">
  This system is configured.  
  So is the life behind it.
</p>

# Structures

```mermaid
graph TB
%%{init: {'flowchart': {'nodeSpacing': 20, 'rankSpacing': 25}}}%%
  BSPWM["👾 Branch : bspwm"] -.- J1
  HYPRLAND["♨️ Branch : Hyprland"] -..- J1
  NIRI["🍥 Branch : Niri"] -...- J1

  J1((Ψ)) -.-> DOTS
  SUCKLESS[">_ Suckless Terminal"] -...-|Inputs| FLAKE
  PLYMOUTH["🍎 Bloodrage-Plymouth"] -..-|Inputs| FLAKE
  UNSTABLE["⚠️ Nixpkgs-Unstable"] -.-|Inputs| FLAKE
  DOTS[("🐧 Dotfiles")] -..-|Inputs| FLAKE

  FLAKE[("✨ Flake.nix")] --> OUT(("🚀")) -->|Outputs| HM["🏠︎ Home Manager"]
  OUT -->|Outputs| SYSTEMS["⚙️ NixOs Configurations"]
  OUT -->|Outputs| OVERLAYS["🛠️ Overlays"]

  SYSTEMS --->|Modules| SYSMDL["📦 Configuration.nix"]

subgraph Systems

  SYSMDL -.- SystemPackages.nix -.- Services.nix -.- Virtualisation.nix -.- Devenv.nix -.- AutoUpdate.nix -.- Hardware.nix -.- Networks.nix
  SYSMDL -.- Local.nix -.- Audio.nix -.- Users.nix -.- Bluetooth.nix -.- Acme.nix -.- FileSystems.nix -.- LCL["Hardware-configurations.nix"]
  SYSMDL -.- Fonts.nix -.- OpenSSH.nix -.- Shell.nix -.- Sudo.nix -.- Touchpad.nix -.- Settings.nix -.- Nginx.nix
  LCL -.- Networks.nix
  LCL -.- Nginx.nix
end

  classDef configNode fill:#A0C981,stroke:#303446,stroke-width:2px,color:#303446
  classDef moduleNode fill:#D48AEA,stroke:#303446,stroke-width:2px,color:#303446
  classDef appNode fill:#6CB6EB,stroke:#303446,stroke-width:2px,color:#303446
  classDef dataNode fill:#EF9F76,stroke:#303446,stroke-width:2px,color:#303446
  classDef background fill:#14141414,stroke-width:2px,color:#00ff0000
  classDef branch fill:#14141400,stroke-width:0px,color:#ffffff

  class SYSTEMS,SYSMDL, configNode
  class FLAKE,PLYMOUTH,BSPWM,HYPRLAND,NIRI,HM moduleNode
  class PLYMOUTH,SUCKLESS,OVERLAYS appNode
  class FLAKE dataNode

  class Systems background
  class J1,OUT branch
```

</samp>
