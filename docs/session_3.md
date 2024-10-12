# Session 3: Linux commands and File system

## Linux File System

<!--

	•	Hierarchical structure: The Linux file system is organized in a tree-like structure, with the root directory / at the top.
	•	Root directory (/): The base of the file system, all directories and files stem from this point.
	•	Common directories:
	•	/bin: Essential binaries (executables) for system operation.
	•	/boot: Files required to boot the system.
	•	/dev: Device files (e.g., disks, peripherals).
	•	/etc: Configuration files for system-wide settings.
	•	/home: User directories, each user has their own subdirectory (e.g., /home/username).
	•	/lib: Shared libraries needed by the binaries in /bin and /sbin.
	•	/media or /mnt: Mount points for external file systems (e.g., USB drives, network storage).
	•	/opt: Optional add-on software.
	•	/proc: Virtual file system providing process and system information.
	•	/root: Home directory for the root (superuser).
	•	/sbin: System binaries for administrative tasks.
	•	/tmp: Temporary files (often cleared at reboot).
	•	/usr: Contains user utilities and applications.
	•	/var: Variable files like logs, caches, and spool files.
	•	File types:
	•	Regular files: Normal data files.
	•	Directories: Containers for other files.
	•	Device files: Represent hardware devices (block or character devices).
	•	Links: Can be symbolic (soft) or hard, used to reference other files.
	•	Sockets and pipes: For inter-process communication.
	•	Permissions:
	•	Three types: read (r), write (w), and execute (x).
	•	Assigned to three groups: owner, group, and others.
	•	Mounting: File systems (e.g., external drives, partitions) must be mounted to a directory before use.
	•	Inodes: Each file has an inode that stores metadata like file size, permissions, and ownership, but not the filename.
	•	File systems types:
	•	ext4: Most common default file system in Linux.
	•	xfs, btrfs, zfs: Other advanced file systems with specific features.
	•	Everything is a file: In Linux, almost everything is treated as a file, including hardware devices, processes, and sockets.


-->
