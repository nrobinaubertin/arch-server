#!/bin/bash

yesorno() {
    printf "%s: " "$1"
    if [ "$2" = "yes" ]
    then
        case "$(read -r c && echo "$c")" in 
            [Yy]*|"") read -r "$3" <<< true;;
            *) read -r "$3" <<< false;;
        esac
    else
        case "$(read -r c && echo "$c")" in 
            [Nn]*|"") read -r "$3" <<< true;;
            *) read -r "$3" <<< false;;
        esac
    fi
}

choose_param() {
    printf "The default %s is %s.\n" "$1" "$2" 
    printf "Do you want to keep it ? (Y/n) "
    case "$(read -r c && echo "$c")" in 
        [Yy]*|"") read -r "$3" <<< "$2";;
        *) 
            printf "Enter the wanted %s: " "$1"
            read -r "$3"
            ;;
    esac
}

# Choose account name and password
choose_param "account name" "niels" "ACCOUNT_NAME"
while true; do
    read -rs -p "$ACCOUNT_NAME's password: " PASSWORD
    echo
    read -rs -p "Confirm password: " PASSWORD2
    echo
    [ "$PASSWORD" = "$PASSWORD2" ] && break
    echo "Please try again"
done

choose_param "timezone" "Europe/Paris" "TIMEZONE"

# TODO: propose a list of filesystems to choose from
#choose_param "filesystem" "ext4" "FILESYSTEM"

echo ""
lsblk -f
echo ""

choose_param "disk to install on" "/dev/sda" "DISK"
choose_param "root partition size" "25G" "SIZE"
yesorno "Do you want wifi ? (Y/n)" "yes" "WIFI"

# Update system clock
timedatectl set-ntp true

# TODO: propose another partition scheme ?
# Create partition table
parted -s "$DISK" mklabel msdos
# Create root parition
parted -s "$DISK" mkpart primary 0% "$SIZE"
# Create home partition
parted -s "$DISK" mkpart primary "$SIZE" 100%
# Make root partition bootable
parted -s "$DISK" set 1 boot on

# Format partitions
mkfs.ext4 -F "${DISK}1"
mkfs.ext4 -F "${DISK}2"

# Mount filesystems
mount "${DISK}1" /mnt
mkdir /mnt/home
mount "${DISK}2" /mnt/home

# TODO: use parabola
## Install keyring and mirror list for free repositories in /etc/pacman.d/mirrorlist:
#pacman -U https://www.parabola.nu/packages/libre/any/parabola-keyring/download/
#pacman -U https://www.parabola.nu/packages/libre/any/pacman-mirrorlist/download/

# Install some packages
pacstrap /mnt base git grub sudo

# Gen fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Set timezone
ln -sf "/usr/share/zoneinfo/$TIMEZONE" /mnt/etc/localtime

# Run hwclock(8) to generate /etc/adjtime
arch-chroot /mnt hwclock --systohc

# Set locale (TODO: it's only in english/french for now)
sed -i 's/^#en_US\.UTF/en_US\.UTF/' /mnt/etc/locale.gen
sed -i 's/^#fr_FR\.UTF/fr_FR\.UTF/' /mnt/etc/locale.gen
arch-chroot /mnt locale-gen
echo "LANG=en_US.UTF-8" > /mnt/etc/locale.conf
echo "KEYMAP=fr-pc" > /mnt/etc/vconsole.conf

# TODO: generate something unique and meaningful
echo "${ACCOUNT_NAME}-arch" > /mnt/etc/hostname

if [ "$WIFI" ]
then
    arch-chroot /mnt pacman --noconfirm -S iw wpa_supplicant dialog
fi

# Lock root account and prepare user account
arch-chroot /mnt passwd -l root
arch-chroot /mnt useradd -m -g wheel -s /bin/bash "$ACCOUNT_NAME"
echo "$ACCOUNT_NAME ALL=(ALL) NOPASSWD:ALL" >> /mnt/etc/sudoers
echo "$ACCOUNT_NAME:$PASSWORD" | arch-chroot /mnt chpasswd

# Write master boot record
arch-chroot /mnt grub-install --target=i386-pc --recheck "$DISK"
# Enable GRUB configuration
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

# "Unmount the disks"
umount -R /mnt

echo ""
echo "Type any key to reboot..."
read -rs -n1
reboot
