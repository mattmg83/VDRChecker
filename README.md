# VDRChecker
Windows .bat file to checks whethers all files within a folder and its subdirectories are valid and not blank. Useful for checking whether a Dataroom has corrupt or blank files

# File Integrity Checker

## Overview

VDRChecker is a simple batch script that scans directories and files to identify potential integrity issues. It checks for corrupt and blank files, providing a detailed report of the scan results.

## Features

- Scans all files in the current directory and its subdirectories
- Identifies and reports corrupt files (files that can't be read)
- Identifies and reports blank files (files with zero size)
- Generates a detailed log file with timestamps
- Provides a summary of the scan results
- Automatically opens the log file upon completion

## Requirements

- Windows operating system
- No additional software or dependencies required

## Usage

1. Download the .bat file.
2. Place the batch file in the directory you want to scan, or any directory if you want to scan the entire drive.
3. Double-click to run the script.
4. The script will start scanning immediately and display progress in a command window.
5. Once complete, a summary will be shown in the command window, and a detailed log file will open automatically.
6. Press any key to close the command window when you're done reviewing the summary.

## Understanding the Results

The script provides results in two formats:

1. **Command Window Output**: Displays a real-time log of each file checked and a summary at the end.

2. **Log File**: A text file named `FileIntegrityCheck_YYYYMMDD_HHMMSS.txt` (where YYYYMMDD_HHMMSS is the current date and time) containing:
   - Summary of total files checked, corrupt files, blank files, and healthy files
   - List of corrupt files (if any)
   - List of blank files (if any)
   - Detailed log of all checked files

## Limitations

- The script checks file readability and size, but cannot detect all types of file corruption.
- Performance may be slower for directories with a very large number of files.
- The script requires read access to all files and directories it checks.

## Troubleshooting

- If the script closes immediately, make sure you're running it on a Windows system.
- If you get a "Access Denied" error, try running the script as an administrator.

## Contributing

Contributions, issues, and feature requests are welcome. Feel free to check [issues page](link-to-your-issues-page) if you want to contribute.

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Author

Mathieu Guerville

## Acknowledgments

- Claude 3.5 Sonnet delivered, file tested and validated Oct 2024.
