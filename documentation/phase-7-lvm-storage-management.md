# Phase 7: LVM Storage Management

## 1. Objective
To configure and manage Linux storage using GPT partitioning, Physical Volumes (PV), Volume Groups (VG), Logical Volumes (LV), XFS filesystems, persistent mounts and online filesystem extension.

## 2. Disk Identification
Two additional 20 GB disks were selected:
- `/dev/sdb` – partitioned using gdisk.
- `/dev/sdc` – partitioned using fdisk.

The existing OS disk `/dev/nvme0n1` was not modified.

## 3. GPT Partitioning

Created one partition on each disk:
- `/dev/sdb1` – GPT, Linux LVM (8E00), using gdisk.
- `/dev/sdc1` – GPT, Linux LVM, using fdisk.

Both partitions were verified successfully.

## 4. Physical Volume Creation

Created LVM Physical Volumes:

```bash
pvcreate /dev/sdb1 /dev/sdc1
pvs
```

Both partitions were successfully initialized as PVs.

## 5. Volume Group Creation

Combined both PVs into one Volume Group:

```bash
vgcreate vg_data /dev/sdb1 /dev/sdc1
vgs
```

Volume Group: `vg_data`  
Total capacity: Approximately 39.99 GB.

## 6. Logical Volume Creation

Created two Logical Volumes:

```bash
lvcreate -L 10G -n lv_app vg_data
lvcreate -L 5G -n lv_backup vg_data
lvs -a -o +devices
```

| Logical Volume | Initial Size | Purpose |
|---|---:|---|
| lv_app | 10 GB | Application data |
| lv_backup | 5 GB | Backup storage |

## 7. XFS Filesystem Creation

Created XFS filesystems:

```bash
mkfs.xfs /dev/vg_data/lv_app
mkfs.xfs /dev/vg_data/lv_backup
```

Both filesystems were created successfully.

## 8. Mount Configuration

Created mount directories:

```bash
mkdir -p /data/app /data/backup
```

Mounted both Logical Volumes:

```bash
mount /dev/vg_data/lv_app /data/app
mount /dev/vg_data/lv_backup /data/backup
```

Verified using:

```bash
df -hT /data/app /data/backup
```

## 9. Persistent Mount Configuration

Backed up the original fstab:

```bash
cp -p /etc/fstab /etc/fstab.pre-lvm-backup
```

Retrieved filesystem UUIDs using:

```bash
blkid /dev/vg_data/lv_app /dev/vg_data/lv_backup
```

Added UUID-based entries to `/etc/fstab`:

```text
UUID=ea8ad6bf-77f1-4ca4-b8f5-7bfd882cb6b0  /data/app     xfs  defaults  0 0
UUID=10cce282-23c4-4f2e-b3c3-e79d7e3bfefd  /data/backup  xfs  defaults  0 0
```

Validated configuration:

```bash
mount -a
findmnt -T /data/app
findmnt -T /data/backup
```

Both persistent mounts were verified successfully.

## 10. Logical Volume Extension
Extended lv_app from 10 GB to 12 GB:

lvextend -L 12G /dev/vg_data/lv_app

Expanded the mounted XFS filesystem online:

xfs_growfs /data/app

Verified the updated capacity:

df -hT /data/app /data/backup

The filesystem extension completed successfully without unmounting the volume.

## 11. Final Storage Configuration

| Component | Final Configuration |
|---|---|
| Volume Group | vg_data |
| Total VG Capacity | 39.99 GB |
| Logical Volume | lv_app – 12 GB |
| Mount Point | /data/app |
| Logical Volume | lv_backup – 5 GB |
| Mount Point | /data/backup |
| Filesystem | XFS |
| Available VG Space | Approximately 22.99 GB |

## 12. Evidence Collected

- 66-lvm-disk-partitions.txt
- 67-lvm-logical-volumes.txt
- 68-lvm-mounted-filesystems.txt
- 69-lvm-fstab-verification.txt
- 70-lvm-extend-verification.txt
- 71-lvm-final-audit.txt

## 13. Conclusion

Successfully implemented Linux LVM storage management using gdisk, fdisk, PVs, VGs and LVs.

Configured XFS filesystems, persistent UUID-based mounts and online filesystem extension.

Both additional disks were incorporated into the LVM storage pool while keeping the existing operating system disk untouched.

**Phase 7: LVM Storage Management – Completed.**
