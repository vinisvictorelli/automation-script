#!/bin/bash

# Function to check if Flatpak is installed
check_flatpak() {
    if command -v flatpak &> /dev/null; then
        echo "Flatpak is installed."
        return 0
    else
        echo "Flatpak is NOT installed."
        return 1
    fi
}

# Function to check if Snap is installed
check_snap() {
    if command -v snap &> /dev/null; then
        echo "Snap is installed."
        return 0
    else
        echo "Snap is NOT installed."
        return 1
    fi
}

# Function to check if apt package manager is available
check_apt() {
    if command -v apt &> /dev/null; then
        echo "APT package manager is available."
        return 0
    else
        echo "APT package manager is NOT available."
        return 1
    fi
}

# Function to check if dnf package manager is available
check_dnf() {
    if command -v dnf &> /dev/null; then
        echo "DNF package manager is available."
        return 0
    else
        echo "DNF package manager is NOT available."
        return 1
    fi
}

# Main function to check all conditions and take appropriate actions
main() {
    echo "Performing actions for systems with APT..."
    # Installing flatpak
    sudo apt install flatpak
    sudo apt install gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    echo 'Flatpak installed'
    # Installing dependencies
    sudo apt-get install ffmpeg
    sudo apt install mpv
    # Installing Obsidian using apt
    wget -qO obsidian.deb "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/obsidian_1.7.7_amd64.deb"
    sudo apt install -y ./obsidian.deb
    rm obsidian.deb
    echo "Obsidian installed via APT."
    # Installing obs studio
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt update
    sudo apt-get update && sudo apt-get install obs-studio
    # Installing calibre ebook management
    sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
    # Installing VSCODE
    wget -q0 vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
    sudo apt install -y ./vscode.deb
    rm vscode.deb
    echo 'VSCode installed using apt'
    # Installing vlc media player
    sudo snap install -y vlc
    echo 'VLC installed using snap'
    # Installing LocalSend
    flatpak install flathub org.localsend.localsend_app
    echo 'LocalSend installed using flatpak'
    # Installing Anaconda
    wget -q0 anaconda.sh 'https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh'
    sudo bash ./anaconda.sh
    rm anaconda.sh
    echo 'Anaconda installed using bash script'
    # Installing harmony music
    wget -q0 harmony.deb 'https://github.com/anandnet/Harmony-Music/releases/download/v1.10.31/harmonymusicv1.10.31.deb'
    sudo apt install -y harmony.deb
    rm harmony.deb
    echo 'Harmony music installed using apt'
    # Installing qbittorrent
    sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
    sudo apt-get update
    sudo apt-get install qbittorrent
    echo 'QBittorrent installed using apt'
}
