# check-upgradeable
Shell script that send a Pushover notification when there are APT packages to upgrade.

## installation
1. [Set up Pushover](https://support.pushover.net/i7-what-is-pushover-and-how-do-i-use-it)
2. Add the script to your cronjob file
    - Execute
    ```bash
    crontab -e
    ```
    - Add line `0 0 * * 0 /path/to/script.sh` to the file (This executes the script every week on sunday at 00:00)
    - Save the file
